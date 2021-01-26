
import 'package:json_annotation/json_annotation.dart';

part 'provider_type.g.dart';

@JsonSerializable()
class ProviderType{

  ProviderType({this.id, this.name});

  int id;
  String name;

  factory ProviderType.fromJson(Map<String, dynamic> json)=> _$ProviderTypeFromJson(json);

  Map<String, dynamic> toJson()=> _$ProviderTypeToJson(this);
}