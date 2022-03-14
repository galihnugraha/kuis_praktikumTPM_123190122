import 'package:flutter/material.dart';
import 'login_page.dart';
import 'detail_page.dart';

import 'model/menu.dart';

class HomePage extends StatefulWidget{
  final String username;
  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Menu Page"),
        actions: <Widget>[

          IconButton(icon: new Icon(Icons.logout, color: Colors.white), onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) {
                return LoginPage();
              }), (route) => false,
            );
          },),

        ],
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: _createListCard(),
      ),

    );
  }

  Widget _createListCard() {
    var dataMenu = getAllMenu();

    return ListView.separated(
      itemBuilder: (context, index) {
        return _createCard(dataMenu[index], context);
      },
      itemCount: dataMenu.length,
      separatorBuilder: (context, index) {
        return Container(
          color: Colors.grey,
          height: 1,
          margin: EdgeInsets.symmetric(vertical: 4),
        );
      },
    );
  }

  Widget _createCard(Menu data, BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailPage(name: data.name, image: data.image,  desc: data.desc, price: data.price, category: data.category, ratings: data.ratings, reviewer: data.reviewer, sold: data.sold);
          }));
        },
        child: Container(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.network(data.image),
              ),
              Expanded(
                flex: 3,
                child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Text(data.name)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}