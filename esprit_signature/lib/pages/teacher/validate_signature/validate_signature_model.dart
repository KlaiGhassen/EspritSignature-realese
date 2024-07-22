import '/flutter_flow/flutter_flow_util.dart';
import 'validate_signature_widget.dart' show ValidateSignatureWidget;
import 'package:flutter/material.dart';

class ValidateSignatureModel extends FlutterFlowModel<ValidateSignatureWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
