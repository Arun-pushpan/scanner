import 'dart:io';

import 'package:card_new/card_view.dart';
import 'package:card_new/save_card.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class CardScanner extends StatefulWidget {
  const CardScanner({Key? key}) : super(key: key);

  @override
  State<CardScanner> createState() => _CardScannerState();
}

class _CardScannerState extends State<CardScanner> {
  late Size size;
  bool textScanning = false;
  XFile? imageFile;
  String scannedText = "";

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
      body: Center(
          child: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (textScanning) const CircularProgressIndicator(),
                    if (!textScanning && imageFile == null)
                      SizedBox(height: 40,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.9,

                        height: MediaQuery.of(context).size.height*0.3,
                       // color: Colors.grey[300]!,
                        decoration: BoxDecoration(
                          color:  Color(0XFF273443),
                          border: Border.all(
                            color: Color(0xff1EBEA5),
                            width: 3,
                          )
                        )
                      ),
                   // if (imageFile != null) Image.file(File(imageFile!.path)),
                    SizedBox(height: 200,),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //
                           Container(
                             height: 80,
                                  width: 80,
                                  // color: Color(0xff273443),
                                  decoration: ShapeDecoration(
                                    shape: CircleBorder(
                                      side: BorderSide(
                                        width: 3,color: Color(0xff1EBEA5),
                                      )
                                    ),
                                  ),

                                  child:
                                      IconButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context)=>CardView()));
                                         // getImage(ImageSource.camera);
                                        },
                                        icon: Icon(Icons.qr_code_scanner,
                                          color: Color(0xff1EBEA5),size: 50,),
                                      ),
                                ),

                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                   if (imageFile != null) Image.file(File(imageFile!.path)),
                   SizedBox(height: 30,),
                    Container(
                      child: Text(
                        scannedText,
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                )),
          )),
    );
  }

   getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        setState(() {});
        getRecognisedText(pickedImage);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText = "Error occured while scanning";
      setState(() {});
    }
  }

  void getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = scannedText + line.text + "\n";
      }
    }
    textScanning = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }
}

