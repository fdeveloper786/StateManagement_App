import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/BlocPatternApp/Blocs/internet_event.dart';
import 'package:testapp/BlocPatternApp/Blocs/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent,InternetState> {
 Connectivity _connectivity = Connectivity();
 StreamSubscription? connectivitySubscription;

  InternetBloc() : super(InternetInitialState()) {
   on<InternetLostEvent>((event,emit)=> emit(InternetLostState()));
   on<InternetGainedEvent>((event,emit) => emit(InternetGainedState()));
   _connectivity.onConnectivityChanged.listen((result) {
     if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
       add(InternetGainedEvent());
     }
     else {
       add(InternetLostEvent());
     }
   });
  }

  @override // It is override because it is already defined in bloc
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}