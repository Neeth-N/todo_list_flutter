import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/model/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      home: const ToDoPage(title: 'To-Do List'),
    );
  }
}

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ToDoPage> createState() => _ToDoState();
}

class _ToDoState extends State<ToDoPage> {

  List<Todo> task = [];
  String curv = '';
  // final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formkey = GlobalKey();
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(widget.title),
    ),
    body: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Form(
    key: formkey,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    TextFormField(
    validator: (val) {
    if (val == null || val.isEmpty) {
    return 'Enter something';
    }
    else{
      curv = val;
    return null;
    }
    },
    decoration: InputDecoration(
    labelText: "Task",
    hintText: "Enter your task here",
    ),
    ),
    SizedBox(height: 10),
    Row(
    children: [
    Expanded(
    child: TextButton(
    onPressed: () => _selectDate(context),
    child: Text(
    'Select Due Date',
    style: TextStyle(fontSize: 16),
    ),
    ),
    ),

            TextButton(

                onPressed: (){
                  if (formkey.currentState!.validate()) {

                  }
                      setState(() {
                      task.add(Todo(
                      action: curv.trim(),
                      dueDate: selectedDate,
                ));
                  });
                },
                child:
                    Padding(
                       padding:  const EdgeInsets.only(right: 15),
                child: Text('Submit', style: TextStyle(fontSize: 20),
                ))),


    ],
    ),
      Padding(
        padding: EdgeInsets.only(left: 5,top: 25),
        child: Text('Your Tasks :', style: TextStyle(fontSize: 25)),
      ),
      // Expanded(
      //   child: ListView.builder(
      //     itemCount: task.length,
      //     itemBuilder: (context, index) {
      //       return ListTile(
      //         title: Text(task[index].action),
      //         subtitle: Text(
      //           'Due Date: ${task[index].dueDate.day}/${task[index].dueDate.month}/${task[index].dueDate.year}',
      //         ),
      //       );
      //     },
      //   ),
      // ),

    ],
    ),
    ),
    ],
    ),
    ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}



