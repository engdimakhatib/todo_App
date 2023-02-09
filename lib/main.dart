import 'package:flutter/material.dart';

import 'cubit/appcubit.dart';
import 'cubit/bloc_observer.dart';
import 'cubit/cubit.dart';
import 'layout/newsLayout.dart';
import 'network/local/cache_helper.dart';
import 'network/remote/dio_helper.dart';
import 'shared/remote/dio_helper.dart';

      //package : hexcolor 
      //sharedPreferences
      //webview
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
 Bloc.observer = MyBlocObserver() ;
 DioHelper.init();
await CacheHelper.init();
bool isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {

final bool isDark ;

  const MyApp({super.key ,isDark });
  //  MyApp(isDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
   providers :[
    BlocProvider(create :(context)=> NewsCubit()..getBusiness()..getSports()..getSiences(),),
      BlocProvider(create :(context)=> AppCubit()..changeAppMode( fromShared : isDark,),),
   ],
  
    child : BlocConsumer<AppCubit,AppStates>(
      listener : (context,state){},
      builder : (context , state){
        return  MaterialApp(

   theme : ThemeData(
    primarySwatch : Colors.deepOrange,
    scaffoldBackgroundColor : Colors.white,
    appBar : AppBarTheme(
     titleSpacing : 20.0,
      bachWardsCompatibility : false,
      systemOverlayStyle : SystemUiOverlayStyle(
        statusBarColor :     Colors.white,
        statusBarIconBrightness : Brightness.dark,
      ),
  iconTheme : IconThemeData(
  color : Colors.black,
  ),
    ),
    bottomNavigationBarTheme :BottomNavigationBarThemeData(
       backgroundColor : Colors.white,
      elevation : 0.0,
        type : bottomNavigationBarType.fixed,
      selectedItemColor : Colors.deepOrane,
      unselectedItemColor : Colors.grey,
      elevation : 20.0,
    ),
    floatingActionButtonTheme : FloatingActionButtonThemeData(
      backgroundColor : Colors.deepOrange,
    ),
     textTheme : TextTheme(
      bodyText1 : TextStyle(fontSize: 18 ,fontWeight : FontWeight.w600 , color : Colors.black,),
    ),
   ),
    dartTheme : ThemeData(

scaffoldBackgroundColor : HexColor('333739'),
    appBar : AppBarTheme(  
      titleSpacing : 20.0,
      bachWardsCompatibility : false,
      systemOverlayStyle : SystemUiOverlayStyle(
        statusBarColor :  HexColor('333739'),
        statusBarIconBrightness : Brightness.light,
      ),
      elevation : 0.0,
      backgroundColor : HexColor('333739'),
      titleTextStyle : TextStyle(
        color : Colors.black,fontSize :20.0 , fontWeight : FontWeight.white,
      ),
       iconTheme : IconThemeData( color : Colors.white, ),
     ),
    bottomNavigationBarTheme :BottomNavigationBarThemeData(
      type : bottomNavigationBarType.fixed,
      selectedItemColor : Colors.deepOrane,
      unselectedItemColor : Colors.grey,
      elevation : 20.0,
      backgroundColor : HexColor('333739'),
    ),
    floatingActionButtonTheme : FloatingActionButtonThemeData(backgroundColor : Colors.deepOrange,),
    textTheme : TextTheme(
      bodyText1 : TextStyle(fontSize: 18 ,fontWeight : FontWeight.w600 , color : Colors.white,),
    ),
    ),
    themeMode : AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
   
   home : Directionality(
    textDirection : TextDirection.ltr,
    child :  NewsLayout(),
   ),
     );//MaterialApp
      }
  
    ),
    );
    
 
  }



}