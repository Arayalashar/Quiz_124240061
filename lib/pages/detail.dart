import 'package:flutter/material.dart';
import '../models/culinaryList.dart';

class DetailPage extends StatelessWidget {
  final Culinary culinary;
  const DetailPage({super.key, required this.culinary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(culinary.name),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  culinary.imageUrl,
                  height: 250,
                ),
              ),
              SizedBox(height: 16),
              Text(
                culinary.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Description:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(culinary.description),
              SizedBox(height: 20),
              Text("Name: ${culinary.name}"),
              Text("Category: ${culinary.category}"),
              Text("Origin: ${culinary.origin}"),
              Text("Main Ingredient: ${culinary.mainIngredient}"),
              Text("Flavor: ${culinary.flavor}"),
              Text("Spicy Level: ${culinary.spicyLevel}"),
              Text("Serving Time: ${culinary.servingTime}"),
              Text("Wikipedia Url: ${culinary.wikipediaUrl}"),
              SizedBox(height: 12),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Kembali ke Home"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}