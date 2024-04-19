import 'package:flutter/material.dart';
import 'package:trip_plannerx/screens/home/inside_categories_screens/description_page0.dart';

class Pagezero extends StatelessWidget {
  Pagezero({super.key});

  final List<String> img = [
    "https://static2.tripoto.com/media/filter/tst/img/415096/TripDocument/1550220068_1550219789211.jpg",
    "https://www.fabhotels.com/blog/wp-content/uploads/2019/09/Munnar-Kerala-1.jpg",
    "https://www.trawell.in/admin/images/upload/963467586Illikkal.jpg",
    "https://tourismtn.com/wp-content/uploads/2020/12/Vattakanal-Dolphin-Nose-Point-Kodaikanal.jpg"
  ];
  final List<String> place = [
    'Manali',
    'Top station',
    'Illikalkallu',
    'Dophin Nose'
  ];
  final List<String> descriptions = [
    'Manali is synonymous streams and birdsong, forests and orchards and grandees of snow-capped mountains. Manali is the real starting point of an ancient trade route which crosses the Rohtang and Baralacha passes, and runs via Lahul and Ladakh to Kashmir while divergent road connects it with Spiti.',
    'Top Station is a tourist destination located in Theni district of Tamil nadu. Top Station is notable as the historic transshipment location for Kannan Devan tea delivered there from Munnar and Madupatty by railway and then down by ropeway to Kottagudi. This area is popular for the rare Neelakurinji flowers. The Kurinjimala Sanctuary is nearby. Top Station is the western entrance to the planned Palani Hills National Park.',
    'Illikkal Kallu is a Thalanadu located on top of the Illickal Malaa in the Kottayam district of Kerala, India.The distance from kottayam railway station to illikal kallu is 57km. Situated at around 3500 feet above sea level, Illickal Kallu is a major tourist attraction in Thalanadu. L. S. G.D., Thalanadu village of Meenachil taluk. Only one half of the original rock remains, as the other half of the rock has fallen off. The nearest town is Teekoy. Numerous mountain streams originate from this peak and flow down to form the Meenachil River. ',
    'to Dolphin’s Nose, a viewpoint that offers an enthralling view of the blue mountains of Nilgiris and the lush green tea estates on its slopes. Let your eyes and mind freely wander along the marvellous view of unending plains and lush green hillocks from the vantage point Dolphin Nose offers. At 6600 ft above sea level, the view from the dolphin’s nose is breath-taking. An ideal spot for those interested in trekking, the trail to the Dolphin’s Nose covers a distance of 3 kms in the Palani Hill Range. This view point is a favourite among the tourists who come to adore the glory of the Princess of hill-stations. Kodaikanal proudly fosters this location as an ideal spot from which one may marvel at the glory of its lush green landscapes, rough terrains, and the rugged charm of the towns.'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mountains'),
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
                        builder: (context) => DescriptionPage0(
                              title: place[index],
                              imageUrl: img[index],
                              description: descriptions[index],
                            )));
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber,
                  image: DecorationImage(
                      image: NetworkImage(img[index]), fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 5),
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
                          place[index],
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
