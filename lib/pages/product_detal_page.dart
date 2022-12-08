import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});
  static const routeName = 'product-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('text'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      body: Container(),
    );
  }
}
