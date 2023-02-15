import 'package:flutter/material.dart';
import 'package:flutterprovider/provider/item_menu_provider.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> favItem = context.watch<ItemMenuProvider>().favouriteItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Items"),
      ),
      body: ListView.builder(
          itemCount: favItem.length,
          itemBuilder: ((BuildContext context, index) {
            return ListTile(
              title: Text('item ${favItem[index]}'),
              trailing: InkWell(
                child: const Text(
                  'Remove',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  context
                      .read<ItemMenuProvider>()
                      .removeFavouriteItem(favItem[index]);
                },
              ),
            );
          })),
    );
  }
}
