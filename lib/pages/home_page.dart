import "package:flutter/material.dart";
import "package:flutter_basics/models/catalog.dart";
import "package:flutter_basics/widgets/custom_drawer.dart";
import "package:flutter_basics/widgets/item_widget.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dumyList = List.generate(20, (index) => CatalopModel.items[0]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Basics'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dumyList.length,
          itemBuilder: (constext, index) {
            return ItemWidget(
              item: dumyList[index],
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
