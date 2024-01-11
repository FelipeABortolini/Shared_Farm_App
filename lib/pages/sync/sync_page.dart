// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flv_farm/pages/home/host_home_page.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/category_models/fertilizantes_foliares_controller.dart';
import '../../controllers/category_models/adjuvantes_controller.dart';
import '../../controllers/category_models/adubos_controller.dart';
import '../../controllers/category_models/diesel_controller.dart';
import '../../controllers/category_models/fungicidas_controller.dart';
import '../../controllers/category_models/herbicidas_controller.dart';
import '../../controllers/category_models/inoculantes_controller.dart';
import '../../controllers/category_models/inseticidas_controller.dart';
import '../../controllers/category_models/sementes_controller.dart';
import '../../controllers/locals_controller.dart';
import '../../controllers/recipe_controller.dart';
import '../../controllers/user_controller.dart';
import '../../controllers/vehicles/vehicles_controller.dart';
import '../../core/auth_service.dart';
import '../../db/locals/utils/get_locals.dart';
import '../../db/recipes/utils/get_recipes.dart';
import '../../db/user_register.dart';
import '../../db/vehicles/utils/get_vehicles.dart';
import '../../shared/get_products.dart';
import '../home/home_page.dart';
import '../login/utils/sync_categories_for_cultures.dart';

// ignore: must_be_immutable
class SyncPage extends StatefulWidget {
  final AdubosController adubos;
  final SementesController sementes;
  final InseticidasController inseticidas;
  final HerbicidasController herbicidas;
  final FungicidasController fungicidas;
  final AdjuvantesController adjuvantes;
  final InoculantesController inoculantes;
  final FertilizantesFoliaresController fertilizantesFoliares;
  final DieselController diesel;
  final AdubosController adubos1;
  final AdubosController adubos2;
  final AdubosController adubos3;
  final AdubosController adubos4;
  final AdubosController adubos5;
  final AdubosController adubos6;
  final AdubosController adubos7;
  final AdubosController adubos8;
  final AdubosController adubos9;
  final AdubosController adubos10;
  final SementesController sementes1;
  final SementesController sementes2;
  final SementesController sementes3;
  final SementesController sementes4;
  final SementesController sementes5;
  final SementesController sementes6;
  final SementesController sementes7;
  final SementesController sementes8;
  final SementesController sementes9;
  final SementesController sementes10;
  final InseticidasController inseticidas1;
  final InseticidasController inseticidas2;
  final InseticidasController inseticidas3;
  final InseticidasController inseticidas4;
  final InseticidasController inseticidas5;
  final InseticidasController inseticidas6;
  final InseticidasController inseticidas7;
  final InseticidasController inseticidas8;
  final InseticidasController inseticidas9;
  final InseticidasController inseticidas10;
  final HerbicidasController herbicidas1;
  final HerbicidasController herbicidas2;
  final HerbicidasController herbicidas3;
  final HerbicidasController herbicidas4;
  final HerbicidasController herbicidas5;
  final HerbicidasController herbicidas6;
  final HerbicidasController herbicidas7;
  final HerbicidasController herbicidas8;
  final HerbicidasController herbicidas9;
  final HerbicidasController herbicidas10;
  final FungicidasController fungicidas1;
  final FungicidasController fungicidas2;
  final FungicidasController fungicidas3;
  final FungicidasController fungicidas4;
  final FungicidasController fungicidas5;
  final FungicidasController fungicidas6;
  final FungicidasController fungicidas7;
  final FungicidasController fungicidas8;
  final FungicidasController fungicidas9;
  final FungicidasController fungicidas10;
  final AdjuvantesController adjuvantes1;
  final AdjuvantesController adjuvantes2;
  final AdjuvantesController adjuvantes3;
  final AdjuvantesController adjuvantes4;
  final AdjuvantesController adjuvantes5;
  final AdjuvantesController adjuvantes6;
  final AdjuvantesController adjuvantes7;
  final AdjuvantesController adjuvantes8;
  final AdjuvantesController adjuvantes9;
  final AdjuvantesController adjuvantes10;
  final InoculantesController inoculantes1;
  final InoculantesController inoculantes2;
  final InoculantesController inoculantes3;
  final InoculantesController inoculantes4;
  final InoculantesController inoculantes5;
  final InoculantesController inoculantes6;
  final InoculantesController inoculantes7;
  final InoculantesController inoculantes8;
  final InoculantesController inoculantes9;
  final InoculantesController inoculantes10;
  final DieselController diesel1;
  final DieselController diesel2;
  final DieselController diesel3;
  final DieselController diesel4;
  final DieselController diesel5;
  final DieselController diesel6;
  final DieselController diesel7;
  final DieselController diesel8;
  final DieselController diesel9;
  final DieselController diesel10;
  final FertilizantesFoliaresController fertilizantesFoliares1;
  final FertilizantesFoliaresController fertilizantesFoliares2;
  final FertilizantesFoliaresController fertilizantesFoliares3;
  final FertilizantesFoliaresController fertilizantesFoliares4;
  final FertilizantesFoliaresController fertilizantesFoliares5;
  final FertilizantesFoliaresController fertilizantesFoliares6;
  final FertilizantesFoliaresController fertilizantesFoliares7;
  final FertilizantesFoliaresController fertilizantesFoliares8;
  final FertilizantesFoliaresController fertilizantesFoliares9;
  final FertilizantesFoliaresController fertilizantesFoliares10;
  final VehiclesController vehicles;
  final LocalsController locals;
  final RecipeController recipes;
  final AuthService auth;
  final bool first;
  final UserController user;

  const SyncPage({
    Key? key,
    required this.adubos,
    required this.sementes,
    required this.inseticidas,
    required this.herbicidas,
    required this.fungicidas,
    required this.adjuvantes,
    required this.inoculantes,
    required this.diesel,
    required this.fertilizantesFoliares,
    required this.adubos1,
    required this.adubos2,
    required this.adubos3,
    required this.adubos4,
    required this.adubos5,
    required this.adubos6,
    required this.adubos7,
    required this.adubos8,
    required this.adubos9,
    required this.adubos10,
    required this.sementes1,
    required this.sementes2,
    required this.sementes3,
    required this.sementes4,
    required this.sementes5,
    required this.sementes6,
    required this.sementes7,
    required this.sementes8,
    required this.sementes9,
    required this.sementes10,
    required this.inseticidas1,
    required this.inseticidas2,
    required this.inseticidas3,
    required this.inseticidas4,
    required this.inseticidas5,
    required this.inseticidas6,
    required this.inseticidas7,
    required this.inseticidas8,
    required this.inseticidas9,
    required this.inseticidas10,
    required this.herbicidas1,
    required this.herbicidas2,
    required this.herbicidas3,
    required this.herbicidas4,
    required this.herbicidas5,
    required this.herbicidas6,
    required this.herbicidas7,
    required this.herbicidas8,
    required this.herbicidas9,
    required this.herbicidas10,
    required this.fungicidas1,
    required this.fungicidas2,
    required this.fungicidas3,
    required this.fungicidas4,
    required this.fungicidas5,
    required this.fungicidas6,
    required this.fungicidas7,
    required this.fungicidas8,
    required this.fungicidas9,
    required this.fungicidas10,
    required this.adjuvantes1,
    required this.adjuvantes2,
    required this.adjuvantes3,
    required this.adjuvantes4,
    required this.adjuvantes5,
    required this.adjuvantes6,
    required this.adjuvantes7,
    required this.adjuvantes8,
    required this.adjuvantes9,
    required this.adjuvantes10,
    required this.inoculantes1,
    required this.inoculantes2,
    required this.inoculantes3,
    required this.inoculantes4,
    required this.inoculantes5,
    required this.inoculantes6,
    required this.inoculantes7,
    required this.inoculantes8,
    required this.inoculantes9,
    required this.inoculantes10,
    required this.diesel1,
    required this.diesel2,
    required this.diesel3,
    required this.diesel4,
    required this.diesel5,
    required this.diesel6,
    required this.diesel7,
    required this.diesel8,
    required this.diesel9,
    required this.diesel10,
    required this.fertilizantesFoliares1,
    required this.fertilizantesFoliares2,
    required this.fertilizantesFoliares3,
    required this.fertilizantesFoliares4,
    required this.fertilizantesFoliares5,
    required this.fertilizantesFoliares6,
    required this.fertilizantesFoliares7,
    required this.fertilizantesFoliares8,
    required this.fertilizantesFoliares9,
    required this.fertilizantesFoliares10,
    required this.vehicles,
    required this.locals,
    required this.recipes,
    required this.auth,
    required this.first,
    required this.user,
  }) : super(key: key);

  @override
  State<SyncPage> createState() => _SyncPageState();
}

class _SyncPageState extends State<SyncPage> {
  final sync = SyncCategoriesForCulture();

  GetVehicles getVehicles = GetVehicles();
  GetLocals getLocals = GetLocals();
  GetRecipes getRecipes = GetRecipes();
  UserRegister userGet = UserRegister();

  bool isLoading = true;

  Future<void> setUser(UserController user, AuthService auth) async {
    user.setCurrentUser({
      "name": auth.usuario!.displayName,
      "permission": await userGet.getPermission(auth.usuario!.displayName!)
    });
  }

  Future<int> getAll(
    adubos,
    sementes,
    inseticidas,
    herbicidas,
    fungicidas,
    adjuvantes,
    inoculantes,
    diesel,
    fertilizantesFoliares,
    vehicles,
    locals,
    recipes,
    first,
  ) async {
    await getProducts(adubos, "adubo");
    await getProducts(sementes, "semente");
    await getProducts(inseticidas, "inseticida");
    await getProducts(herbicidas, "herbicida");
    await getProducts(fungicidas, "fungicida");
    await getProducts(adjuvantes, "adjuvante");
    await getProducts(inoculantes, "inoculante");
    await getProducts(diesel, "diesel");
    await getProducts(fertilizantesFoliares, "fertilizanteFoliar");
    vehicles.setVehicles(await getVehicles.get());
    locals.setLocals(await getLocals.get());
    if (vehicles.vehicles.isNotEmpty) {
      vehicles.selected = vehicles.vehicles[0]["ID"];
    }
    if (locals.locals.isNotEmpty) {
      locals.selected = locals.locals[0]["ID"];
    }
    if (first) {
      recipes.setAll(await getRecipes.get());
    }
    return 0;
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () async {
      if (widget.first) {
        setUser(widget.user, widget.auth);
      }
      await getAll(
        widget.adubos,
        widget.sementes,
        widget.inseticidas,
        widget.herbicidas,
        widget.fungicidas,
        widget.adjuvantes,
        widget.inoculantes,
        widget.diesel,
        widget.fertilizantesFoliares,
        widget.vehicles,
        widget.locals,
        widget.recipes,
        widget.first,
      );
      sync.sync([
        widget.adubos,
        widget.adubos1,
        widget.adubos2,
        widget.adubos3,
        widget.adubos4,
        widget.adubos5,
        widget.adubos6,
        widget.adubos7,
        widget.adubos8,
        widget.adubos9,
        widget.adubos10,
      ], [
        widget.sementes,
        widget.sementes1,
        widget.sementes2,
        widget.sementes3,
        widget.sementes4,
        widget.sementes5,
        widget.sementes6,
        widget.sementes7,
        widget.sementes8,
        widget.sementes9,
        widget.sementes10,
      ], [
        widget.inseticidas,
        widget.inseticidas1,
        widget.inseticidas2,
        widget.inseticidas3,
        widget.inseticidas4,
        widget.inseticidas5,
        widget.inseticidas6,
        widget.inseticidas7,
        widget.inseticidas8,
        widget.inseticidas9,
        widget.inseticidas10,
      ], [
        widget.herbicidas,
        widget.herbicidas1,
        widget.herbicidas2,
        widget.herbicidas3,
        widget.herbicidas4,
        widget.herbicidas5,
        widget.herbicidas6,
        widget.herbicidas7,
        widget.herbicidas8,
        widget.herbicidas9,
        widget.herbicidas10,
      ], [
        widget.fungicidas,
        widget.fungicidas1,
        widget.fungicidas2,
        widget.fungicidas3,
        widget.fungicidas4,
        widget.fungicidas5,
        widget.fungicidas6,
        widget.fungicidas7,
        widget.fungicidas8,
        widget.fungicidas9,
        widget.fungicidas10,
      ], [
        widget.adjuvantes,
        widget.adjuvantes1,
        widget.adjuvantes2,
        widget.adjuvantes3,
        widget.adjuvantes4,
        widget.adjuvantes5,
        widget.adjuvantes6,
        widget.adjuvantes7,
        widget.adjuvantes8,
        widget.adjuvantes9,
        widget.adjuvantes10,
      ], [
        widget.inoculantes,
        widget.inoculantes1,
        widget.inoculantes2,
        widget.inoculantes3,
        widget.inoculantes4,
        widget.inoculantes5,
        widget.inoculantes6,
        widget.inoculantes7,
        widget.inoculantes8,
        widget.inoculantes9,
        widget.inoculantes10,
      ], [
        widget.diesel,
        widget.diesel1,
        widget.diesel2,
        widget.diesel3,
        widget.diesel4,
        widget.diesel5,
        widget.diesel6,
        widget.diesel7,
        widget.diesel8,
        widget.diesel9,
        widget.diesel10,
      ], [
        widget.fertilizantesFoliares,
        widget.fertilizantesFoliares1,
        widget.fertilizantesFoliares2,
        widget.fertilizantesFoliares3,
        widget.fertilizantesFoliares4,
        widget.fertilizantesFoliares5,
        widget.fertilizantesFoliares6,
        widget.fertilizantesFoliares7,
        widget.fertilizantesFoliares8,
        widget.fertilizantesFoliares9,
        widget.fertilizantesFoliares10,
      ]);
      if (widget.user.currentUser["permission"] == "Host" || widget.user.currentUser["permission"] == "Gerencial") {
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
              "Sincronizando dados...",
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
