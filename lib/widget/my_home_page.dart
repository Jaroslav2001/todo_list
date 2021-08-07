import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/todo_list_cubit.dart';
import 'package:todo_list/models/todo.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Todo List')),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          child: Center(
            child: ElevatedButton(
              onPressed: () async {
                String? textBuild;
                await showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('Ведите текст'),
                      actions: <Widget>[
                        TextField(
                          autofocus: true,
                          onSubmitted: (text){
                            textBuild = text;
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                );
                context.read<TodoListCubit>().create(textBuild!);
              },
              child: Text('Создать'),
            ),
          ),
        ),
      ),
      body: BlocBuilder<TodoListCubit, List<Todo>>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: state.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () async {
                    int? indexBuild;
                    String? textBuild;
                    await showDialog(
                        context: context,
                        builder: (BuildContext context) =>AlertDialog(
                            title: Text(state[index].name),
                            actions: <Widget>[
                              TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Изиенить',
                                  filled: true,
                                ),
                                onSubmitted: (text){
                                  indexBuild = index;
                                  textBuild = text;
                                  Navigator.pop(context);
                                },
                              ),
                              GestureDetector(
                                onTap: (){
                                  indexBuild = index;
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding:  EdgeInsets.all(15),
                                  child: Text('Удалить'),
                                ),
                              )
                            ],
                        ),
                    );
                    if(textBuild != null){
                      context.read<TodoListCubit>().update(indexBuild!,textBuild!);
                      return;
                    }
                    context.read<TodoListCubit>().delete(indexBuild!);
                  },
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      state[index].name,
                      style: TextStyle(
                        fontSize: 26
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
