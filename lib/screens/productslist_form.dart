// ignore_for_file: curly_braces_in_flow_control_structures, unused_field

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:football_shop/widgets/left_drawer.dart';

class AddProductFormPage extends StatefulWidget {
  const AddProductFormPage({super.key});

  @override
  State<AddProductFormPage> createState() => _AddProductFormPageState();
}

class _AddProductFormPageState extends State<AddProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  int _price = 0;
  String _description = "";
  String _thumbnail = "";
  String _brand = "";
  int _stock = 0;

  bool _isValidUrl(String url) {
    final uri = Uri.tryParse(url);
    return uri != null &&
        uri.hasScheme &&
        (uri.isScheme("http") || uri.isScheme("https"));
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Product"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Product Name
              TextFormField(
                decoration: const InputDecoration(labelText: "Product Name"),
                onChanged: (value) => _name = value,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Please enter product name.";
                  if (value.length < 3)
                    return "Please enter at least 3 characters.";
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Price
              TextFormField(
                decoration: const InputDecoration(labelText: "Price"),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _price = int.tryParse(value) ?? 0;
                },
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Please enter product price.";
                  final number = int.tryParse(value);
                  if (number == null)
                    return "Please enter a valid number for the price.";
                  if (number <= 0)
                    return "Please enter a price greater than 0.";
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Description
              TextFormField(
                decoration: const InputDecoration(labelText: "Description"),
                maxLines: 3,
                onChanged: (value) => _description = value,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Please enter product description.";
                  if (value.length < 5)
                    return "Please enter at least 5 characters.";
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Thumbnail URL
              TextFormField(
                decoration: const InputDecoration(labelText: "Thumbnail URL"),
                onChanged: (value) => _thumbnail = value,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Please enter product thumbnail URL.";
                  if (!_isValidUrl(value)) return "Please enter a valid URL.";
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Brand
              TextFormField(
                decoration: const InputDecoration(labelText: "Brand"),
                onChanged: (value) => _brand = value,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Please enter product brand.";
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Stock
              TextFormField(
                decoration: const InputDecoration(labelText: "Stock"),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _stock = int.tryParse(value) ?? 0;
                },
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Please enter stock.";
                  final number = int.tryParse(value);
                  if (number == null) return "Stock must be a valid number.";
                  if (number < 0) return "Stock cannot be negative.";
                  return null;
                },
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    print("Sending request...");

                    final response = await request.post(
                      "http://localhost:8000/create-flutter/",
                      jsonEncode({
                        "name": _name,
                        "price": _price,
                        "description": _description,
                        "thumbnail": _thumbnail,
                        "brand": _brand,
                        "stock": _stock,
                      }),
                    );

                    if (!context.mounted) return;

                    if (response['status'] == 'success') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Product saved!")),
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Failed: ${response['message']}"),
                        ),
                      );
                    }
                  }
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
