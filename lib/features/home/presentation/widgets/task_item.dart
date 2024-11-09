import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/core/helpers/snackbars.dart';
import 'package:todo/core/theme/app_colors.dart';
import 'package:todo/core/theme/styles.dart';
import 'package:todo/features/home/domain/models/task.dart';
import 'package:todo/features/home/presentation/providers/task_providers.dart';

class TaskItem extends ConsumerStatefulWidget {
  final Task task;
  const TaskItem({super.key,
    required this.task,
  });

  @override
  ConsumerState<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends ConsumerState<TaskItem> {

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.task.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        // Remove the item from the list
        ref.read(deleteTaskProvider(widget.task.id));
        SnackBars.showSnackBar(context, widget.task.title+' deleted');
      },
      background: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Icon(Icons.delete, color: Colors.white),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.task, color: AppColors.secondaryColor,),
                  SizedBox(width: 10,),
                  Expanded(child: Text(widget.task.title, style: textItem,)),
                ],
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
