import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'checkout_page.dart';
import 'home_page.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String image;
  final String desc;
  final int price;
  final String category;
  final double ratings;
  final int reviewer;
  final int sold;

  String total = "";

  DetailPage({
    Key? key,
    required this.name,
    required this.image,
    required this.desc,
    required this.price,
    required this.category,
    required this.ratings,
    required this.reviewer,
    required this.sold,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.network(image, width: 500,),
              //SizedBox(height: 16,),
              Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
              SizedBox(height: 16,),
              Text("Description : ${desc}", style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 16,),
              Text(" "),
              Text("Price : Rp.${price}", style: TextStyle(fontWeight: FontWeight.bold),),
              Text(" "),
              Text("Ratings : ${ratings}"),
              Text(" "),
              Text("Reviewer : ${reviewer}"),
              Text(" "),
              Text("Sold : ${sold}"),
              SizedBox(height: 100,),

              _totalField(),
              _checkoutButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _totalField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value){
          total = value;
        },
        decoration: InputDecoration(
          hintText: 'Amount of Product',
          contentPadding: const EdgeInsets.all(8.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }

  Widget _checkoutButton(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          int total2 = int.parse(total);
          int checkout = total2 * price;

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) { return CheckoutPage(name: this.name, total2: total2, checkout: checkout); }));
        },
        child: const Text('Checkout'),
        ),
      );
  }
}
