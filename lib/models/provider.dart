
import 'package:json_annotation/json_annotation.dart';
import 'package:pro_zone/models/image.dart';
import 'package:pro_zone/models/provider_state.dart';
import 'package:pro_zone/models/provider_type.dart';

part 'provider.g.dart';

@JsonSerializable(explicitToJson: true)
class Provider{

  Provider({this.id, this.name, this.description, this.rating, this.address, this.activeStatus, this.providerType, this.state, this.images});

  int id;
  String name;
  String description;
  int rating;
  String address;

  @JsonKey(name: "active_status")
  String activeStatus; //active_status

  @JsonKey(name: "provider_type")
  ProviderType providerType; //provider_type

  ProviderState state;
  List<Image> images;

  factory Provider.fromJson(Map<String, dynamic> json)=> _$ProviderFromJson(json);

  Map<String, dynamic> toJson()=> _$ProviderToJson(this);
}
