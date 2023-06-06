import 'package:flutter/material.dart';

import '../../../../core/widgets/app_drawer.dart';

class LaboursGrid extends StatefulWidget {
  const LaboursGrid({Key? key}) : super(key: key);

  @override
  LaboursGridState createState() => LaboursGridState();
}

class LaboursGridState extends State<LaboursGrid> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: const Text("Labour Grid"),
      ),
    );
  }
}
