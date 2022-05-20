import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_list/app/core/utils/extensions.dart';
import 'package:getx_todo_list/app/modules/home/controller.dart';
import 'package:getx_todo_list/app/widgets/icons.dart';
import 'package:dotted_border/dotted_border.dart';

class AddCart extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();

  AddCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
            titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
            radius: 5,
            title: 'Task Type',
            content: Form(
              key: homeCtrl.formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: homeCtrl.editCtrl,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title'
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        child: DottedBorder(
          child: Center(
            child: Icon(
              Icons.add,
              size: 10.0.wp,
              color: Colors.grey,
            ),
          ),
          color: Colors.grey[400]!,
          dashPattern: const [4, 8],
        ),
      ),
    );
  }
}
