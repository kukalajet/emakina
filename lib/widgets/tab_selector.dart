import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:emakina/blocs/blocs.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      currentIndex: AppTab.values.indexOf(activeTab),
      selectedLabelStyle: TextStyle(color: Color.fromRGBO(95, 135, 231, 1)),
      // selectedItemColor: Color.fromRGBO(95, 135, 231, 1),
      selectedItemColor: Colors.red[900],
      selectedFontSize: 10,
      unselectedFontSize: 10,
      onTap: (index) => onTabSelected(AppTab.values[index]),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.local_fire_department),
          label: "Feed",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: "Favorites",
        ),
      ],
    );
  }
}
