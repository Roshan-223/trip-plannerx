import 'package:flutter/material.dart';

class BottomFav extends StatefulWidget {
  const BottomFav({super.key});

  @override
  State<BottomFav> createState() => _BottomFavState();
}

class _BottomFavState extends State<BottomFav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: const Text('Favorites'),
  ),
  
   );
  }
}