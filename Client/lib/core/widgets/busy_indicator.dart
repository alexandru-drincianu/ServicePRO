import 'package:flutter/material.dart';

/// [BusyIndicator] is a widget used to display in progress indicator on the screen.
class BusyIndicator extends StatelessWidget {
  const BusyIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Opacity(
          opacity: 0.1,
          child: ModalBarrier(
            dismissible: false,
          ),
        ),
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
