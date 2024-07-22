import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/custom_auth/auth_util.dart';

List<UserStruct> sortTeachers(
  List<UserStruct> teachers,
  int index,
  bool order,
) {
  // sort list of teacher based on matrecule,fullName,email,updatedAt,status
  switch (index) {
    case 0:
      teachers.sort((a, b) => order
          ? a.matricule.compareTo(b.matricule)
          : b.matricule.compareTo(a.matricule));
      break;
    case 1:
      teachers.sort((a, b) => order
          ? a.fullName.compareTo(b.fullName)
          : b.fullName.compareTo(a.fullName));
      break;
    case 2:
      teachers.sort((a, b) =>
          order ? a.email.compareTo(b.email) : b.email.compareTo(a.email));
      break;
    case 3:
      teachers.sort((a, b) => order
          ? a.status.serialize().compareTo(b.status.serialize())
          : b.status.serialize().compareTo(a.status.serialize()));

      break;
    case 4:
      teachers.sort((a, b) => order
          ? a.updatedAt.compareTo(b.updatedAt)
          : b.updatedAt.compareTo(a.updatedAt));
      break;
    default:
      break;
  }
  return teachers;
}
