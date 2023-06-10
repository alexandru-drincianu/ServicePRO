import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/enums/enums.dart';
import 'package:service_pro/core/localization/localization.dart';
import 'package:service_pro/core/models/VehicleModels/vehicle_model.dart';

import '../../../../core/custom_colors.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../routing/app_router.dart';
import '../../../../routing/app_router.gr.dart';
import '../../provider/vehicles_provider.dart';

class VehicleDetailsPage extends StatefulWidget {
  final int id;
  const VehicleDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  VehicleDetailsPageState createState() => VehicleDetailsPageState();
}

class VehicleDetailsPageState extends State<VehicleDetailsPage> {
  bool _setupComplete = false;
  late final VehicleModel _vehicleData;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    final vehiclesProvider = context.read<VehiclesProvider>();
    final vehicleData = await vehiclesProvider.getVehicleById(widget.id);
    setState(() {
      _vehicleData = vehicleData!;
      _setupComplete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate(
            TranslationKeys.vehicleDetails,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => router.replace(const VehiclesRoute()),
        ),
      ),
      body: _setupComplete
          ? SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 40,
                ),
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
                        _vehicleData.registration!,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildRow(
                  icon: Icons.person,
                  label: 'Owner:',
                  text: _vehicleData.user!.fullName!,
                  buttonLabel: 'Go to profile',
                  onPressed: () {
                    router.replace(UserDetailsRoute(id: _vehicleData.user!.id));
                  },
                ),
                _buildRow(
                  icon: Icons.confirmation_num,
                  label: 'VIN:',
                  text: _vehicleData.vin!,
                ),
                _buildRow(
                  icon: Icons.branding_watermark,
                  label: 'Brand:',
                  text: _vehicleData.brand!,
                ),
                _buildRow(
                  icon: Icons.confirmation_num,
                  label: 'Model:',
                  text: _vehicleData.model!,
                ),
                _buildRow(
                  icon: Icons.ev_station,
                  label: 'Fuel:',
                  text: FuelTypeString[_vehicleData.fuelType!] ?? '',
                ),
                _buildRow(
                  icon: Icons.speed,
                  label: 'Mileage:',
                  text: _vehicleData.mileage!.toString(),
                ),
              ]),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      drawer: const AppDrawer(),
    );
  }

  Container _buildRow({
    required IconData icon,
    required String label,
    required String text,
    String? buttonLabel,
    VoidCallback? onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          if (buttonLabel != null)
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(
                    buttonLabel,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
