import 'package:flutter/material.dart';
import '../models/property_model.dart';
import 'property_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_start/screens/favorites_provider.dart';


class CategoryPropertiesScreen extends StatefulWidget {
  final String category;
  final List<PropertyModel> allProperties;

  const CategoryPropertiesScreen({
    Key? key,
    required this.category,
    required this.allProperties,
  }) : super(key: key);

  @override
  _CategoryPropertiesScreenState createState() => _CategoryPropertiesScreenState();
}

class _CategoryPropertiesScreenState extends State<CategoryPropertiesScreen> {
  List<PropertyModel> get categoryProperties =>
      widget.allProperties.where((p) => p.category == widget.category).toList();

  

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("عقارات ${widget.category}"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: categoryProperties.length,
        itemBuilder: (context, index) {
          final property = categoryProperties[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PropertyDetailsScreen(property: property),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
                    child: Image.asset(
                      property.imageUrl,
                      width: 120,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(property.title, style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(property.location, style: TextStyle(color: Colors.grey)),
                          Text(property.price, style: TextStyle(color: Colors.indigo)),
                          Text(property.type, style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ),
                  ),
                IconButton(
  icon: Icon(
    favoritesProvider.isFavorite(property)
        ? Icons.favorite
        : Icons.favorite_border,
    color: Colors.red,
  ),
  onPressed: () {
    favoritesProvider.toggleFavorite(property);
  },
)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
