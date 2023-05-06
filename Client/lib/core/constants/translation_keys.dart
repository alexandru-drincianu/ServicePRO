/// [TranslationKeys] returns the translation keys to use across the whole app
class TranslationKeys {
  const TranslationKeys._();

  // Common
  static const mandatoryInput = 'mandatory_input';

  // App
  static const appTitle = 'app_title';

  // Pages titles
  static const homeTitle = 'home_title';
  static const loginTitle = 'login_title';
  static const ordersTitle = 'orders_title';
  static const addOrdersTitle = 'add_orders_title';
  static const editOrderTitle = 'edit_order_title';
  static const settingsTitle = 'settings_title';

  // Login Page
  static const username = 'login_username';
  static const password = 'login_password';
  static const login = 'login_button';

  // Orders Page
  static const deleteDialogTitle = 'orders_delete_dialog_title';
  static const deleteDialogContent = 'orders_delete_dialog_content';
  static const deleteDialogConfirm = 'orders_delete_dialog_confirm';
  static const deleteDialogCancel = 'orders_delete_dialog_cancel';
  static const fetchOrdersErrorCode = 'fetch_orders_error';
  static const deleteOrderErrorCode = 'delete_order_error';

  // Order info Page
  static const orderNumber = 'order_info_order_number';
  static const orderCustomer = 'order_info_customer';
  static const orderCapacity = 'order_info_capacity';
  static const orderValue = 'order_info_value';
  static const orderDeliveryDate = 'order_info_delivery_date';
  static const orderActive = 'order_info_active';
  static const submit = 'order_info_submit';
  static const createOrderErrorCode = 'order_info_create_order_error';
  static const addOrderSuccess = 'order_info_success';
  static const updateOrderErrorCode = 'order_info_update_order_error';
  static const searchOrdersLabel = 'search_orders_label';
  static const noOrdersFound = 'no_orders_found';
  static const noOrdersCreated = 'no_orders_created';

  // Settings Page
  static const localeName = 'locale_name';
  static const language = 'language';
  static const theme = 'theme';
  static const logout = 'logout';
}
