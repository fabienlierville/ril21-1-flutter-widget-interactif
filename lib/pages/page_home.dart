import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  //TextField
  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets Interactifs"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Entrez votre Email",
                hintText: "test@test.com",
                suffixIcon: Icon(Icons.remove_red_eye)
              ),
              onChanged: (String value){
                setState(() {
                  email = value;
                });
              },
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
            ),
            Text("Votre mail est ${email}")
          ],
        ),
      )
    );
  }
}
