import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/auth_provider.dart';
import 'package:state_management/provider/count_provider.dart';
import 'package:state_management/provider/favourite_provider.dart';
import 'package:state_management/provider/slider-provider.dart';
import 'package:state_management/provider/theme_changer_provider.dart';
import 'package:state_management/screen/count.dart';
import 'package:state_management/screen/login.dart';
import 'package:state_management/screen/theme_screen.dart';
import 'package:state_management/screen/favourite/favourite_screen.dart';
import 'package:state_management/screen/slider.dart';
import 'package:state_management/screen/value_notify_listener.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),

      ],
      child:Builder(
        builder:(BuildContext context){
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
             debugShowCheckedModeBanner: false,
             title: 'Flutter Demo',
             themeMode: themeChanger.themeMode,
             theme: ThemeData(
               brightness: Brightness.light,
             primarySwatch :Colors.blue,
             ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.teal,
                ),
                iconTheme:const IconThemeData(
                  color: Colors.pink,
                ),
              ),
              home: const LoginScreen(),
          );
        }
      )
    );
  }
}
