import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/core/theme/styles.dart';
import 'package:todo/features/home/domain/models/task.dart';
import 'package:todo/features/home/presentation/providers/task_providers.dart';
import 'package:todo/features/home/presentation/widgets/task_item.dart';
import 'package:todo/features/loading/presentation/screens/loading_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  static const String route = '/home';
  static const String name = 'home';

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final tasksAsyncValue = ref.watch(getTasksProvider('tasks'));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('TO DO LIST', style: textTitle),
            SizedBox(height: 5,),
            Center(child: Text('Swipe from right to left to delete a task', style: textItem)),
          ]
        ),
      ),
      body: tasksAsyncValue.when(
        loading: () => LoadingScreen(),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (tasks) {
          return ListView.builder(
            itemCount: tasks!.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TaskItem(task: task);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(context),
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }

  void _displayDialog(BuildContext context) async {

    final _textFieldController = TextEditingController();

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a task to your List'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Enter task here'),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: mainButtonStyle,
                child: Text('ADD', style: textButton,),
                onPressed: () {
                  Navigator.of(context).pop();
                  ref.read(addTaskProvider(Task(id: '', title: _textFieldController.text)));
                },
              ),
              Center(
                child: TextButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          );
        });
  }
}
