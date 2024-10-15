import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/favourite_provider.dart';

class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({super.key});

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print('----- build ------');
    final provider = Provider.of<FavouriteItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favourite App"),
        centerTitle: true,
        actions: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 15),
          //   child: InkWell(
          //     onTap: () {
          //       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyFavouriteScreen(),));
          //     },
          //     child: const Icon(Icons.favorite),
          //   ),
          // )
          Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15, right: 15),
                child: Icon(Icons.favorite, size: 30,),
              ),
              Positioned(
                  right: 0,
                  top: 0,
                  child: Consumer(
                    builder: (context, value, child) {
                      return provider.selectedItem.isNotEmpty ?  CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Text(
                          provider.selectedItem.length.toString(),
                        ),
                      ) : const SizedBox.shrink();
                    },
                  )
              )
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: provider.selectedItem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteItemProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if(value.selectedItem.contains(index)){
                            value.removeItem(index);
                          }else{
                            value.addItem(index);
                          }

                        },
                        title: Text("Item ${index.toString()}"),
                        trailing: value.selectedItem.contains(index) ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline),
                      );
                    },
                  );
                },)
          )
        ],
      ),
    );
  }
}
