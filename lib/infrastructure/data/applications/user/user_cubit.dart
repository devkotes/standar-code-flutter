import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:standar_code_flutter/infrastructure/data/models/list_user_model.dart';
import 'package:standar_code_flutter/infrastructure/data/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  final _repository = UserRepository();

  Future<void> getListUser(String page) async {
    try {
      emit(UserLoading());
      final data = await _repository.getListUser(page);
      emit(UserSuccess(data));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
