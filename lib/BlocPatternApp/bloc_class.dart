

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/BlocPatternApp/Blocs/internet_bloc.dart';
import 'package:testapp/BlocPatternApp/Blocs/internet_state.dart';

class BlocClass extends StatelessWidget {
   BlocClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetBloc,InternetState>(
      listener: (ctx,state) {
        if(state is InternetGainedState){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Internet connect!'),
                backgroundColor: Colors.green,
              )
          );
        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Internet not connect!'),
                backgroundColor: Colors.red,
              )
          );
        }
      },
      builder: (ctx,state) {
        if(state is InternetGainedState){
          return Text('Connected');
        }
        else if(state is InternetLostState){
          return Text('Internet not conencted !');
        }else {
          return Text("Loading...");
        }
      },
      // Listener worked as block builder but it will not make any screen, it will work in background.
      // Builder is used to make UI on screen on state change.
      // So , If we want to use both features then we can use BlockConsumer
      /*BlocBuilder<InternetBloc,InternetState>(
              builder: (ctx,state) {
                if(state is InternetGainedState){
                  return Text('Connected');
                }else if(state is InternetLostState){
                  return Text('Internet not conencted !');
                }else {
                  return Text("Loading...");
                }
              },
            ),*/
    );
  }
}
