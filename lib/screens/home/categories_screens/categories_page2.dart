import 'package:flutter/material.dart';
import 'package:trip_plannerx/screens/home/inside_categories_screens/decription_page2.dart';

class PageTwo extends StatelessWidget {
  PageTwo({super.key});

  final List<String> pic = [
    "https://visatoexplore.in/wp-content/uploads/2021/01/Kalapathher-1024x682.jpg",
    "https://media.cntraveler.com/photos/5845955fe677ad7e572f89de/1:1/w_876,h_876,c_limit/lakshadweep-islands-GettyImages-675619991.jpg",
    "https://peopleplaces.in/wp-content/uploads/2023/04/cropped-68643150_2451118974944099_473544174726021120_n.jpg"
  ];
  final List<String> text = ['Swaraj Dweep', 'lakshadweep', 'Munroe'];
  final List<String> description = [
    "Swaraj Dweep is a picturesque natural paradise with beautiful white sandy beaches, rich coral reefs and lush green forest. It is one of the populated islands in the Andaman group with an area of 113 sq. km. and is located 39 km of north-east of Port Blair.",
    "India's smallest Union Territory Lakshadweep is an archipelago consisting of 36 islands with an area of 32 sq km. It is a uni-district Union Territory and is comprised of 12 atolls, three reefs, five submerged banks and ten inhabited islands. The islands comprise of 32 sq km.",
    "Munroe Island or Mundrothuruthu is an inland island group located at the confluence of Ashtamudi Lake and the Kallada River, in Kollam district, Kerala, South India. It is a group of eight small islets comprising a total area of about 13.4 km2. The island, accessible by road, rail and inland water navigation, is about 25 kilometres (16 mi) from Kollam by road, 38 kilometres (24 mi) north from Paravur, 12 kilometres (7.5 mi) west from Kundara and about 25 kilometres (16 mi) from Karunagapally. As of the 2011 Indian census, the administrative village of Mundrothuruth (which includes nearby small villages as well) has a total population of 9599, consisting of 4636 males and 4963 females. This island is also known as Sinking Island of Kerala"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Islands'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DecriptionPage2(
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
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
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
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
