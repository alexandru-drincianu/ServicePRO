import 'package:service_pro/core/models/order_model.dart';
import 'model_factory.dart';

class OrderModelFactory extends ModelFactory<OrderModel> {
  @override
  OrderModel generateFake() {
    return OrderModel(
      id: faker.randomGenerator.integer(10000),
      number: faker.randomGenerator.integer(10000).toString(),
      client: '${faker.person.firstName()} ${faker.person.lastName()}',
      capacity: faker.randomGenerator.integer(10000),
      value: faker.randomGenerator.decimal(scale: 10000),
      deliveryDate: faker.date.dateTime(minYear: 2022).toString(),
      isActive: faker.randomGenerator.boolean(),
      isDeleted: faker.randomGenerator.boolean(),
    );
  }

  @override
  List<OrderModel> generateFakeList({
    required int length,
  }) =>
      List.generate(
        length,
        (_) => generateFake(),
      );
}
