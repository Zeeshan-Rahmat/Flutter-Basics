import 'package:flutter/material.dart';
import 'package:flutter_basics/models/catalog.dart';
import 'package:flutter_basics/pages/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(cartProvider).items;
    final totalPrice = ref.watch(cartProvider).totalPrice;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, isChanged);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                child: items.isEmpty
                    ? Center(
                        child: Text(
                          'Your Cart is Empty',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      )
                    : ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final Item item = items[index];
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
                                        errorBuilder:
                                            (context, error, stackTrace) {
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
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  subtitle: Text(
                                    '\$${item.price.toStringAsFixed(2)}',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      ref
                                          .read(cartProvider.notifier)
                                          .removeItem(item);
                                      isChanged = true;
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.remove_circle_rounded,
                                      color: Colors.redAccent,
                                    ),
                                  )),
                            ),
                          );
                        })),
            const SizedBox(height: 10),
            const Divider(),
            SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$$totalPrice",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 3),
                          content: Text("Buying not Supported yet."),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: Theme.of(context).primaryColor,
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

// class _CartItemList extends ConsumerStatefulWidget {
//   const _CartItemList({super.key});

//   @override
//   ConsumerState<_CartItemList> createState() => _CartItemListState();
// }

// class _CartItemListState extends ConsumerState<_CartItemList> {
//   @override
//   Widget build(BuildContext context) {
//     final items = ref.watch(cartProvider).items;

//     return items.isEmpty
//         ? Center(
//             child: Text(
//               'Your Cart is Empty',
//               style: Theme.of(context).textTheme.labelMedium,
//             ),
//           )
//         : ListView.builder(
//             itemCount: items.length,
//             itemBuilder: (context, index) {
//               final Item item = items[index];
//               return Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ListTile(
//                       leading: SizedBox(
//                         width: 60,
//                         height: 60,
//                         child: ClipRRect(
//                           child: Image.network(
//                             item.image,
//                             fit: BoxFit.contain,
//                             errorBuilder: (context, error, stackTrace) {
//                               return const Icon(
//                                 Icons.broken_image,
//                                 size: 50,
//                                 color: Colors.grey,
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                       title: Text(
//                         item.name,
//                         style: Theme.of(context).textTheme.titleMedium,
//                       ),
//                       subtitle: Text(
//                         '\$${item.price.toStringAsFixed(2)}',
//                         style: Theme.of(context).textTheme.bodyMedium,
//                       ),
//                       trailing: IconButton(
//                         onPressed: () {
//                           ref.read(cartProvider.notifier).removeItem(item);
//                           setState(() {});
//                         },
//                         icon: const Icon(
//                           Icons.remove_circle_rounded,
//                           color: Colors.redAccent,
//                         ),
//                       )),
//                 ),
//               );
//             });
//   }
// }
