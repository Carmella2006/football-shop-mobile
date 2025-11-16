// ignore_for_file: curly_braces_in_flow_control_structures, unused_field

import 'package:flutter/material.dart';
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
  String _category = "";
  bool _isFeatured = false;

  bool _isValidUrl(String url) {
    final uri = Uri.tryParse(url);
    return uri != null &&
        uri.hasScheme &&
        (uri.isScheme("http") || uri.isScheme("https"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Product"),
        backgroundColor: Colors.blue,
      ),
      drawer: const LeftDrawer(),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
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
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Category"),
                items: const [
                  DropdownMenuItem(value: "Shoes", child: Text("Shoes")),
                  DropdownMenuItem(value: "Jersey", child: Text("Jersey")),
                  DropdownMenuItem(value: "Ball", child: Text("Ball")),
                  DropdownMenuItem(
                    value: "Accessories",
                    child: Text("Accessories"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _category = value ?? "";
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Please select a category.";
                  return null;
                },
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text("Is Featured?"),
                value: _isFeatured,
                onChanged: (bool value) {
                  setState(() {
                    _isFeatured = value;
                  });
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Product saved successfully!"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
