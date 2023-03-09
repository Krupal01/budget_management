import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/local_service.dart';
import '../model/json_formatted.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final LocalService localService;

  UserCubit(this.localService) : super(UserInitial());

  Future<void> addUser(User user) async {
    emit(UserLoading());

    try {
      localService.addUser(user);
      emit(UserAddSuccess());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> updateUser(User user) async {
    emit(UserLoading());

    try {
      localService.updateUser(user);
      emit(UserUpdateSuccess());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> deleteUser(int userId) async {
    emit(UserLoading());

    try {
      localService.deleteUser(userId);
      emit(UserDeleteSuccess());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> getUser(int userId) async {
    emit(UserLoading());
    try {
      localService.getUserById(userId).then((value) => emit(UserGetSuccess(value)));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
