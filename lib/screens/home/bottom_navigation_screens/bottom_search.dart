
// 
import 'package:flutter/material.dart';

class BottomSearch extends StatelessWidget {
  const BottomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search your destination'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Search your Destination",prefixIcon: const Icon(Icons.search)),
          ),
        ));
  }
}
