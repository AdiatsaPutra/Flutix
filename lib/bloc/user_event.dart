part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUser extends UserEvent {
  final String id;

  LoadUser(this.id);
  @override
  List<Object> get props => [id];
}

class SignOut extends UserEvent {
  @override
  List<Object> get props => [];
}

// Update Data User
class UpdateData extends UserEvent {
  final String name;
  final String profilImage;

  UpdateData({this.name, this.profilImage});

  @override
  List<Object> get props => [name, profilImage];
}
