import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flv_farm/pages/reports/culture_reports/culture_reports_page.dart';
import 'package:flv_farm/pages/reports/daily_reports/daily_reports_page.dart';
import 'package:flv_farm/pages/reports/stock_reports/stock_reports_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../controllers/report/report_type_controller.dart';
import '../../core/auth_service.dart';
import '../../providers/providers.dart';
import '../../shared/alert.dart';
import '../home/home_page.dart';
import '../home/host_home_page.dart';

class ViewSharePage extends StatefulHookConsumerWidget {
  const ViewSharePage(this.file, this.auth, {Key? key}) : super(key: key);

  final File file;
  final AuthService auth;

  @override
  ConsumerState<ViewSharePage> createState() => _ViewShareState();
}

class _ViewShareState extends ConsumerState<ViewSharePage> {
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  AlertWidget alert = AlertWidget();

  sharePdf(ReportTypeController type) async {
    if (type.daily) {
      await Share.shareFiles(
        [widget.file.path],
        text: 'Relatório Diário',
        subject: 'Relatório Diário',
      );
    } else if (type.culture) {
      await Share.shareFiles(
        [widget.file.path],
        text: 'Relatório de Cultura',
        subject: 'Relatório de Cultura',
      );
    } else if (type.stock) {
      await Share.shareFiles(
        [widget.file.path],
        text: 'Relatório de Estoque',
        subject: 'Relatório de Estoque',
      );
    } else if (type.fill) {
      await Share.shareFiles(
        [widget.file.path],
        text: 'Relatório de Abastecimento',
        subject: 'Relatório de Abastecimento',
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pdfViewer = ref.watch(pdfViewerProvider);
    final reportType = ref.watch(reportTypeProvider);
    final local = ref.watch(localProvider);
    final dailyReport = ref.watch(dailyReportProvider);
    final cultureReport = ref.watch(cultureReportProvider);
    final stockReport = ref.watch(stockReportProvider);
    final fillReport = ref.watch(fillReportProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final fullHistory = ref.watch(fullHistoryProvider);
    final user = ref.watch(userProvider);

    showPDF() {
      pdfViewer.setPdfViewerPath(widget.file.path);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Relatório pronto'),
          leading: IconButton(
          onPressed: () {
            fullHistory.resetControllers();
            selectedCategory.resetControllers();
            local.allUnselected();
            dailyReport.resetControllers();
            cultureReport.resetControllers();
            stockReport.resetControllers();
            fillReport.resetControllers();
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Visualização do relatório',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                pdfViewer.pdfViewerPath != ''
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: SfPdfViewer.file(
                          widget.file,
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () async => showPDF(),
                        child: const Text('Mostrar PDF'),
                      ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (reportType.daily) {
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) {
                                return DailyReportPage();
                              },
                            ),
                            (Route<dynamic> route) => false,
                          );
                        } else if (reportType.culture) {
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) {
                                return CulturesReportPage();
                              },
                            ),
                            (Route<dynamic> route) => false,
                          );
                        } else if (reportType.stock) {
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) {
                                return StockReportPage();
                              },
                            ),
                            (Route<dynamic> route) => false,
                          );
                        }
                      },
                      child: const Text('Novo relatório'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // report.resetControllers();
                        if (user.currentUser["permission"] == "Host" || user.currentUser["permission"] == "Gerencial") {
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return const HostHomePage();
                              },
                            ),
                          );
                        } else {
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        }
                      },
                      child: const Text('Home'),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            sharePdf(reportType);
          },
          child: const Icon(Icons.share),
        ));
  }
}
