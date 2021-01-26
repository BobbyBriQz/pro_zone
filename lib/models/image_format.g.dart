// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_format.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageFormat _$ImageFormatFromJson(Map<String, dynamic> json) {
  return ImageFormat(
    url: json['url'] as String,
    size: (json['size'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ImageFormatToJson(ImageFormat instance) =>
    <String, dynamic>{
      'url': instance.url,
      'size': instance.size,
    };
