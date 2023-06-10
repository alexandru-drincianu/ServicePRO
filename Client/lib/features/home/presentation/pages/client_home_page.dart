import 'package:flutter/material.dart';

/// [ClientHomePage] is the page displayed under Home tab in the app. It is the first
/// screen displayed after a successful login.

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({Key? key}) : super(key: key);

  @override
  ClientHomePageState createState() => ClientHomePageState();
}

class ClientHomePageState extends State<ClientHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            child: Text(
              "Welcome to ServicePRO!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
