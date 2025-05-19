import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/locale/locale_bloc.dart';
import '../bloc/locale/locale_event.dart';

// نموذج بيانات المستخدم
class User {
  String name;
  String email;
  final String profileImageUrl;

  User({
    required this.name,
    required this.email,
    required this.profileImageUrl,
  });
}

class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _emailController = TextEditingController(text: widget.user.email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    setState(() {
      widget.user.name = _nameController.text;
      widget.user.email = _emailController.text;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('✅ تم حفظ التعديلات بنجاح')),
    );
  }

  void _logout() {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('🚪 تم تسجيل الخروج')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الصفحة الشخصية"),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'تسجيل الخروج',
            onPressed: _logout,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.user.profileImageUrl),
              ),
            ),
            const SizedBox(height: 24),

            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'الاسم',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'البريد الإلكتروني',
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),

            ElevatedButton.icon(
              onPressed: _saveProfile,
              icon: const Icon(Icons.save),
              label: const Text('حفظ التعديلات'),
            ),

            const SizedBox(height: 32),

            const Text(
              'الإعدادات',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),

            // زر تغيير اللغة باستخدام BLoC
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('تغيير اللغة'),
              trailing: DropdownButton<String>(
                value: Localizations.localeOf(context).languageCode,
                onChanged: (String? newLang) {
                  if (newLang != null) {
                    context.read<LocaleBloc>().add(
                      ChangeLocaleEvent(Locale(newLang)),
                    );
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: 'ar',
                    child: Text('العربية'),
                  ),
                  DropdownMenuItem(
                    value: 'en',
                    child: Text('English'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
