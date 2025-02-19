// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => ErrorModel(
      fault: Fault.fromJson(json['fault'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{
      'fault': instance.fault,
    };

Fault _$FaultFromJson(Map<String, dynamic> json) => Fault(
      faultstring: json['faultstring'] as String,
      detail: Detail.fromJson(json['detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FaultToJson(Fault instance) => <String, dynamic>{
      'faultstring': instance.faultstring,
      'detail': instance.detail,
    };

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
      errorcode: json['errorcode'] as String,
    );

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'errorcode': instance.errorcode,
    };
