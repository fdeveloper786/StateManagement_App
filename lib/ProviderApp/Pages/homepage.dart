import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:testapp/BlocPatternApp/Blocs/internet_bloc.dart';
import 'package:testapp/BlocPatternApp/bloc_class.dart';
import 'package:testapp/ProviderApp/Provider/home_page_provider.dart';


class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20),
            child: ChangeNotifierProvider<HomePageProvider> (
              create: (context)=> HomePageProvider(),
              child: Consumer<HomePageProvider>(
                builder: (context,provider,child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      BlocClass(),
                      Text(provider.eligibilityMessage.toString(),
                      style: TextStyle(
                      color: (provider.isEligible== true) ? Colors.green : Colors.red
                      ),

                      ),
                      TextField(
                        keyboardType:TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Enter your age"
                        ),
                        onChanged: (val) {
                          if(val.isEmpty) {
                            provider.eligibilityMessage = "Please input age !";
                          }else {
                            provider.eligibility(int.parse(val));
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
              ),
        ),
      ),
    );
  }
}
