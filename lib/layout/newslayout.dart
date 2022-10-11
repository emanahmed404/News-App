import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modules/search/search.dart';
import '../shared/components/components.dart';
import 'cubit.dart';


class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: Icon(
            Icons.newspaper_sharp,
            size: 35,
          ),
        ),
        title: Text('News'),
        actions: [
          IconButton(
              onPressed: () {
                navigateto(context, searchScreen());
              },
              icon: Icon(
                Icons.search,
              )),
          IconButton(
              onPressed: () {
                NewsCubit.get(context).changeMode();
              },
              icon: Icon(
                Icons.brightness_4_outlined,
              )),
        ],
      ),
      body: NewsCubit.get(context).screens[NewsCubit.get(context).currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: NewsCubit.get(context).bottomItems,
        currentIndex: NewsCubit.get(context).currentIndex,
        onTap: (index) {
          NewsCubit.get(context).changeBottomNavBar(index);
        },
      ),
    );
  }
}
