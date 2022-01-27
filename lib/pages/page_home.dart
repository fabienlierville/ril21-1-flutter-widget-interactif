import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  //TextField
  String? email;
  bool obscureText = true;
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
                suffixIcon: IconButton(
                   icon:(obscureText) ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                  onPressed: (){
                     setState(() {
                       obscureText = !obscureText;
                     });
                  },
                )
              ),
              onChanged: (String value){
                setState(() {
                  email = value;
                });
              },
              keyboardType: TextInputType.emailAddress,
              obscureText: obscureText,
            ),
            Text("Votre mail est ${email}")
          ],
        ),
      )
    );
  }
}
