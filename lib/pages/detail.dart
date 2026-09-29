import 'package:flutter/material.dart';
import '../models/culinaryList.dart';

class DetailPage extends StatefulWidget {
  final Culinary food;
  const DetailPage({super.key, required this.food});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.food.name),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite, 
              color: isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isFavorite 
                      ? '${widget.food.name} ditambahkan ke Wishlist' 
                      : '${widget.food.name} dihapus dari Wishlist'),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  widget.food.imageUrl,
                  height: 250,
                ),
              ),
              SizedBox(height: 16),
              Text(
                widget.food.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Deskripsi:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(widget.food.description),
              SizedBox(height: 20),
              Text("ID: ${widget.food.id}"),
              Text("Name: ${widget.food.name}"),
              Text("Category: ${widget.food.category}"),
              Text("Origin: ${widget.food.origin}"),
              Text("Main Ingredient: ${widget.food.mainIngredient}"),
              Text("Flavor: ${widget.food.flavor}"),
              Text("Spicy Level: ${widget.food.spicyLevel}"),
              Text("Serving Time: ${widget.food.servingTime}"),
              SizedBox(height: 12),
              Text(
                "Informasi Lebih Lanjut:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(widget.food.wikipediaUrl),
              SizedBox(height: 20),
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