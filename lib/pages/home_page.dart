import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import 'dart:convert';
import "package:flutter_basics/models/catalog.dart";
import "package:flutter_basics/pages/main.dart";
import "package:flutter_basics/utils/my_routes.dart";
import "package:flutter_basics/widgets/custom_drawer.dart";
import "package:flutter_basics/widgets/item_widget.dart";
import "package:flutter_basics/widgets/my_theme.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:http/http.dart' as http;

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final catalogJSON =
        await rootBundle.loadString('assets/files/catalog.json');
    // final respose = await http.get(Uri.parse(url));
    // final catalogJSON = respose.body;

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
    final int itemCount = ref.watch(cartProvider).items.length;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Basics'),
      ),
      floatingActionButton: Stack(
        clipBehavior: Clip.none,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.cartRoute).then((value) {
                if (value == true) {
                  setState(() {});
                }
              });
            },
            child: Icon(
              CupertinoIcons.cart,
              color: MyTheme.dark_brightColor,
            ),
          ),
          Positioned(
            top: -8,
            right: -5,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                itemCount.toString(),
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Catalog App',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                'Trending Products',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListViewWidget(item: CatalogModel.items)
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  final List<Item> item;
  const ListViewWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: item.isEmpty == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: item.length,
              itemBuilder: (constext, index) {
                return ItemWidget(
                  item: item[index],
                );
              },
            ),
    );
  }
}
