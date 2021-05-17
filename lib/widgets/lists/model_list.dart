import 'package:emakina/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model_repository/model_repository.dart';

class ModelList extends StatefulWidget {
  const ModelList({
    @required this.manufaturerId,
    @required this.onTap,
  }) : assert(manufaturerId != null);

  final int manufaturerId;
  final Function(Model) onTap;

  @override
  _ModelListState createState() => _ModelListState();
}

class _ModelListState extends State<ModelList> {
  ModelBloc _modelBloc;

  @override
  void initState() {
    super.initState();
    _modelBloc = context.read<ModelBloc>()
      ..add(ModelFetched(manufacturerId: widget.manufaturerId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ModelBloc, ModelState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.status) {
          case ModelStatus.failure:
            return const Center(child: Text('failed to fetch door types'));
          case ModelStatus.success:
            if (state.models.isEmpty) {
              return const Center(child: Text('no types'));
            }
            return Material(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => _ModelItem(
                  model: state.models[index],
                  onTap: widget.onTap,
                ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: state.models.length,
              ),
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _ModelItem extends StatelessWidget {
  final Model model;
  final Function(Model) onTap;

  const _ModelItem({
    Key key,
    @required this.model,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.name, style: Theme.of(context).textTheme.headline6),
      onTap: () => onTap(model),
    );
  }
}
