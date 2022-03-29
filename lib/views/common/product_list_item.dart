import 'package:flutter/material.dart';
import 'package:shopress/wordpress/models/product.dart';

class ProductListItemWidget extends StatelessWidget {
  const ProductListItemWidget({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            margin: EdgeInsets.only(right: 10),
            color: Colors.black,
            child: Image.network(
              (product.imageSource).toString(),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      product.name.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          padding: MaterialStateProperty.all(EdgeInsets.all(2)),
                          fixedSize: MaterialStateProperty.all(Size.square(30)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        child: Icon(Icons.add, size: 20),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "EGP",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      product.price.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber[700],
                        ),
                        Text("(" + product.averageRating.toString() + ")")
                      ],
                    ),
                    Container(
                      height: 20,
                      child: Row(
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.pink[200]),
                                elevation: MaterialStateProperty.all(0)),
                            onPressed: () {},
                            child: Text("15%"),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.purple[200]),
                                elevation: MaterialStateProperty.all(0),
                              ),
                              onPressed: () {},
                              child: Text("Hot Deal")),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
