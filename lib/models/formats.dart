import 'package:json_annotation/json_annotation.dart';
import 'package:pro_zone/models/image_format.dart';

part 'formats.g.dart';

@JsonSerializable(explicitToJson: true)
class Formats{
  Formats({this.small, this.medium, this.large});

  ImageFormat small;
  ImageFormat medium;
  ImageFormat large;

  factory Formats.fromJson(Map<String, dynamic> json)=> _$FormatsFromJson(json);

  Map<String, dynamic> toJson()=> _$FormatsToJson(this);

}