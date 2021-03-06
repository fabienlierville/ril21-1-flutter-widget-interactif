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

  //CheckBox
  Map<String, bool> listCourse = {
    "Carottes": false,
    "Bananes": false,
    "Yaourt": false,
    "Pain": false,
  };
  //Radio
  TransportChoix transportChoix = TransportChoix.Avion;
  //Switch
  bool sondage = false;
  //Slider
  double perimetre = 0.0;
  //Date
  DateTime? dateNaissance;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("Widgets Interactifs"),
          ),
          body: Center(
            child: Column(
              children: [
                TextField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: "Entrez votre Email",
                      hintText: "test@test.com",
                      suffixIcon: IconButton(
                        icon: (obscureText) ? Icon(Icons.visibility_off) : Icon(
                            Icons.visibility),
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                      )
                  ),
                  onChanged: (String value) {
                    setState(() {
                      email = value;
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  obscureText: obscureText,
                ),
                Text("Votre mail est ${email}"),
                Container(
                  child: Column(
                    children: courses(),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      value: TransportChoix.Avion ,
                      onChanged: (TransportChoix? c){
                        setState(() {
                          transportChoix = c!;
                        });
                      },
                      groupValue: transportChoix,
                    ),
                    Text("Avion"),
                    Radio(
                      value: TransportChoix.Voiture ,
                      onChanged: (TransportChoix? c){
                        setState(() {
                          transportChoix = c!;
                        });
                      },
                      groupValue: transportChoix,
                    ),
                    Text("Voiture"),
                    Radio(
                      value: TransportChoix.Bateau ,
                      onChanged: (TransportChoix? c){
                        setState(() {
                          transportChoix = c!;
                        });
                      },
                      groupValue: transportChoix,
                    ),
                    Text("Bateau"),
                  ],
                ),
                Switch(
                    value: sondage,
                    onChanged: (bool b){
                      setState(() {
                        sondage = b;
                        print(sondage);
                      });
                    },
                  activeColor: Colors.green,
                  inactiveTrackColor: Colors.red,
                ),
                Text((sondage) ? "Pour" : "Contre"),
                RotatedBox(
                  quarterTurns: 0,
                  child:Slider(
                    value: perimetre,
                    onChanged: (double d){
                      setState(() {
                        perimetre = d;
                      });
                    },
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: perimetre.toString(),
                    activeColor: Colors.black45,
                    inactiveColor: Colors.pink,
                  ) ,
                ),
                Text("P??rim??tre = ${perimetre.toStringAsFixed(2)}"),
                Text("P??rim??tre = ${perimetre.toInt()}"),
                ElevatedButton(
                    onPressed: selectionDate,
                    child: Text("Choisir Date")
                ),
                Text("DateNAissance = ${dateNaissance}"),
                ElevatedButton(
                    onPressed: ()async{
                      DateTime? date = await selectionDate2();
                      if(date != null){
                        setState(() {
                          dateNaissance = date;
                        });
                      }
                    },
                    child: Text("Choisir Date 2 ")
                ),



              ],
            ),
          )
      ),
    );
  }

  // Carottes [] -> Row
  // Yaourt [] -> Row
  List<Row> courses() {
    List<Row> l = [];
    listCourse.forEach((aliment, panier) {
      Row r = Row(
        children: [
          Text(
            aliment, style:
          TextStyle(
              color: (panier) ? Colors.green : Colors.red,
            decoration: (panier) ? TextDecoration.lineThrough : TextDecoration.none
            ),

          ),
          Checkbox(
              value: panier,
              onChanged: (bool? b) {
                setState(() {
                  listCourse[aliment] = b!;
                });
              }
          ),
        ],
      );
      l.add(r);
    });
    return l;
  }


  Future<void> selectionDate() async{
    DateTime? datechoisie = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1983),
        lastDate: DateTime(2040),
      initialDatePickerMode: DatePickerMode.year
    );

    if(datechoisie != null){
      TimeOfDay? heure = await showTimePicker(
          context: context,
          initialTime: TimeOfDay(hour: 10, minute: 15)
      );

      if(heure != null){
        datechoisie = datechoisie.add(Duration(hours: heure.hour, minutes: heure.minute));
        setState(() {
          dateNaissance = datechoisie;
        });
      }


    }
  }

  Future<DateTime?> selectionDate2() async{
    DateTime? datechoisie = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1983),
        lastDate: DateTime(2040)
    );

    return datechoisie;
  }

}

enum TransportChoix{
  Voiture,
  Avion,
  Bateau
}