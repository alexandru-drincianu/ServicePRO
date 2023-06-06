import 'package:flutter/material.dart';
import 'package:service_pro/core/localization/localization.dart';
import 'package:service_pro/features/warehouse/presentation/widgets/consumables_grid.dart';
import 'package:service_pro/features/warehouse/presentation/widgets/labours_grid.dart';

import '../../../../core/widgets/app_drawer.dart';

class WarehousePage extends StatefulWidget {
  const WarehousePage({Key? key}) : super(key: key);

  @override
  WarehousePageState createState() => WarehousePageState();
}

class WarehousePageState extends State<WarehousePage> {
  bool _showConsumables = false;
  bool _showLabours = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate(
            TranslationKeys.warehouse,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showConsumables = true;
                        _showLabours = false;
                      });
                    },
                    child: const Text("Consumables"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showConsumables = false;
                        _showLabours = true;
                      });
                    },
                    child: const Text("Labours"),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (_showConsumables) const ConsumablesGrid(),
              if (_showLabours) const LaboursGrid(),
            ],
          ),
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
