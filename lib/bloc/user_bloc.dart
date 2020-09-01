import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tiket_flutter/model/models.dart';
import 'package:tiket_flutter/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    // Mengambil Data Dari Firestore
    if (event is LoadUser) {
      User user = await UserServices.getUser(event.id);

      yield UserLoaded(user);
      // Jika SignOut Mengembalikan User Initial
    } else if (event is SignOut) {
      yield UserInitial();
    }
  }
}
