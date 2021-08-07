import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/todo_list_cubit.dart';

import 'my_home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(child: BlocProvider(
        create: (context) => TodoListCubit(),
        child: MyHomePage(title: 'Todo List'),
      )),
    );
  }
}