import 'package:flutter/material.dart';
import 'package:flutter_start/screens/favorites_provider.dart';
import '../models/property_model.dart';
import 'property_details_screen.dart';
import 'category_properties_screen.dart';
import 'package:provider/provider.dart';
//import 'lib\screens\favorites_provider.dart';

class HomePage extends StatefulWidget {
 // final List<PropertyModel> favoriteProperties;
 // final Function(PropertyModel) toggleFavorite;

  const HomePage({
    Key? key, 
   // required this.favoriteProperties,
    //required this.toggleFavorite,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> categories = [
    "شقق",
    "فلل",
    "فنادق",
    "شاليهات",
    "استديوهات",
    "أراضي"
  ];

  String selectedType = "الكل";

  final List<PropertyModel> allProperties = [
    // شقق
    PropertyModel(
        title: "شقة مفروشة",
        location: "دمشق - المزة",
        imageUrl: "assets/images/p4.jpg",
        price: "1,200,000 ل.س",
        description: "شقة حديثة مع إطلالة رائعة، مفروشة بالكامل.",
        category: "شقق",
        type: "للايجار",
        id: '1'),
    PropertyModel(
        title: "شقة راقية",
        location: "حلب - شارع النيل",
        imageUrl: "assets/images/p6.jpg",
        price: "2,800,000 ل.س",
        description: "شقة 3 غرف مع صالون، إكساء سوبر ديلوكس.",
        category: "شقق",
        type: "للبيع",
        id: '2'),
    PropertyModel(
        title: "شقة اقتصادية",
        location: "حمص - الزهراء",
        imageUrl: "assets/images/p5.jpg",
        price: "900,000 ل.س",
        description: "شقة صغيرة مناسبة للعائلات الصغيرة.",
        category: "شقق",
        type: "للايجار",
        id: '3'),
    PropertyModel(
        title: "شقة بإطلالة جبلية",
        location: "اللاذقية - كسب",
        imageUrl: "assets/images/p4.jpg",
        price: "1,700,000 ل.س",
        description: "شقة مفروشة في منطقة هادئة وباردة صيفاً.",
        category: "شقق",
        type: "للبيع",
        id: '4'),

    // فلل
    PropertyModel(
        title: "فيلا فاخرة",
        location: "دمشق - المالكي",
        imageUrl: "assets/images/p5.jpg",
        price: "3,500,000 ل.س",
        description: "فيلا راقية مع مسبح وحديقة، موقع مميز.",
        category: "فلل",
        type: "للايجار",
        id:"5"
        ),
    PropertyModel(
        title: "فيلا على البحر",
        location: "طرطوس - الرمال الذهبية",
        imageUrl: "assets/images/p6.jpg",
        price: "6,800,000 ل.س",
        description: "فيلا بإطلالة بحرية، تصميم حديث.",
        category: "فلل",
        type: "للبيع",
        id: '6'),
    PropertyModel(
        title: "فيلا ثلاث طوابق",
        location: "ريف دمشق - يعفور",
        imageUrl: "assets/images/p4.jpg",
        price: "5,000,000 ل.س",
        description: "فيلا كبيرة مناسبة للعائلات الكبيرة.",
        category: "فلل",
        type: "للايجار",
        id: '7'),
    PropertyModel(
        title: "فيلا حديثة البناء",
        location: "دمشق - مشروع دمر",
        imageUrl: "assets/images/p4.jpg",
        price: "4,200,000 ل.س",
        description: "فيلا بإطلالة خلابة، مسبح وحديقة.",
        category: "فلل",
        type: "للبيع",
        id: '8'),

    // فنادق
    PropertyModel(
        title: "فندق خمس نجوم",
        location: "حلب - وسط المدينة",
        imageUrl: "assets/images/p6.jpg",
        price: "25,000,000 ل.س",
        description: "فندق فاخر يحتوي على 100 غرفة.",
        category: "فنادق",
        type: "للبيع",
        id: '9'),
    PropertyModel(
        title: "فندق صغير",
        location: "اللاذقية - الصليبة",
        imageUrl: "assets/images/p4.jpg",
        price: "7,000,000 ل.س",
        description: "فندق 3 طوابق يحتوي على 25 غرفة.",
        category: "فنادق",
        type: "للبيع",
        id: '10'),
    PropertyModel(
        title: "فندق تراثي",
        location: "دمشق القديمة",
        imageUrl: "assets/images/p5.jpg",
        price: "15,000,000 ل.س",
        description: "فندق ذو طراز دمشقي قديم.",
        category: "فنادق",
        type: "للبيع",
        id: '11'),
    PropertyModel(
        title: "نُزل اقتصادي",
        location: "حمص - حي الإنشاءات",
        imageUrl: "assets/images/p6.jpg",
        price: "4,000,000 ل.س",
        description: "نُزل بسيط بديكور حديث مناسب للشباب.",
        category: "فنادق",
        type: "للبيع",
        id: '12'),

    // شاليهات
    PropertyModel(
        title: "شاليه على البحر",
        location: "طرطوس - الرمال الذهبية",
        imageUrl: "assets/images/p6.jpg",
        price: "6,500,000 ل.س",
        description: "شاليه رائع بإطلالة بحرية مباشرة.",
        category: "شاليهات",
        type: "للايجار",
        id: '13'),
    PropertyModel(
        title: "شاليه خشبي",
        location: "اللاذقية - رأس البسيط",
        imageUrl: "assets/images/p4.jpg",
        price: "5,000,000 ل.س",
        description: "شاليه خشبي بطابع ريفي وإطلالة على البحر.",
        category: "شاليهات",
        type: "للبيع",
        id: '14'),
    PropertyModel(
        title: "شاليه في المنتجع",
        location: "طرطوس - منتجع الرمال",
        imageUrl: "assets/images/p5.jpg",
        price: "7,500,000 ل.س",
        description: "شاليه مؤثث بالكامل ضمن مجمع سياحي.",
        category: "شاليهات",
        type: "للبيع",
        id: '15'),
    PropertyModel(
        title: "شاليه مميز",
        location: "اللاذقية - وادي قنديل",
        imageUrl: "assets/images/p4.jpg",
        price: "6,200,000 ل.س",
        description: "شاليه حديث مع حديقة خاصة.",
        category: "شاليهات",
        type: "للايجار",
        id: '16'),

    // استديوهات
    PropertyModel(
        title: "استديو عصري",
        location: "دمشق - باب توما",
        imageUrl: "assets/images/p5.jpg",
        price: "750,000 ل.س",
        description: "استديو مناسب للطلاب أو العزاب.",
        category: "استديوهات",
        type: "للبيع",
        id: '17'),
    PropertyModel(
        title: "استديو مفروش",
        location: "اللاذقية - المشروع العاشر",
        imageUrl: "assets/images/p6.jpg",
        price: "850,000 ل.س",
        description: "استديو مؤثث بالكامل مع شرفة.",
        category: "استديوهات",
        type: "للايجار",
        id: '18'),
    PropertyModel(
        title: "استديو صغير",
        location: "حلب - الجميلية",
        imageUrl: "assets/images/p5.jpg",
        price: "680,000 ل.س",
        description: "استديو عملي ومناسب للعمل أو السكن.",
        category: "استديوهات",
        type: "للبيع",
        id: '19'),
    PropertyModel(
        title: "استديو اقتصادي",
        location: "حمص - عكرمة",
        imageUrl: "assets/images/p4.jpg",
        price: "700,000 ل.س",
        description: "استديو هادئ ومريح للعيش الفردي.",
        category: "استديوهات",
        type: "للبيع",
        id: '20'),

    // أراضي
    PropertyModel(
        title: "أرض زراعية",
        location: "ريف دمشق - الزبداني",
        imageUrl: "assets/images/p7.jpg",
        price: "10,000,000 ل.س",
        description: "أرض بمساحة 5000 م2، صالحة للزراعة.",
        category: "أراضي",
        type: "للبيع",
        id: '21'),
    PropertyModel(
        title: "أرض للبناء",
        location: "دمشق - ضاحية قدسيا",
        imageUrl: "assets/images/p4.jpg",
        price: "15,000,000 ل.س",
        description: "أرض 400 م2 مرخصة لبناء فيلا.",
        category: "أراضي",
        type: "للبيع",
        id: '22'),
    PropertyModel(
        title: "أرض استثمارية",
        location: "حمص - الدوير",
        imageUrl: "assets/images/p5.jpg",
        price: "8,000,000 ل.س",
        description: "أرض تصلح لبناء مشروعات صغيرة.",
        category: "أراضي",
        type: "للبيع",
        id: '23'),
    PropertyModel(
        title: "أرض صناعية",
        location: "حلب - الشيخ نجار",
        imageUrl: "assets/images/p6.jpg",
        price: "20,000,000 ل.س",
        description: "أرض في منطقة صناعية مرخصة.",
        category: "أراضي",
        type: "للبيع",
        id: '24'
        ),
  ];

  /*bool isFavorite(PropertyModel property) {
    return widget.favoriteProperties.contains(property);
  }*/
  /* bool isFavorite(PropertyModel property) {
  return widget.favoriteProperties.any((fav) => fav.id == property.id);
}*/



  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
      
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "الصفحة الرئيسية",
          style: TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _searchBox(),
          SizedBox(height: 20),
          Text("التصنيفات",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          _buildCategoriesGrid(),
          SizedBox(height: 20),
          Text("عقارات متوفرة",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          _buildFilterButtons(),
          SizedBox(height: 10),
          _buildPropertyList(),
        ],
      ),
    );
  }

  Widget _searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search),
          hintText: "ابحث عن عقار...",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildFilterButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildFilterChip("الكل"),
          SizedBox(width: 8),
          _buildFilterChip("للبيع"),
          SizedBox(width: 8),
          _buildFilterChip("للايجار"),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    bool isSelected = selectedType == label;
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      ),
      selected: isSelected,
      selectedColor: Colors.indigo,
      backgroundColor: Colors.grey[200],
      onSelected: (value) {
        setState(() {
          selectedType = label;
        });
      },
    );
  }

  Widget _buildCategoriesGrid() {
    final List<Color> categoryColors = [
      Colors.indigo.shade100,
      Colors.green.shade100,
      Colors.orange.shade100,
      Colors.pink.shade100,
      Colors.blue.shade100,
      Colors.purple.shade100,
    ];

    final List<IconData> categoryIcons = [
      Icons.apartment,
      Icons.villa,
      Icons.hotel,
      Icons.beach_access,
      Icons.stay_current_portrait,
      Icons.landscape,
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => CategoryPropertiesScreen(
      category: categories[index],
      allProperties: allProperties,
     // favoriteProperties: widget.favoriteProperties,
      //toggleFavorite: widget.toggleFavorite,
    ),
  ),
);

          },
          child: Container(
            decoration: BoxDecoration(
              color: categoryColors[index],
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(categoryIcons[index], size: 40, color: Colors.indigo[700]),
                SizedBox(height: 10),
                Text(
                  categories[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.indigo[900],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPropertyList() {
    List<PropertyModel> filteredProperties;
 final favoritesProvider = Provider.of<FavoritesProvider>(context);
//final favorites = favoritesProvider.favorites;

    if (selectedType == "الكل") {
      filteredProperties = allProperties;
    } else {
      filteredProperties =
          allProperties.where((p) => p.type == selectedType).toList();
    }

    return Column(
      children: filteredProperties.map((property) {
return GestureDetector(
 onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => PropertyDetailsScreen(property: property),
    ),
  ).then((_) {
    setState(() {}); // يعيد بناء الصفحة عند الرجوع
  });
}
,
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
                Text(property.title,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(property.location,
                    style: TextStyle(color: Colors.grey)),
                Text(property.price,
                    style: TextStyle(color: Colors.indigo)),
              ],
            ),
          ),
        ),
     /* IconButton(
  icon: Icon(
    isFavorite(property) ? Icons.favorite : Icons.favorite_border,
    color: Colors.red,
  ),
  onPressed: () {
    setState(() {
      widget.toggleFavorite(property); // ✅ يحفظ/يحذف العقار من المفضلة
    });
  },
)*/

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

      }).toList(),
    );
  }
 

}
