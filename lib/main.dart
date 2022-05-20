
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:comp2/pages/page.dart';

import 'models/product_model.dart';
import 'models/products.dart';
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SLpage>(create: (BuildContext context) => SLpage()),
        ChangeNotifierProvider<Products>(create: (BuildContext context) => Products()),
        ChangeNotifierProvider<ProductModel>(create: (BuildContext context) => ProductModel()),


      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: Provider.of<SLpage>(context).Login,
        home: CommonPage(),
      ),
    );
  }
}


class CommonPage extends StatefulWidget {
  const CommonPage({Key? key}) : super(key: key);

  @override
  _CommonPageState createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPage> {

  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(

      body: Provider.of<SLpage>(context).Login,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: height * 0.2,
        centerTitle: true,
        title: SwitchListTile(
          activeColor: Colors.blueGrey,
          autofocus: false,
          title: Provider.of<SLpage>(context).isLogin?
          Text("SignIn", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),):
          Text("SingUp",  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          onChanged: (_){
            Provider.of<SLpage>(context, listen: false).toggleLogin();
          },
          value: Provider.of<SLpage>(context).isLogin,
        ),
      ),

    );

  }
}


