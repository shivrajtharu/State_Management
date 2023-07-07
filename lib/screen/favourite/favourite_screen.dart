import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/favourite_provider.dart';
import 'package:state_management/screen/favourite/my_favourite.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite App"),
        centerTitle: true,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyFavourite()));
            },
            child: const Icon(Icons.favorite)),
          const SizedBox(width: 20,),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index){
               return Consumer<FavouriteItemProvider>(builder: (context, value,child){
                 return ListTile(
                   onTap: (){
                     if (value.selectedItem.contains(index)){
                       value.removeItem(index);
                     }else {
                       value.addItem(index);
                     }
                   },
                   title: Text("Item$index"),
                   trailing: Icon(
                       value.selectedItem.contains(index) ?Icons.favorite: Icons.favorite_border_outlined),
                 );
               });
              }
            ),
          )
        ],
      ),
    );
  }
}
