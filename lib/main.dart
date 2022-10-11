import 'package:bloc/bloc.dart';
import 'package:dailynews/shared/components/blockobserver.dart';
import 'package:dailynews/shared/network/remote/cachehelper.dart';
import 'package:dailynews/shared/network/remote/diohelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


import 'layout/cubit.dart';
import 'layout/newslayout.dart';
import 'layout/states.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>NewsCubit()..getBusiness()..getsports()..getscience()..changeMode(
          fromShared:CacheHelper.getBoolean()
      ),
      child: BlocConsumer<NewsCubit,NewsAppStates>(
        listener: (context ,state){},
        builder:(context ,state){
          print('test');
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                elevation: 0.0,
                backgroundColor: Colors.white,
                backwardsCompatibility: false ,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark ,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold ,
                ),

              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type :BottomNavigationBarType.fixed ,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
              ),

              // switchTheme: Colors.deepOrange,
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                elevation: 0.0,
                backgroundColor: HexColor('333739'),
                backwardsCompatibility: false ,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739') ,
                  statusBarIconBrightness: Brightness.light ,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold ,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),

              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type :BottomNavigationBarType.fixed ,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                backgroundColor: HexColor('333739'),
              ),

              // switchTheme: Colors.deepOrange,
            ),
            themeMode:NewsCubit.get(context).isDark ?ThemeMode.dark :ThemeMode.light ,
            home: NewsApp(),
          );
        } ,
      ),
    );
  }
}


