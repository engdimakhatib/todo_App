import '../shared/remote/dio_helper.dart';
import 'newsState.dart';

class NewsCubit extends Cubit<NewsState>
{
NewsCubit():super(NewsInitialState());
static NewsCubit get(context) => BlocProvider.of(context);
int currentIndex = 0;
List<BottomNavigationBarItem> bottomItems = [
  BottomNavigationBarItem(icon : Icon(Icons.business),label:'Business'),
  BottomNavigationBarItem(icon : Icon(Icons.sports),label:'Sports'),
  BottomNavigationBarItem(icon : Icon(Icons.science),label:'Science'),
  BottomNavigationBarItem(icon : Icon(Icons.settings),label:'Settings'),
],
void changeBottomNavBar(int index)
{
currentIndex = index ;
if(index==1)
getSports();
if(index==1)
getSiences();

emit(NewsBottomNavState);
}
List<Widget> screens = [BusinessScreen(), SportsScreen(),ScienceScreen(), SettingsScreen(),];

List<dynamic> business =[];

void getBusiness()
{
 DioHelper.getData(
    url :'v2/top-headLines',
    query:
    {
'country':'eg'
,'category':'business'
,'apiKey':''
}).then((value){
  business = value.data['articles'];

  print(sports[0]['title']);
  emit(NewsGetBusinessLoadingState());
}).catchError((error){
  print(error.toString());
  emit(NewsGetBusinessSuccessState());
});
}

List<dynamic> sports =[];

void getSports()
{
  if(sports.length==0){
 DioHelper.getData(
    url :'v2/top-headLines',
    query:
    {
'country':'eg'
,'category':'sports'
,'apiKey':''
}).then((value){
  sports = value.data['articles'];

  print(sports[0]['title']);
  emit(NewsGetSportsLoadingState());
}).catchError((error){
  print(error.toString());
  emit(NewsGetSportsErrorState());
});
  }
 else 
 emit(NewsGetSportsSuccessState());
}

List<dynamic> science =[];

void getSiences()
{
  if(science.length == 0)
  {
 DioHelper.getData(
    url :'v2/top-headLines',
    query:
    {
'country':'eg'
,'category':'science'
,'apiKey':''
}).then((value){
  science = value.data['articles'];
  print(sports[0]['title']);
  emit(NewsGetSiencesLoadingState());
}).catchError((error){
  print(error.toString());
  emit(NewsGetSiencesErrorState());
});
  }
 else
 emit(NewsGetSiencesSuccessState());
}

List<dynamic> search =[];

void getSearch(String value)
{
  emit(NewsGetSearchLoadingState);

  search =[];

 DioHelper.getData(
    url :'v2/everything',
    query:
    {
'q':'$value'
,'apiKey':''
}).then((value){
  search = value.data['articles'];

  print(sports[0]['title']);
  emit((NewsGetSearchSuccessState));
}).catchError((error){
  print(error.toString());
  emit(NewsGetSearchErrorState());
});

}

}