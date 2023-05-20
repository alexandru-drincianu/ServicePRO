import 'package:flutter/material.dart';
import 'package:service_pro/routing/app_router.dart';

import '../../../../core/localization/localization.dart';
import '../../../../routing/app_router.gr.dart';

class NewMechanicInfoPage extends StatefulWidget {
  final int id;
  const NewMechanicInfoPage({Key? key, required this.id}) : super(key: key);

  @override
  NewMechanicInfoPageState createState() => NewMechanicInfoPageState();
}

class NewMechanicInfoPageState extends State<NewMechanicInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              const Text(
                'Welcome to the ServicePRO team!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Let\'s get you started',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  router.replace(UserDetailsRoute(id: widget.id));
                },
                child: const Text('Set up details'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
