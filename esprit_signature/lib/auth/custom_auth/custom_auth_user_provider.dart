import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class EspritSignatureAuthUser {
  EspritSignatureAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<EspritSignatureAuthUser> espritSignatureAuthUserSubject =
    BehaviorSubject.seeded(EspritSignatureAuthUser(loggedIn: false));
Stream<EspritSignatureAuthUser> espritSignatureAuthUserStream() =>
    espritSignatureAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
