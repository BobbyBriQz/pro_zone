
import 'package:json_annotation/json_annotation.dart';

part 'provider_state.g.dart';

@JsonSerializable()
class ProviderState{

  ProviderState({this.id, this.name});

  int id;
  String name;

  factory ProviderState.fromJson(Map<String, dynamic> json)=> _$ProviderStateFromJson(json);

  Map<String, dynamic> toJson()=> _$ProviderStateToJson(this);
}