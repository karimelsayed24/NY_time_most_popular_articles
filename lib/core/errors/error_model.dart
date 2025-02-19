import 'package:json_annotation/json_annotation.dart';
part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  final Fault fault;

  ErrorModel({required this.fault});

  factory ErrorModel.fromJson(Map<String, dynamic> json) => _$ErrorModelFromJson(json);
}


@JsonSerializable()
class Fault {
  final String faultstring;
  final Detail detail;

  Fault({required this.faultstring, required this.detail});

  factory Fault.fromJson(Map<String, dynamic> json) => _$FaultFromJson(json);
}


@JsonSerializable()
class Detail {
  final String errorcode;

  Detail({required this.errorcode});

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
}



