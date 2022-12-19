import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfW;
import 'package:printing/printing.dart';

class PrintToPDF extends StatelessWidget {
  final List<dynamic> toPrint;
  const PrintToPDF({Key? key, required this.toPrint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Printing.layoutPdf(
      format:   PdfPageFormat.a4,
      onLayout: ( PdfPageFormat format ) async {
        final pdfW.Document pdf = pdfW.Document();

        for(var it in toPrint){
          pdf.addPage(
          pdfW.Page(
            pageFormat: format,
            build:      (pdfW.Context context) {
              return pdfW.Center( child: it );
            },
          ),
        );
        }
        

        final file = File("example.pdf");
         file.writeAsBytes(await pdf.save());
        return pdf.save();
      },
    );
  
    return Container();
    //https://blog.logrocket.com/how-create-pdfs-flutter/
  }
}