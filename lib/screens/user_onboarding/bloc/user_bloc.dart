import 'package:bloc/bloc.dart';
import 'package:expense_app/database_provider/app_database.dart';
import 'package:expense_app/models/user_model.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  AppDataBase db;
  UserBloc({required this.db}) : super(UserInitialState()) {
    on<CreateNewUserEvent>((event, emit) async {
      emit(UserLoadingState());
      bool check = await db.createNewAccount(event.newUser);

      if (check) {
        emit(UserSuccessState());
      } else {
        emit(UserErrorState(failMsg: 'Email Already Exists'));
      }
    });
    on<LoginUserEvent>((event, emit) async {
      emit(UserLoadingState());
      bool check = await db.authenticateUser(event.uname, event.pass);
      if (check) {
        emit(UserSuccessState());
      } else {
        emit(UserErrorState(failMsg: 'Invalid User Name & Password!!!!'));
      }
    });
  }
}
