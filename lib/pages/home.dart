import 'package:bloc_api_call/ProfilModel.dart';
import 'package:bloc_api_call/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //wrap with widget MultiBlockProvider
    return  Scaffold(
        appBar: AppBar(
          title: const Text(
            'Flutter Bloc API Call',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
                if (state is ProfileInitial) {
                  return Text("Click on Button for API Call");
                }
                if (state is ProfileLoading) {
                  return CircularProgressIndicator();
                }
                if (state is ProfileSuccess) {
                  ProfilModel model = state.model;
                  return Text(
                    'Name: ${model.data![0].firstName}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  );
                }
                if (state is ProfileError) {
                  return Text(state.msg);
                }
                return Text('Something went wrong');
              }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // passing profile event : Button clicked from profile event
            context.read<ProfileBloc>().add(ButtonClicked());
          },
          tooltip: 'Call Api',
          child: const Icon(Icons.call),
        ),
      );
  }
}

// mixin ProfileBloc {
//   void add(ButtonClicked buttonClicked) {}
// }
