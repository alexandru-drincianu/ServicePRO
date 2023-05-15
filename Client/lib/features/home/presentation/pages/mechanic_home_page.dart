import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../camera/presentation/pages/camera_page.dart';

/// [MechanicHomePage] is the page displayed under Home tab in the app. It is the first
/// screen displayed after a successful login.

class MechanicHomePage extends StatefulWidget {
  const MechanicHomePage({Key? key}) : super(key: key);

  @override
  MechanicHomePageState createState() => MechanicHomePageState();
}

class MechanicHomePageState extends State<MechanicHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              await availableCameras().then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CameraPage(cameras: value),
                    ),
                  ));
            },
            child: const Text("Take a Picture"),
          ),
        ),
      ),
    );
  }
}
