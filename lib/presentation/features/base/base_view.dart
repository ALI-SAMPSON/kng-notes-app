import 'package:flutter/material.dart';
import 'package:note_taking_app/app/app_di.dart';
import 'package:note_taking_app/presentation/features/base/base.model.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;

  const BaseView({super.key, 
    required this.builder,
  });

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = instance<T>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      //builder: (context) => model,
      value: model,
      //builder: (context) => model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
