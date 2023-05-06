import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import 'package:service_pro/core/models/base_state.dart';
import 'package:service_pro/features/orders/provider/orders_provider.dart';
import '../../../core/models/factories/order_model_factory.dart';
import '../../../mocks.dart';
import '../../../provider_test.dart';

void main() {
  group(
    OrdersProvider,
    () {
      late final MockOrdersService mockOrdersService;

      setUpAll(() {
        mockOrdersService = MockOrdersService();
      });

      group(
        'fetchOrders()',
        () {
          final orders = OrderModelFactory().generateFakeList(length: 2);

          testProvider<OrdersProvider>(
            'updates [fetchOrdersState] to busy, then it fetches the orders from '
            'repository and updates [fetchOrdersState] to success when finished.',
            build: () => OrdersProvider(ordersService: mockOrdersService),
            setUp: () => when(mockOrdersService.fetchOrders).thenAnswer(
              (_) => Future.value(orders),
            ),
            act: (provider) => provider.fetchOrders(),
            expect: {
              (provider) => provider.fetchOrdersState: [
                const FetchOrdersState.busy(),
                successActionState,
              ],

              // This is equivalent with running plain expect in verify block:
              // ```dart
              // verify: (provider) => expect(provider.filteredOrders, orders),
              // ```
              (provider) => provider.filteredOrders: [
                orders,
              ],
            },
            verify: (_) => verify(mockOrdersService.fetchOrders).called(1),
          );

          testProvider<OrdersProvider>(
            'updates [fetchOrdersState] to busy, then it fetches the orders from '
            'repository and updates [fetchOrdersState] to error if it fails.',
            build: () => OrdersProvider(ordersService: mockOrdersService),
            setUp: () => when(mockOrdersService.fetchOrders).thenThrow(''),
            act: (provider) => provider.fetchOrders(),
            expect: {
              (provider) => provider.fetchOrdersState: [
                const FetchOrdersState.busy(),
                const FetchOrdersState.error(''),
              ],
            },
            verify: (_) => verify(mockOrdersService.fetchOrders).called(1),
          );
        },
      );

      group(
        'deleteOrder()',
        () {
          final orders = OrderModelFactory().generateFakeList(length: 2);

          testProvider<OrdersProvider>(
            'updates [deleteOrderState] to busy, it deletes the order using '
            'the repository, then it fetches the orders from repository and '
            'updates [fetchOrdersState] to success. In case all went good, it '
            'also updates [deleteOrderState] to success.',
            build: () => OrdersProvider(ordersService: mockOrdersService),
            setUp: () {
              when(
                () => mockOrdersService.deleteOrder(any()),
              ).thenAnswer(
                (_) => Future.value(),
              );
              when(mockOrdersService.fetchOrders).thenAnswer(
                (_) => Future.value(orders),
              );
            },
            act: (provider) => provider.deleteOrder(0),
            expect: {
              (provider) => provider.deleteOrderState: [
                const DeleteOrderState.busy(),
                successActionState,
              ],

              // This is equivalent with running plain expect in verify block:
              // ```dart
              // verify: (provider) => expect(provider.filteredOrders, orders),
              // ```
              (provider) => provider.filteredOrders: [
                orders,
              ],
            },
            verify: (_) {
              verify(() => mockOrdersService.deleteOrder(0)).called(1);
              verify(mockOrdersService.fetchOrders).called(1);
            },
          );

          testProvider<OrdersProvider>(
            'updates [deleteOrderState] to busy, it deletes the order using the '
            'repository and then it updates [deleteOrderState] to error if the '
            'action failed.',
            build: () => OrdersProvider(ordersService: mockOrdersService),
            setUp: () {
              when(() => mockOrdersService.deleteOrder(any())).thenThrow('');
            },
            act: (provider) => provider.deleteOrder(0),
            expect: {
              (provider) => provider.fetchOrdersState: [],
              (provider) => provider.deleteOrderState: [
                const DeleteOrderState.busy(),
                const DeleteOrderState.error(''),
              ],
            },
            verify: (_) {
              verify(() => mockOrdersService.deleteOrder(0)).called(1);
              verifyNever(mockOrdersService.fetchOrders);
            },
          );

          testProvider<OrdersProvider>(
            'updates [deleteOrderState] to busy, it deletes the order using the '
            'repository, then it fetches the orders from repository and updates '
            '[deleteOrderState] to error if fetching the orders failed.',
            build: () => OrdersProvider(ordersService: mockOrdersService),
            setUp: () {
              when(
                () => mockOrdersService.deleteOrder(any()),
              ).thenAnswer(
                (_) => Future.value(),
              );
              when(mockOrdersService.fetchOrders).thenThrow('');
            },
            act: (provider) => provider.deleteOrder(0),
            expect: {
              (provider) => provider.fetchOrdersState: [],
              (provider) => provider.deleteOrderState: [
                const DeleteOrderState.busy(),
                const DeleteOrderState.error(''),
              ],
            },
            verify: (_) {
              verify(() => mockOrdersService.deleteOrder(0)).called(1);
              verify(mockOrdersService.fetchOrders).called(1);
            },
          );
        },
      );
    },
  );
}
