import 'package:flutter/material.dart';
import 'package:trip_plannerx/screens/home/inside_categories_screens/description_page3.dart';

class PageThree extends StatelessWidget {
  PageThree({super.key});

  final List<String> pic = [
    "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Athirapally_Waterfalls_after_the_Monsoons.jpg/1200px-Athirapally_Waterfalls_after_the_Monsoons.jpg",
    "https://anetrabyle.files.wordpress.com/2013/08/jog-falls-infull-spate-during-mid-august-2013.jpg",
    "https://djtheblogger.files.wordpress.com/2016/08/dudhsagar_falls.jpg"
  ];
  final List<String> text = [
    "Athirapally Waterfalls",
    "Jog Falls",
    "Dudhsagar Falls"
  ];
  final List<String> description = [
    "Athirappilly Falls, is situated in Athirappilly Panchayat, Chalakudy Taluk, Thrissur District of Kerala, India on the Chalakudy River, which originates from the upper reaches of the Western Ghats at the entrance to the Sholayar ranges.It is the largest waterfall in Kerala, which stands tall at 80 fee",
    "Jog Falls is a waterfall on the Sharavati river located in Siddapura taluk, Uttara Kannada District and its view point located in Shimoga district of Karnataka, India. It is the second highest plunge waterfall in India. It is a segmented waterfall which depends on rain and season to become a plunge waterfall.",
    "Dudhsagar Waterfall is situated inside the Bhagwan Mahavir wildlife sanctuary in Sanguem district of Goa close to the border with Karnataka. It is about 60 km from state capital Panaji. Water plummets from a height of over 1,000 ft to form one of the most amazing natural phenomena in Goa."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Falls'),
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
                        builder: (context) => DescriptionPage3(
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
                              )),
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
