// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flv_farm/pages/login/utils/auth_check.dart';
import 'package:flv_farm/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:lottie/lottie.dart';

import '../../controllers/culture/date_picker_controller.dart';
import '../../controllers/culture/local_controller.dart';
import '../../controllers/date_picker_month_controller.dart';
import '../../controllers/products/seleceted_category_controller.dart';
import '../../controllers/report/culture/culture_report_controller.dart';
import '../../controllers/report/daily/daily_report_controller.dart';
import '../../controllers/report/fill/fill_report_controller.dart';
import '../../controllers/report/report_type_controller.dart';
import '../../controllers/report/stock/stock_report_controller.dart';
import '../../core/auth_service.dart';
import '../../db/reports/culture/culture_data.dart';
import '../../db/reports/daily/daily_data.dart';
import '../../db/reports/fill/fill_data.dart';
import '../../db/reports/stock/stock_data.dart';
import 'utils/generate_report_function.dart';
import 'view_share_page.dart';
import 'package:universal_io/io.dart';

class GenerateReportPage extends StatefulHookConsumerWidget {
  const GenerateReportPage({
    Key? key,
    required this.reportType,
    required this.dailyReport,
    required this.cultureReport,
    required this.stockReport,
    required this.fillReport,
    required this.dateProv,
    this.dateProvStart,
    this.dateProvEnd,
    this.selectedCategory,
    this.fullHistory,
    required this.local,
    required this.auth,
  }) : super(key: key);

  final ReportTypeController reportType;
  final DailyReportController dailyReport;
  final CultureReportController cultureReport;
  final StockReportController stockReport;
  final FillReportController fillReport;
  final DatePickerController dateProv;
  final DatePickerMonthController? dateProvStart;
  final DatePickerController? dateProvEnd;
  final SelectedCategoryController? selectedCategory;
  final bool? fullHistory;
  final LocalController local;
  final AuthService auth;

  @override
  ConsumerState<GenerateReportPage> createState() => _GenerateReportState();
}

class _GenerateReportState extends ConsumerState<GenerateReportPage> {
  bool isLoading = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () async {
      CreateReport pdf = CreateReport();
      File file;
      file = File("");

      if (widget.reportType.daily) {
        DailyData dailyData = DailyData();
        await dailyData.get(
          widget.dailyReport,
          widget.dateProv.date.millisecondsSinceEpoch,
          widget.local,
        );
        file = await pdf.generateReportFunction(
            "Relatório Diário",
            widget.dailyReport,
            widget.cultureReport,
            widget.stockReport,
            widget.fillReport,
            "",
            "",
            false);
      } else if (widget.reportType.culture) {
        CultureData cultureData = CultureData();
        await cultureData.get(
          widget.cultureReport,
        );
        file = await pdf.generateReportFunction(
            "Relatório de Cultura",
            widget.dailyReport,
            widget.cultureReport,
            widget.stockReport,
            widget.fillReport,
            "",
            "",
            false);
      } else if (widget.reportType.stock) {
        widget.stockReport.resetControllers();
        StockData stockData = StockData();
        await stockData.get(
          widget.stockReport,
          widget.dateProvStart!.date.millisecondsSinceEpoch,
          widget.dateProv.date.millisecondsSinceEpoch,
          widget.local,
          widget.selectedCategory!,
          widget.fullHistory!,
        );
        file = await pdf.generateReportFunction(
            "Relatório de Estoque",
            widget.dailyReport,
            widget.cultureReport,
            widget.stockReport,
            widget.fillReport,
            DateFormat('dd/MM/yyyy').format(widget.dateProvStart!.date),
            DateFormat('dd/MM/yyyy').format(widget.dateProvEnd!.date),
            widget.fullHistory!);
      } else if (widget.reportType.fill) {
        FillReportData fillData = FillReportData();
        await fillData.get(
          widget.fillReport,
          widget.dateProvStart!.date.millisecondsSinceEpoch,
          widget.dateProv.date.millisecondsSinceEpoch,
          widget.local,
          widget.fullHistory!,
        );
        file = await pdf.generateReportFunction(
            "Relatório de Abastecimento",
            widget.dailyReport,
            widget.cultureReport,
            widget.stockReport,
            widget.fillReport,
            DateFormat('dd/MM/yyyy').format(widget.dateProvStart!.date),
            DateFormat('dd/MM/yyyy').format(widget.dateProvEnd!.date),
            widget.fullHistory!);
      }

      widget.local.setSantaTerezinha();
      widget.dateProv.setDate(DateTime.now());
      widget.dailyReport.resetControllers();
      widget.cultureReport.resetControllers();

      if (Platform.isAndroid) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return ViewSharePage(file, widget.auth);
            },
          ),
        );
      } else {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return AuthCheck(first: false);
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Gerando Relatório...",
              style: TextStyle(
                fontSize: 22,
                color: Colors.black38,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            if (isLoading)
              Lottie.asset('assets/loading.json', height: 50, width: 50),
          ],
        ),
      ),
    );
  }
}
