import 'package:flutter/material.dart';
import 'package:shopress/views/common/categories_bar.dart';
import 'package:shopress/views/common/product_list_item.dart';
import 'package:shopress/views/common/search_bar.dart';
import 'package:shopress/views/common/section_header.dart';
import 'package:shopress/views/pages/home/home_slider.dart';
import 'package:shopress/wordpress/models/product.dart';
import 'package:shopress/wordpress/wordpress.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String route = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Shopress",
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  ".store",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.notifications_none,
                  size: 22.0,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
        elevation: 0.7,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        iconSize: 30,
        selectedIconTheme: IconThemeData(color: Colors.black),
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(color: Colors.pink),
        unselectedFontSize: 14,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          if (index != 2) {
            return;
          }
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              context: context,
              builder: (context) {
                return Container(
                  height: 320,
                  child: Center(
                    child: Text('Hello From Bottom'),
                  ),
                );
              });
        },
        selectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: "Blog",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Account",
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBarWidget(),
              SizedBox(
                height: 25,
              ),
              HomeSliderWidget(),
              SizedBox(
                height: 15,
              ),
              CategoriesBarWidget(),
              SizedBox(
                height: 10,
              ),
              SectionHeaderWidget(
                  title: "New Arrivals", buttonText: "View All"),
              FutureBuilder<List<Product>?>(
                  future: WordPress.products().newest(5),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          for (Product item in snapshot.data as List<Product>)
                            ProductListItemWidget(product: item)
                        ],
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
              SizedBox(
                height: 10,
              ),
              SectionHeaderWidget(title: "Popular", buttonText: "View All"),
              FutureBuilder<List<Product>?>(
                  future: WordPress.products().popular(5),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          for (Product item in snapshot.data as List<Product>)
                            ProductListItemWidget(product: item)
                        ],
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
