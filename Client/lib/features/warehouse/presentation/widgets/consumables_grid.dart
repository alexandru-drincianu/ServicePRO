import 'package:flutter/material.dart';

import '../../../../core/widgets/app_drawer.dart';

class ConsumablesGrid extends StatefulWidget {
  const ConsumablesGrid({Key? key}) : super(key: key);

  @override
  ConsumablesGridState createState() => ConsumablesGridState();
}

class ConsumablesGridState extends State<ConsumablesGrid> {
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
        child: const Text("Consumables Grid"),
      ),
    );
  }
}
