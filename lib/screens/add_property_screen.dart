import 'package:flutter/material.dart';

class AddPropertyScreen extends StatefulWidget {
  @override
  _AddPropertyScreenState createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _spaceController = TextEditingController();
  String _propertyType = 'شقة';

  void _saveProperty() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("تم إضافة العقار بنجاح!")),
      );
      _nameController.clear();
      _priceController.clear();
      _descriptionController.clear();
      _locationController.clear();
      _spaceController.clear();
      setState(() => _propertyType = 'شقة');
    }
  }

  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey[700]),
      prefixIcon: Icon(icon, color: Color(0xFF1E3A8A)),
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F6FA),
      appBar: AppBar(
        backgroundColor: Color(0xFF1E3A8A),
        title: Text('إضافة عقار'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 12),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.indigo[100],
                  child: Icon(Icons.add_business_rounded, size: 40, color: Colors.indigo[700]),
                ),
                SizedBox(height: 8),
                Text(
                  'أدخل تفاصيل العقار',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 24),

                // ====== البطاقة الأولى ======
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [

                        SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: _propertyType,
                          onChanged: (value) => setState(() => _propertyType = value!),
                          items: ['شقة', 'منزل', 'فيلا', 'مكتب', 'أرض', 'محل تجاري']
                              .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                              .toList(),
                          decoration: _buildInputDecoration('نوع العقار', Icons.category),
                          validator: (value) =>
                              (value == null || value.isEmpty) ? "يرجى اختيار نوع العقار" : null,
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _priceController,
                          keyboardType: TextInputType.number,
                          decoration: _buildInputDecoration('السعر', Icons.attach_money),
                          validator: (value) {
                            if (value == null || value.isEmpty) return "يرجى إدخال السعر";
                            final price = double.tryParse(value);
                            if (price == null || price <= 0) return "أدخل سعرًا صحيحًا";
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // ====== البطاقة الثانية ======
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _locationController,
                          decoration: _buildInputDecoration('الموقع (المدينة، الحي)', Icons.location_on),
                          validator: (value) {
                            if (value == null || value.trim().length < 4)
                              return "يرجى إدخال موقع واضح مثل: جدة، حي السلامة";
                            return null;
                          },
                        ),
                        SizedBox(height: 8),
                        TextButton.icon(
                          onPressed: () {
                            // تنفيذ لاحقًا: اختيار الموقع من الخريطة
                          },
                          icon: Icon(Icons.map, color: Color(0xFF1E3A8A)),
                          label: Text("اختيار الموقع من الخريطة"),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _spaceController,
                          keyboardType: TextInputType.number,
                          decoration: _buildInputDecoration('المساحة (م²)', Icons.square_foot),
                          validator: (value) {
                            final space = double.tryParse(value ?? '');
                            if (value == null || value.isEmpty) return "يرجى إدخال المساحة";
                            if (space == null || space <= 0) return "المساحة يجب أن تكون رقمًا صحيحًا";
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // ====== البطاقة الثالثة ======
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      controller: _descriptionController,
                      maxLines: 5,
                      decoration: _buildInputDecoration('وصف العقار', Icons.description),
                      validator: (value) {
                        if (value == null || value.length < 10)
                          return "يرجى إدخال وصف مفصل لا يقل عن 10 أحرف";
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 100), // مساحة قبل الزر الثابت
              ],
            ),
          ),
        ),
      ),

      // ====== زر الحفظ ثابت أسفل الشاشة ======
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton.icon(
          onPressed: _saveProperty,
          icon: Icon(Icons.check_circle_outline),
          label: Text("حفظ العقار", style: TextStyle(fontSize: 16)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF1E3A8A),
            padding: EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ),
    );
  }
}
