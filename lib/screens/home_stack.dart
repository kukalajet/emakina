import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emakina/blocs/blocs.dart';
import 'package:emakina/widgets/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'feed_screen.dart';
import 'favorites_screen.dart';

class HomeStack extends StatelessWidget {
  final List<Widget> _tabs = [
    FeedScreen(),
    FavoritesScreen(),
  ];

  static Route route() {
    return MaterialPageRoute(builder: (_) => HomeStack());
  }

  Widget _buildBody(BuildContext context, AppTab activeTab) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //       colors: [Color(0xFF282a57), Colors.black],
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter),
      // ),
      child: IndexedStack(
        index: activeTab.index,
        children: _tabs,
      ),
    );
  }

  Widget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(50.0),
      child: HeaderBar(),
    );
  }

  Widget _buildBottomNavigation(BuildContext context, AppTab activeTab) {
    final bool hasBottomPadding = MediaQuery.of(context).viewPadding.bottom > 0;

    return SizedBox(
      height: hasBottomPadding ? 80 : 50,
      child: TabSelector(
        activeTab: activeTab,
        onTabSelected: (tab) =>
            BlocProvider.of<TabBloc>(context).add(TabUpdated(tab)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          body: _buildBody(context, activeTab),
          appBar: _buildAppBar(),
          bottomNavigationBar: _buildBottomNavigation(context, activeTab),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: CenterButton(
            onPressed: () => {
              showCupertinoModalBottomSheet(
                expand: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => Center(
                  child: Text('Hello World!'),
                ),
              )
            },
          ),
        );
      },
    );
  }
}
