import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/count_provider.dart';
import 'package:state_management/provider/favourite_provider.dart';
import 'package:state_management/provider/slider-provider.dart';
import 'package:state_management/screen/count.dart';
import 'package:state_management/screen/favourite/favourite_screen.dart';
import 'package:state_management/screen/slider.dart';

void main() {
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

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch :Colors.blue,
        ),
        home: const FavouriteScreen(),
      ),
    );
  }
}
