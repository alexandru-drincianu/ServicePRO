import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:provider/provider.dart';

import 'package:service_pro/core/models/base_state.dart';
import 'package:service_pro/core/widgets/busy_indicator.dart';
import 'package:service_pro/features/orders/presentation/widgets/orders_container.dart';
import 'package:service_pro/features/orders/provider/orders_provider.dart';
import '../../../../helpers.dart';
import '../../../../mocks.dart';

void main() {
  group(
    OrdersContainer,
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

      /// Helper function used to render [OrdersContainer] widget in a common way.
      Future<void> renderOrdersContainer(WidgetTester tester) => renderWidget(
            tester,
            // Material is required by OrderSearchBar to be able to render the
            // TextFormField.
            const Material(child: OrdersContainer()),
            providers: [
              ChangeNotifierProvider<OrdersProvider>(
                create: (_) => mockOrdersProvider,
              ),
            ],
          );

      testWidgets(
        'calls provider.fetchOrders() in initState()',
        (tester) async {
          await renderOrdersContainer(tester);

          verify(mockOrdersProvider.fetchOrders).called(1);
        },
      );

      /// Helper function for expecting [Busy Indicator widget]
      Future<void> testForBusyIndicator(WidgetTester tester) async {
        await renderOrdersContainer(tester);
        expect(find.byType(BusyIndicator), findsOneWidget);
      }

      testWidgets(
        'renders a busy indicator while fetching orders.',
        (tester) async {
          when(() => mockOrdersProvider.fetchOrdersState).thenReturn(
            const BaseState.busy(),
          );
          await testForBusyIndicator(tester);
        },
      );

      testWidgets(
        'renders a busy indicator while deleting orders.',
        (tester) async {
          when(() => mockOrdersProvider.deleteOrderState).thenReturn(
            const BaseState.busy(),
          );
          await testForBusyIndicator(tester);
        },
      );

      testWidgets(
        'displays the error message of fetch orders state when fetching orders '
        'failed.',
        (tester) async {
          when(() => mockOrdersProvider.fetchOrdersState).thenReturn(
            const BaseState.error('#translation_key'),
          );

          await renderOrdersContainer(tester);

          expect(find.text('#translation_key'), findsOneWidget);
        },
      );
    },
  );
}
