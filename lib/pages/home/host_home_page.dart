import 'package:flutter/material.dart';
import 'package:flv_farm/pages/fill_vehicles/fill_vehicles_page.dart';
import 'package:flv_farm/pages/home/widgets/card_home.dart';
import 'package:flv_farm/pages/home/widgets/navbar_host.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:universal_io/io.dart';

import '../../db/cultures/continue_culture/get_user_cultures.dart';
import '../../providers/providers.dart';
import '../culture/culture_home.dart';
import '../exclude_data/exclude_data_page.dart';
import '../host/in_product/in_product_page.dart';

class HostHomePage extends StatefulHookConsumerWidget {
  const HostHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HostHomePageState createState() => _HostHomePageState();
}

class _HostHomePageState extends ConsumerState<HostHomePage> {
  @override
  void initState() {
    super.initState();
  }

  GetUserCultures getUserCultures = GetUserCultures();

  @override
  Widget build(BuildContext context) {
    final adubos = ref.watch(adubosProvider);
    final levelSelected = ref.watch(addLevelProvider);
    final dateProv = ref.watch(datePickerProvider);
    final culture = ref.watch(cultureProvider);
    final vehicles = ref.watch(vehiclesProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return Scaffold(
      drawer: NavBarHost(),
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
            GestureDetector(
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
            GestureDetector(
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
            GestureDetector(
              onTap: () async {
                vehicles.setName(vehicles.vehicles[0]["name"]);
                vehicles.setPlate(vehicles.vehicles[0]["plate"]);
                levelSelected.resetLevel();
                adubos.setNoSelection();
                adubos.resetAll();
                dateProv.setDate(DateTime.now());
                selectedCategory.resetControllers();
                // ignore: use_build_context_synchronously
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return InProductPage();
                    },
                  ),
                );
              },
              child: const CardHome(
                myIcon: Icons.add_circle_outline_sharp,
                color: Color(0xFFfe1a27),
                heading: 'Entrada de Produto',
                color1: Color.fromARGB(255, 255, 238, 239),
              ),
            ),
            GestureDetector(
                onTap: () async {
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const ExcludeDataPage();
                      },
                    ),
                  );
                },
                child: const CardHome(
                  myIcon: Icons.disabled_by_default_outlined,
                  color: Color(0xFFfe1a27),
                  heading: 'Excluir Dados',
                  color1: Color.fromARGB(255, 255, 238, 239),
                ),
              ),
          ]),
        ),
      ),
    );
  }
}
