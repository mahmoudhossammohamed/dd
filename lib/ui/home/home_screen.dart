import 'package:flutter/material.dart';
import 'package:news_app/ui/home/categories/categories_fragment.dart';
import 'package:news_app/ui/home/categories/category.dart';
import 'package:news_app/ui/home/categoryDetails/category_details.dart';
import 'package:news_app/ui/home/home_drawer.dart';
import 'package:news_app/ui/home/settings/settings_fragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homescreen';
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidgt = CategoriesFragment(onCategoryItemClick);
  }
  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/images/background_pattern.png'),
            fit: BoxFit.cover,
            )
          ),
        child: Scaffold(
          drawer: HomeDrawer(onMenuItemClick),
          appBar: AppBar(
            centerTitle: true,
            title: Text('News app'),
          ),
          body: selectedWidgt,
    ));
  }

  late Widget selectedWidgt  ;

  void onMenuItemClick(MenuItem item){
    Navigator.pop(context);
    switch(item){
      case MenuItem.categories: {
        selectedWidgt = CategoriesFragment(onCategoryItemClick);
    }
      case MenuItem.settings: {
        selectedWidgt = SettingsFragment();
    }
    }
    setState(() {

    });
  }

  void onCategoryItemClick(Category category){
    selectedWidgt = CategoryDetails(category);
    setState(() {});
  }
}
