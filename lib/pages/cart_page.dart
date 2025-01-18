import 'package:flutter/material.dart';
import 'package:flutter_basics/models/catalog.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Expanded(child: _CartItemList()),
            const SizedBox(height: 10),
            const Divider(),
            SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$9999",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: Theme.of(context).primaryColorLight,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'BUY',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CartItemList extends StatefulWidget {
  const _CartItemList({super.key});

  @override
  State<_CartItemList> createState() => __CartItemListState();
}

class __CartItemListState extends State<_CartItemList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, indeex) {
          final Item item = CatalogModel.items[indeex];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
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
                title: Text(
                  item.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  '\$${item.price.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: const Icon(
                  Icons.remove_circle_rounded,
                  color: Colors.redAccent,
                ),
              ),
            ),
          );
        });
  }
}
