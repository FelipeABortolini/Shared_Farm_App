import 'package:flutter/material.dart';
import 'package:flv_farm/pages/culture/start_culture/start_culture_page.dart';
import 'package:flv_farm/pages/home/widgets/card_home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:universal_io/io.dart';

import '../../core/auth_service.dart';
import '../../db/cultures/continue_culture/get_cultures.dart';
import '../../db/cultures/continue_culture/get_user_cultures.dart';
import '../../providers/providers.dart';
import '../culture/continue_culture/continue_culture_page.dart';
import '../culture/finish_culture/finish_culture_page.dart';
import 'culture_reports/culture_reports_page.dart';
import 'daily_reports/daily_reports_page.dart';
import 'fill_reports/fill_reports_page.dart';
import 'stock_reports/stock_reports_page.dart';

class ReportsHomePage extends StatefulHookConsumerWidget {
  const ReportsHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReportsHomePageState createState() => _ReportsHomePageState();
}

class _ReportsHomePageState extends ConsumerState<ReportsHomePage> {
  @override
  void initState() {
    super.initState();
  }

  GetUserCultures getUserCultures = GetUserCultures();
  GetCultures getCultures = GetCultures();

  @override
  Widget build(BuildContext context) {
    final adubos = ref.watch(adubosProvider);
    final cultureReport = ref.watch(cultureReportProvider);
    final levelSelected = ref.watch(addLevelProvider);
    final phaseOption = ref.watch(selectPhaseProvider);
    final culture = ref.watch(cultureProvider);
    final userCultures = ref.watch(userCulturesProvider);
    final auth = ref.watch(authServiceProvider.notifier);
    final indexCultureSelected = ref.watch(indexCultureSelectedProvider);
    final cultureStage = ref.watch(cultureStageProvider);
    final local = ref.watch(localProvider);
    final dateProv = ref.watch(datePickerProvider);
    final user = ref.watch(userProvider);
    final reportType = ref.watch(reportTypeProvider);
    final dailyReport = ref.watch(dailyReportProvider);
    final stockReport = ref.watch(stockReportProvider);
    final dateProvStart = ref.watch(datePickerStartProvider);
    final dateProvEnd = ref.watch(datePickerEndProvider);
    final fullHistory = ref.watch(fullHistoryProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final fillReport = ref.watch(fillReportProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Relatórios"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.green[50],
          image: Platform.isAndroid
              ? const DecorationImage(
                  image: AssetImage("assets/images/back.png"),
                  fit: BoxFit.cover,
                )
              : const DecorationImage(
                  image: AssetImage("assets/images/back.png"),
                  fit: BoxFit.fitHeight,
                ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                dateProv.setDate(DateTime.now());
                local.allUnselected();
                dailyReport.resetControllers();
                reportType.setDaily();
                // ignore: use_build_context_synchronously
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return DailyReportPage();
                    },
                  ),
                );
              },
              child: const CardHome(
                myIcon: Icons.today,
                color: Color(0xFFfe1a27),
                heading: 'Relatório Diário',
                color1: Color.fromARGB(255, 255, 238, 239),
              ),
            ),
            GestureDetector(
              onTap: () async {
                cultureReport.resetAllNamesCultures();
                cultureReport.resetAllCultures();
                cultureReport.resetControllers();
                cultureReport.setAllCultures(await getCultures.getAll());
                cultureReport.setAllNamesCultures(await getCultures.getNames());
                reportType.setCulture();
                // ignore: use_build_context_synchronously
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return CulturesReportPage();
                    },
                  ),
                );
              },
              child: const CardHome(
                myIcon: Icons.grass_outlined,
                color: Color(0xFFfe1a27),
                heading: 'Relatório de Cultura',
                color1: Color.fromARGB(255, 255, 238, 239),
              ),
            ),
            GestureDetector(
              onTap: () async {
                fullHistory.resetControllers();
                dateProvStart.resetDate();
                dateProvEnd.resetDate();
                local.allUnselected();
                selectedCategory.allUnselected();
                stockReport.resetControllers();
                reportType.setStock();
                // ignore: use_build_context_synchronously
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return StockReportPage();
                    },
                  ),
                );
              },
              child: const CardHome(
                myIcon: Icons.now_widgets_sharp,
                color: Color(0xFFfe1a27),
                heading: 'Relatório de Estoque',
                color1: Color.fromARGB(255, 255, 238, 239),
              ),
            ),
            GestureDetector(
              onTap: () async {
                fullHistory.resetControllers();
                dateProvStart.resetDate();
                dateProvEnd.resetDate();
                local.allUnselected();
                fillReport.resetControllers();
                reportType.setFill();
                // ignore: use_build_context_synchronously
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return FillReportPage();
                    },
                  ),
                );
              },
              child: const CardHome(
                myIcon: Icons.local_gas_station_rounded,
                color: Color(0xFFfe1a27),
                heading: 'Relatório de Abastecimento',
                color1: Color.fromARGB(255, 255, 238, 239),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
