import 'package:json_annotation/json_annotation.dart';
import 'package:ram_character/models/info_dto.dart';
import 'package:ram_character/models/person.dart';

part 'response_dto.g.dart';

@JsonSerializable()
class ResponseDTO {
  final InfoDTO info;
  final List<Person> results;

  ResponseDTO({required this.info, required this.results});

  factory ResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDTOToJson(this);
}
