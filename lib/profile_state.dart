part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}
// inisialize
class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

// Loading
class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

// Success
class ProfileSuccess extends ProfileState {
  // caling profile model step 2
  final ProfilModel model;
  ProfileSuccess(this.model);
  @override
  List<Object> get props => [model];
}

// Error
class ProfileError extends ProfileState {
  // msg step 1
  final String msg;
  var error;
  // constructor
  ProfileError(this.error, this.msg);
  @override
  List<Object> get props => [];
}
