import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:providerapi1/provider/getdata_provider.dart';
import 'package:providerapi1/provider/todo_provider.dart';
import 'package:providerapi1/screens/display_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 // get dataProvider => null;

  
    @override
  void initState(){
   super.initState();
   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    Provider.of<TodoProvider>(context,listen: false).getAllTodos();
    // final dataProvider = Provider.of<GetDataProvider>(context, listen: false);
    // dataProvider.getMyData();
   });
  }

  @override
  Widget build(BuildContext context) {
   // final dataProvider = Provider.of<GetDataProvider>(context);
    return Scaffold(
      body: Consumer<TodoProvider>(builder: (context, value, child) {
        if(value.isLoading){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final todos=value.todos;
        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context,index){
            final todo=todos[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(todo.id.toString()),
              ),
              title: Text(todo.title,
              style: TextStyle(
                color: todo.completed?Colors.grey:Colors.amber
              ),),
              onTap: () {
               Get.to( HomeScreen(
               // dataProvider: dataProvider
                ));
              },
            );

        });
      },),
    );
  }
}