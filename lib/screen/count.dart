import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/count_provider.dart';

class Count extends StatefulWidget {
  const Count({Key? key}) : super(key: key);

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Counter"),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context,value,child){
          print('only this widget build');
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",style: TextStyle(fontSize: 40),),
              Text(countProvider.count.toString(),
                style: const TextStyle(fontSize: 50,color: Colors.indigo),),
            ],
          );
        })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
