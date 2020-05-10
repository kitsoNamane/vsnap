import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vsnap/utils/utils.dart';

part 'permission_event.dart';
part 'permission_state.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  final Permission permission;

  PermissionBloc({@required this.permission}) : assert(permission != null);

  @override
  PermissionState get initialState => PermissionInitial();

  @override
  Stream<PermissionState> mapEventToState(
    PermissionEvent event,
  ) async* {
    if (event is RequestPermission) {
      yield PermissionLoading();
      final _permissionResult = await _requestPermission(permission);
      if (_permissionResult != null) {
        yield PermissionGranted(_permissionResult);
      } else {
        yield PermissionGranted(false);
      }
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    var permissionResult = await requestPermission(permission);
    return permissionResult;
  }
}
