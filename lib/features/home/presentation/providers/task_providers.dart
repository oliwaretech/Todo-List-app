
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/features/home/data/repositories/task_repository_impl.dart';
import 'package:todo/features/home/domain/models/task.dart';
import 'package:todo/features/home/domain/reopositories/task_repository.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return TaskRepositoryImpl(firestore: firestore);
});

final getTasksProvider = StreamProvider.family<List<Task>?, String>((ref, firestoreRef) {
  final repository = ref.read(taskRepositoryProvider);
  return repository.getTasks(firestoreRef); // This should return a Stream<List<Task>>
});

final deleteTaskProvider = FutureProvider.family<Task?, String>((ref, id) async {
  final repository = ref.read(taskRepositoryProvider);
  repository.deleteTask(id);
});

final addTaskProvider = FutureProvider.family<Task?, Task>((ref, task) async {
  final repository = ref.read(taskRepositoryProvider);
  repository.addTask(task);
});