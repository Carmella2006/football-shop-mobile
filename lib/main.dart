import 'package:flutter/material.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:football_shop/screens/product_entry_list.dart';
import 'package:football_shop/screens/productslist_form.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop/screens/login.dart';

void main() {
  runApp(
    Provider(create: (_) => CookieRequest(), child: const FootballShopApp()),
  );
}

class FootballShopApp extends StatelessWidget {
  const FootballShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Shop',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(
              seedColor: const Color(0xFF1E3A8A),
              brightness: Brightness.light,
            ).copyWith(
              primary: const Color(0xFF1E3A8A),
              secondary: Colors.blueAccent,
            ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E3A8A),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1E3A8A),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),

      home: const LoginPage(),
      routes: {
        '/home': (context) => MyHomePage(),
        '/add-product': (context) => const AddProductFormPage(),
        '/products-list': (context) => const ProductEntryListPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
