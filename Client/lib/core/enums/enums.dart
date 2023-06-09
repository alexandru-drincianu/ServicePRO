import 'dart:ui';

import 'package:flutter/material.dart';

enum UserRole { admin, mechanic, client }

final Map<int, String> UserRoleString = {
  UserRole.admin.index: 'Admin',
  UserRole.mechanic.index: 'Mechanic',
  UserRole.client.index: 'Client',
};

enum FuelType { gasoline, diesel, lpg, electric }

final Map<int, String> FuelTypeString = {
  FuelType.gasoline.index: 'Gasoline',
  FuelType.diesel.index: 'Diesel',
  FuelType.lpg.index: 'LPG',
  FuelType.electric.index: 'Electric',
};

enum WorkorderStatus { arrived, inProgress, ready, invoiced }

final Map<int, String> WorkorderStatusString = {
  WorkorderStatus.arrived.index: 'Arrived',
  WorkorderStatus.inProgress.index: 'In progress',
  WorkorderStatus.ready.index: 'Ready',
  WorkorderStatus.invoiced.index: 'Invoiced',
};

final Map<int, Color> WorkorderStatusColor = {
  WorkorderStatus.arrived.index: Colors.blue,
  WorkorderStatus.inProgress.index: Colors.orange,
  WorkorderStatus.ready.index: Colors.green,
};

enum WorkorderItemType { consumable, labour }

final Map<int, String> WorkorderItemTypeString = {
  WorkorderItemType.consumable.index: 'Consumable',
  WorkorderItemType.labour.index: 'Labour',
};
