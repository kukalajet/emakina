import 'package:emakina/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valute_repository/valute_repository.dart';

class ValuteList extends StatefulWidget {
  const ValuteList({
    @required this.onTap,
  });

  final Function(Valute) onTap;

  @override
  _ValuteListState createState() => _ValuteListState();
}

class _ValuteListState extends State<ValuteList> {
  ValuteBloc _valuteBloc;

  @override
  void initState() {
    super.initState();
    _valuteBloc = context.read<ValuteBloc>()..add(ValuteFetched());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ValuteBloc, ValuteState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.status) {
          case ValuteStatus.failure:
            return const Center(child: Text('failed to fetch door types'));
          case ValuteStatus.success:
            if (state.valutes.isEmpty) {
              return const Center(child: Text('no types'));
            }
            return Material(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: state.valutes.length,
                itemBuilder: (_, index) => _ValuteItem(
                  valute: state.valutes[index],
                  onTap: widget.onTap,
                ),
                separatorBuilder: (context, index) => Divider(),
              ),
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _ValuteItem extends StatelessWidget {
  final Valute valute;
  final Function(Valute) onTap;

  const _ValuteItem({
    Key key,
    @required this.valute,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        valute.name,
        style: Theme.of(context).textTheme.headline6,
      ),
      trailing: Text(
        valute.symbol,
        style: Theme.of(context).textTheme.headline6,
      ),
      onTap: () => onTap(valute),
    );
  }
}
