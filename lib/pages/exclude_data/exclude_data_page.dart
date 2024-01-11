import 'package:flutter/material.dart';
import 'package:flv_farm/pages/culture/start_culture/start_culture_page.dart';
import 'package:flv_farm/pages/home/widgets/card_home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:universal_io/io.dart';

import '../../core/auth_service.dart';
import '../../db/cultures/continue_culture/get_cultures.dart';
import '../../db/cultures/continue_culture/get_user_cultures.dart';
import '../../db/products/in_product/exclude_in_product.dart';
import '../../db/vehicles/fill/exclude_fill.dart';
import '../../providers/providers.dart';
import '../culture/continue_culture/continue_culture_page.dart';
import '../culture/exclude_phase_culture/select_culture_exclude_phase_page.dart';
import '../culture/finish_culture/finish_culture_page.dart';
import '../fill_vehicles/exclude_fill_vehicle_page.dart';
import '../host/in_product/exclude_in_product_page.dart';

class ExcludeDataPage extends StatefulHookConsumerWidget {
  const ExcludeDataPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExcludeDataPageState createState() => _ExcludeDataPageState();
}

class _ExcludeDataPageState extends ConsumerState<ExcludeDataPage> {
  @override
  void initState() {
    super.initState();
  }

  GetUserCultures getUserCultures = GetUserCultures();
  GetCultures getCultures = GetCultures();
  ExcludeFill excludeFill = ExcludeFill();
  ExcludeInProduct excludeInProduct = ExcludeInProduct();

  @override
  Widget build(BuildContext context) {
    final adubos = ref.watch(adubosProvider);
    final cultureReport = ref.watch(cultureReportProvider);
    final levelSelected = ref.watch(addLevelProvider);
    final phaseOption = ref.watch(selectPhaseProvider);
    final culture = ref.watch(cultureProvider);
    final userCultures = ref.watch(userCulturesProvider);
    final indexCultureSelected = ref.watch(indexCultureSelectedProvider);
    final cultureStage = ref.watch(cultureStageProvider);
    final dateProv = ref.watch(datePickerProvider);
    final deleteFillVehicle = ref.watch(deleteFillVehicleProvider);
    final deleteInProduct = ref.watch(deleteInProductProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Excluir dados"),
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
              onTap: () async {
                culture.setIsCulture();
                dateProv.setDate(DateTime.now());
                levelSelected.resetLevel();
                adubos.setNoSelection();
                adubos.resetAll();
                phaseOption.resetPhase();
                userCultures
                    .setCulturesList(await getUserCultures.getOpened());
                indexCultureSelected.resetIndex();
                cultureReport.resetAllNamesCultures();
                cultureReport.resetAllCultures();
                cultureReport.resetControllers();
                cultureReport.setAllCultures(await getCultures.getOpened());
                cultureReport
                    .setAllNamesCultures(await getCultures.getNamesOpened());
                cultureStage.setStage("exclude");
                // ignore: use_build_context_synchronously
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SelectCultureExcludePhasePage();
                    },
                  ),
                );
              },
              child: const CardHome(
                myIcon: Icons.disabled_by_default_outlined,
                color: Color(0xFFfe1a27),
                heading: 'Dado de Cultura',
                color1: Color.fromARGB(255, 255, 238, 239),
              ),
            ),
            GestureDetector(
              onTap: () async {
                deleteFillVehicle.setFills(await excludeFill.getFills());
                // ignore: use_build_context_synchronously
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ExcludeFillVehiclePage();
                    },
                  ),
                );
              },
              child: const CardHome(
                myIcon: Icons.disabled_by_default_outlined,
                color: Color(0xFFfe1a27),
                heading: 'Abastecimento',
                color1: Color.fromARGB(255, 255, 238, 239),
              ),
            ),
            GestureDetector(
              onTap: () async {
                deleteInProduct.setIns(await excludeInProduct.getIns());
                // ignore: use_build_context_synchronously
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ExcludeInProductPage();
                    },
                  ),
                );
              },
              child: const CardHome(
                myIcon: Icons.disabled_by_default_outlined,
                color: Color(0xFFfe1a27),
                heading: 'Entrada',
                color1: Color.fromARGB(255, 255, 238, 239),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
