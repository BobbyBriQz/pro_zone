
import 'package:json_annotation/json_annotation.dart';

import 'formats.dart';

part 'image.g.dart';

@JsonSerializable(explicitToJson: true)
class Image{

  Image({this.id, this.formats});
  int id;
  Formats formats;

  factory Image.fromJson(Map<String, dynamic> json)=> _$ImageFromJson(json);

  Map<String, dynamic> toJson()=> _$ImageToJson(this);
}