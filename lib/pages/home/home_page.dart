import 'package:flutter/material.dart';
import 'package:flv_farm/pages/home/widgets/card_home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:universal_io/io.dart';

import '../../db/cultures/continue_culture/get_user_cultures.dart';
import '../../providers/providers.dart';
import '../culture/culture_home.dart';
import '../culture/historic_cultures/historic_cultures_page.dart';
import '../fill_vehicles/fill_vehicles_page.dart';
import '../reports/reports_home_page.dart';
import 'widgets/navbar.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  GetUserCultures getUserCultures = GetUserCultures();

  @override
  Widget build(BuildContext context) {
    final dateProv = ref.watch(datePickerProvider);
    final culture = ref.watch(cultureProvider);
    final user = ref.watch(userProvider);
    final userCultures = ref.watch(userCulturesProvider);
    final indexCultureSelected = ref.watch(indexCultureSelectedProvider);

    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text("Página Inicial"),
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
            Visibility(
              visible: user.currentUser["permission"] != "Consulta",
              child: GestureDetector(
                onTap: () {
                  culture.setIsCulture();
                  dateProv.setDate(DateTime.now());
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const CultureHome();
                      },
                    ),
                  );
                },
                child: const CardHome(
                  myIcon: Icons.grass_outlined,
                  color: Color(0xFFfe1a27),
                  heading: 'Culturas',
                  color1: Color.fromARGB(255, 255, 238, 239),
                ),
              ),
            ),
            Visibility(
              visible: user.currentUser["permission"] != "Consulta",
              child: GestureDetector(
                onTap: () async {
                  dateProv.setDate(DateTime.now());
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return FillVehiclesPage();
                      },
                    ),
                  );
                },
                child: const CardHome(
                  myIcon: Icons.local_gas_station_rounded,
                  color: Color(0xFFfe1a27),
                  heading: 'Abastecimento',
                  color1: Color.fromARGB(255, 255, 238, 239),
                ),
              ),
            ),
            Visibility(
              visible: user.currentUser["permission"] == "Consulta",
              child: GestureDetector(
                onTap: () async {
                  dateProv.setDate(DateTime.now());
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const ReportsHomePage();
                      },
                    ),
                  );
                },
                child: const CardHome(
                  myIcon: Icons.edit_document,
                  color: Color(0xFFfe1a27),
                  heading: 'Relatórios',
                  color1: Color.fromARGB(255, 255, 238, 239),
                ),
              ),
            ),
            Visibility(
              visible: user.currentUser["permission"] == "Consulta",
              child: GestureDetector(
                onTap: () async {
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
                child: const CardHome(
                  myIcon: Icons.history,
                  color: Color(0xFFfe1a27),
                  heading: 'Histórico de Culturas',
                  color1: Color.fromARGB(255, 255, 238, 239),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
