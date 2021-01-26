// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    id: json['id'] as int,
    formats: json['formats'] == null
        ? null
        : Formats.fromJson(json['formats'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'id': instance.id,
      'formats': instance.formats?.toJson(),
    };
