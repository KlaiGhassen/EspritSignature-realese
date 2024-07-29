import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'signature_page_widget.dart' show SignaturePageWidget;
import 'package:flutter/material.dart';

class SignaturePageModel extends FlutterFlowModel<SignaturePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - convertToBase64] action in validation widget.
  String? base64;
  // Stores action output result for [Backend Call - API (add signature)] action in validation widget.
  ApiCallResponse? apiResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
