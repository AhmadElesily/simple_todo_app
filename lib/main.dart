import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Screen1(),
  ));
}

class Screen1 extends StatefulWidget {
  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List<String> todos = [];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO APP', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.calendar_month,color: Colors.white,),
          ),
        ],
      ),
      backgroundColor: Color(0xffffffff),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Card(
                    child: TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                          hintText: 'Write your todo item',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 6)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ElevatedButton.icon(
                    label: Text('Add'),
                    icon: Icon(Icons.add),
                    onPressed: (){
                      setState((){
                        todos.add(controller.text);
                        controller.clear();
                      });

                    },
                  ),
                )
              ],
            ),
          ),
          for(final val in todos)
          _todoItem(val),

        ],
      ),
    );
  }
}

Widget _todoItem(String value) {
  return Card(
    elevation: 6,
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(value),
              Text('Description'),
            ],
          ),
          Row(
            children: [
              Image.asset(
                'assets/icons/pencil.png',
                height: 30,
                width: 30,
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/icons/Trash.png',
                height: 30,
                width: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/icons/CheckCircle.png',
                height: 30,
                width: 30,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
