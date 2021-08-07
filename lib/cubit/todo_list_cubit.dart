import 'package:bloc/bloc.dart';
import 'package:todo_list/models/todo.dart';


class TodoListCubit extends Cubit<List<Todo>> {
  TodoListCubit() : super([]);

  void create(String name) async {
    emit(state + [Todo(name: name)]);
  }

  void delete(int index) async {
    state.removeAt(index);
    emit(state+[]);
  }

  void update(int index, String name)async{
    state[index] = Todo(name: name);
    emit(state+[]);
  }
}
