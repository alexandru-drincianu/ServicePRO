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
