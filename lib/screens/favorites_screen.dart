import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_start/screens/favorites_provider.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final favorites = favoritesProvider.favorites;

    return Scaffold(
      appBar: AppBar(
        title: Text('المفضلة'),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF5F7FA),
      body: favorites.isEmpty
          ? Center(
              child: Text(
                'لا توجد عقارات مفضلة بعد',
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.all(16),
              separatorBuilder: (_, __) => SizedBox(height: 12),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final property = favorites[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // صورة العقار
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                        child: Image.asset(
                          property.imageUrl,
                          width: 120,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // تفاصيل العقار
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                property.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                property.location,
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              SizedBox(height: 6),
                              Text(
                                property.price,
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // زر المفضلة
                      IconButton(
                        icon: Icon(Icons.favorite, color: Colors.red),
                        onPressed: () => favoritesProvider.toggleFavorite(property),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
