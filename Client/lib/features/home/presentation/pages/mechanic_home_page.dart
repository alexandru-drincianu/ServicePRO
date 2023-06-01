import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:service_pro/routing/app_router.gr.dart';

import '../../../../core/models/client_model.dart';
import '../../../../routing/app_router.dart';
import '../../../camera/presentation/pages/camera_page.dart';
import '../../../info/presentation/pages/new_mechanic_info_page.dart';

/// [MechanicHomePage] is the page displayed under Home tab in the app. It is the first
/// screen displayed after a successful login.

class MechanicHomePage extends StatefulWidget {
  const MechanicHomePage({Key? key, required this.loggedInUserDetails})
      : super(key: key);

  final ClientModel loggedInUserDetails;

  @override
  MechanicHomePageState createState() => MechanicHomePageState();
}

class MechanicHomePageState extends State<MechanicHomePage> {
  @override
  void initState() {
    super.initState();
    if (isUserDetailsIncomplete()) {
      router.replace(NewMechanicInfoRoute(id: widget.loggedInUserDetails.id));
    }
  }

  bool isUserDetailsIncomplete() {
    return widget.loggedInUserDetails.email == null ||
        widget.loggedInUserDetails.address == null ||
        widget.loggedInUserDetails.telephoneNumber == null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 250,
            height: 250,
            child: ElevatedButton(
              onPressed: () async {
                await availableCameras().then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CameraPage(cameras: value),
                      ),
                    ));
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.camera_alt,
                    size: 120,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Scan License Plate",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
