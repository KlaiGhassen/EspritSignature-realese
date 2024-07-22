// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DashboardDataStruct extends BaseStruct {
  DashboardDataStruct({
    double? allUsersCount,
    double? allSignedUsers,
    double? allSignedUsersPercentage,
    double? allLogedInUsers,
    double? allLogedInUsersPercentage,
    double? signedTeachers,
    double? connectedTeachers,
  })  : _allUsersCount = allUsersCount,
        _allSignedUsers = allSignedUsers,
        _allSignedUsersPercentage = allSignedUsersPercentage,
        _allLogedInUsers = allLogedInUsers,
        _allLogedInUsersPercentage = allLogedInUsersPercentage,
        _signedTeachers = signedTeachers,
        _connectedTeachers = connectedTeachers;

  // "allUsersCount" field.
  double? _allUsersCount;
  double get allUsersCount => _allUsersCount ?? 0.0;
  set allUsersCount(double? val) => _allUsersCount = val;

  void incrementAllUsersCount(double amount) =>
      allUsersCount = allUsersCount + amount;

  bool hasAllUsersCount() => _allUsersCount != null;

  // "allSignedUsers" field.
  double? _allSignedUsers;
  double get allSignedUsers => _allSignedUsers ?? 0.0;
  set allSignedUsers(double? val) => _allSignedUsers = val;

  void incrementAllSignedUsers(double amount) =>
      allSignedUsers = allSignedUsers + amount;

  bool hasAllSignedUsers() => _allSignedUsers != null;

  // "allSignedUsersPercentage" field.
  double? _allSignedUsersPercentage;
  double get allSignedUsersPercentage => _allSignedUsersPercentage ?? 0.0;
  set allSignedUsersPercentage(double? val) => _allSignedUsersPercentage = val;

  void incrementAllSignedUsersPercentage(double amount) =>
      allSignedUsersPercentage = allSignedUsersPercentage + amount;

  bool hasAllSignedUsersPercentage() => _allSignedUsersPercentage != null;

  // "allLogedInUsers" field.
  double? _allLogedInUsers;
  double get allLogedInUsers => _allLogedInUsers ?? 0.0;
  set allLogedInUsers(double? val) => _allLogedInUsers = val;

  void incrementAllLogedInUsers(double amount) =>
      allLogedInUsers = allLogedInUsers + amount;

  bool hasAllLogedInUsers() => _allLogedInUsers != null;

  // "allLogedInUsersPercentage" field.
  double? _allLogedInUsersPercentage;
  double get allLogedInUsersPercentage => _allLogedInUsersPercentage ?? 0.0;
  set allLogedInUsersPercentage(double? val) =>
      _allLogedInUsersPercentage = val;

  void incrementAllLogedInUsersPercentage(double amount) =>
      allLogedInUsersPercentage = allLogedInUsersPercentage + amount;

  bool hasAllLogedInUsersPercentage() => _allLogedInUsersPercentage != null;

  // "signedTeachers" field.
  double? _signedTeachers;
  double get signedTeachers => _signedTeachers ?? 0.0;
  set signedTeachers(double? val) => _signedTeachers = val;

  void incrementSignedTeachers(double amount) =>
      signedTeachers = signedTeachers + amount;

  bool hasSignedTeachers() => _signedTeachers != null;

  // "connectedTeachers" field.
  double? _connectedTeachers;
  double get connectedTeachers => _connectedTeachers ?? 0.0;
  set connectedTeachers(double? val) => _connectedTeachers = val;

  void incrementConnectedTeachers(double amount) =>
      connectedTeachers = connectedTeachers + amount;

  bool hasConnectedTeachers() => _connectedTeachers != null;

  static DashboardDataStruct fromMap(Map<String, dynamic> data) =>
      DashboardDataStruct(
        allUsersCount: castToType<double>(data['allUsersCount']),
        allSignedUsers: castToType<double>(data['allSignedUsers']),
        allSignedUsersPercentage:
            castToType<double>(data['allSignedUsersPercentage']),
        allLogedInUsers: castToType<double>(data['allLogedInUsers']),
        allLogedInUsersPercentage:
            castToType<double>(data['allLogedInUsersPercentage']),
        signedTeachers: castToType<double>(data['signedTeachers']),
        connectedTeachers: castToType<double>(data['connectedTeachers']),
      );

  static DashboardDataStruct? maybeFromMap(dynamic data) => data is Map
      ? DashboardDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'allUsersCount': _allUsersCount,
        'allSignedUsers': _allSignedUsers,
        'allSignedUsersPercentage': _allSignedUsersPercentage,
        'allLogedInUsers': _allLogedInUsers,
        'allLogedInUsersPercentage': _allLogedInUsersPercentage,
        'signedTeachers': _signedTeachers,
        'connectedTeachers': _connectedTeachers,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'allUsersCount': serializeParam(
          _allUsersCount,
          ParamType.double,
        ),
        'allSignedUsers': serializeParam(
          _allSignedUsers,
          ParamType.double,
        ),
        'allSignedUsersPercentage': serializeParam(
          _allSignedUsersPercentage,
          ParamType.double,
        ),
        'allLogedInUsers': serializeParam(
          _allLogedInUsers,
          ParamType.double,
        ),
        'allLogedInUsersPercentage': serializeParam(
          _allLogedInUsersPercentage,
          ParamType.double,
        ),
        'signedTeachers': serializeParam(
          _signedTeachers,
          ParamType.double,
        ),
        'connectedTeachers': serializeParam(
          _connectedTeachers,
          ParamType.double,
        ),
      }.withoutNulls;

  static DashboardDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DashboardDataStruct(
        allUsersCount: deserializeParam(
          data['allUsersCount'],
          ParamType.double,
          false,
        ),
        allSignedUsers: deserializeParam(
          data['allSignedUsers'],
          ParamType.double,
          false,
        ),
        allSignedUsersPercentage: deserializeParam(
          data['allSignedUsersPercentage'],
          ParamType.double,
          false,
        ),
        allLogedInUsers: deserializeParam(
          data['allLogedInUsers'],
          ParamType.double,
          false,
        ),
        allLogedInUsersPercentage: deserializeParam(
          data['allLogedInUsersPercentage'],
          ParamType.double,
          false,
        ),
        signedTeachers: deserializeParam(
          data['signedTeachers'],
          ParamType.double,
          false,
        ),
        connectedTeachers: deserializeParam(
          data['connectedTeachers'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'DashboardDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DashboardDataStruct &&
        allUsersCount == other.allUsersCount &&
        allSignedUsers == other.allSignedUsers &&
        allSignedUsersPercentage == other.allSignedUsersPercentage &&
        allLogedInUsers == other.allLogedInUsers &&
        allLogedInUsersPercentage == other.allLogedInUsersPercentage &&
        signedTeachers == other.signedTeachers &&
        connectedTeachers == other.connectedTeachers;
  }

  @override
  int get hashCode => const ListEquality().hash([
        allUsersCount,
        allSignedUsers,
        allSignedUsersPercentage,
        allLogedInUsers,
        allLogedInUsersPercentage,
        signedTeachers,
        connectedTeachers
      ]);
}

DashboardDataStruct createDashboardDataStruct({
  double? allUsersCount,
  double? allSignedUsers,
  double? allSignedUsersPercentage,
  double? allLogedInUsers,
  double? allLogedInUsersPercentage,
  double? signedTeachers,
  double? connectedTeachers,
}) =>
    DashboardDataStruct(
      allUsersCount: allUsersCount,
      allSignedUsers: allSignedUsers,
      allSignedUsersPercentage: allSignedUsersPercentage,
      allLogedInUsers: allLogedInUsers,
      allLogedInUsersPercentage: allLogedInUsersPercentage,
      signedTeachers: signedTeachers,
      connectedTeachers: connectedTeachers,
    );
