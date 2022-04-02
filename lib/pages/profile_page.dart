import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(

      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.blueAccent.shade100],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.5, 0.9],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text("20/02/2022", style: TextStyle(color: Colors.white, fontSize: 20),),
                    ),
                  ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      minRadius: 50.0,
                      child: Icon(Icons.person,
                      size: 60,)
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Name Surname',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Address',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height*0.01,),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: ProfileButton(title: 'Change My Information',),
         ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProfileButton(title: 'My Credit Cards',),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProfileButton(title: 'Change Location',),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProfileButton(title: 'Change Language',),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProfileButton(title: 'Help',),
          )
        ],
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  ProfileButton({
    Key? key, required this.title
  }) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialButton(
      minWidth: 30,
      height: height*0.08 ,
      color: Colors.blueAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))
        ),
      child: Text(title, style: TextStyle(color: Colors.white, fontSize: 18),),
        onPressed: (){});
  }
}
