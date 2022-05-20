import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_todo_list/app/data/services/storage/repository.dart';
import '../../data/models/task.dart';

class HomeController extends GetxController {
  TaskRepository taskRepository;

  HomeController({required this.taskRepository});
  final formKey = GlobalKey<FormState>();
  final editCtrl = TextEditingController();
  final tasks = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();
    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));
  }

  @override
  void onClose() {
    super.onClose();
  }
}
