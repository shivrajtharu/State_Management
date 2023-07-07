import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/slider-provider.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({Key? key}) : super(key: key);

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(builder: (context,value,child){
            return  Slider(
                min: 0,
                max: 1,
                value: value.value, onChanged: (val){
                value.setValue(val);
            });
          }),
          Consumer<SliderProvider>(builder: (context,value,child){
            return  Row(
              children: [
                Expanded(
                  child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value),
                      ),
                      child: const Center(
                        child: Text("Container1"),
                      )
                  ),
                ),
                Expanded(
                  child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value),
                      ),
                      child: const Center(
                        child: Text("Container2"),
                      )
                  ),
                )
              ],
            );
          }),
        ],
      ),
    );
  }
}
