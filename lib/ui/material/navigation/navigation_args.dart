
import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraArguments extends Equatable {
  final String scanType;
  final Permission permission;

  CameraArguments({this.scanType, this.permission});

  @override
  List<Object> get props => [];
}

