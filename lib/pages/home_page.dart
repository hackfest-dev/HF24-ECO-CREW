import 'package:flutter/material.dart';
import 'package:sample/components/search_appbar.dart';

import '../components/feed.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Search_Bar(),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: const [
              Feed(),
              Feed(),
              Feed(),
            ],
          )),
    );
  }
}
