// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostData _$PostDataFromJson(Map<String, dynamic> json) {
  return PostData()
    ..id = json['_id'] as String?
    ..v = json['__v'] as int?
    ..categoryIds = json['category_ids'] as List<dynamic>?
    ..createdAt = json['created_at'] as String?
    ..description = json['description'] as String?
    ..image = json['image'] as String?
    ..price = json['price'] as int?
    ..title = json['title'] as String?
    ..type = json['type'] as String?
    ..updatedAt = json['updated_at'] as String?
    ..userId = json['user_id'] as String?
    ..author = json['author'] == null
        ? null
        : PostAuthor.fromJson(json['author'] as Map<String, dynamic>)
    ..categories = (json['categories'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : CategoryData.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$PostDataToJson(PostData instance) => <String, dynamic>{
      '_id': instance.id,
      '__v': instance.v,
      'category_ids': instance.categoryIds,
      'created_at': instance.createdAt,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'title': instance.title,
      'type': instance.type,
      'updated_at': instance.updatedAt,
      'user_id': instance.userId,
      'author': instance.author,
      'categories': instance.categories,
    };
