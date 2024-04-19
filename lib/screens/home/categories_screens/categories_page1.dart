import 'package:flutter/material.dart';
import 'package:trip_plannerx/screens/home/inside_categories_screens/description_page1.dart';

class PageOne extends StatelessWidget {
  PageOne({super.key});

  final List<String> pic = [
    "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjxIC90IR3jli2TdL1WS-PNj19D6v4rbElU_WchOV-WaQhyhcS0JK-NGrlChVaGWRhYWgQy2xpqvrvIsZKgBojutPtN58Mr6E7M5nX-6BSzSfdZIyUWiFgDcvSX1M--EupMBJfeTByxH8JPHkbKCq1I-6o_MRoKrbgCn7ywCyqD8XuZQqMk8osiQQecILg/s891/Gir%20national%20park.jpg",
    "https://www.holidify.com/images/bgImages/MANAS-NATIONAL-PARK.jpg",
    "https://img.traveltriangle.com/blog/wp-content/uploads/2018/12/great-himalayan-national-park-stay-tent5.jpg"
  ];
  final List<String> text = [
    'Gir National Park',
    'manas National Park',
    'The Great Himalayan National Park'
  ];
  final List<String> description = [
    "Gir National Park and Wildlife Sanctuary, also known as Sasan Gir, is a forest, national park, and wildlife sanctuary near Talala Gir in Gujarat, India. It is located 43 km (27 mi) north-east of Somnath, 65 km (40 mi) south-east of Junagadh and 60 km (37 mi) south-west of Amreli. It was established in 1965 in the erstwhile Nawab of Junagarh's private hunting area, with a total area of 1,410.30 km2 (544.52 sq mi), of which 258.71 km2 (99.89 sq mi) is fully protected as a national park as wildlife sanctuary.It is part of the Khathiar-Gir dry deciduous forests ecoregion.",
    'Manas National Park is a national park, Project Tiger reserve, and an elephant reserve in Assam, India. Located in the Himalayan foothills, it borders the Royal Manas National Park in Bhutan. The park is known for its rare and endangered endemic wildlife such as the Assam roofed turtle, hispid hare, golden langur and pygmy hog. Manas is also famous for its population of the wild water buffalo. Because of its exceptional biodiversity, scenery, and variety of habitats, Manas National Park is a biosphere reserve and a UNESCO World Heritage Site.',
    "The Great Himalayan National Park is a national park in India, located in Banjar sub-division of Kullu in the state of Himachal Pradesh. The park was established in 1984 and is spread over an area of 1171 km2; elevations within the park range between 1500 and 6000 m. The Great Himalayan National Park is a habitat to numerous flora and more than 375 fauna species, including approximately 31 mammals, 181 birds, 3 reptiles, 9 amphibians, 11 annelids, 17 mollusks and 127 insects. They are protected under the strict guidelines of the Wildlife Protection Act of 1972; hence any sort of hunting is not permitted."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wild'),
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
                        builder: (context) => Descriptionpage1(
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
