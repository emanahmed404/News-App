import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/cubit.dart';
import '../../layout/states.dart';
import '../../shared/components/buildNewsItem.dart';
import '../../shared/components/defaultFormField.dart';

class searchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsAppStates>(
      listener: (context,states){},
      builder: (context,states){
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    lable: 'Search',
                    prefix: Icons.search,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'search about what ?!!!';
                      } else
                        return null;
                    },
                    onChange: (value){
                      NewsCubit.get(context).getSearch(value);
                    }


                ),
              ),
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder:(context,index)=>buildNewsItem(NewsCubit.get(context).search[index],context) ,
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
                  itemCount:NewsCubit.get(context).search.length ,
                ),
              ),
            ],
          ),

        );
      },
    );
  }
}
