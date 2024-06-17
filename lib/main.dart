import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  String curv = 'Task';
  List<String> task = [];
  // final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    print(curv);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          key: formkey,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              // onSubmitted: (value) => setState(() => task = value),
              initialValue: curv,
              validator: (val){
                  if (val != null) {
                    val = val.trim();
                    if(val.isNotEmpty) {
                      task.add(val);
                      print(task);
                      setState(() {});
                    }
                  }
                  else{
                    return 'Enter Something';
                  }
                  return null;
              },
              // textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                labelText: "Task",
                hintText: "Enter your Task here",
              ),
            ),
            TextButton(
                onPressed: (){
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.reset();
                  }
                },
                child:
                Text('Submit', style: TextStyle(fontSize: 25))
            ),
          ],
        ),
      ),
    );
  }
}
