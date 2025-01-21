import 'package:flutter/material.dart';
import 'package:flutter_basics/models/catalog.dart';
import 'package:flutter_basics/pages/item_page.dart';
import 'package:flutter_basics/pages/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemWidget extends ConsumerStatefulWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  ConsumerState<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends ConsumerState<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);

    const double padding = 16;
    const double borderRadius = 8;

    final bool isAdded = cart.items.contains(widget.item);

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ItemPage(item: widget.item),
        ),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 120,
                height: 120,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: Theme.of(context).primaryColorDark,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Hero(
                    tag: Key(widget.item.id.toString()),
                    child: Image.network(
                      widget.item.image,
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
              const SizedBox(width: padding),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.item.desc,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${widget.item.price.toStringAsFixed(2)}",
                          style: Theme.of(context).textTheme.labelMedium,
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
                              ref.read(cartProvider.notifier).addItem(widget.item);
                              setState(() {
                                
                              });
                            }
                          },
                          style: TextButton.styleFrom(
                            elevation: 0.0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(borderRadius),
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
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
