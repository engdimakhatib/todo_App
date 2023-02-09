

import 'package:dima/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/archived_tasks.dart';
import '../../modules/done_tasks.dart';
import '../../modules/new_tasks.dart';
import 'package:sqflite/sqflite.dart';

import '../constants.dart';
import '../network/local/cache_helper.dart';
class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialStates());

static AppCubit get(context) => BlocProvider.of(context);

 int currentIndex = 0;

List<Widget> screens =[const NewTaskScreen() , const DoneTaskScreen(), const ArchivedTasksScreen()];

List<String> titles =['Task' , 'Done Task' ,'Archived Task'];

void changeIndex(int index)
{
  currentIndex = index ;
  emit(AppChangeBottomNavBarState());
}
//part DB
 late  Database database;

   List<Map> newTasks = [];
   List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  void getDataFromDatabase(database) 
  {
    newTasks = [];
    doneTasks = [];
    archivedTasks = []; 
    emit(AppGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value)
  {
value.forEach((element){
  if(element['status'] == 'new') { newTasks.add(element);}
  else if(element['status'] == 'done') {
    doneTasks.add(element);} 
   else {archivedTasks.add(element); }
});
   emit(AppGetDatabaseState());
  });
    print(tasks);
  }

void updateData({required String status , required int id}) async
{
  database.rawUpdate(
    'UPDATE tasks set status = ? WHERE id = ? ',
    // ignore: unnecessary_string_interpolations
    ['$status' , '$id'],
  ).then((value){
    getDataFromDatabase(database) ;
    emit(AppUpdateDatabaseState());
  });
}
void deleteData({ required int id}) async
{
   database.rawDelete(
    'DELETE FROM  tasks  WHERE id = ? ',
    ['id' , '$id'],
  ).then((value){
    getDataFromDatabase(database) ;
    emit(AppDeleteDatabaseState());
  });
}
  insertToDatabase({required String title , required String time ,required String date}) async
  {
  await database.transaction((txn) async {
      txn.rawInsert(' INSERT INTO tasks (title , date , time , status) VALUES( "$title", "$date", "$time", "new" ) '
      // ignore: avoid_print
      ).then((value)
      {      print('value when insert new record ${value.toString()}');
        emit(AppInsertDatabaseState());
          getDataFromDatabase(database) ;
        // ignore: avoid_print
       
        }
      // ignore: avoid_print
      ).catchError((error){print('Error when inserting new record ${error.toString()}');
       // ignore: invalid_return_type_for_catch_error
      // return null;
        });
        return null;
    });
  }
void createDatabase()  async
{
  await openDatabase (
    'todo.db',
    version : 1,
    onCreate : (database , version){
    // ignore: avoid_print
    print('database created');
    database
    .execute(
      'CREATE TABLE tasks (id INTEGER PRIMARY KEY , title TEXT , date TEXT , time TEXT , status TEXT)'
      ).then((value){
      // ignore: avoid_print
      print('table created');
      }).catchError((error){
        // ignore: avoid_print
        print('Error when creating table ${error.toString()}');
       });
    },

  //here i get data
  onOpen : (database){
  getDataFromDatabase(database);
  emit(AppGetDatabaseState());
// ignore: avoid_print
print('DataBase Opened');
    },
  ).then((value)
  {
    database = value;
    emit(AppCreateDatabaseState());
  });
}
//add all variables that need to setState
bool isBottomSheetShown = false ;
IconData fabIcon = Icons.edit ;

void changeBottomSheetState({required bool isShow , required IconData icon })
{
isBottomSheetShown = isShow;
fabIcon = icon;
emit(AppChangeBottomSheetState());
}

bool isDark = false;
void changeAppMode({bool fromShared})
{
  if(fromShared != null)
  {
 isDark = fromShared;
     emit(AppChangeModeState());
  }
 
  else
  {
isDark = !isDark;
  CacheHelper.putData(key : 'isDark' , value : isDark).then(((value) {
      emit(AppChangeModeState());
  }));
  }
  

}
}
