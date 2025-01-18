import 'package:flutter/material.dart';
import 'package:flutter_basics/models/catalog.dart';
import 'package:flutter_basics/pages/item_page.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    const double padding = 16;
    const double borderRadius = 8;

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ItemPage(item: item),
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
                  color: Theme.of(context).primaryColor,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
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
              const SizedBox(width: padding),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.desc,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${item.price.toStringAsFixed(2)}",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            elevation: 0.0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                          ),
                          child: Text(
                            'Add to Cart',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
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
