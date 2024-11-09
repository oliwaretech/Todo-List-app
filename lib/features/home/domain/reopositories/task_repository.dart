
import 'package:todo/features/home/domain/models/task.dart';

abstract class TaskRepository {
  Stream<List<Task>> getTasks(String firestoreRef);
  Future<void> addTask(Task task);
  Future<void> deleteTask(String id);
}