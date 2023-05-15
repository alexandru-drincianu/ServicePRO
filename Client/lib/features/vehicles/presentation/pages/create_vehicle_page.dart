import 'package:flutter/material.dart';
import 'package:service_pro/features/vehicles/presentation/widgets/vehicle_wizzard_form.dart';
import '../../../../core/localization/localization.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../routing/app_router.dart';
import '../../../../routing/app_router.gr.dart';

class CreateVehiclePage extends StatefulWidget {
  const CreateVehiclePage({Key? key}) : super(key: key);

  @override
  CreateVehiclePageState createState() => CreateVehiclePageState();
}

class CreateVehiclePageState extends State<CreateVehiclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate(
            TranslationKeys.createVehicle,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => router.replace(const VehiclesRoute()),
        ),
      ),
      body: const VehicleWizzardForm(),
      drawer: const AppDrawer(),
    );
  }
}
