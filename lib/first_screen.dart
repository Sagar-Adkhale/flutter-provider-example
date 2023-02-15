import 'package:flutter/material.dart';
import 'package:flutterprovider/provider/item_menu_provider.dart';
import 'package:flutterprovider/second_screen.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> favItem = context.watch<ItemMenuProvider>().favouriteItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Example"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SecondScreen()))),
      body: ListView.builder(
          itemCount: 40,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Item $index'),
              trailing: InkWell(
                  onTap: () => {
                        favItem.contains(index)
                            ? context
                                .read<ItemMenuProvider>()
                                .removeFavouriteItem(index)
                            : context
                                .read<ItemMenuProvider>()
                                .setFavouriteItem(index)
                      },
                  child: Icon(Icons.favorite,
                      color:
                          favItem.contains(index) ? Colors.red : Colors.grey)),
            );
          }),
    );
  }
}
