import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../core/dialogs/error_dialog_stack.dart';
import '../../../../core/localization/localization.dart';
import '../../../../core/widgets/busy_indicator.dart';
import '../../provider/login_provider.dart';
import '../widgets/login_container.dart';

/// [LoginPage] is the page responsible for user authentication. It is also the
/// initial page of the app.
class LoginPage extends StatelessWidget {
  const LoginPage({this.onAuthenticationResult, super.key});

  /// Callback used to announce the router if the user succeeded to login or not.
  final void Function(bool isAuthenticated)? onAuthenticationResult;

  @override
  Widget build(BuildContext context) {
    final authenticationState = context.select(
      (LoginProvider provider) => provider.authenticationState,
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          context.translate(TranslationKeys.loginTitle),
        ),
      ),
      body: Stack(
        children: [
          const LoginContainer(),
          if (authenticationState.hasError)
            ErrorDialogStack(
              errorMessage: context.translate(
                authenticationState.error?.errorId ?? 'login_error',
              ),
              details: authenticationState.error?.message,
              onReturn: context.read<LoginProvider>().resetState,
            ),
          if (authenticationState.isBusy) const BusyIndicator(),
        ],
      ),
    );
  }
}
