import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_scanner/result_screen.dart';

const bgColor = Color(0xfffafafa);

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  bool isScanCompleted = false;
  bool isFlashOn = false;
  bool isFrontCamera = false;
  MobileScannerController controller = MobileScannerController();
  // create a method
  void closeScreen(){
    isScanCompleted = false;
  }
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      backgroundColor: bgColor,
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            setState(() {
              isFlashOn = !isFlashOn;
            });
           controller.toggleTorch();
          }, icon: Icon(Icons.flash_on,color:isFlashOn? Colors.blue: Colors.grey,)),
          IconButton(onPressed: (){
            setState(() {
              isFrontCamera = !isFrontCamera;
            });
           controller.switchCamera();
          }, icon: Icon(Icons.camera_front,color: isFrontCamera? Colors.blue: Colors.grey,))
          ],
        iconTheme: IconThemeData(color: Colors.black87),
        centerTitle: true,
        title: Text("QR Scanner",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,letterSpacing: 1),),
      ),
      body: Container(
        width:double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(children: [
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("Place the QR code",style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.bold,letterSpacing: 1),),
            SizedBox(height: 10,),
            Text("Scanning will be started autometically",
            style: TextStyle(color: Colors.black54,fontSize: 16,),),
            ],)),
            // qr scanner        =======>>>>>>>>>>
          Expanded(
            flex: 4,
            child: Stack(children: [
              MobileScanner(
                controller: controller,
              allowDuplicates: true,
              onDetect: (barcode, args) {
                if(!isScanCompleted){
                  String code = barcode.rawValue ?? '...';
                  isScanCompleted = true;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen(closeScreen: closeScreen,code: code,)));
                }
               },
            ),

     
           
            ],)
            ),
          Expanded(child: Container(
           alignment: Alignment.center,
           child: Text("Developed by Deepak Bharti",style: TextStyle(color: Colors.black87,fontSize: 14,letterSpacing: 1),),
            )),
            
        ],),
      ),
    );
  }


  
}

