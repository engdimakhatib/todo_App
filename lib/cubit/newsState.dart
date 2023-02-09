abstract class NewsState{}

class NewsInitialState extends  NewsState{}

class NewsBottomNavState extends NewsState{}

class NewsGetBusinessLoadingState extends NewsState{}

class NewsGetBusinessSuccessState extends NewsState{}

class NewsGetBusinessErrorState extends NewsState
{
  final String error;
  NewsGetBusinessErrorState(this.error);
}
class NewsGetSportsLoadingState extends NewsState{}

class NewsGetSportsSuccessState extends NewsState{}

class NewsGetSportsErrorState extends NewsState
{
  final String error;
  NewsGetSportsErrorState(this.error);
}
class NewsGetSettingsLoadingState extends NewsState{}

class NewsGetSettingsSuccessState extends NewsState{}

class NewsGetSettingsErrorState extends NewsState
{
  final String error;
  NewsGetSettingsErrorState(this.error);
}
class NewsGetSiencesLoadingState extends NewsState{}

class NewsGetSiencesSuccessState extends NewsState{}

class NewsGetSiencesErrorState extends NewsState
{
  final String error;
  NewsGetSiencesErrorState(this.error);
}
class AppChangeModeState extends  NewsState{}

class NewsGetSearchLoadingState extends NewsState{}

class NewsGetSearchSuccessState extends NewsState{}

class NewsGetSearchErrorState extends NewsState
{
  final String error;
  NewsGetSiencesErrorState(this.error);
}