import 'package:flutter/material.dart';

class HomeSliderWidget extends StatelessWidget {
  const HomeSliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> ImagesSlides = [
      "images/slide.png",
      "images/slide.png",
      "images/slide.png",
    ];
    return Container(
      height: 170.0,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                width: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.only(
                    right: index == ImagesSlides.length - 1 ? 0 : 20),
                child: Image.asset(
                  ImagesSlides[index],
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                  height: 240,
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Summer Offers",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Get discount 50%",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ))
            ],
          );
        },
      ),
    );
  }
}
