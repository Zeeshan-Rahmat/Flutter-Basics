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

  loadData() async {
    final catalogJSON =
        await rootBundle.loadString('assets/files/catalog.json');
    final decodedJSON = jsonDecode(catalogJSON);
    var products = decodedJSON['products'];
  }

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
