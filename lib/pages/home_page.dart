import 'package:flutter/material.dart';
import 'package:sample/appbars/search_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Search_Bar(), // Use the SearchBar widget here
      ),
      body: const Center(
        child: Text("Welcome to the Page!"),
      ),
    );
  }
}
