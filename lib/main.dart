import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:testapp/BlocPatternApp/Blocs/internet_bloc.dart';
import 'package:testapp/GameApp/mario.dart';
import 'BlocPatternApp/Screens/home_screen.dart';
import 'ProviderApp/Pages/homepage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'api_class.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await FlutterConfig.loadEnvVariables();
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('dot evn ${dotenv.env['API_URL']}');
    print('dot env2 ${dotenv.env['PHOTOS']}');
    print('api class ${MyApi.API_URL}');
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    List pages = ['ProviderApp', 'BlocPatternApp', 'Mario'];
    List<Widget> route = [HomePage(), HomeScreen(), MarioGame()];

    return Scaffold(
      appBar: AppBar(
        title: Text('Pages'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: pages.length,
            itemBuilder: (ctx, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => route[index]));
                      },
                      child: Text(pages[index].toString())),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
