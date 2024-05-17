// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_blogs_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageBlogAdapter extends TypeAdapter<ImageBlog> {
  @override
  final int typeId = 5;

  @override
  ImageBlog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageBlog(
      images: (fields[0] as List).cast<String>(), blogs: [],
    );
  }

  @override
  void write(BinaryWriter writer, ImageBlog obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageBlogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
