import 'package:flutter/material.dart';
import 'package:shopress/wordpress/models/product_category.dart';
import 'package:shopress/wordpress/wordpress.dart';

class CategoriesBarWidget extends StatelessWidget {
  const CategoriesBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> CategoriesNames = [
      "Body",
      "Nail",
      "Face",
      "Hair",
      "Body",
      "Name"
    ];
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 70,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Text("All Categories"),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          FutureBuilder<List<ProductCategory>?>(
            future: WordPress.products().categories(),
            builder: (context, snapshot) {
              return Container(
                height: 30,
                child: (snapshot.hasData)
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            (snapshot.data as List<ProductCategory>).length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                right: index ==
                                        (snapshot.data as List<ProductCategory>)
                                                .length -
                                            1
                                    ? 0
                                    : 10),
                            height: 20,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 0)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                )),
                                backgroundColor: MaterialStateProperty.all(
                                    index == 0 ? Colors.black : Colors.white),
                              ),
                              child: Text(
                                (snapshot.data as List<ProductCategory>)[index]
                                    .name,
                                style: TextStyle(
                                  color:
                                      index == 0 ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : Text("Loading"),
              );
            },
          ),
        ],
      ),
    );
  }
}
