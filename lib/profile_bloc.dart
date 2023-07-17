import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_api_call/ProfilModel.dart';
import 'package:bloc_api_call/webservices.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  //creating web service object
  final _service = WebServices();
  ProfileBloc() : super(ProfileInitial()) {
  // create method to call an API
  on<ButtonClicked>((event, emit) => _callApi(event, emit));
  }
  //create method
  _callApi(ButtonClicked event, Emitter<ProfileState> emit) {
  //  when clicked loading to initiial
    emit(ProfileLoading());
  //  call the service
    final response = _service.callProfileApi();
    // error handeling
    if(response == null){
      emit(ProfileError('msg', 'error'));
    }else{
      var body  = jsonDecode(response.body);
      print('body: $body');
      var data = ProfilModel.fromJson(response.body);
      print(data);
      emit(ProfileSuccess(data));
    }
  }
}
