import 'package:flutter/material.dart';
import 'package:news_app/ui/home/categories/category.dart';
import 'package:news_app/ui/home/categories/category_widget.dart';


typedef OnCategoryClick =void Function(Category category);
class CategoriesFragment extends StatelessWidget {
  OnCategoryClick onCategoryClick;
  CategoriesFragment(this.onCategoryClick,{super.key});
  List<Category> categories = Category.getAllCategories();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('''Pick your category\nof interest''',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24
          ),),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 20),
                itemBuilder: (context, index) =>  InkWell(
                  onTap: (){
                    onCategoryClick(categories[index]);
                  },
                    child: CategoryItem(categories[index], index)),
            itemCount: categories.length,),
          )

        ],
      ),
    );
  }
}
