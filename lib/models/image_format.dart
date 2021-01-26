import 'package:json_annotation/json_annotation.dart';

part 'image_format.g.dart';

@JsonSerializable()
class ImageFormat{
  ImageFormat({this.url, this.size});

  @JsonKey(name: "url")
  String url;

  @JsonKey(name: "size")
  double size;

  factory ImageFormat.fromJson(Map<String, dynamic> json)=> _$ImageFormatFromJson(json);

  Map<String, dynamic> toJson()=> _$ImageFormatToJson(this);
}