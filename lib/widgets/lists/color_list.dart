import 'package:emakina/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:color_repository/color_repository.dart';

class ColorList extends StatefulWidget {
  const ColorList({
    @required this.onTap,
  });

  final Function(Color) onTap;

  @override
  _ColorListState createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  ColorBloc _colorBloc;

  @override
  void initState() {
    super.initState();
    _colorBloc = context.read<ColorBloc>()..add(ColorFetched());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ColorBloc, ColorState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.status) {
          case ColorStatus.failure:
            return const Center(child: Text('failed to fetch door types'));
          case ColorStatus.success:
            if (state.colors.isEmpty) {
              return const Center(child: Text('no types'));
            }
            return Container(
              decoration: BoxDecoration(color: Colors.indigo[50]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(state.colors.length, (index) {
                  return _ColorItem(
                    color: state.colors[index],
                    onTap: widget.onTap,
                  );
                }),
              ),
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _ColorItem extends StatelessWidget {
  final Color color;
  final Function(Color) onTap;

  const _ColorItem({
    Key key,
    @required this.color,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(color),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(color.code, style: TextStyle(color: Colors.black87)),
          ],
        ),
        // child: ListTile(
        //   title: Text(color.name, style: TextStyle(color: Colors.black87)),
        // ),
      ),
    );
  }
}
