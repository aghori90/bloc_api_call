part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

// for button clicked event
class ButtonClicked extends ProfileEvent{

  @override
  // TODO: implement props
  List<Object?> get props => [];

}