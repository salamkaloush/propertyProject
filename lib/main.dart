import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';
import 'screens/favorites_provider.dart';
import 'bloc/locale/locale_bloc.dart';
import 'bloc/locale/locale_state.dart';
import 'l10n/l10n.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LocaleBloc()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'تطبيق العقارات',
          debugShowCheckedModeBanner: false,
          locale: state.locale,
          supportedLocales: L10n.all, // ✅ تدعم العربية والإنجليزية
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(
            primaryColor: const Color(0xFF1E3A8A),
            scaffoldBackgroundColor: Colors.white,
          ),
          builder: (context, child) {
            return Directionality(
              textDirection: state.locale.languageCode == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: child!,
            );
          },
          home:  SplashScreen(),
        );
      },
    );
  }
}
