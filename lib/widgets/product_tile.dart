import 'dart:io';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_detail_screen.dart'; // Novo import

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback onDelete;

  ProductTile({required this.product, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: product.imagePath != null && product.imagePath!.isNotEmpty
          ? Image.file(File(product.imagePath!), width: 50, height: 50, fit: BoxFit.cover)
          : null,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              product.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            'R\$ ${product.price?.toStringAsFixed(2) ?? '0.00'}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product), // Nova navegação
          ),
        );
      },
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}
