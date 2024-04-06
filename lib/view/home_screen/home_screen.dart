import 'package:flutter/material.dart';
import 'package:todo_app/controller/home_screen_controller.dart';
//import 'package:todo_app/model/action_model.dart';
import 'package:todo_app/core/color_constant.dart';
import 'package:todo_app/view/widget/action_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    HomeScreenController.getInitKeys();
    super.initState();
  }

  TextEditingController actionController = TextEditingController();
  String? dropValue;
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          Icon(Icons.search),
         SizedBox(width: 10)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Today",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
                SizedBox(width: 5),
                Icon(Icons.sunny)
              ],
            ),
            Column(
              children: List.generate(HomeScreenController.actionListKeys.length,
                  (index) {
                final currentKey = HomeScreenController.actionListKeys[index];
                final currentElement =
                    HomeScreenController.todoBox.get(currentKey);
                return ActionCardWidget(
                  action: currentElement!.action,
                  onDelete: () async {
                    await HomeScreenController.deleteAction(currentKey);
                    setState(() {});
                  },
                );
              }),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
        child: TextButton.icon(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(ColorConstant.primaryBlue)),
            onPressed: () {
              actionController.clear();
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: 20,
                        left: 25,
                        right: 25,
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: StatefulBuilder(builder: (BuildContext context,
                        void Function(void Function()) bottomSetState) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Add New Action",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: actionController,
                            decoration: InputDecoration(
                                hintText: "Action",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide())),
                          ),
                          SizedBox(height: 10),
                          DropdownButton(
                            value: dropValue,
                            hint: Text("Select"),
                            items: [
                              DropdownMenuItem(value: "1", child: Text("maths homework")),
                              DropdownMenuItem (value: "2", child: Text("science class")),
                              DropdownMenuItem(value: "3", child: Text(" Hindi exam")),
                              DropdownMenuItem(value: "4", child: Text(" English lesson")),

                            ],
                            onChanged: (value) {
                              dropValue = value;
                              bottomSetState(() {});
                            },
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                              onPressed: () {
                                if (actionController.text != "") {
                                  HomeScreenController.addAction(
                                      action: actionController.text,
                                      finished: isFinished,
                                      category: dropValue);
                                  setState(() {});
                                }
                                Navigator.pop(context);
                              },
                              child: Text("Add"))
                        ],
                      );
                    }),
                  );
                },
              );
            },
            icon: Text(
              "Add an action",
              style: TextStyle(color: ColorConstant.primaryWhite),
            ),
            label: Icon(Icons.add_circle, color: ColorConstant.primaryWhite)),
      ),
    );
  }
}