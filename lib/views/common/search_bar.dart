import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Expanded(
        child: TextField(
          style: TextStyle(
            fontSize: 15.0,
          ),
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            hintText: "Find your product. Body shop",
            hintStyle: TextStyle(color: Colors.grey[500]),
            constraints: BoxConstraints.expand(height: 45.0),
            prefixIcon: Icon(Icons.search),
            fillColor: Colors.grey[200],
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0),
                borderSide: BorderSide.none),
          ),
        ),
      ),
      SizedBox(
        width: 20,
      ),
      SizedBox(
        width: 40.0,
        height: 40,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black87),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              )),
              padding: MaterialStateProperty.all(EdgeInsets.zero)),
          child: Icon(
            Icons.sort_sharp,
            size: 30.0,
          ),
        ),
      ),
    ]);
  }
}
