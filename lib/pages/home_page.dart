import 'package:flutter/material.dart';
import 'package:read_otomatis/Login/login_screen.dart';
import 'package:read_otomatis/pages/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: (){}, icon: icon),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
              icon: Icon(Icons.logout_outlined))
        ],
        title: Center(
          child: Text('eaaa'.toUpperCase()),
        ),
      ),
      body: Center(
          child: FutureBuilder(
            future: ApiService(
                    apiUrl:
                        'https://script.google.com/macros/s/AKfycbxTAGRDPtaXoAZlnkjU-ZDM7AcE1PZCPwva3jz4pppW482HZpiRfGyR5kH7cb_DqrFfng/exec')
                .fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                MyData data = snapshot.data as MyData;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Name: ${data.name}'),
                    Text('Type: ${data.type}'),
                    Text('Color: ${data.color}'),
                    Text('Shop: ${data.shop}'),
                    Text('Size: ${data.size}'),
                    Text('Transaction ID: ${data.transaction}'),
                    Text('Quantity: ${data.quantity}'),
                    Text('Price: ${data.price}'),
                    Text('Processing time: ${data.processing}'),
                    Text('Buyer Data: ${data.buyer}'),
                    Text('Email: ${data.emails}'),
                  ],
                );
              }
            },
          ),
        ),
      );
  }
   
  }

