import 'dart:convert';
import 'dart:html';
import 'dart:io' as dartio;
import 'package:http/http.dart' show get;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:universal_io/io.dart' as uni;

import '../../../controllers/report/culture/culture_report_controller.dart';
import '../../../controllers/report/daily/daily_report_controller.dart';
import '../../../controllers/report/fill/fill_report_controller.dart';
import '../../../controllers/report/stock/stock_report_controller.dart';
import '../../culture/utils/kgInBag.dart';

class CreateReport {
  CreateReport();

  Future<dartio.File> generateReportFunction(
      String name,
      DailyReportController dailyReport,
      CultureReportController cultureReport,
      StockReportController stockReport,
      FillReportController fillReport,
      String dateStart,
      String dateEnd,
      bool fullHistory) async {
    final PdfDocument document = PdfDocument();

    final page = document.pages.add();

    if (uni.Platform.isAndroid) {
      final byteData = await rootBundle.load("assets/images/icon.png");

      final dPath = await getApplicationDocumentsDirectory();

      await dartio.File("${dPath.path}/icon.png").writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

      page.graphics.drawImage(
        PdfBitmap(dartio.File("${dPath.path}/icon.png").readAsBytesSync()),
        const Rect.fromLTWH(25, 10, 60, 60),
      );
    } else {
      var response = await get(
          Uri.parse("https://cdn-icons-png.flaticon.com/512/187/187039.png"));
      var data = response.bodyBytes;
      PdfBitmap image = PdfBitmap(data);

      page.graphics.drawImage(
        image,
        const Rect.fromLTWH(25, 10, 60, 60),
      );
    }

    dartio.File file = dartio.File("");

    if (name == "Relatório Diário") {
      page.graphics.drawString(
          'RELATÓRIO DIÁRIO',
          PdfStandardFont(PdfFontFamily.helvetica, 24,
              style: PdfFontStyle.bold),
          bounds: const Rect.fromLTWH(180, 25, 400, 50));

      page.graphics.drawString(
          'Data: ${dailyReport.date}',
          PdfStandardFont(PdfFontFamily.helvetica, 14,
              style: PdfFontStyle.regular),
          bounds: const Rect.fromLTWH(30, 85, 400, 50));

      String localsStr = "";
      for (var local in dailyReport.locals) {
        localsStr += "$local, ";
      }

      dailyReport.locals.length > 1
          ? page.graphics.drawString(
              'Locais: ${localsStr.substring(0, localsStr.length - 2)}',
              PdfStandardFont(PdfFontFamily.helvetica, 14,
                  style: PdfFontStyle.regular),
              bounds: const Rect.fromLTWH(30, 108, 500, 50))
          : page.graphics.drawString(
              'Local: ${localsStr.substring(0, localsStr.length - 2)}',
              PdfStandardFont(PdfFontFamily.helvetica, 14,
                  style: PdfFontStyle.regular),
              bounds: const Rect.fromLTWH(30, 108, 500, 50));

      page.graphics.drawString(
          'MOVIMENTAÇÕES DO DIA',
          PdfStandardFont(PdfFontFamily.helvetica, 18,
              style: PdfFontStyle.bold),
          bounds: const Rect.fromLTWH(155, 145, 400, 50));

      final PdfGrid grid = PdfGrid();

      grid.columns.add(count: 10);

      final PdfGridRow headerRow = grid.headers.add(1)[0];
      headerRow.cells[0].value = 'OPERAÇÃO';
      headerRow.cells[1].value = 'PRINCÍPIO ATIVO';
      headerRow.cells[2].value = 'PRODUTO';
      headerRow.cells[3].value = 'CULTURA / FASE';
      headerRow.cells[4].value = 'VEÍCULO';
      headerRow.cells[5].value = 'QUANTIDADE';
      headerRow.cells[6].value = 'QTD RESULTANTE';
      headerRow.cells[7].value = 'LOCAL';
      headerRow.cells[8].value = 'HORA';
      headerRow.cells[9].value = 'USUÁRIO';

      headerRow.style.font =
          PdfStandardFont(PdfFontFamily.helvetica, 6, style: PdfFontStyle.bold);
      headerRow.style.backgroundBrush = PdfBrushes.lightGreen;
      PdfGridRow row = PdfGridRow(grid);
      for (var register in dailyReport.table) {
        row = grid.rows.add();
        register.op == "in"
            ? row.cells[0].value = "Entrada ${register.id}"
            : row.cells[0].value = "Saída ${register.id}";
        register.activePrinciple == ""
            ? row.cells[1].value = "N/A"
            : row.cells[1].value = register.activePrinciple;
        row.cells[2].value = register.product.toUpperCase();
        register.culture == ""
            ? row.cells[3].value = "N/A"
            : row.cells[3].value = "${register.culture} / ${register.phase}";
        register.vehicle == ""
            ? row.cells[4].value = "N/A"
            : row.cells[5].value = "${register.vehicle} / ${register.plate}";
        row.cells[5].value =
            "${register.quantity.toString()} ${register.unity}";
        register.op == "in"
            ? "Estoque Central"
            : row.cells[6].value = "${register.newQtt} ${register.unity}";
        row.cells[7].value = register.local;
        register.op == "in"
            ? row.cells[8].value = "N/A"
            : row.cells[8].value = register.hour;
        row.cells[9].value = register.user;
      }
      grid.style.cellPadding = PdfPaddings(left: 5, top: 5);

      grid.draw(
          page: page,
          bounds: Rect.fromLTWH(
              0, 170, page.getClientSize().width, page.getClientSize().height));

      PdfForm form = document.form;
      form.flattenAllFields();

      if (uni.Platform.isAndroid) {
        file = await dartio.File(
                '${(await getApplicationSupportDirectory()).path}/${name}_${dailyReport.date.replaceAll("/", "_")}.pdf')
            .writeAsBytes(await document.save());
      } else {
        List<int> i = await document.save();
        AnchorElement(
            href:
                "data:aplication/octet-stream;charset=utf-16le;base64,${base64.encode(i)}")
          ..setAttribute("download",
              '${name}_${dailyReport.date.replaceAll("/", "_")}.pdf')
          ..click();
      }
    } else if (name == "Relatório de Cultura") {
      // ========================================================================================================
      page.graphics.drawString(
          'RELATÓRIO DE CULTURA',
          PdfStandardFont(PdfFontFamily.helvetica, 24,
              style: PdfFontStyle.bold),
          bounds: const Rect.fromLTWH(150, 25, 400, 50));

      double first = 85;
      double add = 22;
      bool hasColheita = false;

      PdfLayoutResult? gridCultureDraw;

      page.graphics.drawString(
          'Tipo: ${cultureReport.cultureType}',
          PdfStandardFont(PdfFontFamily.helvetica, 14,
              style: PdfFontStyle.regular),
          bounds: Rect.fromLTWH(30, first, 500, 50));

      page.graphics.drawString(
          'Nome: ${cultureReport.cultureName}',
          PdfStandardFont(PdfFontFamily.helvetica, 14,
              style: PdfFontStyle.regular),
          bounds: Rect.fromLTWH(30, first + add, 500, 50));

      page.graphics.drawString(
          'Local: ${cultureReport.local}',
          PdfStandardFont(PdfFontFamily.helvetica, 14,
              style: PdfFontStyle.regular),
          bounds: Rect.fromLTWH(30, first + 2 * add, 500, 50));

      page.graphics.drawString(
          'Data de Início: ${cultureReport.startDate}',
          PdfStandardFont(PdfFontFamily.helvetica, 14,
              style: PdfFontStyle.regular),
          bounds: Rect.fromLTWH(30, first + 3 * add, 500, 50));

      page.graphics.drawString(
          'Data de Término: ${cultureReport.endDate}',
          PdfStandardFont(PdfFontFamily.helvetica, 14,
              style: PdfFontStyle.regular),
          bounds: Rect.fromLTWH(30, first + 4 * add, 500, 50));

      page.graphics.drawString(
          'Total Líquido: ${cultureReport.totalKgNet} kg / ${cultureReport.totalBagsNet} scs',
          PdfStandardFont(PdfFontFamily.helvetica, 14,
              style: PdfFontStyle.regular),
          bounds: Rect.fromLTWH(30, first + 5 * add, 400, 50));

      page.graphics.drawString(
          'Total Classificado: ${cultureReport.totalKg} kg / ${cultureReport.totalBags} scs',
          PdfStandardFont(PdfFontFamily.helvetica, 14,
              style: PdfFontStyle.regular),
          bounds: Rect.fromLTWH(30, first + 6 * add, 400, 50));

      page.graphics.drawString(
          'Diferença: ${double.parse((((cultureReport.totalKgNet - cultureReport.totalKg) / cultureReport.totalKgNet) * 100).toStringAsFixed(2))} %',
          PdfStandardFont(PdfFontFamily.helvetica, 14,
              style: PdfFontStyle.regular),
          bounds: Rect.fromLTWH(30, first + 7 * add, 400, 50));

      final PdfGrid gridCulture = PdfGrid();

      gridCulture.columns.add(count: 8);

      final PdfGridRow headerRowIns = gridCulture.headers.add(1)[0];
      headerRowIns.cells[0].value = 'ID';
      headerRowIns.cells[1].value = 'FASE';
      headerRowIns.cells[2].value = 'PRINCÍPIO ATIVO';
      headerRowIns.cells[3].value = 'PRODUTO';
      headerRowIns.cells[4].value = 'QUANTIDADE';
      headerRowIns.cells[5].value = 'QTD RESULTANTE';
      headerRowIns.cells[6].value = 'DATA - HORA';
      headerRowIns.cells[7].value = 'USUÁRIO';

      headerRowIns.style.font =
          PdfStandardFont(PdfFontFamily.helvetica, 6, style: PdfFontStyle.bold);
      headerRowIns.style.backgroundBrush = PdfBrushes.lightGreen;
      PdfGridRow rowIns = PdfGridRow(gridCulture);
      for (var register in cultureReport.table) {
        for (var prod in register.prods) {
          rowIns = gridCulture.rows.add();
          rowIns.cells[0].value = prod.id.toString();
          rowIns.cells[1].value = register.phase;
          rowIns.cells[2].value = prod.activePrinciple;
          rowIns.cells[3].value = prod.product;
          rowIns.cells[4].value = "${prod.quantity.toString()} ${prod.unity}";
          rowIns.cells[5].value = "${prod.newQtt} ${prod.unity}";
          rowIns.cells[6].value = "${register.date} - ${register.hour}";
          rowIns.cells[7].value = register.user;
        }
      }

      page.graphics.drawString(
          'DADOS DA CULTURA',
          PdfStandardFont(PdfFontFamily.helvetica, 18,
              style: PdfFontStyle.bold),
          bounds: Rect.fromLTWH(170, first + 8 * add, 400, 50));

      gridCulture.style.cellPadding = PdfPaddings(left: 5, top: 5);

      gridCultureDraw = gridCulture.draw(
          page: page,
          bounds: Rect.fromLTWH(0, first + 8 * add + 25,
              page.getClientSize().width, page.getClientSize().height));

      PdfPage currentPage = page;
      if (gridCultureDraw != null) {
        currentPage = gridCultureDraw.page;
      }

      double spaceBetweenGrids = 0;
      double bottomIn = 0;
      double startColheita = 0;

      if (gridCultureDraw != null) {
        bottomIn = gridCultureDraw.bounds.bottom;
        spaceBetweenGrids = 50;
        startColheita = bottomIn + spaceBetweenGrids;
      }

      // ----------- COLHEITA -----------
      if (cultureReport.tableColheita.isNotEmpty) {
        final PdfGrid gridColheitaCulture = PdfGrid();

        gridColheitaCulture.columns.add(count: 9);

        final PdfGridRow headerRowColheita =
            gridColheitaCulture.headers.add(1)[0];
        headerRowColheita.cells[0].value = 'ID';
        // headerRowColheita.cells[1].value = 'QTD BRUTA';
        headerRowColheita.cells[1].value = 'QTD LÍQUIDA (KG/SCS)';
        headerRowColheita.cells[2].value = 'UMID / IMP / AVAR';
        headerRowColheita.cells[3].value = 'QTD CLASS. (KG/SCS)';
        headerRowColheita.cells[4].value = 'DIF. %';
        headerRowColheita.cells[5].value = 'VEÍCULO';
        headerRowColheita.cells[6].value = 'LOCAL DE ENTREGA';
        headerRowColheita.cells[7].value = 'DATA - HORA';
        headerRowColheita.cells[8].value = 'USUÁRIO';

        headerRowColheita.style.font = PdfStandardFont(
            PdfFontFamily.helvetica, 6,
            style: PdfFontStyle.bold);
        headerRowColheita.style.backgroundBrush = PdfBrushes.lightGreen;
        PdfGridRow rowColheita = PdfGridRow(gridColheitaCulture);

        for (var register in cultureReport.tableColheita) {
          rowColheita = gridColheitaCulture.rows.add();
          rowColheita.cells[0].value = register.id.toString();
          // rowColheita.cells[1].value = "${register.grossQuantity} KG";
          rowColheita.cells[1].value =
              "${register.netQuantityKg} KG / ${register.netQuantityBags} SCS";
          rowColheita.cells[3].value =
              "${register.classifiedQttKg} KG / ${register.classifiedQttBags} SCS";
          rowColheita.cells[4].value = "${register.difPerc} %";
          if (register.impurity == "" &&
              register.damaged == "" &&
              register.moisture == "") {
            rowColheita.cells[2].value = "N/A";
          } else {
            rowColheita.cells[2].value =
                "${register.moisture} KG / ${register.impurity} KG / ${register.damaged} KG";
          }

          rowColheita.cells[5].value =
              "${register.vehicle} / ${register.plate}";
          rowColheita.cells[6].value = register.localDelivery;
          rowColheita.cells[7].value = "${register.date} - ${register.hour}";
          rowColheita.cells[8].value = register.user;
        }

        if (startColheita + 200 < currentPage.size.height) {
          currentPage.graphics.drawString(
            'COLHEITAS',
            PdfStandardFont(PdfFontFamily.helvetica, 18,
                style: PdfFontStyle.bold),
            bounds: Rect.fromLTWH(210, startColheita, 400, 50),
          );
          gridColheitaCulture.style.cellPadding = PdfPaddings(left: 5, top: 5);
          gridColheitaCulture.draw(
            page: currentPage,
            bounds: Rect.fromLTWH(
                0,
                startColheita + 25,
                currentPage.getClientSize().width,
                currentPage.getClientSize().height),
          );
        } else {
          currentPage = document.pages.add();
          currentPage.graphics.drawString(
            'COLHEITAS',
            PdfStandardFont(PdfFontFamily.helvetica, 18,
                style: PdfFontStyle.bold),
            bounds: const Rect.fromLTWH(210, 0, 400, 50),
          );
          gridColheitaCulture.style.cellPadding = PdfPaddings(left: 5, top: 5);
          gridColheitaCulture.draw(
            page: currentPage,
            bounds: Rect.fromLTWH(0, 25, currentPage.getClientSize().width,
                currentPage.getClientSize().height),
          );
        }
      }

      PdfForm form = document.form;
      form.flattenAllFields();
      if (uni.Platform.isAndroid) {
        file = await dartio.File(
                '${(await getApplicationSupportDirectory()).path}/${name}_${cultureReport.cultureName.replaceAll("/", "_")}.pdf')
            .writeAsBytes(await document.save());
      } else {
        List<int> i = await document.save();
        AnchorElement(
            href:
                "data:aplication/octet-stream;charset=utf-16le;base64,${base64.encode(i)}")
          ..setAttribute("download",
              '${name}_${cultureReport.cultureName.replaceAll("/", "_")}.pdf')
          ..click();
      }
    } else if (name == "Relatório de Abastecimento") {
      String localsStr = "";
      for (var local in fillReport.locals) {
        localsStr += "$local, ";
      }

      page.graphics.drawString(
          // =================================================================================================================
          'RELATÓRIO DE ABASTECIMENTO',
          PdfStandardFont(PdfFontFamily.helvetica, 24,
              style: PdfFontStyle.bold),
          bounds: const Rect.fromLTWH(110, 25, 400, 50));

      fillReport.locals.length > 1
          ? page.graphics.drawString(
              'Locais: ${localsStr.substring(0, localsStr.length - 2)}',
              PdfStandardFont(PdfFontFamily.helvetica, 14,
                  style: PdfFontStyle.regular),
              bounds: const Rect.fromLTWH(30, 85, 500, 50))
          : page.graphics.drawString(
              'Local: ${localsStr.substring(0, localsStr.length - 2)}',
              PdfStandardFont(PdfFontFamily.helvetica, 14,
                  style: PdfFontStyle.regular),
              bounds: const Rect.fromLTWH(30, 85, 500, 50));

      double initIns = 185;

      bool noIns = false;
      if (fillReport.tableIns.isEmpty) {
        noIns = true;
      }

      bool noOuts = false;
      if (fillReport.table.isEmpty) {
        noOuts = true;
      }

      PdfLayoutResult? gridInsDraw;
      PdfLayoutResult? gridOutsDraw;

      double startIn = initIns;
      // ======================= INS =====================================

      if (!noIns && fillReport.tableIns.isNotEmpty) {
        page.graphics.drawString(
            'ENTRADAS',
            PdfStandardFont(PdfFontFamily.helvetica, 18,
                style: PdfFontStyle.bold),
            bounds: Rect.fromLTWH(210, initIns - 25, 400, 50));
        final PdfGrid gridIns = PdfGrid();

        gridIns.columns.add(count: 6);

        final PdfGridRow headerRowIns = gridIns.headers.add(1)[0];
        headerRowIns.cells[0].value = 'OPERAÇÃO';
        headerRowIns.cells[1].value = 'PRODUTO';
        headerRowIns.cells[2].value = 'QUANTIDADE';
        headerRowIns.cells[3].value = 'QTD RESULTANTE';
        headerRowIns.cells[4].value = 'LOCAL';
        headerRowIns.cells[5].value = 'DATA';

        headerRowIns.style.font = PdfStandardFont(PdfFontFamily.helvetica, 6,
            style: PdfFontStyle.bold);
        headerRowIns.style.backgroundBrush = PdfBrushes.lightGreen;
        PdfGridRow rowIns = PdfGridRow(gridIns);
        for (var register in fillReport.tableIns) {
          rowIns = gridIns.rows.add();
          rowIns.cells[0].value = "Entrada ${register.id}";
          rowIns.cells[1].value = "Diesel";
          rowIns.cells[2].value = "${register.quantity.toString()} L";
          rowIns.cells[3].value = "${register.newQtt} L";
          rowIns.cells[4].value = "Estoque Central";
          rowIns.cells[5].value = register.date;
        }
        gridIns.style.cellPadding = PdfPaddings(left: 5, top: 5);

        gridInsDraw = gridIns.draw(
            page: page,
            bounds: Rect.fromLTWH(0, initIns, page.getClientSize().width,
                page.getClientSize().height));
      }

      PdfPage currentPage = page;
      if (gridInsDraw != null) {
        currentPage = gridInsDraw.page;
      }

      double spaceBetweenGrids = 0;
      double bottomIn = 0;
      double startOut = 0;

      if (gridInsDraw != null && fillReport.tableIns.isNotEmpty) {
        bottomIn = gridInsDraw.bounds.bottom;
        spaceBetweenGrids = 50;
        startOut = bottomIn + spaceBetweenGrids;
      } else {
        startOut = startIn;
      }

      if (!noOuts && fillReport.table.isNotEmpty) {
        final PdfGrid gridFill = PdfGrid();

        gridFill.columns.add(count: 9);

        final PdfGridRow headerRow = gridFill.headers.add(1)[0];
        headerRow.cells[0].value = 'ID';
        headerRow.cells[1].value = 'PRODUTO';
        headerRow.cells[2].value = 'VEÍCULO';
        headerRow.cells[3].value = 'PLACA';
        headerRow.cells[4].value = 'QUANTIDADE';
        headerRow.cells[5].value = 'QTD RESULTANTE';
        headerRow.cells[6].value = 'DATA - HORA';
        headerRow.cells[7].value = 'LOCAL';
        headerRow.cells[8].value = 'USUÁRIO';

        headerRow.style.font = PdfStandardFont(PdfFontFamily.helvetica, 6,
            style: PdfFontStyle.bold);
        headerRow.style.backgroundBrush = PdfBrushes.lightGreen;
        PdfGridRow row = PdfGridRow(gridFill);
        for (var register in fillReport.table) {
          row = gridFill.rows.add();
          row.cells[0].value = register.id.toString();
          row.cells[1].value =
              "${register.product[0].toUpperCase()}${register.product.substring(1)}";
          row.cells[2].value = register.vehicle;
          row.cells[3].value = register.plate;
          row.cells[4].value = "${register.quantity.toString()} L";
          row.cells[5].value = "${register.newQtt} L";
          row.cells[6].value = "${register.date} - ${register.hour}";
          row.cells[7].value = register.local;
          row.cells[8].value = register.user;
        }
        gridFill.style.cellPadding = PdfPaddings(left: 5, top: 5);

        if (startOut + 150 < currentPage.size.height) {
          currentPage.graphics.drawString(
              'ABASTECIMENTOS',
              PdfStandardFont(PdfFontFamily.helvetica, 18,
                  style: PdfFontStyle.bold),
              bounds: Rect.fromLTWH(170, startOut, 400, 50));
          gridOutsDraw = gridFill.draw(
              page: currentPage,
              bounds: Rect.fromLTWH(
                  0,
                  startOut + 25,
                  currentPage.getClientSize().width,
                  currentPage.getClientSize().height));
        } else {
          currentPage = document.pages.add();
          currentPage.graphics.drawString(
              'ABASTECIMENTOS',
              PdfStandardFont(PdfFontFamily.helvetica, 18,
                  style: PdfFontStyle.bold),
              bounds: const Rect.fromLTWH(170, 0, 400, 50));
          gridOutsDraw = gridFill.draw(
              page: currentPage,
              bounds: Rect.fromLTWH(0, 25, currentPage.getClientSize().width,
                  currentPage.getClientSize().height));
        }
      }

      currentPage = page;
      if (gridOutsDraw != null) {
        currentPage = gridOutsDraw.page;
      }

      double startStock = 0;

      if (gridOutsDraw != null && fillReport.table.isNotEmpty) {
        bottomIn = gridOutsDraw.bounds.bottom;
        spaceBetweenGrids = 50;
        startStock = bottomIn + spaceBetweenGrids;
      } else {
        startStock = startOut;
      }

      if (startStock + 330 < currentPage.size.height) {
        fullHistory
            ? currentPage.graphics.drawString(
                'CONSUMO POR LOCAL - HISTÓRICO COMPLETO',
                PdfStandardFont(PdfFontFamily.helvetica, 18,
                    style: PdfFontStyle.bold),
                bounds: Rect.fromLTWH(30, startStock, 600, 50))
            : currentPage.graphics.drawString(
                'CONSUMO POR LOCAL $dateStart - $dateEnd',
                PdfStandardFont(PdfFontFamily.helvetica, 18,
                    style: PdfFontStyle.bold),
                bounds: Rect.fromLTWH(30, startStock, 600, 50));

        currentPage.graphics.drawString(
            'Santa Terezinha: ${fillReport.dieselSantaTerezinha} L',
            PdfStandardFont(PdfFontFamily.helvetica, 14,
                style: PdfFontStyle.regular),
            bounds: Rect.fromLTWH(30, startStock + 25, 500, 50));
        currentPage.graphics.drawString(
            'Real: ${fillReport.dieselReal} L',
            PdfStandardFont(PdfFontFamily.helvetica, 14,
                style: PdfFontStyle.regular),
            bounds: Rect.fromLTWH(30, startStock + 2 * 25, 500, 50));
        currentPage.graphics.drawString(
            'São João: ${fillReport.dieselSaoJoao} L',
            PdfStandardFont(PdfFontFamily.helvetica, 14,
                style: PdfFontStyle.regular),
            bounds: Rect.fromLTWH(30, startStock + 3 * 25, 500, 50));
        currentPage.graphics.drawString(
            'São Jorge: ${fillReport.dieselSaoJorge} L',
            PdfStandardFont(PdfFontFamily.helvetica, 14,
                style: PdfFontStyle.regular),
            bounds: Rect.fromLTWH(30, startStock + 4 * 25, 500, 50));
        currentPage.graphics.drawString(
            'Cruzeiro: ${fillReport.dieselCruzeiro} L',
            PdfStandardFont(PdfFontFamily.helvetica, 14,
                style: PdfFontStyle.regular),
            bounds: Rect.fromLTWH(30, startStock + 5 * 25, 500, 50));
        currentPage.graphics.drawString(
            'Campinho: ${fillReport.dieselCampinho} L',
            PdfStandardFont(PdfFontFamily.helvetica, 14,
                style: PdfFontStyle.regular),
            bounds: Rect.fromLTWH(30, startStock + 6 * 25, 500, 50));

        currentPage.graphics.drawString(
            'SALDO ATUAL DE DIESEL: ${fillReport.qtt} L',
            PdfStandardFont(PdfFontFamily.helvetica, 18,
                style: PdfFontStyle.bold),
            bounds: Rect.fromLTWH(30, startStock + 7 * 25, 400, 50));
        currentPage.graphics.drawString(
            'Central de abastecimento: ${fillReport.dieselCentral} L',
            PdfStandardFont(PdfFontFamily.helvetica, 14,
                style: PdfFontStyle.regular),
            bounds: Rect.fromLTWH(30, startStock + 8 * 25, 500, 50));
      } else {
        currentPage = document.pages.add();
        fullHistory
            ? currentPage.graphics.drawString(
                'CONSUMO POR LOCAL - HISTÓRICO COMPLETO',
                PdfStandardFont(PdfFontFamily.helvetica, 18,
                    style: PdfFontStyle.bold),
                bounds: const Rect.fromLTWH(30, 0, 600, 50))
            : currentPage.graphics.drawString(
                'CONSUMO POR LOCAL $dateStart - $dateEnd',
                PdfStandardFont(PdfFontFamily.helvetica, 18,
                    style: PdfFontStyle.bold),
                bounds: const Rect.fromLTWH(30, 0, 600, 50));

        // currentPage.graphics.drawString(
        //     'SALDOS DE DIESEL',
        //     PdfStandardFont(PdfFontFamily.helvetica, 18,
        //         style: PdfFontStyle.bold),
        //     bounds: const Rect.fromLTWH(30, 0, 0, 50));

        currentPage.graphics.drawString(
            'Santa Terezinha: ${fillReport.dieselSantaTerezinha} L',
            PdfStandardFont(PdfFontFamily.helvetica, 14,
                style: PdfFontStyle.regular),
            bounds: const Rect.fromLTWH(30, 25, 500, 50));
        currentPage.graphics.drawString(
            'Real: ${fillReport.dieselReal} L',
            PdfStandardFont(PdfFontFamily.helvetica, 14,
                style: PdfFontStyle.regular),
            bounds: const Rect.fromLTWH(30, 2 * 25, 500, 50));
        currentPage.graphics.drawString(
            'São João: ${fillReport.dieselSaoJoao} L',
            PdfStandardFont(PdfFontFamily.helvetica, 14,
                style: PdfFontStyle.regular),
            bounds: const Rect.fromLTWH(30, 3 * 25, 500, 50));
        currentPage.graphics.drawString(
            'São Jorge: ${fillReport.dieselSaoJorge} L',
            PdfStandardFont(PdfFontFamily.helvetica, 14,
                style: PdfFontStyle.regular),
            bounds: const Rect.fromLTWH(30, 4 * 25, 500, 50));
        currentPage.graphics.drawString(
            'Cruzeiro: ${fillReport.dieselCruzeiro} L',
            PdfStandardFont(PdfFontFamily.helvetica, 14,
                style: PdfFontStyle.regular),
            bounds: const Rect.fromLTWH(30, 5 * 25, 500, 50));
        currentPage.graphics.drawString(
            'Campinho: ${fillReport.dieselCampinho} L',
            PdfStandardFont(PdfFontFamily.helvetica, 14,
                style: PdfFontStyle.regular),
            bounds: const Rect.fromLTWH(30, 6 * 25, 500, 50));

        currentPage.graphics.drawString(
            'SALDO ATUAL DE DIESEL: ${fillReport.qtt} L',
            PdfStandardFont(PdfFontFamily.helvetica, 18,
                style: PdfFontStyle.bold),
            bounds: const Rect.fromLTWH(30, 7 * 25, 400, 50));
        currentPage.graphics.drawString(
            'Central de abastecimento: ${fillReport.dieselCentral} L',
            PdfStandardFont(PdfFontFamily.helvetica, 14,
                style: PdfFontStyle.regular),
            bounds: const Rect.fromLTWH(30, 8 * 25, 500, 50));
      }

      PdfForm form = document.form;
      form.flattenAllFields();

      if (uni.Platform.isAndroid) {
        file = await dartio.File(
                '${(await getApplicationSupportDirectory()).path}/$name.pdf')
            .writeAsBytes(await document.save());
      } else {
        List<int> i = await document.save();
        AnchorElement(
            href:
                "data:aplication/octet-stream;charset=utf-16le;base64,${base64.encode(i)}")
          ..setAttribute("download", '$name.pdf')
          ..click();
      }
    } else if (name == "Relatório de Estoque") {
      // ========================================================================================================
      page.graphics.drawString(
          'RELATÓRIO DE ESTOQUE',
          PdfStandardFont(PdfFontFamily.helvetica, 24,
              style: PdfFontStyle.bold),
          bounds: const Rect.fromLTWH(180, 25, 400, 50));

      String categoriasStr = "";
      for (var cat in stockReport.categories) {
        categoriasStr += "${cat[0].toUpperCase()}${cat.substring(1)}, ";
      }

      stockReport.categories.length > 1
          ? page.graphics.drawString(
              'Categorias: ${categoriasStr.substring(0, categoriasStr.length - 2)}',
              PdfStandardFont(PdfFontFamily.helvetica, 14,
                  style: PdfFontStyle.regular),
              bounds: const Rect.fromLTWH(30, 85, 500, 50))
          : page.graphics.drawString(
              'Categoria: ${categoriasStr.substring(0, categoriasStr.length - 2)}',
              PdfStandardFont(PdfFontFamily.helvetica, 14,
                  style: PdfFontStyle.regular),
              bounds: const Rect.fromLTWH(30, 85, 500, 50));

      String localsStr = "";
      for (var local in stockReport.locals) {
        localsStr += "$local, ";
      }

      stockReport.locals.length > 1
          ? page.graphics.drawString(
              'Locais: ${localsStr.substring(0, localsStr.length - 2)}',
              PdfStandardFont(PdfFontFamily.helvetica, 14,
                  style: PdfFontStyle.regular),
              bounds: const Rect.fromLTWH(30, 120, 500, 50))
          : page.graphics.drawString(
              'Local: ${localsStr.substring(0, localsStr.length - 2)}',
              PdfStandardFont(PdfFontFamily.helvetica, 14,
                  style: PdfFontStyle.regular),
              bounds: const Rect.fromLTWH(30, 120, 500, 50));

      fullHistory
          ? page.graphics.drawString('Período analisado: HISTÓRICO COMPLETO',
              PdfStandardFont(PdfFontFamily.helvetica, 14),
              bounds: const Rect.fromLTWH(30, 145, 500, 50))
          : page.graphics.drawString('Período analisado: $dateStart - $dateEnd',
              PdfStandardFont(PdfFontFamily.helvetica, 14),
              bounds: const Rect.fromLTWH(30, 145, 500, 50));

      double initIns = 195;

      bool noIns = false;
      if (stockReport.tableIns.isEmpty) {
        noIns = true;
      }

      bool noOuts = false;
      if (stockReport.tableOuts.isEmpty) {
        noOuts = true;
      }

      PdfLayoutResult? gridInsDraw;
      PdfLayoutResult? gridOutsDraw;
      PdfLayoutResult? gridLocalsCurrentsDraw;

      double startIn = initIns;
      // ======================= INS =====================================

      if (!noIns && stockReport.tableIns.isNotEmpty) {
        page.graphics.drawString(
            'ENTRADAS',
            PdfStandardFont(PdfFontFamily.helvetica, 18,
                style: PdfFontStyle.bold),
            bounds: Rect.fromLTWH(210, initIns - 25, 400, 50));
        final PdfGrid gridIns = PdfGrid();

        gridIns.columns.add(count: 6);

        final PdfGridRow headerRowIns = gridIns.headers.add(1)[0];
        headerRowIns.cells[0].value = 'OPERAÇÃO';
        headerRowIns.cells[1].value = 'PRINCÍPIO ATIVO';
        headerRowIns.cells[2].value = 'PRODUTO';
        headerRowIns.cells[3].value = 'QUANTIDADE';
        headerRowIns.cells[4].value = 'QTD RESULTANTE';
        headerRowIns.cells[5].value = 'DATA';

        headerRowIns.style.font = PdfStandardFont(PdfFontFamily.helvetica, 6,
            style: PdfFontStyle.bold);
        headerRowIns.style.backgroundBrush = PdfBrushes.lightGreen;
        PdfGridRow rowIns = PdfGridRow(gridIns);
        for (var register in stockReport.tableIns) {
          rowIns = gridIns.rows.add();
          rowIns.cells[0].value = "Entrada ${register.id}";
          register.activePrinciple == ""
              ? rowIns.cells[1].value = "N/A"
              : rowIns.cells[1].value = register.activePrinciple;
          rowIns.cells[2].value = register.product.toUpperCase();
          rowIns.cells[3].value =
              "${register.quantity.toString()} ${register.unity}";
          rowIns.cells[4].value = "${register.newQtt} ${register.unity}";
          rowIns.cells[5].value = register.date;
        }
        gridIns.style.cellPadding = PdfPaddings(left: 5, top: 5);

        gridInsDraw = gridIns.draw(
            page: page,
            bounds: Rect.fromLTWH(0, initIns, page.getClientSize().width,
                page.getClientSize().height));
      }

      PdfPage currentPage = page;
      if (gridInsDraw != null) {
        currentPage = gridInsDraw.page;
      }

      double spaceBetweenGrids = 0;
      double bottomIn = 0;
      double startOut = 0;

      if (gridInsDraw != null && stockReport.tableOuts.isNotEmpty) {
        bottomIn = gridInsDraw.bounds.bottom;
        spaceBetweenGrids = 50;
        startOut = bottomIn + spaceBetweenGrids;
      } else {
        startOut = startIn;
      }

      if (!noOuts && stockReport.tableOuts.isNotEmpty) {
        // ======================= OUTS =====================================
        final PdfGrid gridOuts = PdfGrid();

        gridOuts.columns.add(count: 9);

        final PdfGridRow headerRowOuts = gridOuts.headers.add(1)[0];
        headerRowOuts.cells[0].value = 'OPERAÇÃO';
        headerRowOuts.cells[1].value = 'PRINCÍPIO ATIVO';
        headerRowOuts.cells[2].value = 'PRODUTO';
        headerRowOuts.cells[3].value = 'CULTURA / FASE';
        headerRowOuts.cells[4].value = 'QUANTIDADE';
        headerRowOuts.cells[5].value = 'QTD RESULTANTE';
        headerRowOuts.cells[6].value = 'LOCAL';
        headerRowOuts.cells[7].value = 'DATA - HORA';
        headerRowOuts.cells[8].value = 'USUÁRIO';

        headerRowOuts.style.font = PdfStandardFont(PdfFontFamily.helvetica, 6,
            style: PdfFontStyle.bold);
        headerRowOuts.style.backgroundBrush = PdfBrushes.lightGreen;
        PdfGridRow rowOuts = PdfGridRow(gridOuts);
        for (var register in stockReport.tableOuts) {
          rowOuts = gridOuts.rows.add();
          rowOuts.cells[0].value = "Saída ${register.id}";
          register.activePrinciple == ""
              ? rowOuts.cells[1].value = "N/A"
              : rowOuts.cells[1].value = register.activePrinciple;
          rowOuts.cells[2].value = register.product.toUpperCase();
          register.culture == ""
              ? rowOuts.cells[3].value = "N/A"
              : rowOuts.cells[3].value =
                  "${register.culture} / ${register.phase}";
          rowOuts.cells[4].value =
              "${register.quantity.toString()} ${register.unity}";
          rowOuts.cells[5].value = "${register.newQtt} ${register.unity}";
          rowOuts.cells[6].value = register.local;
          rowOuts.cells[7].value = "${register.date} - ${register.hour}";
          rowOuts.cells[8].value = register.user;
        }
        gridOuts.style.cellPadding = PdfPaddings(left: 5, top: 5);

        if (startOut + 150 < currentPage.size.height) {
          currentPage.graphics.drawString(
            'SAÍDAS',
            PdfStandardFont(PdfFontFamily.helvetica, 18,
                style: PdfFontStyle.bold),
            bounds: Rect.fromLTWH(210, startOut, 400, 50),
          );
          gridOutsDraw = gridOuts.draw(
            page: currentPage,
            bounds: Rect.fromLTWH(
                0,
                startOut + 25,
                currentPage.getClientSize().width,
                currentPage.getClientSize().height),
          );
        } else {
          currentPage = document.pages.add();
          currentPage.graphics.drawString(
            'SAÍDAS',
            PdfStandardFont(PdfFontFamily.helvetica, 18,
                style: PdfFontStyle.bold),
            bounds: const Rect.fromLTWH(210, 0, 400, 50),
          );
          gridOutsDraw = gridOuts.draw(
            page: currentPage,
            bounds: Rect.fromLTWH(0, 25, currentPage.getClientSize().width,
                currentPage.getClientSize().height),
          );
        }
      }

      if (gridOutsDraw != null) {
        currentPage = gridOutsDraw.page;
      }

      spaceBetweenGrids = 0;
      double bottomOut = 0;
      // double startLocals = 0;
      double startAlls = 0;

      if (gridOutsDraw != null && stockReport.tableLocalsCurrents.isNotEmpty) {
        bottomOut = gridOutsDraw.bounds.bottom;
        spaceBetweenGrids = 50;
        startAlls = bottomOut + spaceBetweenGrids;
      } else if (gridInsDraw != null &&
          stockReport.tableLocalsCurrents.isNotEmpty) {
        bottomIn = gridInsDraw.bounds.bottom;
        spaceBetweenGrids = 50;
        startAlls = bottomIn + spaceBetweenGrids;
      } else {
        startAlls = startIn;
      }

      // ======================= CURRENT LOCALS =====================================

      // if (stockReport.tableLocalsCurrents.isNotEmpty) {
      //   final PdfGrid gridCurrentLocals = PdfGrid();

      //   gridCurrentLocals.columns.add(count: 5);

      //   final PdfGridRow headerRowCurrentLocals =
      //       gridCurrentLocals.headers.add(1)[0];
      //   headerRowCurrentLocals.cells[0].value = 'ID';
      //   headerRowCurrentLocals.cells[1].value = 'PRINCÍPIO ATIVO';
      //   headerRowCurrentLocals.cells[2].value = 'PRODUTO';
      //   headerRowCurrentLocals.cells[3].value = 'LOCAL';
      //   headerRowCurrentLocals.cells[4].value = 'QUANTIDADE';

      //   headerRowCurrentLocals.style.font = PdfStandardFont(
      //       PdfFontFamily.helvetica, 6,
      //       style: PdfFontStyle.bold);
      //   headerRowCurrentLocals.style.backgroundBrush = PdfBrushes.lightGreen;
      //   PdfGridRow rowCurrentLocals = PdfGridRow(gridCurrentLocals);
      //   for (var register in stockReport.tableLocalsCurrents) {
      //     rowCurrentLocals = gridCurrentLocals.rows.add();
      //     rowCurrentLocals.cells[0].value = register.id.toString();
      //     register.activePrinciple == ""
      //         ? rowCurrentLocals.cells[1].value = "N/A"
      //         : rowCurrentLocals.cells[1].value = register.activePrinciple;
      //     rowCurrentLocals.cells[2].value = register.product.toUpperCase();
      //     rowCurrentLocals.cells[3].value = register.local;
      //     rowCurrentLocals.cells[4].value =
      //         "${register.quantity.toString()} ${register.unity}";
      //   }
      //   gridCurrentLocals.style.cellPadding = PdfPaddings(left: 5, top: 5);

      //   if (startLocals + 150 < currentPage.size.height) {
      //     currentPage.graphics.drawString(
      //         'SALDO ATUAL POR LOCAIS',
      //         PdfStandardFont(PdfFontFamily.helvetica, 18,
      //             style: PdfFontStyle.bold),
      //         bounds: Rect.fromLTWH(140, startLocals, 400, 50));

      //     gridLocalsCurrentsDraw = gridCurrentLocals.draw(
      //         page: currentPage,
      //         bounds: Rect.fromLTWH(
      //             0,
      //             startLocals + 25,
      //             currentPage.getClientSize().width,
      //             currentPage.getClientSize().height));
      //   } else {
      //     currentPage = document.pages.add();
      //     currentPage.graphics.drawString(
      //         'SALDO ATUAL POR LOCAIS',
      //         PdfStandardFont(PdfFontFamily.helvetica, 18,
      //             style: PdfFontStyle.bold),
      //         bounds: const Rect.fromLTWH(140, 0, 400, 50));

      //     gridLocalsCurrentsDraw = gridCurrentLocals.draw(
      //         page: currentPage,
      //         bounds: Rect.fromLTWH(0, 25, currentPage.getClientSize().width,
      //             currentPage.getClientSize().height));
      //   }
      // }

      // if (gridLocalsCurrentsDraw != null) {
      //   currentPage = gridLocalsCurrentsDraw.page;
      // }

      // spaceBetweenGrids = 0;
      // double bottomLocals = 0;
      // double startAlls = 0;

      // if (gridLocalsCurrentsDraw != null &&
      //     stockReport.tableAllCurrents.isNotEmpty) {
      //   bottomLocals = gridLocalsCurrentsDraw.bounds.bottom;
      //   spaceBetweenGrids = 50;
      //   startAlls = bottomLocals + spaceBetweenGrids;
      // }

      // ======================= ALL LOCALS =====================================

      if (stockReport.tableAllCurrents.isNotEmpty) {
        final PdfGrid gridAllLocals = PdfGrid();

        gridAllLocals.columns.add(count: 4);

        final PdfGridRow headerRowAllLocals = gridAllLocals.headers.add(1)[0];
        headerRowAllLocals.cells[0].value = 'ID';
        headerRowAllLocals.cells[1].value = 'PRINCÍPIO ATIVO';
        headerRowAllLocals.cells[2].value = 'PRODUTO';
        headerRowAllLocals.cells[3].value = 'QUANTIDADE';

        headerRowAllLocals.style.font = PdfStandardFont(
            PdfFontFamily.helvetica, 6,
            style: PdfFontStyle.bold);
        headerRowAllLocals.style.backgroundBrush = PdfBrushes.lightGreen;
        PdfGridRow rowAllLocals = PdfGridRow(gridAllLocals);
        for (var register in stockReport.tableAllCurrents) {
          rowAllLocals = gridAllLocals.rows.add();
          rowAllLocals.cells[0].value = register.id.toString();
          register.activePrinciple == ""
              ? rowAllLocals.cells[1].value = "N/A"
              : rowAllLocals.cells[1].value = register.activePrinciple;
          rowAllLocals.cells[2].value = register.product.toUpperCase();
          rowAllLocals.cells[3].value =
              "${register.quantity.toString()} ${register.unity}";
        }
        gridAllLocals.style.cellPadding = PdfPaddings(left: 5, top: 5);

        if (startAlls + 150 < currentPage.size.height) {
          currentPage.graphics.drawString(
              'SALDO ATUAL TOTAL',
              PdfStandardFont(PdfFontFamily.helvetica, 18,
                  style: PdfFontStyle.bold),
              bounds: Rect.fromLTWH(165, startAlls, 400, 50));
          gridAllLocals.draw(
              page: currentPage,
              bounds: Rect.fromLTWH(
                  0,
                  startAlls + 25,
                  currentPage.getClientSize().width,
                  currentPage.getClientSize().height));
        } else {
          currentPage = document.pages.add();
          currentPage.graphics.drawString(
              'SALDO ATUAL TOTAL',
              PdfStandardFont(PdfFontFamily.helvetica, 18,
                  style: PdfFontStyle.bold),
              bounds: const Rect.fromLTWH(165, 0, 400, 50));
          gridAllLocals.draw(
              page: currentPage,
              bounds: Rect.fromLTWH(0, 25, currentPage.getClientSize().width,
                  currentPage.getClientSize().height));
        }
      }

      PdfForm form = document.form;
      form.flattenAllFields();

      if (uni.Platform.isAndroid) {
        file = await dartio.File(
                '${(await getApplicationSupportDirectory()).path}/$name.pdf')
            .writeAsBytes(await document.save());
      } else {
        List<int> i = await document.save();
        AnchorElement(
            href:
                "data:aplication/octet-stream;charset=utf-16le;base64,${base64.encode(i)}")
          ..setAttribute("download", '$name.pdf')
          ..click();
      }
    }

    document.dispose();

    return file;
  }
}
