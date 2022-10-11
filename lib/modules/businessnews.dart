import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../layout/cubit.dart';
import '../layout/states.dart';
import '../shared/components/buildNewsItem.dart';
import '../shared/components/components.dart';



class BusinessNews extends StatelessWidget {
  const BusinessNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsAppStates>(
      listener:(context,state)=>{} ,
      builder:(context,state){
        return ConditionalBuilder(
          condition:state is! NewsGetBusinessDataLoadingState ,
          builder: (context)=>ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder:(context,index)=>buildNewsItem(NewsCubit.get(context).business[index],context) ,
            separatorBuilder: (context,index)=>Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            itemCount:NewsCubit.get(context).business.length ,
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator(color: Colors.deepOrange,))
      );
      } ,

    );

  }
}
