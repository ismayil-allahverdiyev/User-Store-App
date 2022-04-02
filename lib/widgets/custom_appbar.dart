import 'package:comp2/pages/profile_page.dart';
import 'package:comp2/pages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
const Color customBackground = Color(0xffe6e6ec);
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              onSubmitted: (value){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                print(value);
              },
              decoration: InputDecoration(
                prefixIcon:IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                  },
                ),
                hintText: "Search",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none),
                fillColor: customBackground,
                filled: true,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            decoration: BoxDecoration(
              color: customBackground,
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: Center(
              child: IconButton(
                icon: IconButton( icon: Icon(Icons.person_outline),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                  },),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}