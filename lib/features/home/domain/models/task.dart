import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String title,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) =>
      _$TaskFromJson(json);

  factory Task.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    return Task.fromJson(doc.data()!).copyWith(id: doc.id);
  }
}