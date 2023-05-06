import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../core/constants/theme_constants.dart';
import '../../../../core/localization/localization.dart';
import '../../provider/orders_provider.dart';

/// [OrdersSearchBar] is the search bar displayed at the top of Orders Page. It
/// is used to sort orders based on order number or customer name.
class OrdersSearchBar extends StatefulWidget {
  const OrdersSearchBar({super.key});

  @override
  State<OrdersSearchBar> createState() => _OrdersSearchBarState();
}

class _OrdersSearchBarState extends State<OrdersSearchBar> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(
      text: context.read<OrdersProvider>().filter,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  /// Clears filter from provider and from local controller. Removes focus too.
  void clearFilter() {
    context.read<OrdersProvider>().filterOrders('');

    // Clear controller and lose focus
    controller.clear();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final hasEmptyFilter = context.select<OrdersProvider, bool>(
      (provider) => provider.filter == null || provider.filter!.isEmpty,
    );

    return Padding(
      padding: const EdgeInsets.all(ThemeConstants.paddingS),
      child: TextFormField(
        controller: controller,
        autofocus: false,
        decoration: InputDecoration(
          isDense: true,
          suffixIcon: hasEmptyFilter
              ? const Icon(
                  Icons.search,
                  size: ThemeConstants.sizeUnitXXL,
                )
              : IconButton(
                  icon: const Icon(
                    Icons.clear,
                    size: ThemeConstants.sizeUnitXXL,
                  ),
                  onPressed: clearFilter,
                ),
          contentPadding: EdgeInsets.zero,
          labelText: context.translate(
            TranslationKeys.searchOrdersLabel,
          ),
        ),
        onChanged: context.read<OrdersProvider>().filterOrders,
      ),
    );
  }
}
