import 'package:flutter/material.dart';
import 'package:untitled/beer/list_model.dart';

class BeerDetails extends StatelessWidget {
  final Beer beer;

  const BeerDetails({required this.beer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(beer.name),
        foregroundColor: Colors.white70,
        backgroundColor: Color.fromRGBO(38, 58, 41, 1),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              beer.image_url!,
              // fit: BoxFit.cover,
            ),
            Text(
              'Ingredients:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(beer.ingredients.join(', ')),
            SizedBox(height: 16),
            Text(
              'Food Pairing:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(beer.foodPairing.join(', ')),
            SizedBox(height: 16),
            Text(
              'Brewer\'s Tips:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(beer.brewersTips),
          ],
        ),
      ),
    );
  }
}
