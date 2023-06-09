import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

void showToastSucceded(message) {
  BotToast.showText(
    text: message,
    textStyle: const TextStyle(
      color: Colors.white,
      fontSize: 16.0,
    ),
    contentColor: Colors.green,
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 16.0,
    ),
  );
}

void showToastFailed(message) {
  BotToast.showText(
    text: message,
    textStyle: const TextStyle(
      color: Colors.white,
      fontSize: 16.0,
    ),
    contentColor: Colors.red,
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 16.0,
    ),
  );
}
