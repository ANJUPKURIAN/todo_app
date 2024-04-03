import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        actions: [Icon(Icons.search), SizedBox(width: 10)],
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
              children: List.generate(
                  5,
                  (index) => ListTile(
                        leading: Checkbox(
                          value: false,
                          onChanged: (value) {
                            value = true;
                            setState(() {
                              
                            });

                          },
                          
                        ),
                        title: Row(
                          children: [
                            Text("Task"),
                            SizedBox(width: 20),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Incomplete",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                            onPressed: () {}, icon: Icon(Icons.delete)),
                      )),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
        child: TextButton.icon(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.deepPurple)),
            onPressed: () {},
            icon: Text(
              "Add a task",
              style: TextStyle(color: Colors.white),
            ),
            label: Icon(Icons.add_circle, color: Colors.white)),
      ),
    );
  }
}