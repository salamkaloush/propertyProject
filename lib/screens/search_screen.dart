import 'package:flutter/material.dart';
import '../models/property_model.dart'; // تأكد من أن المسار صحيح

class SearchScreen extends StatefulWidget {
  final List<PropertyModel> allProperties;

  const SearchScreen({Key? key, required this.allProperties}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<PropertyModel> _filteredProperties = [];

  @override
  void initState() {
    super.initState();
    _filteredProperties = widget.allProperties; // عرض كل العقارات عند بداية تحميل الصفحة
  }

  // دالة لتصفية العقارات بناءً على الكلمة المدخلة في شريط البحث
  void _searchProperties() {
    setState(() {
      _filteredProperties = widget.allProperties.where((property) {
        // البحث في العنوان، الموقع، أو الوصف
        return property.title.toLowerCase().contains(_searchController.text.toLowerCase()) ||
               property.location.toLowerCase().contains(_searchController.text.toLowerCase()) ||
               property.description.toLowerCase().contains(_searchController.text.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("بحث العقارات"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // شريط البحث
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'ابحث عن عقار...',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                _searchProperties(); // تحديث البحث عند تغيير النص
              },
            ),
            SizedBox(height: 20),
            
            // عرض العقارات التي تم تصفيتها بناءً على البحث
            Expanded(
              child: _filteredProperties.isEmpty
                  ? Center(child: Text("لا توجد نتائج للبحث"))
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: _filteredProperties.length,
                      itemBuilder: (context, index) {
                        final property = _filteredProperties[index];
                        return Card(
                          elevation: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // صورة العقار
                              Image.asset(
                                property.imageUrl,
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // عنوان العقار
                                    Text(
                                      property.title,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    // موقع العقار
                                    Text(
                                      property.location,
                                      style: TextStyle(fontSize: 14, color: Colors.grey),
                                    ),
                                    SizedBox(height: 8),
                                    // سعر العقار
                                    Text(
                                      property.price,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
