// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class CreateNewUserEvent extends UserEvent {
  UserModel newUser;
  CreateNewUserEvent({
    required this.newUser,
  });
}

class LoginUserEvent extends UserEvent {
  String uname;
  String pass;
  LoginUserEvent({
    required this.uname,
    required this.pass,
  });
}
