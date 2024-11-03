import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
//1.stateless widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Prodct Cards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductsPage(),
    );
  }
}

//2.Define the Product enum
enum Product {

  dart,
  flutter,
  firebase,

}

extension ProductDetails on Product {

  String get title {

    switch (this) {
      case Product.dart:
        return 'Dart';
      case Product.flutter:
        return 'Flutter';
      case Product.firebase:
        return 'Firebase';

    }
  }

  String get description {

    switch (this) {
      case Product.dart:
        return 'he best object Language';
      case Product.flutter:
        return 'the best mobile widget library';
      case Product.firebase:
        return 'The best cloud database';
    }
  }

  String get imagePath {

    switch (this) {
      case Product.dart:
        return 'assets/dart.png';
      case Product.flutter:
        return 'assets/flutter.png';
      case Product.firebase:
        return 'assets/firebase.png';

    }
  }
}


//3. the PrductCard Stateless Widget
//3.1 this part had some hard issues, so most lines are copied.

class ProductCard extends StatelessWidget {

  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.blue, width: 2),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.imagePath,
              height: 50,
            ),
            const SizedBox(height: 10),
            Text(
              product.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              product.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//decoration difficulty

//4.ProductCard in ProductsPage
class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: Column(

        children: [

          ProductCard(product: Product.dart),
          ProductCard(product: Product.flutter),
          ProductCard(product: Product.firebase),
        ],
      ),

    );

  }

}
