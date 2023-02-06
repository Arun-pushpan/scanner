import 'package:flutter/material.dart';
class SaveCard extends StatefulWidget {
  const SaveCard( {Key? key}) : super(key: key);

  @override
  State<SaveCard> createState() => _SaveCardState();
}

class _SaveCardState extends State<SaveCard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF273443),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios,
          size: 30,color: Colors.black,),),
        backgroundColor: Color(0XFF273443),
        title: Text(" Save Card ", style: TextStyle(fontSize: 18,
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
                  SizedBox(height: 40,),
                  Ccontainer(),
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Tbutton(sicon: Icons.close),
                      Tbutton(sicon: Icons.download),
                    ],
                  )
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

            },
            child: Text("Edit")),
      ],
    );
  }
  Widget Ccontainer(){
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.3,
            // color: Colors.grey[300]!,
            decoration: BoxDecoration(
                color:  Color(0XFF273443),
                border: Border.all(
                  color: Color(0xff545479),
                  width: 3,
                )
            ),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff1EBEA5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                  ),
                  onPressed: (){

                  },
                  child: Text("Save Details")),
                SizedBox(height: 20,),
            ],
          ),
        ),
      ],
    );
  }
}
class Tbutton extends StatelessWidget {
  final IconData sicon;
  const Tbutton({Key? key,required this.sicon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xff1EBEA5),
      radius:30,
      child: IconButton(
        onPressed: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context)=>SaveCard()));
          // getImage(ImageSource.camera);
        },
        icon: Icon(sicon,color: Colors.white,
          size: 25,),
      ),
    );
  }
}
