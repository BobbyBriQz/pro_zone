// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Provider _$ProviderFromJson(Map<String, dynamic> json) {
  return Provider(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    rating: json['rating'] as int,
    address: json['address'] as String,
    activeStatus: json['active_status'] as String,
    providerType: json['provider_type'] == null
        ? null
        : ProviderType.fromJson(json['provider_type'] as Map<String, dynamic>),
    state: json['state'] == null
        ? null
        : ProviderState.fromJson(json['state'] as Map<String, dynamic>),
    images: (json['images'] as List)
        ?.map(
            (e) => e == null ? null : Image.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProviderToJson(Provider instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'rating': instance.rating,
      'address': instance.address,
      'active_status': instance.activeStatus,
      'provider_type': instance.providerType?.toJson(),
      'state': instance.state?.toJson(),
      'images': instance.images?.map((e) => e?.toJson())?.toList(),
    };
