// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? email,
    String? matricule,
    Role? role,
    String? image,
    Status? status,
    String? id,
    String? signatureImage,
    String? createdAt,
    String? updatedAt,
    String? fullName,
    bool? verified,
  })  : _email = email,
        _matricule = matricule,
        _role = role,
        _image = image,
        _status = status,
        _id = id,
        _signatureImage = signatureImage,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _fullName = fullName,
        _verified = verified;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "matricule" field.
  String? _matricule;
  String get matricule => _matricule ?? '';
  set matricule(String? val) => _matricule = val;

  bool hasMatricule() => _matricule != null;

  // "role" field.
  Role? _role;
  Role get role => _role ?? Role.ENSEIGNANT;
  set role(Role? val) => _role = val;

  bool hasRole() => _role != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "status" field.
  Status? _status;
  Status get status => _status ?? Status.NOLOG;
  set status(Status? val) => _status = val;

  bool hasStatus() => _status != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "signatureImage" field.
  String? _signatureImage;
  String get signatureImage => _signatureImage ?? '';
  set signatureImage(String? val) => _signatureImage = val;

  bool hasSignatureImage() => _signatureImage != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "fullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "verified" field.
  bool? _verified;
  bool get verified => _verified ?? false;
  set verified(bool? val) => _verified = val;

  bool hasVerified() => _verified != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        email: data['email'] as String?,
        matricule: data['matricule'] as String?,
        role: deserializeEnum<Role>(data['role']),
        image: data['image'] as String?,
        status: deserializeEnum<Status>(data['status']),
        id: data['id'] as String?,
        signatureImage: data['signatureImage'] as String?,
        createdAt: data['createdAt'] as String?,
        updatedAt: data['updatedAt'] as String?,
        fullName: data['fullName'] as String?,
        verified: data['verified'] as bool?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'email': _email,
        'matricule': _matricule,
        'role': _role?.serialize(),
        'image': _image,
        'status': _status?.serialize(),
        'id': _id,
        'signatureImage': _signatureImage,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt,
        'fullName': _fullName,
        'verified': _verified,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'matricule': serializeParam(
          _matricule,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.Enum,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.Enum,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'signatureImage': serializeParam(
          _signatureImage,
          ParamType.String,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updatedAt': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'fullName': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'verified': serializeParam(
          _verified,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        matricule: deserializeParam(
          data['matricule'],
          ParamType.String,
          false,
        ),
        role: deserializeParam<Role>(
          data['role'],
          ParamType.Enum,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        status: deserializeParam<Status>(
          data['status'],
          ParamType.Enum,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        signatureImage: deserializeParam(
          data['signatureImage'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updatedAt'],
          ParamType.String,
          false,
        ),
        fullName: deserializeParam(
          data['fullName'],
          ParamType.String,
          false,
        ),
        verified: deserializeParam(
          data['verified'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        email == other.email &&
        matricule == other.matricule &&
        role == other.role &&
        image == other.image &&
        status == other.status &&
        id == other.id &&
        signatureImage == other.signatureImage &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        fullName == other.fullName &&
        verified == other.verified;
  }

  @override
  int get hashCode => const ListEquality().hash([
        email,
        matricule,
        role,
        image,
        status,
        id,
        signatureImage,
        createdAt,
        updatedAt,
        fullName,
        verified
      ]);
}

UserStruct createUserStruct({
  String? email,
  String? matricule,
  Role? role,
  String? image,
  Status? status,
  String? id,
  String? signatureImage,
  String? createdAt,
  String? updatedAt,
  String? fullName,
  bool? verified,
}) =>
    UserStruct(
      email: email,
      matricule: matricule,
      role: role,
      image: image,
      status: status,
      id: id,
      signatureImage: signatureImage,
      createdAt: createdAt,
      updatedAt: updatedAt,
      fullName: fullName,
      verified: verified,
    );
