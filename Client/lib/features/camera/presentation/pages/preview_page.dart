import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/features/vehicles/presentation/widgets/vehicle_wizzard_form.dart';
import 'dart:io';

import 'package:service_pro/features/vehicles/provider/vehicles_provider.dart';
import 'package:service_pro/routing/app_router.dart';
import 'package:service_pro/routing/app_router.gr.dart';

import '../../../../core/custom_colors.dart';
import '../../../../core/models/vehicle_scan_model.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key, required this.picture}) : super(key: key);

  final XFile picture;

  @override
  PreviewPageState createState() => PreviewPageState();
}

class PreviewPageState extends State<PreviewPage> {
  late VehicleScanModel? _vehicleScanModel;
  late bool _setupComplete = false;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    final vehiclesProvider = context.read<VehiclesProvider>();
    final vehicleScanModel =
        await vehiclesProvider.sendLicenseplatePhoto(widget.picture);
    setState(() {
      _vehicleScanModel = vehicleScanModel;
      _setupComplete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_setupComplete) {
      return const Center(child: CircularProgressIndicator());
    }

    String message = '';
    if (_vehicleScanModel?.vehicle != null) {
      message = 'The vehicle is in the database';
    } else {
      message = 'The vehicle does not exist';
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Preview Page')),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Image.file(
            File(widget.picture.path),
            fit: BoxFit.cover,
            width: 300,
            height: 300,
          ),
          const SizedBox(height: 24),
          Center(
            child: Container(
              width: 300,
              height: 80,
              decoration: BoxDecoration(
                color: CustomColors.nroGreen,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  _vehicleScanModel?.licensePlate ?? '',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            message,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          if (_vehicleScanModel?.vehicle == null)
            SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  router.replace(CreateVehicleRoute(
                    licensePlate: _vehicleScanModel?.licensePlate ?? '',
                  ));
                },
                child: const Text(
                  'Add vehicle!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            )
          else
            SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  router.replace(VehicleDetailsRoute(
                    id: _vehicleScanModel?.vehicle?.id ?? -1,
                  ));
                },
                child: const Text(
                  'Go to vehicle!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
