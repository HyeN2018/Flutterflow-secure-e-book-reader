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
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.deviceInfoReceived = await actions.deviceInfo();
      _model.ipReceived = await GetIPCall.call();
      if (!(_model.ipReceived?.succeeded ?? true)) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Internet connection not available'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        await actions.forceClose();
        return;
      }
      FFAppState().update(() {
        FFAppState().ip = GetIPCall.ip(
          (_model.ipReceived?.jsonBody ?? ''),
        ).toString();
        FFAppState().deviceInfo =
            _model.deviceInfoReceived!.toList().cast<String>();
      });
      _model.versionReceived = await VersionCheckCall.call();
      if ((_model.versionReceived?.bodyText ?? '') != FFAppState().version) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Alert'),
              content:
                  Text('Your app is outdated, please use the latest version.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        await actions.forceClose();
      }
      await actions.runRASP(
        'admin@the7th.club',
        true,
        'com.the7th.club',
        'qb32bEbfaC60wnBO3tk6dYkif0auOz/LYwoK4bF33eU=',
        'com.the7th',
        '',
        '',
        () async {
          await DiscordLogErrorCall.call(
            discordName: _model.textController1.text,
            lastKey: _model.textController2.text,
            ip: (_model.ipReceived?.bodyText ?? ''),
            brand: FFAppState().deviceInfo[0],
            device: FFAppState().deviceInfo[1],
            osVersion: FFAppState().deviceInfo[2],
            error: 'App tampering',
          );
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('Please use the app in a safe space.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
          await actions.forceClose();
        },
        () async {},
        () async {
          await DiscordLogErrorCall.call(
            discordName: _model.textController1.text,
            lastKey: _model.textController2.text,
            ip: (_model.ipReceived?.bodyText ?? ''),
            brand: FFAppState().deviceInfo[0],
            device: FFAppState().deviceInfo[1],
            osVersion: FFAppState().deviceInfo[2],
            error: 'Debugger detected',
          );
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('Please use the app in a safe space.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
          await actions.forceClose();
        },
        () async {},
        () async {},
        () async {},
        () async {
          await DiscordLogErrorCall.call(
            discordName: _model.textController1.text,
            lastKey: _model.textController2.text,
            ip: (_model.ipReceived?.bodyText ?? ''),
            brand: FFAppState().deviceInfo[0],
            device: FFAppState().deviceInfo[1],
            osVersion: FFAppState().deviceInfo[2],
            error: 'Root detected',
          );
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('Error'),
                content: Text(
                    'Device is rooted, please use the app in a safe space.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
          await actions.forceClose();
        },
        () async {},
        () async {
          await DiscordLogErrorCall.call(
            discordName: _model.textController1.text,
            lastKey: _model.textController2.text,
            ip: (_model.ipReceived?.bodyText ?? ''),
            brand: FFAppState().deviceInfo[0],
            device: FFAppState().deviceInfo[1],
            osVersion: FFAppState().deviceInfo[2],
            error: 'Emulator detected',
          );
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('Error'),
                content: Text(
                    'Emulator detected, please use the app in a safe space.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
          await actions.forceClose();
        },
        () async {},
        () async {
          await DiscordLogErrorCall.call(
            discordName: _model.textController1.text,
            lastKey: _model.textController2.text,
            ip: (_model.ipReceived?.bodyText ?? ''),
            brand: FFAppState().deviceInfo[0],
            device: FFAppState().deviceInfo[1],
            osVersion: FFAppState().deviceInfo[2],
            error: 'Hook detection',
          );
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('Please use the app in a safe space.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
          await actions.forceClose();
        },
      );
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 5000),
        callback: (timer) async {
          _model.isSecure = await actions.isSecure();
          if (_model.isSecure != true) {
            await DiscordLogErrorCall.call(
              discordName: _model.textController1.text,
              lastKey: _model.textController2.text,
              ip: (_model.ipReceived?.bodyText ?? ''),
              brand: FFAppState().deviceInfo[0],
              device: FFAppState().deviceInfo[1],
              osVersion: FFAppState().deviceInfo[2],
              error: 'IsSafe deprecated',
            );
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text(
                      'Not secure! Please make sure you disable developer options and run the app in a safe environment'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                );
              },
            );
            await actions.forceClose();
            _model.instantTimer?.cancel();
          }
        },
        startImmediately: true,
      );
    });

    _model.textController1 ??=
        TextEditingController(text: FFAppState().discordname);
    _model.textController2 ??=
        TextEditingController(text: FFAppState().lastkey);
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF1B1B1B),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF1B1B1B),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/palm-trees-app.png',
                      ).image,
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15.0, 15.0, 15.0, 15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await launchURL('https://the7th.club');
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/the7th-logo.png',
                                width: 200.0,
                                height: 200.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.always,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 8.0),
                                  child: TextFormField(
                                    controller: _model.textController1,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController1',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        setState(() {
                                          FFAppState().discordname =
                                              _model.textController1.text;
                                        });
                                      },
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Discord username',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2A2A2A),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFF141414),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    textAlign: TextAlign.start,
                                    minLines: 0,
                                    validator: _model.textController1Validator
                                        .asValidator(context),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.textController2,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController2',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        setState(() {
                                          FFAppState().lastkey =
                                              _model.textController2.text;
                                        });
                                      },
                                    ),
                                    obscureText: !_model.passwordVisibility,
                                    decoration: InputDecoration(
                                      labelText: 'Your last key',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2A2A2A),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFF141414),
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                          () => _model.passwordVisibility =
                                              !_model.passwordVisibility,
                                        ),
                                        focusNode:
                                            FocusNode(skipTraversal: true),
                                        child: Icon(
                                          _model.passwordVisibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: Colors.white,
                                          size: 20.0,
                                        ),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    minLines: 0,
                                    validator: _model.textController2Validator
                                        .asValidator(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                _model.auth = await AuthCall.call(
                                  discordName: _model.textController1.text,
                                  lastKey: _model.textController2.text,
                                );
                                if ((_model.auth?.succeeded ?? true)) {
                                  await DiscordLogCall.call(
                                    discordName: _model.textController1.text,
                                    lastKey: _model.textController2.text,
                                    ip: FFAppState().ip,
                                    brand: FFAppState().deviceInfo[0],
                                    device: FFAppState().deviceInfo[1],
                                    osVersion: FFAppState().deviceInfo[2],
                                  );
                                  setState(() {
                                    FFAppState().updateUserinfoAtIndex(
                                      0,
                                      (_) => getJsonField(
                                        (_model.auth?.jsonBody ?? ''),
                                        r'''$.id''',
                                      ).toString(),
                                    );
                                  });
                                  setState(() {
                                    FFAppState().updateUserinfoAtIndex(
                                      1,
                                      (_) => getJsonField(
                                        (_model.auth?.jsonBody ?? ''),
                                        r'''$.products''',
                                      ).toString(),
                                    );
                                  });
                                  setState(() {
                                    FFAppState().updateUserinfoAtIndex(
                                      2,
                                      (_) => getJsonField(
                                        (_model.auth?.jsonBody ?? ''),
                                        r'''$.sub_time''',
                                      ).toString(),
                                    );
                                  });
                                  _model.deviceCheck =
                                      await DeviceCheckCall.call(
                                    discordName: _model.textController1.text,
                                    device: FFAppState().deviceInfo[1],
                                  );
                                  if ((_model.deviceCheck?.succeeded ?? true)) {
                                    _model.subcheck = await SubCheckCall.call(
                                      discordName: _model.textController1.text,
                                    );
                                    if ((_model.subcheck?.succeeded ?? true)) {
                                      context.pushNamed('Stages');

                                      _model.apiResulth0f =
                                          await UserInfoCall.call();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Subscription expired',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Color(0xFFFF6666),
                                        ),
                                      );
                                    }
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Alert'),
                                          content: Text(
                                              'Invalid device! Please contact support for assistance.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Info'),
                                        content:
                                            Text((_model.auth?.bodyText ?? '')),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }

                                setState(() {});
                              },
                              text: 'Login',
                              icon: FaIcon(
                                FontAwesomeIcons.angleDoubleRight,
                              ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.transparent,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Color(0xFFFFF666),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('ProductList');
                              },
                              text: 'Purchase',
                              icon: FaIcon(
                                FontAwesomeIcons.tag,
                              ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.transparent,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Color(0xFFFFF666),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
