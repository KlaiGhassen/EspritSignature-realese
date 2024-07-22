import '/components/side_bar_nav_admin/side_bar_nav_admin_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'settings_page_widget.dart' show SettingsPageWidget;
import 'package:flutter/material.dart';

class SettingsPageModel extends FlutterFlowModel<SettingsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideBarNavAdmin component.
  late SideBarNavAdminModel sideBarNavAdminModel1;
  // Model for sideBarNavAdmin component.
  late SideBarNavAdminModel sideBarNavAdminModel2;

  @override
  void initState(BuildContext context) {
    sideBarNavAdminModel1 = createModel(context, () => SideBarNavAdminModel());
    sideBarNavAdminModel2 = createModel(context, () => SideBarNavAdminModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideBarNavAdminModel1.dispose();
    sideBarNavAdminModel2.dispose();
  }
}
