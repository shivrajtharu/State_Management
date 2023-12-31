import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/favourite_provider.dart';

class MyFavourite extends StatefulWidget {
  const MyFavourite({Key? key}) : super(key: key);

  @override
  State<MyFavourite> createState() => _MyFavouriteState();
}

class _MyFavouriteState extends State<MyFavourite> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteItemProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favourite"),
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
                itemCount: favouriteProvider.selectedItem.length,
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
