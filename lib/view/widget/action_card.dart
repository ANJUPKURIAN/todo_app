import 'package:flutter/material.dart';
//import 'package:todo_app/controller/home_screen_controller.dart';
import 'package:todo_app/core/color_constant.dart';
//import 'package:todo_app/model/action_model.dart';

class ActionCardWidget extends StatefulWidget {
  const ActionCardWidget({super.key, required this.action, this.onDelete});
  final String action;
  final void Function()? onDelete;

  @override
  State<ActionCardWidget> createState() => _ActionCardWidgetState();
}



class _ActionCardWidgetState extends State<ActionCardWidget> {
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: isFinished,
        onChanged: (value) {
          isFinished = !isFinished;
          setState(() {});
        },
      ),
      title: Row(
        children: [
          Text(widget.action),
          SizedBox(width: 20),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: isFinished == false
                    ? ColorConstant.primaryGrey
                    : ColorConstant.primaryBlue,
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              isFinished == false ? "Incomplete" : "Complete",
              style: TextStyle(
                  color: ColorConstant.primaryWhite,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      trailing:
          IconButton(onPressed: widget.onDelete, icon: Icon(Icons.delete)),
    );
  }
}