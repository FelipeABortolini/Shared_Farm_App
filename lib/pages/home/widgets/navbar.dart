import 'package:flutter/material.dart';
import 'package:flv_farm/pages/culture/historic_cultures/historic_cultures_page.dart';
import 'package:flv_farm/pages/support/support_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:universal_io/io.dart';

import '../../../core/auth_service.dart';
import '../../../db/cultures/continue_culture/get_cultures.dart';
import '../../../db/cultures/continue_culture/get_user_cultures.dart';
import '../../../providers/providers.dart';
import '../../../version.dart';
import '../../login/login_page.dart';
import '../../login/utils/auth_check.dart';
import '../../reports/culture_reports/culture_reports_page.dart';
import '../../reports/daily_reports/daily_reports_page.dart';
import '../../reports/fill_reports/fill_reports_page.dart';
import '../../reports/stock_reports/stock_reports_page.dart';

// ignore: must_be_immutable
class NavBar extends HookConsumerWidget {
  NavBar({super.key});

  GetUserCultures getUserCultures = GetUserCultures();
  GetCultures getCultures = GetCultures();

  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authServiceProvider.notifier);
    final adubos = ref.watch(adubosProvider);
    final levelSelected = ref.watch(addLevelProvider);
    final phaseOption = ref.watch(selectPhaseProvider);
    final userCultures = ref.watch(userCulturesProvider);
    final indexCultureSelected = ref.watch(indexCultureSelectedProvider);
    final reportType = ref.watch(reportTypeProvider);
    final cultureReport = ref.watch(cultureReportProvider);
    final dailyReport = ref.watch(dailyReportProvider);
    final stockReport = ref.watch(stockReportProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final local = ref.watch(localProvider);
    final fillReport = ref.watch(fillReportProvider);
    final sidebarSubitems = ref.watch(sidebarSubitemsProvider);
    final dateProvStart = ref.watch(datePickerStartProvider);
    final dateProvEnd = ref.watch(datePickerEndProvider);
    final fullHistory = ref.watch(fullHistoryProvider);
    final user = ref.watch(userProvider);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: (auth.usuario != null)
                ? Text(
                    "${auth.usuario!.displayName}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : const Text(
                    "Até mais!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            accountEmail: (auth.usuario != null)
                ? Text("${auth.usuario!.email}")
                : const SizedBox(height: 1),
            currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.black54,
                child: Icon(
                  Icons.person,
                  size: 50,
                )),
            decoration: BoxDecoration(
              color: Colors.blue[200],
              image: const DecorationImage(
                  image: AssetImage("assets/images/trees.png"),
                  fit: BoxFit.cover),
            ),
          ),
          // Platform.isAndroid
          //     ? Column(
          //         children: [
          //           const Divider(),
          //           ListTile(
          //             leading: const Icon(Icons.edit_document),
          //             title: const Text("Relatórios"),
          //             onTap: () {
          //               sidebarSubitems.setProduct(false);
          //               sidebarSubitems.setVehicle(false);
          //               sidebarSubitems.setReport(!sidebarSubitems.report);
          //               sidebarSubitems.setRecipe(false);
          //             },
          //           ),
          //       Visibility(
          //         visible: sidebarSubitems.report,
          //         child: Padding(
          //           padding: const EdgeInsets.only(left: 30),
          //           child: Column(
          //             children: [
          //               const Divider(),
          //               ListTile(
          //                 leading: const Icon(
          //                   Icons.today,
          //                   color: Colors.blueGrey,
          //                 ),
          //                 title: const Text(
          //                   "Relatório Diário",
          //                   style: TextStyle(color: Colors.blueGrey),
          //                 ),
          //                 onTap: () {
          //                   local.allUnselected();
          //                   dailyReport.resetControllers();
          //                   reportType.setDaily();
          //                   sidebarSubitems.resetAll();
          //                   // ignore: use_build_context_synchronously
          //                   Navigator.of(context).push(
          //                     MaterialPageRoute(
          //                       builder: (context) {
          //                         return DailyReportPage();
          //                       },
          //                     ),
          //                   );
          //                 },
          //               ),
          //               const Divider(),
          //               ListTile(
          //                 leading: const Icon(
          //                   Icons.grass_outlined,
          //                   color: Colors.blueGrey,
          //                 ),
          //                 title: const Text(
          //                   "Relatório de Cultura",
          //                   style: TextStyle(color: Colors.blueGrey),
          //                 ),
          //                 onTap: () async {
          //                   cultureReport.resetAllNamesCultures();
          //                   cultureReport.resetAllCultures();
          //                   cultureReport.resetControllers();
          //                   cultureReport
          //                       .setAllCultures(await getCultures.getAll());
          //                   cultureReport.setAllNamesCultures(
          //                       await getCultures.getNames());
          //                   reportType.setCulture();
          //                   sidebarSubitems.resetAll();
          //                   // ignore: use_build_context_synchronously
          //                   Navigator.of(context).push(
          //                     MaterialPageRoute(
          //                       builder: (context) {
          //                         return CulturesReportPage();
          //                       },
          //                     ),
          //                   );
          //                 },
          //               ),
          //               const Divider(),
          //               ListTile(
          //                 leading: const Icon(
          //                   Icons.now_widgets_sharp,
          //                   color: Colors.blueGrey,
          //                 ),
          //                 title: const Text(
          //                   "Relatório de Estoque",
          //                   style: TextStyle(color: Colors.blueGrey),
          //                 ),
          //                 onTap: () {
          //                   fullHistory.resetControllers();
          //                   dateProvStart.resetDate();
          //                   dateProvEnd.resetDate();
          //                   local.allUnselected();
          //                   selectedCategory.allUnselected();
          //                   stockReport.resetControllers();
          //                   reportType.setStock();
          //                   sidebarSubitems.resetAll();
          //                   // ignore: use_build_context_synchronously
          //                   Navigator.of(context).push(
          //                     MaterialPageRoute(
          //                       builder: (context) {
          //                         return StockReportPage();
          //                       },
          //                     ),
          //                   );
          //                 },
          //               ),
          //               const Divider(),
          //               ListTile(
          //                 leading: const Icon(
          //                   Icons.local_gas_station_rounded,
          //                   color: Colors.blueGrey,
          //                 ),
          //                 title: const Text(
          //                   "Relatório de Abastecimento",
          //                   style: TextStyle(color: Colors.blueGrey),
          //                 ),
          //                 onTap: () {
          //                   fullHistory.resetControllers();
          //                   dateProvStart.resetDate();
          //                   dateProvEnd.resetDate();
          //                   local.allUnselected();
          //                   fillReport.resetControllers();
          //                   reportType.setFill();
          //                   sidebarSubitems.resetAll();
          //                   // ignore: use_build_context_synchronously
          //                   Navigator.of(context).push(
          //                     MaterialPageRoute(
          //                       builder: (context) {
          //                         return FillReportPage();
          //                       },
          //                     ),
          //                   );
          //                 },
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   )
          // : const SizedBox(height: 1),
          Visibility(
            visible: user.currentUser["permission"] == "Operacional",
            child: ListTile(
              leading: const Icon(Icons.history),
              title: const Text("Histórico de Culturas"),
              onTap: () async {
                levelSelected.resetLevel();
                adubos.setNoSelection();
                adubos.resetAll();
                phaseOption.resetPhase();
                userCultures.setCulturesList(await getUserCultures.getAll());
                indexCultureSelected.resetIndex();
                // ignore: use_build_context_synchronously
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return HistoricCulturesPage();
                    },
                  ),
                );
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.cloud_download_rounded),
            title: const Text("Sincronizar"),
            onTap: () async {
              // ignore: use_build_context_synchronously
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return AuthCheck(first: false);
                  },
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.support_agent),
            title: const Text("Suporte"),
            onTap: () {
              // ignore: use_build_context_synchronously
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SupportPage();
                  },
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.logout_outlined,
              color: Colors.red,
            ),
            title: const Text(
              "Sair",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onTap: () {
              auth.logout(user);
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
              );
            },
          ),
          const Divider(),
          const SizedBox(height: 30),
          Center(
            child: Column(
              children: [
                Lottie.asset('assets/farmer.json', height: 140, width: 250),
                const SizedBox(height: 10),
                const Text(
                  'Versão: Produção $version',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                  ),
                ),
                const SizedBox(height: 5),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.copyright,
                      size: 20,
                      color: Colors.black26,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '2023 Integre Jr. / FLV Techs',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
