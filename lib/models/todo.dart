import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    int? id,
    required String depscription,
    required String authname,
    String? time,
  }) = _Todo;
  factory Todo.fromJson(Map<String, Object?> json) => _$TodoFromJson(json);
}
