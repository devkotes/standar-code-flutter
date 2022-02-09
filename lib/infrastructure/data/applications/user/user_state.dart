part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final ListUserModel listUserModel;

  const UserSuccess(this.listUserModel);

  @override
  List<Object> get props => [listUserModel];
}

class UserError extends UserState {
  final String msg;

  const UserError(this.msg);

  @override
  List<Object> get props => [msg];
}
