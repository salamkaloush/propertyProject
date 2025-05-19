import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../models/property_model.dart';
import 'package:flutter_start/screens/favorites_provider.dart';

class PropertyDetailsScreen extends StatelessWidget {
  final PropertyModel property;

  const PropertyDetailsScreen({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      property.imageUrl,
      'assets/images/p1.jpg',
      'assets/images/p2.jpg',
      'assets/images/p3.jpg',
      'assets/images/p5.jpg',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(property.title),
        backgroundColor: const Color(0xFF1E3A8A),
        elevation: 0,
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 250,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
            ),
            items: imageList.map((imagePath) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
            }).toList(),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        property.title,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ),
                    Consumer<FavoritesProvider>(
                      builder: (context, favoritesProvider, _) {
                        final isFav = favoritesProvider.isFavorite(property);
                        return IconButton(
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: Colors.redAccent,
                          ),
                          onPressed: () => favoritesProvider.toggleFavorite(property),
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 8),
                Text(property.location, style: TextStyle(fontSize: 16, color: Colors.grey[700])),

                const SizedBox(height: 12),
                Text(property.price, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo)),

                const SizedBox(height: 20),

                Row(
                  children: [
                    RatingBarIndicator(
                      rating: 4.5,
                      itemCount: 5,
                      itemSize: 24.0,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                    ),
                    const SizedBox(width: 8),
                    Text('4.5 من 5', style: TextStyle(color: Colors.grey[600])),
                  ],
                ),

                const SizedBox(height: 20),
                const Text("الوصف", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 8),
                Text(property.description, style: const TextStyle(fontSize: 16, color: Colors.black87)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
