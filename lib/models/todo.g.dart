// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$$_TodoFromJson(Map<String, dynamic> json) => _$_Todo(
      id: json['id'] as int?,
      depscription: json['depscription'] as String,
      authname: json['authname'] as String,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'id': instance.id,
      'depscription': instance.depscription,
      'authname': instance.authname,
      'time': instance.time,
    };
