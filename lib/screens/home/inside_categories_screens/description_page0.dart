import 'package:flutter/material.dart';

class DescriptionPage0 extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  const DescriptionPage0(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              Image(
                image: NetworkImage(imageUrl),
                width: 350,
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(description),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 22.0),
                  child: Text('Direction'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
