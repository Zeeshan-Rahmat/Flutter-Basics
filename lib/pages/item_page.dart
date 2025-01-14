import 'package:flutter/material.dart';

import 'package:flutter_basics/models/catalog.dart';
import 'package:flutter_basics/widgets/my_theme.dart';

class ItemPage extends StatelessWidget {
  final Item item;
  const ItemPage({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${item.price.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: MyTheme.darkBluishColor,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                elevation: 0.0,
                backgroundColor: Theme.of(context).primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Buy',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 400,
            padding: const EdgeInsets.all(30),
            child: ClipRRect(
              child: Hero(
                tag: Key(item.id.toString()),
                child: Image.network(
                  item.image,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.desc,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
