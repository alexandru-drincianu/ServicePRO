import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:provider/provider.dart';

import 'package:service_pro/core/constants/translation_keys.dart';
import 'package:service_pro/core/models/order_model.dart';
import 'package:service_pro/features/orders/presentation/widgets/delete_alert_dialog.dart';
import 'package:service_pro/features/orders/presentation/widgets/orders_list.dart';
import 'package:service_pro/features/orders/provider/orders_provider.dart';
import '../../../../core/models/factories/order_model_factory.dart';
import '../../../../helpers.dart';
import '../../../../mocks.dart';

void main() {
  group(
    OrdersList,
    () {
      late final MockOrdersProvider mockOrdersProvider;

      setUpAll(() {
        mockOrdersProvider = MockOrdersProvider();
      });

      tearDown(() {
        reset(mockOrdersProvider);
      });

      setUp(() {
        when(mockOrdersProvider.fetchOrders).thenAnswer(
          (_) => Future.value(),
        );
        when(
          () => mockOrdersProvider.fetchOrdersState,
        ).thenReturn(
          const FetchOrdersState.busy(),
        );
        when(
          () => mockOrdersProvider.deleteOrderState,
        ).thenReturn(
          const DeleteOrderState.empty(),
        );
      });

      /// Helper function used to render [OrdersList] widget in a common way.
      Future<void> renderOrdersList(
        WidgetTester tester, {
        List<OrderModel>? orders,
      }) =>
          renderWidget(
            tester,
            OrdersList(
              orders: orders ?? const [],
            ),
            providers: [
              ChangeNotifierProvider<OrdersProvider>(
                create: (_) => mockOrdersProvider,
              ),
            ],
          );

      testWidgets(
        'renders correctly for when there is no order provided and no filter is '
        'applied.',
        (tester) async {
          when(() => mockOrdersProvider.filter).thenReturn(null);

          await renderOrdersList(tester);

          expect(find.byType(ListView), findsNothing);
          expect(find.byType(Dismissible), findsNothing);

          expect(find.text(TranslationKeys.noOrdersCreated), findsOneWidget);
        },
      );

      testWidgets(
        'renders correctly for when there is no order provided and a filter is '
        'applied.',
        (tester) async {
          when(() => mockOrdersProvider.filter).thenReturn('test');

          await renderOrdersList(tester);

          expect(find.byType(ListView), findsNothing);
          expect(find.byType(Dismissible), findsNothing);

          expect(find.text(TranslationKeys.noOrdersFound), findsOneWidget);
        },
      );

      testWidgets(
        'renders correctly in case the orders list is not empty.',
        (tester) async {
          final orders = OrderModelFactory().generateFakeList(length: 2);
          await renderOrdersList(tester, orders: orders);

          expect(find.text(TranslationKeys.noOrdersCreated), findsNothing);
          expect(find.text(TranslationKeys.noOrdersFound), findsNothing);

          expect(find.byType(ListView), findsOneWidget);
          expect(find.byType(Dismissible), findsNWidgets(2));

          for (final order in orders) {
            final orderFinder = find.byKey(Key('${order.id}'));
            expect(
              find.descendant(
                of: orderFinder,
                matching: find.byType(Card),
              ),
              findsOneWidget,
            );
            expect(
              find.descendant(
                of: orderFinder,
                matching: find.text(order.number),
              ),
              findsOneWidget,
            );
            expect(
              find.descendant(
                of: orderFinder,
                matching: find.text(order.client),
              ),
              findsOneWidget,
            );
            expect(
              find.descendant(
                of: orderFinder,
                matching: find.text(order.capacity.toString()),
              ),
              findsOneWidget,
            );
            expect(
              find.descendant(
                of: orderFinder,
                matching: find.text(order.value.toString()),
              ),
              findsOneWidget,
            );
            expect(
              find.descendant(
                of: orderFinder,
                matching: find.text(order.deliveryDate),
              ),
              findsOneWidget,
            );
          }
        },
      );

      testWidgets(
        'dragging the card to left or to right dismisses it creating a dialog '
        'with DeleteAlertDialog as body.',
        (tester) async {
          final orders = OrderModelFactory().generateFakeList(length: 2);
          await renderOrdersList(tester, orders: orders);

          // Dismiss first order card
          await tester.dragFrom(
            tester.getCenter(find.byType(Dismissible).first),
            const Offset(1000, 0),
          );
          await tester.pumpAndSettle();

          expect(find.byType(DeleteAlertDialog), findsOneWidget);
        },
      );

      testWidgets(
        'calls provider.deleteOrder when confirming the deletion of an order.',
        (tester) async {
          final orders = OrderModelFactory().generateFakeList(length: 2);

          when(
            () => mockOrdersProvider.deleteOrder(any()),
          ).thenAnswer(
            (_) => Future.value(),
          );

          await renderOrdersList(tester, orders: orders);

          // Dismiss first order card and confirm deletion
          await tester.dragFrom(
            tester.getCenter(find.byType(Dismissible).first),
            const Offset(1000, 0),
          );
          await tester.pumpAndSettle();
          await tester.tap(find.text(TranslationKeys.deleteDialogConfirm));
          await tester.pumpAndSettle();

          verify(
            () => mockOrdersProvider.deleteOrder(orders.first.id!),
          ).called(1);
        },
      );
    },
  );
}
