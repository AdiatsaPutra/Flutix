import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tiket_flutter/bloc/blocs.dart';
import 'package:tiket_flutter/model/models.dart';
import 'package:tiket_flutter/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiket_flutter/shared/shared.dart';

part 'main_page.dart';
part 'sign_in_page.dart';
part 'wrapper.dart';
part 'splash_page.dart';
part 'movie_page.dart';
part 'sign_up_page.dart';
part 'preference.dart';
part 'account_confirmation_page.dart';

// Get Image From Gallery Method
Future<File> pick() {
  var image = ImagePicker.pickImage(source: ImageSource.gallery);
  return image;
}
