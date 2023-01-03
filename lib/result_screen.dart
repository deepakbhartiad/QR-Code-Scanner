import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ResultScreen extends StatelessWidget {
final String code;
final Function() closeScreen;

  const ResultScreen({super.key, required this.code, required this.closeScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
       appBar: AppBar(
        leading: IconButton(onPressed: (){
          closeScreen();
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black87,)),
        centerTitle: true,
        title: Text("QR Scanner",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,letterSpacing: 1),),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          // show qr code heare
          QrImage(data: code,size: 150,version: QrVersions.auto,),




           
         Text("Scanned Result",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.bold,letterSpacing: 1),),
      SizedBox(height: 10,),
      // showing this results

        Text(code,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black87,fontSize: 16,letterSpacing: 1),),
        SizedBox(height: 10,),
        SizedBox(
          width: MediaQuery.of(context).size.width-100,
          height:48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: (){
// data copy
Clipboard.setData(ClipboardData(text: code));

            }, child:   Text("Copy",style: TextStyle(fontSize: 16,letterSpacing: 1),),),
        )
        ]),
      ),
    );
  }
}