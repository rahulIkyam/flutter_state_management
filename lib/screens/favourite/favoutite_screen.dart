import 'package:flutter/material.dart';
import 'package:flutter_state_management/providers/favourite_provider.dart';
import 'package:flutter_state_management/screens/favourite/my_favourite_screen.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  List<int> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    print('----- build ------');
    final provider = Provider.of<FavouriteItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite App"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => const MyFavouriteScreen(),)
                );
              },
                child:  Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 15),
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
            ),
          ),
          // Text(provider.selectedItem.length.toString()),

        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: 50,
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
