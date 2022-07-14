import 'dart:io' as io;
import 'dart:html' as html;

import 'dart:convert';
import 'dart:isolate';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart ' as pw;
import 'package:screenshot/screenshot.dart';
import 'package:universal_html/html.dart';

import '../bloc/state_manager_bloc.dart';
//import 'package:image/image.dart';
/*
https://pub.dev/packages/image
https://flutteragency.com/how-to-save-image-file-in-flutter/
https://stackoverflow.com/questions/62091269/how-to-convert-image-to-pdf-using-flutter
https://camposha.info/flutter/flutter-image-to-pdf/#gsc.tab=0
https://www.youtube.com/watch?v=rABnaF-Xk3E
https://help.syncfusion.com/flutter/pdf/getting-started
https://maneesha-erandi.medium.com/pdf-creation-with-flutter-bac7e2753b89
https://stackoverflow.com/questions/64725938/how-to-convert-a-whole-flutter-screen-to-pdf
https://blog.logrocket.com/how-create-pdfs-flutter/
https://www.autoscripts.net/rendering-a-canvas-to-an-image-in-a-way-that-doesnt-lock-up-flutter-ui/
https://maneesha-erandi.medium.com/pdf-creation-with-flutter-bac7e2753b89
https://stackoverflow.com/questions/54861467/unsupported-operation-namespace-while-using-dart-io-on-web
 */
class PDFCreator /*extends StatelessWidget*/{

  final                      pdf                  = pw.Document();
  final ScreenshotController screenShotController;
  final List<Widget>         childToImage;

  PDFCreator({/*super.key,*/ required this.childToImage, required this.screenShotController});

  /*@override
  Widget build(BuildContext context) {

    waiter();
    return Container();
  }*/


  Future<bool> creator( ) async {
    for( var it in childToImage){
      if(it.runtimeType != SizedBox)
      {Uint8List imageWidget = await pictureMaker(it);
      addPage(imageWidget);}
    }
    return downloadFileV2( pdf );
  }

  Future<Uint8List> pictureMaker(Widget widgetToImage) async {

    /*final mdq = Builder(builder: (context) => MediaQuery(data: MediaQueryData(size: Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height)), child: widgetToImage));
    final Widget mmmm = Container(
      child: mdq,
    );*/
    /*
    final mdq =ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 0,
                        minHeight: 0,
                        maxWidth: 700,
                        maxHeight: 7000,
                      ),
                      child: widgetToImage);
*/
    final Uint8List image = await screenShotController.captureFromWidget( Material(child: SizedBox(width: 660, child: widgetToImage)) );
    final Uint8List imageUint8List = image.buffer.asUint8List(image.offsetInBytes, image.lengthInBytes);

    return imageUint8List;
  }

/*
/*
  print("picture saved");
    final toPDFimage = pw.MemoryImage(
      File('assets/pdf/widgetShot.png').readAsBytesSync(),
    );
*/
    //await File('assets/pdf/widgetShot.png').writeAsBytes(image);


    ////addPage(imageUint8List);
    

    //    ByteData? byteData = await image.toByteData();
    //Uint8List pngBytes = byteData!.buffer.asUint8List();

    //final File imageFile = await ImagePicker.pickImage(source: imageSource);

    //final File newImage = await imageFile.copy('assets/widgetShot.png');
  /*
      final mmm = pw.MemoryImage(
      File('test.webp').readAsBytesSync(),
      );

      final pw.ImageProvider imp = pw.ImageProvider();
      final nn = pw.Image( imp );
*/
  }
*/
  void addPage(Uint8List im) async {

    final image = pw.MemoryImage(im
      //File('assets/pdf/widgetShot.png').readAsBytesSync(),
    );
    const double inch = 72.0;
    const double cm = inch / 2.54;

    pdf.addPage(
      pw.Page(
        pageFormat: const PdfPageFormat(21.0 * cm, 29.7 * cm, marginAll: 1.5 * cm),
        //pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Expanded(
            child: pw.Image(image),
          );
        }
      )
    ); 

    //final file = io.File("example.pdf");
    //await file.writeAsBytes(await pdf.save());
    //print("pdf saved");
    
  }

/*
https://stackoverflow.com/questions/59783344/flutter-web-download-option/60614367#60614367
https://stackoverflow.com/questions/70988967/about-pdf-file-opening-and-downloading-flutter-web-in-web-hosting
 */
  void downloadFile(pw.Document file) {

    

  //final rawData = file.readAsBytesSync();
  //final content = base64Encode(rawData);
  final anchor = html.AnchorElement(
      href: "data:application/octet-stream,$file")
    ..setAttribute("download", "file.pdf")
    ..click();
}




//https://stackoverflow.com/questions/70988967/about-pdf-file-opening-and-downloading-flutter-web-in-web-hosting
  //Future<Map<bool, dynamic>> 
  Future<bool> downloadFileV2( pw.Document file ) async{
    ByteData  bytesLocal; 
    Blob blob;
    try {
      bytesLocal = await rootBundle.load('assets/pdf/cv.pdf');
      blob = html.Blob([bytesLocal], 'application/pdf');
    } 
    catch (e) {
      Uint8List bytes = await file.save();
      blob = html.Blob([bytes], 'application/pdf');
    }
    
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.window.open(url, "_blank");
    html.Url.revokeObjectUrl(url);

    return true;
  }
}
