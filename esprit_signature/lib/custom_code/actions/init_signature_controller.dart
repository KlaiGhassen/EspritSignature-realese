// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:signature/signature.dart';

Future initSignatureController() async {
  SignatureControllerSingleton().init();
}

class SignatureControllerSingleton {
  static SignatureControllerSingleton? _instance;

  factory SignatureControllerSingleton() {
    _instance ??= SignatureControllerSingleton._internal();
    return _instance!;
  }

  SignatureControllerSingleton._internal();

  SignatureController? signatureController;

  init() {
    signatureController = SignatureController(
      penStrokeWidth: 5,
      penColor: Colors.red,
      exportPenColor: Colors.red,
      exportBackgroundColor: Colors.white,
    );
  }
}
