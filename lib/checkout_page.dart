import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'home_page.dart';

class CheckoutPage extends StatelessWidget {
  final String name;
  final int total2;
  final int checkout;

  String total = "";

  CheckoutPage({
    required this.checkout,
    required this.name,
    required this.total2,
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text("Terima kasih sudah memesan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
              SizedBox(height: 16,),
              Text(" "),
              Text("Produk : ${name}"),
              Text(" "),
              Text("Amount : ${total2}"),
              Text(" "),
              Text("Price : ${checkout}"),
              SizedBox(height: 100,),

              _homeButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _homeButton(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) { return HomePage(username: '',); }));
        },
        child: const Text('Kembali ke Home Page'),
      ),
    );
  }
}
