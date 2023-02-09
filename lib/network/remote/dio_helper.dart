class DioHelper{

  static Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(baseUrl:'//newsapi.org ', recieveDataWhenStatusError : true),
    );
  }

static Future<Response> getData({
 required String url , required Map <String , dynamic > query,})
 async
 {
return await dio.get(url , queryParameters : query);
 }

List<dynamic> business=[];
void getBusiness()
{
  emit(NewsGetBusinessLoadingState());
  DioHelper.getData(url: 'v2/top-headLines'
  , query: {'country':'eg','category':'business','apiKey':''},
  ).then((value){
    business = value.data['articles'];
    print(business[0]['title']);
  }).catchError((error){
    print(error.toString());
    emit(NewsGetBusinessErrorState());
  });
}
}