import 'package:hive/hive.dart';
  part 'images_blogs_db.g.dart';
@HiveType(typeId: 5)
class ImageBlog{
  @HiveField(0)
  final List<String>images;
  final List<String>blogs;
  ImageBlog({required  this.images,required this.blogs});
}