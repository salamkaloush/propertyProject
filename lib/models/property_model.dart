class PropertyModel {
  final String title;
  final String location;
  final String imageUrl;
  final String price;
  final String description;
  //bool isFavorite;
  final String category;
  final String type;
  final String id;
  PropertyModel({
    
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.price,
    required this.description,
   // this.isFavorite = false,
    required this.category,
     required this.type,
       required this.id,
  });
}
