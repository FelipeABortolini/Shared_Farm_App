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
import 'exclude_phase_culture/exclude_phase_culture_page.dart';
import 'exclude_phase_culture/select_culture_exclude_phase_page.dart';
import 'reactive_culture/reactive_culture_page.dart';

class CultureHome extends StatefulHookConsumerWidget {
  const CultureHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CultureHomeState createState() => _CultureHomeState();
}

class _CultureHomeState extends ConsumerState<CultureHome> {
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
    final vehicles = ref.watch(vehiclesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Culturas"),
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
            Visibility(
              visible: user.currentUser["permission"] == "Host" ||
                  user.currentUser["permission"] == "Gerencial",
              child: GestureDetector(
                onTap: () {
                  vehicles.setName(vehicles.vehicles[0]["name"]);
                  vehicles.setPlate(vehicles.vehicles[0]["plate"]);
                  culture.setIsCulture();
                  dateProv.setDate(DateTime.now());
                  local.setSantaTerezinha();
                  levelSelected.resetLevel();
                  adubos.setNoSelection();
                  adubos.resetAll();
                  phaseOption.resetPhase();
                  culture.resetControllers();
                  cultureStage.setStage("start");
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return StartCulturePage();
                      },
                    ),
                  );
                },
                child: const CardHome(
                  myIcon: Icons.start,
                  color: Color(0xFFfe1a27),
                  heading: 'Iniciar Cultura',
                  color1: Color.fromARGB(255, 255, 238, 239),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                vehicles.setName(vehicles.vehicles[0]["name"]);
                vehicles.setPlate(vehicles.vehicles[0]["plate"]);
                culture.setIsCulture();
                dateProv.setDate(DateTime.now());
                levelSelected.resetLevel();
                adubos.setNoSelection();
                adubos.resetAll();
                phaseOption.resetPhase();
                userCultures.setCulturesList(await getUserCultures.getOpened());
                indexCultureSelected.resetIndex();
                cultureStage.setStage("continue");
                // ignore: use_build_context_synchronously
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ContinueCulturePage();
                    },
                  ),
                );
              },
              child: const CardHome(
                myIcon: Icons.change_circle_outlined,
                color: Color(0xFFfe1a27),
                heading: 'Continuar Cultura',
                color1: Color.fromARGB(255, 255, 238, 239),
              ),
            ),
            Visibility(
              visible: user.currentUser["permission"] == "Host" ||
                  user.currentUser["permission"] == "Gerencial",
              child: GestureDetector(
                onTap: () async {
                  vehicles.setName(vehicles.vehicles[0]["name"]);
                  vehicles.setPlate(vehicles.vehicles[0]["plate"]);
                  culture.setIsCulture();
                  dateProv.setDate(DateTime.now());
                  levelSelected.resetLevel();
                  adubos.setNoSelection();
                  adubos.resetAll();
                  phaseOption.resetPhase();
                  userCultures
                      .setCulturesList(await getUserCultures.getOpened());
                  indexCultureSelected.resetIndex();
                  cultureStage.setStage("finish");
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return FinishCulturePage();
                      },
                    ),
                  );
                },
                child: const CardHome(
                  myIcon: Icons.done_outline_outlined,
                  color: Color(0xFFfe1a27),
                  heading: 'Finalizar Cultura',
                  color1: Color.fromARGB(255, 255, 238, 239),
                ),
              ),
            ),
            Visibility(
              visible: user.currentUser["permission"] == "Host" ||
                  user.currentUser["permission"] == "Gerencial",
              child: GestureDetector(
                onTap: () async {
                  culture.setIsCulture();
                  cultureReport
                      .setAllNamesCultures(await getCultures.getClosedNames());
                  indexCultureSelected.resetIndex();
                  cultureStage.setStage("reactive");
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ReactiveCulturePage();
                      },
                    ),
                  );
                },
                child: const CardHome(
                  myIcon: Icons.restart_alt_rounded,
                  color: Color(0xFFfe1a27),
                  heading: 'Reativar Cultura',
                  color1: Color.fromARGB(255, 255, 238, 239),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
