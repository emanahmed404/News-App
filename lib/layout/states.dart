abstract class NewsAppStates{}

class AppNewsInitialState extends NewsAppStates{}
//NewsBottomNavBarStates
class NewsBottomNavBarStates extends NewsAppStates{}

class NewsGetBusinessDataLoadingState extends NewsAppStates{}
class NewsGetBusinessDataSuccessState extends NewsAppStates{}
class NewsGetBusinessDataErrorState extends NewsAppStates{
    late String error ;
    NewsGetBusinessDataErrorState(this.error);
}

//sports
class NewsGetSportsDataLoadingState extends NewsAppStates{}
class NewsGetSportsDataSuccessState extends NewsAppStates{}
class NewsGetSportsDataErrorState extends NewsAppStates{
    late String error ;
    NewsGetSportsDataErrorState(this.error);
}

//science
class NewsGetsciencesDataLoadingState extends NewsAppStates{}
class NewsGetscienceDataSuccessState extends NewsAppStates{}
class NewsGetscienceDataErrorState extends NewsAppStates{
    late String error ;
    NewsGetscienceDataErrorState(this.error);
}


//science
class NewsGetSearchDataLoadingState extends NewsAppStates{}
class NewsGetSearchDataSuccessState extends NewsAppStates{}
class NewsGetSearchDataErrorState extends NewsAppStates{
    late String error ;
    NewsGetSearchDataErrorState(this.error);
}

class ChaneModeState extends NewsAppStates{}