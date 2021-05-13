import 'package:emakina/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transmission_repository/transmission_repository.dart';

class TransmissionList extends StatefulWidget {
  const TransmissionList({
    @required this.onTap,
  });

  final Function(Transmission) onTap;

  @override
  _TransmissionListState createState() => _TransmissionListState();
}

class _TransmissionListState extends State<TransmissionList> {
  TransmissionBloc _transmissionBloc;

  @override
  void initState() {
    super.initState();
    _transmissionBloc = context.read<TransmissionBloc>()
      ..add(TransmissionFetched());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransmissionBloc, TransmissionState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.status) {
          case TransmissionStatus.failure:
            return const Center(child: Text('failed to fetch door types'));
          case TransmissionStatus.success:
            if (state.transmissions.isEmpty) {
              return const Center(child: Text('no types'));
            }
            return Container(
              decoration: BoxDecoration(color: Colors.indigo[50]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(state.transmissions.length, (index) {
                  return _TransmissionItem(
                    transmission: state.transmissions[index],
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

class _TransmissionItem extends StatelessWidget {
  final Transmission transmission;
  final Function(Transmission) onTap;

  const _TransmissionItem({
    Key key,
    @required this.transmission,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(transmission),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(transmission.type, style: TextStyle(color: Colors.black87)),
          ],
        ),
        // child: ListTile(
        //   title: Text(transmission.name, style: TextStyle(color: Colors.black87)),
        // ),
      ),
    );
  }
}
