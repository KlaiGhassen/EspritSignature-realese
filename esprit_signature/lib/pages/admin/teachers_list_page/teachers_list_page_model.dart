import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/side_bar_nav_admin/side_bar_nav_admin_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'teachers_list_page_widget.dart' show TeachersListPageWidget;
import 'package:flutter/material.dart';

class TeachersListPageModel extends FlutterFlowModel<TeachersListPageWidget> {
  ///  Local state fields for this page.

  List<UserStruct> listOfTeachers = [];
  void addToListOfTeachers(UserStruct item) => listOfTeachers.add(item);
  void removeFromListOfTeachers(UserStruct item) => listOfTeachers.remove(item);
  void removeAtIndexFromListOfTeachers(int index) =>
      listOfTeachers.removeAt(index);
  void insertAtIndexInListOfTeachers(int index, UserStruct item) =>
      listOfTeachers.insert(index, item);
  void updateListOfTeachersAtIndex(int index, Function(UserStruct) updateFn) =>
      listOfTeachers[index] = updateFn(listOfTeachers[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (all teachers)] action in TeachersListPage widget.
  ApiCallResponse? apiResultle5;
  // Model for sideBarNavAdmin component.
  late SideBarNavAdminModel sideBarNavAdminModel1;
  // State field(s) for loggedphone widget.
  String? loggedphoneValue;
  FormFieldController<String>? loggedphoneValueController;
  // Stores action output result for [Backend Call - API (all teachers)] action in loggedphone widget.
  ApiCallResponse? apiResultvnq;
  // State field(s) for searchphone widget.
  FocusNode? searchphoneFocusNode;
  TextEditingController? searchphoneTextController;
  String? Function(BuildContext, String?)? searchphoneTextControllerValidator;
  // Stores action output result for [Backend Call - API (all teachers)] action in searchphone widget.
  ApiCallResponse? apiResultwx8;
  // Stores action output result for [Backend Call - API (extract to pdf)] action in Button widget.
  ApiCallResponse? apiResultuz9;
  // State field(s) for logged widget.
  FormFieldController<String>? loggedValueController;
  // Stores action output result for [Backend Call - API (all teachers)] action in logged widget.
  ApiCallResponse? apiResult40q;
  // State field(s) for searchpc widget.
  FocusNode? searchpcFocusNode;
  TextEditingController? searchpcTextController;
  String? Function(BuildContext, String?)? searchpcTextControllerValidator;
  List<String> simpleSearchResults = [];
  // Stores action output result for [Backend Call - API (all teachers)] action in Button widget.
  ApiCallResponse? apiResultpnm;
  // Stores action output result for [Backend Call - API (extract to pdf)] action in Button widget.
  ApiCallResponse? apiResultuz10;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<UserStruct>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<UserStruct>();
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
    searchphoneFocusNode?.dispose();
    searchphoneTextController?.dispose();

    searchpcFocusNode?.dispose();
    searchpcTextController?.dispose();

    sideBarNavAdminModel2.dispose();
  }

  /// Additional helper methods.
  String? get loggedValue => loggedValueController?.value;
}
