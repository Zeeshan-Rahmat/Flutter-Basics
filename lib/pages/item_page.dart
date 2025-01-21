import 'package:flutter/material.dart';

import 'package:flutter_basics/models/catalog.dart';
import 'package:flutter_basics/pages/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemPage extends ConsumerWidget {
  final Item item;
  const ItemPage({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isAdded = ref.watch(cartProvider).items.contains(item);

    const double textGap = 8;

    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${item.price.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            ElevatedButton(
              onPressed: () {
                if (isAdded) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 2),
                      content: Text("Item is Already Added"),
                    ),
                  );
                } else {
                  ref.read(cartProvider.notifier).addItem(item);
                }
              },
              style: TextButton.styleFrom(
                elevation: 0.0,
                backgroundColor: Theme.of(context).primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: isAdded
                  ? Icon(
                      Icons.done,
                      color: Theme.of(context).primaryColorLight,
                    )
                  : Icon(
                      Icons.add_shopping_cart_rounded,
                      color: Theme.of(context).primaryColorLight,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: textGap),
                  Text(
                    item.desc,
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: textGap + 5),
                  Text(
                    'Kasd elitr diam nonumy erat tempor sit sanctus vero et consetetur, accusam diam ipsum lorem eos et labore. Labore sanctus. Kasd elitr diam nonumy erat tempor sit sanctus vero et consetetur, accusam diam ipsum lorem eos et labore. Labore sanctus.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
