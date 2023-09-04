import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - deviceInfo] action in HomePage widget.
  List<String>? deviceInfoReceived;
  // Stores action output result for [Backend Call - API (GetIP)] action in HomePage widget.
  ApiCallResponse? ipReceived;
  // Stores action output result for [Backend Call - API (VersionCheck)] action in HomePage widget.
  ApiCallResponse? versionReceived;
  InstantTimer? instantTimer;
  // Stores action output result for [Custom Action - isSecure] action in HomePage widget.
  bool? isSecure;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Minimum 3 characters';
    }

    return null;
  }

  // State field(s) for TextField widget.
  TextEditingController? textController2;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Auth)] action in Button widget.
  ApiCallResponse? auth;
  // Stores action output result for [Backend Call - API (DeviceCheck)] action in Button widget.
  ApiCallResponse? deviceCheck;
  // Stores action output result for [Backend Call - API (SubCheck)] action in Button widget.
  ApiCallResponse? subcheck;
  // Stores action output result for [Backend Call - API (UserInfo)] action in Button widget.
  ApiCallResponse? apiResulth0f;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    passwordVisibility = false;
    textController2Validator = _textController2Validator;
  }

  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
    textController1?.dispose();
    textController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
