import 'package:flutter/material.dart';
import 'package:trip_plannerx/screens/home/designs/colors.dart';
import 'package:trip_plannerx/screens/home/inside_categories_screens/description_page5.dart';

class PageFive extends StatelessWidget {
  PageFive({super.key});
  final List<String> pic = [
    "https://miro.medium.com/v2/resize:fit:1400/format:webp/0*uEnJuRoUCKEUZZI_.jpg",
    "https://miro.medium.com/v2/resize:fit:1400/format:webp/0*RcUbE5L_S9-L_lXV.jpg",
    "https://images.inuth.com/2017/02/red-fort-preset3.jpg",
    "https://th-thumbnailer.cdn-si-edu.com/0Tog4P1WeTD51sLUT4zUW4z-A-o=/1000x750/filters:no_upscale()/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/morning-on-the-Ganges-River-Varanasi-631.jpg"
  ];
  final List<String> text = [
    'Taj Mahal',
    'Qutub Minar',
    'Red Fort',
    'Varanasi'
  ];

  final List<String> description = [
    " The Taj Mahal is an ivory-white marble mausoleum on the south bank of the Yamuna river in the Indian city of Agra. It was commissioned in 1632 by the Mughal emperor, Shah Jahan (reigned from 1628 to 1658), to house the tomb of his favourite wife, Mumtaz Mahal.",
    "Built of red and buff sandstone and eloquently carved with inscriptional bands, the Qutb Minar is the tallest masonry tower in India, measuring 72.5 metres high, with projecting balconies for calling all Muadhdhin to prayer. An iron pillar in the courtyard gave the mosque a unique Indian aesthetic.",
    "The Red Fort Complex was built as the palace fort of Shahjahanabad – the new capital of the fifth Mughal Emperor of India, Shah Jahan. Named for its massive enclosing walls of red sandstone, it is adjacent to an older fort, the Salimgarh, built by Islam Shah Suri in 1546, with which it forms the Red Fort Complex.",
    "The land of Varanasi (Kashi) has been the ultimate pilgrimage spot for Hindus for ages. Hindus believe that one who is graced to die on the land of Varanasi would attain salvation and freedom from the cycle of birth and re-birth. Abode of Lord Shiva and Parvati, the origins of Varanasi are yet unknown."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monuments'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionPage5(title: text[index], imageUrl: pic[index], description: description[index])));
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
                      color: Colors.white.withOpacity(0.5),
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
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white()),
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
