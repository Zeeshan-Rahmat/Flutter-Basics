import "package:flutter/material.dart";
import "package:flutter/services.dart";
import 'dart:convert';
import "package:flutter_basics/models/catalog.dart";
import "package:flutter_basics/widgets/custom_drawer.dart";
import "package:flutter_basics/widgets/item_widget.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final catalogJSON =
        await rootBundle.loadString('assets/files/catalog.json');
    final decodedJSON = jsonDecode(catalogJSON) as Map<String, dynamic>;
    var products = decodedJSON['products'] as List<dynamic>;

    setState(() {
      CatalogModel.items = products
          .map<Item>((item) => Item.fromMap(item as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Basics'),
        centerTitle: true,
      ),
      body: CatalogModel.items.isEmpty == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: CatalogModel.items.length,
                itemBuilder: (constext, index) {
                  return ItemWidget(
                    item: CatalogModel.items[index],
                  );
                },
              ),
            ),
      drawer: const MyDrawer(),
    );
  }
}
