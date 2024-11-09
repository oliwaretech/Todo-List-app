
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/features/home/domain/models/task.dart';
import 'package:todo/features/home/domain/reopositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository{
  final FirebaseFirestore firestore;

  TaskRepositoryImpl({required this.firestore});

  @override
  Future<void> addTask(Task task) async {
    try {
      await firestore.collection('tasks').add(task.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(String id) async {
    try {
      await firestore.collection('tasks').doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<Task>> getTasks(String firestoreRef)  {
    try {
      return firestore.collection(firestoreRef).snapshots().map((snapshot) {
        return snapshot.docs.map((doc) => Task.fromFirestore(doc)).toList();
      });
    } catch (e) {
      rethrow;
    }
  }

}