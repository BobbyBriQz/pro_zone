// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Formats _$FormatsFromJson(Map<String, dynamic> json) {
  return Formats(
    small: json['small'] == null
        ? null
        : ImageFormat.fromJson(json['small'] as Map<String, dynamic>),
    medium: json['medium'] == null
        ? null
        : ImageFormat.fromJson(json['medium'] as Map<String, dynamic>),
    large: json['large'] == null
        ? null
        : ImageFormat.fromJson(json['large'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FormatsToJson(Formats instance) => <String, dynamic>{
      'small': instance.small?.toJson(),
      'medium': instance.medium?.toJson(),
      'large': instance.large?.toJson(),
    };
