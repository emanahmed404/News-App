import 'package:dailynews/layout/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modules/businessnews.dart';
import '../modules/sciencenews.dart';
import '../modules/sportsnews.dart';
import '../shared/network/remote/cachehelper.dart';
import '../shared/network/remote/diohelper.dart';

class NewsCubit extends Cubit<NewsAppStates>{

  NewsCubit() : super(AppNewsInitialState());
  static NewsCubit get(context) =>BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems =
  [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business ',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(Icons.settings),
    //   label: 'Settings',
    // ),
  ];

  List<Widget> screens =[
    BusinessNews(),
    SportsNews(),
    ScienceNews(),
    // SettingsScreen(),
  ];





  bool isDark =false ;
  void changeMode ({bool? fromShared}){
    if((fromShared) != null){
      isDark=fromShared;
      emit(ChaneModeState());
    }
    else {
      isDark =!isDark ;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) =>
          emit(ChaneModeState()) );
    }

  }





  void changeBottomNavBar(int index){
    currentIndex=index ;
    emit(NewsBottomNavBarStates());
  }

  List<dynamic> business =[];
  void getBusiness (){
    emit(NewsGetBusinessDataLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country' : 'eg',
          'category' : 'business',
          'apiKey' : 'c81f973e7faf471d83d516843db173c0'
        }
    ).then((value)
    {
      business =value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessDataSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessDataErrorState(error));
    });
  }

  //sports
  List<dynamic> sports =[];
  void getsports (){
    emit(NewsGetSportsDataSuccessState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country' : 'eg',
          'category' : 'sports',
          'apiKey' : 'c81f973e7faf471d83d516843db173c0'
        }
    ).then((value)
    {
      sports =value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsDataSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportsDataErrorState(error.toString()));
    });
  }

  //SCIENCE
  List<dynamic> science =[];
  void getscience (){
    emit(NewsGetsciencesDataLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country' : 'eg',
          'category' : 'science',
          'apiKey' : 'c81f973e7faf471d83d516843db173c0'
        }
    ).then((value)
    {
      science =value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetscienceDataSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsGetscienceDataErrorState(error.toString()));
    });
  }



  //search
  List<dynamic> search =[];
  void getSearch(String? value){
    emit(NewsGetSearchDataLoadingState());
    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q' : '$value',
          'apiKey' : 'c81f973e7faf471d83d516843db173c0'
        }
    ).then((value)
    {
      search =value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchDataSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchDataErrorState(error.toString()));
    });

    search=[];
  }




}