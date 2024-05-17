import 'package:flutter/material.dart';
import 'package:trip_plannerx/screens/home/inside_categories_screens/description_page4.dart';

class PageFour extends StatelessWidget {
  PageFour({super.key});

  final List<String> pic = [
    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/c8/f1/cb/varkala-beach.jpg?w=1200&h=-1&s=1",
    "https://trip2kerala.com/wp-content/uploads/2022/01/800px-Kuzhupilly_Be.jpg",
    "https://www.keralatourism.org/images/destination/large/kovalam20131031105847_236_1.jpg",
    "https://as1.ftcdn.net/v2/jpg/01/40/51/56/1000_F_140515612_0MMpqpsIvs6xno5YXmPVy9FUmZ4uLnFB.jpg"
  ];

  final List<String> text = [
    'Varkala',
    'Kuzhupilly Beach',
    'Kovalam Beach',
    'Goa'
  ];
  final List<String> description = [
    "Varkala Beach, also known as Papanasam Beach, is a stunning coastal gem located in the town of Varkala, Kerala. The beach is famous for its serene atmosphere, golden sands, and dramatic cliffs. The name Papanasam means washing away sins, as it is believed that taking a dip in the waters here can cleanse one's soul.",
    "Kuzhupilly beach situated at Vypeen in Kochi in its pristine splendour is a literal paradise for swimmers. Its white and sandy shores form the perfect backdrop for a relaxing dip. The beach will also host kite festivals are occasionally.",
    "Kovalam is an internationally renowned beach with three adjacent crescent beaches. It has been a favourite haunt of tourists since the 1930s. A massive rocky promontory on the beach has created a beautiful bay of calm waters ideal for sea bathing. The leisure options at this beach are plenty and diverse.",
    "The state's white-sand beaches, on the other hand, are made from a mix of sand, small stones and coral. Many beaches offer water sports, such as parasailing, windsurfing and kayaking. Beach lodging is quite popular in Goa due to the high tourist traffic."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beaches'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DecriptionPage4(
                            title: text[index],
                            imageUrl: pic[index],
                            description: description[index])));
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber,
                  image: DecorationImage(
                      image: NetworkImage(pic[index]), fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Flex(direction: Axis.vertical, children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          text[index],
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
