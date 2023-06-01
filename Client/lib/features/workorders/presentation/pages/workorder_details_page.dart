import 'package:flutter/material.dart';
import 'package:service_pro/core/localization/localization.dart';

import '../../../../core/widgets/app_drawer.dart';
import '../../../../routing/app_router.dart';
import '../../../../routing/app_router.gr.dart';

class WorkorderDetailsPage extends StatefulWidget {
  final int id;
  const WorkorderDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  WorkorderDetailsPageState createState() => WorkorderDetailsPageState();
}

class WorkorderDetailsPageState extends State<WorkorderDetailsPage> {
  bool _setupComplete = false;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    setState(() {
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
                Text(
                  "WORKORDER PAGE ${widget.id}",
                ),
              ]),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      drawer: const AppDrawer(),
    );
  }
}
