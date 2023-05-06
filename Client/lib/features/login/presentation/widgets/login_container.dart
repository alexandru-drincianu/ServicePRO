import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../core/constants/theme_constants.dart';
import '../../../../core/input_validators/mandatory_input_validator.dart';
import '../../../../core/localization/localization.dart';
import '../../../../routing/routing.dart';
import '../../provider/login_provider.dart';

/// [LoginContainer] is the body of [LoginPage]. Used to input the username and
/// the password necessary for authentication.
class LoginContainer extends StatefulWidget {
  const LoginContainer({this.onAuthenticationResult, super.key});

  /// Callback used to announce the router if the user succeeded to login or not.
  final void Function(bool isAuthenticated)? onAuthenticationResult;

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  late final LoginProvider loginProvider;
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loginProvider = context.read<LoginProvider>();
    loginProvider.addListener(onAuthenticationUpdates);

    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    loginProvider.removeListener(onAuthenticationUpdates);

    // Disposing text editing controllers is a must!
    usernameController.dispose();
    passwordController.dispose();
  }

  /// Called whenever the authenticated state changes
  void onAuthenticationUpdates() {
    final isAuthenticated = loginProvider.authenticationState.data != null;

    // If user is not authenticated ignore state update.
    if (!isAuthenticated) return;

    // If [onAuthenticationResult] is not null, call it. Else navigate to [OrdersPage].
    if (widget.onAuthenticationResult != null) {
      widget.onAuthenticationResult?.call(isAuthenticated);
    } else {
      // Reset router to orders page
      router.replaceAll(const [HomeRoute()]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(ThemeConstants.sizeUnitXXXL),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: context.translate(
                          TranslationKeys.username,
                        ),
                      ),
                      controller: usernameController,
                      validator: (username) => MandatoryInputValidator.validate(
                        username,
                        context.translate(
                          'mandatory_input',
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: context.translate(
                          TranslationKeys.password,
                        ),
                      ),
                      obscureText: true,
                      controller: passwordController,
                      validator: (password) => MandatoryInputValidator.validate(
                        password,
                        context.translate(
                          'mandatory_input',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: ThemeConstants.sizeUnitXXL,
                    ),
                    ElevatedButton(
                      child: Text(
                        context.translate(TranslationKeys.login).toUpperCase(),
                      ),
                      onPressed: () {
                        if (formKey.currentState == null ||
                            !formKey.currentState!.validate()) {
                          return;
                        }

                        // Trigger login process
                        context.read<LoginProvider>().login(
                              username: usernameController.text,
                              password: passwordController.text,
                            );
                      },
                    ),
                    const SizedBox(
                      height: ThemeConstants.sizeUnitXXL,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
