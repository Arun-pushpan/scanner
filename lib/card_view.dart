import 'package:card_new/save_card.dart';
import 'package:flutter/material.dart';
class CardView extends StatefulWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Color(0XFF273443),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, color: Colors.white,),
        backgroundColor: Color(0XFF273443),
        title: Text("Card Scanner", style: TextStyle(fontSize: 18,
            fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Acontainer(),
            SizedBox(height: 20,),
            Bbutton(),
          ],
        ),

      ),
    );
  }
  Widget Acontainer() {
    return  Container(
      height: MediaQuery.of(context).size.height*0.3,
      width: MediaQuery.of(context).size.width*0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade50
      ),
    );
  }
  Widget Bbutton(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff1EBEA5),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
            ),
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text("Try again")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff1EBEA5),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SaveCard()));
            },
            child: Text("  Next  ")),
      ],
    );
  }
}
