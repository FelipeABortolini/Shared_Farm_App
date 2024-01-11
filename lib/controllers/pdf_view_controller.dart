import 'package:flutter/material.dart';

class PdfViewerController extends ChangeNotifier {
  String pdfViewerPath = '';

  void setPdfViewerPath(String state) {
    pdfViewerPath = state;
    notifyListeners();
  }
}
