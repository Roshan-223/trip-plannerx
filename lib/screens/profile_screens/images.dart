import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:trip_plannerx/model/images_blogs_db.dart';
import 'package:trip_plannerx/screens/profile_screens/fullscreen_img.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({Key? key}) : super(key: key);

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  final String imageBoxName = 'scheduleImages';
  late Box<ImageBlog> imageBlogBox;
  List<String> images = [];

  @override
  void initState() {
    super.initState();
    openImageBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPhotoFromGallery,
        child: const Icon(Icons.add_a_photo_outlined),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FullScreenImagePage(imagePath: images[index]),
                  ),
                );
              },
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Delete Image?'),
                    content: const Text(
                        'Are you sure you want to delete this image?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          _deleteImage(index);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                );
              },
              child: Image.file(
                File(images[index]),
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> openImageBox() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    imageBlogBox = await Hive.openBox<ImageBlog>(imageBoxName);
    setState(() {
      images = imageBlogBox.get(0)?.images ?? [];
    });
  }

  Future<void> _addPhotoFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageBlog = imageBlogBox.get(0) ?? ImageBlog(images: [], blogs: []);
      imageBlog.images.add(pickedFile.path);
      imageBlogBox.put(0, imageBlog);
      setState(() {
        images = imageBlog.images;
      });
    }
  }

  void _deleteImage(int index) {
    final imageBlog = imageBlogBox.get(0);
    if (imageBlog != null) {
      imageBlog.images.removeAt(index);
      imageBlogBox.put(0, imageBlog);
      setState(() {
        images = imageBlog.images;
      });
    }
  }
}
