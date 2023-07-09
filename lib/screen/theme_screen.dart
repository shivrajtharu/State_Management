import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/theme_changer_provider.dart';

 class ThemeScreen extends StatefulWidget {
   const ThemeScreen({Key? key}) : super(key: key);

   @override
   State<ThemeScreen> createState() => _ThemeScreenState();
 }

 class _ThemeScreenState extends State<ThemeScreen> {
   @override
   Widget build(BuildContext context) {
     final themeChanger = Provider.of<ThemeChanger>(context);
     return Scaffold(
       appBar: AppBar(
         title: const Text("Theme"),
         centerTitle: true,
         elevation: 0,
       ),
       body: Column(
         children: [
           RadioListTile<ThemeMode>(
               title: const Text("Light Mode"),
               value: ThemeMode.light,
               groupValue: themeChanger.themeMode,
               onChanged: themeChanger.setTheme
           ),
           RadioListTile<ThemeMode>(
               title: const Text("Dark Mode"),
               value: ThemeMode.dark,
               groupValue: themeChanger.themeMode,
               onChanged: themeChanger.setTheme
           ),
           RadioListTile<ThemeMode>(
               title: const Text("System Mode"),
               value: ThemeMode.system,
               groupValue: themeChanger.themeMode,
               onChanged: themeChanger.setTheme
           ),
           const Icon(Icons.favorite),
         ],
       ),
     );
   }
 }
