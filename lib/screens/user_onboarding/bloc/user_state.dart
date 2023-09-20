// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {}

class UserErrorState extends UserState {
  String failMsg;
  UserErrorState({
    required this.failMsg,
  });
}
