import 'package:json_annotation/json_annotation.dart';
part 'info_dto.g.dart';

@JsonSerializable()
class InfoDTO{
  final int count;//": 826,
  final int pages;//": 42,
  final String? next;//": "https://rickandmortyapi.com/api/character?page=2",
  final String? prev;

  InfoDTO({required this.count, required this.pages, this.next, this.prev});

  factory InfoDTO.fromJson(Map<String, dynamic> json) =>
      _$InfoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$InfoDTOToJson(this);
}