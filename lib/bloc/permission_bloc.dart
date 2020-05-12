import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vsnap/utils/utils.dart';
import 'package:meta/meta.dart';

part 'permission_event.dart';
part 'permission_state.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  @override
  PermissionState get initialState => PermissionInitial();

  @override
  Stream<PermissionState> mapEventToState(
    PermissionEvent event,
  ) async* {
    if (event is RequestPermissions) {
      yield PermissionLoading();
      if (event.permissions == null || event.permissions.isEmpty) {
        yield PermissionError();
      }

      final _permissionResult = await requestPermissions(event.permissions);
      if (_permissionResult == PermissionStatus.granted) {
        yield PermissionGranted();
      } else if (_permissionResult == PermissionStatus.denied) {
        yield PermissionDenied();
      } else if (_permissionResult == PermissionStatus.permanentlyDenied &&
          Platform.isAndroid) {
        yield PermissionPermanentlyDenied();
      } else if (_permissionResult == PermissionStatus.restricted &&
          Platform.isIOS) {
        yield PermissionRestricted();
      } else {
        yield PermissionError();
      }

      //if (_permissionResult != null) {
      //  yield PermissionGranted(_permissionResult);
      //} else {
      //  yield PermissionGranted(false);
      //}
    }
  }
}
