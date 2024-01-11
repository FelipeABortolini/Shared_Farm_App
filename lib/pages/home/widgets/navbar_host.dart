import 'package:flutter/material.dart';
import 'package:flv_farm/pages/culture/historic_cultures/historic_cultures_page.dart';
import 'package:flv_farm/pages/host/products/delete_product/delete_product_page.dart';
import 'package:flv_farm/pages/reports/culture_reports/culture_reports_page.dart';
import 'package:flv_farm/pages/reports/stock_reports/stock_reports_page.dart';
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
import '../../host/locals/add_local/add_local_page.dart';
import '../../host/locals/delete_local/delete_local_page.dart';
import '../../host/locals/edit_local/edit_local_page.dart';
import '../../host/products/add_product/add_product_page.dart';
import '../../host/recipes/add_recipe/add_recipe_select_page.dart';
import '../../host/recipes/delete_recipe/del_recipe_select_page.dart';
import '../../host/recipes/edit_recipe/edit_recipe_select_page.dart';
import '../../reports/daily_reports/daily_reports_page.dart';
import '../../reports/fill_reports/fill_reports_page.dart';
import '../../host/vehicles/add_vehicle/add_vehicle_page.dart';
import '../../host/products/edit_product/edit_product_page.dart';
import '../../host/vehicles/delete_vehicle/delete_vehicle_page.dart';
import '../../host/vehicles/edit_vehicle/edit_vehicle_page.dart';
import '../../login/login_page.dart';
import '../../login/utils/auth_check.dart';
import '../../host/register_user/register_user_page.dart';

// ignore: must_be_immutable
class NavBarHost extends HookConsumerWidget {
  NavBarHost({super.key});

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
    final product = ref.watch(productProvider);
    final sidebarSubitems = ref.watch(sidebarSubitemsProvider);
    final vehicles = ref.watch(vehiclesProvider);
    final reportType = ref.watch(reportTypeProvider);
    final cultureReport = ref.watch(cultureReportProvider);
    final dailyReport = ref.watch(dailyReportProvider);
    final stockReport = ref.watch(stockReportProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final local = ref.watch(localProvider);
    final fillReport = ref.watch(fillReportProvider);
    final dateProvStart = ref.watch(datePickerStartProvider);
    final dateProvEnd = ref.watch(datePickerEndProvider);
    final dateProv = ref.watch(datePickerProvider);
    final locals = ref.watch(localsProvider);
    final culture = ref.watch(cultureProvider);
    final cultureType = ref.watch(cultureTypeProvider);
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
          const Divider(),
          ListTile(
            leading: const Icon(Icons.account_tree_rounded),
            title: const Text("Gerenciar Produtos"),
            onTap: () {
              sidebarSubitems.setVehicle(false);
              sidebarSubitems.setRecipe(false);
              sidebarSubitems.setReport(false);
              sidebarSubitems.setProduct(!sidebarSubitems.product);
            },
          ),
          Visibility(
            visible: sidebarSubitems.product,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                children: [
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.add,
                      color: Colors.blueGrey,
                    ),
                    title: const Text(
                      "Adicionar Produto",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    onTap: () {
                      levelSelected.resetLevel();
                      adubos.setNoSelection();
                      adubos.resetAll();
                      product.resetControllers();
                      sidebarSubitems.resetAll();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return AddProductPage();
                          },
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.edit,
                      color: Colors.blueGrey,
                    ),
                    title: const Text(
                      "Editar Produto",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    onTap: () {
                      levelSelected.resetLevel();
                      adubos.setNoSelection();
                      adubos.resetAll();
                      sidebarSubitems.resetAll();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return EditProductPage();
                          },
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.delete,
                      color: Colors.blueGrey,
                    ),
                    title: const Text(
                      "Excluir Produto",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    onTap: () {
                      levelSelected.resetLevel();
                      adubos.setNoSelection();
                      adubos.resetAll();
                      sidebarSubitems.resetAll();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return DelProductPage();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.directions_car_sharp),
            title: const Text("Gerenciar Veículos"),
            onTap: () {
              sidebarSubitems.setProduct(false);
              sidebarSubitems.setRecipe(false);
              sidebarSubitems.setReport(false);
              sidebarSubitems.setVehicle(!sidebarSubitems.vehicle);
            },
          ),
          Visibility(
            visible: sidebarSubitems.vehicle,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                children: [
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.add,
                      color: Colors.blueGrey,
                    ),
                    title: const Text(
                      "Adicionar Veículo",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    onTap: () {
                      sidebarSubitems.resetAll();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return AddVehiclePage();
                          },
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.edit,
                      color: Colors.blueGrey,
                    ),
                    title: const Text(
                      "Editar Veículo",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    onTap: () {
                      vehicles.setName(vehicles.vehicles[0]["name"]);
                      vehicles.setPlate(vehicles.vehicles[0]["plate"]);
                      sidebarSubitems.resetAll();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return EditVehiclePage();
                          },
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.delete,
                      color: Colors.blueGrey,
                    ),
                    title: const Text(
                      "Excluir Veículo",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    onTap: () {
                      vehicles.setName(vehicles.vehicles[0]["name"]);
                      vehicles.setPlate(vehicles.vehicles[0]["plate"]);
                      sidebarSubitems.resetAll();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return DelVehiclePage();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text("Locais de Entrega"),
            onTap: () {
              sidebarSubitems.setProduct(false);
              sidebarSubitems.setRecipe(false);
              sidebarSubitems.setReport(false);
              sidebarSubitems.setVehicle(false);
              sidebarSubitems.setLocal(!sidebarSubitems.local);
            },
          ),
          Visibility(
            visible: sidebarSubitems.local,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                children: [
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.add,
                      color: Colors.blueGrey,
                    ),
                    title: const Text(
                      "Adicionar Local",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    onTap: () {
                      locals.resetControllers();
                      sidebarSubitems.resetAll();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return AddLocalPage();
                          },
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.edit,
                      color: Colors.blueGrey,
                    ),
                    title: const Text(
                      "Editar Local",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    onTap: () {
                      locals.resetControllers();
                      if (locals.locals.isNotEmpty) {
                        locals.setSelected(locals.locals[0]["ID"]);
                      }
                      if (locals.selected != null) {
                        locals.setName(locals
                            .locals[int.parse(locals.selected!) - 1]["name"]);
                      }
                      sidebarSubitems.resetAll();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return EditLocalPage();
                          },
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.delete,
                      color: Colors.blueGrey,
                    ),
                    title: const Text(
                      "Excluir Local",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    onTap: () {
                      locals.resetControllers();
                      if (locals.locals.isNotEmpty) {
                        locals.setSelected(locals.locals[0]["ID"]);
                      }
                      sidebarSubitems.resetAll();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return DelLocalPage();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.menu_book_rounded),
            title: const Text("Gerenciar Receitas"),
            onTap: () {
              culture.resetIsCulture();
              sidebarSubitems.setProduct(false);
              sidebarSubitems.setVehicle(false);
              sidebarSubitems.setReport(false);
              sidebarSubitems.setRecipe(!sidebarSubitems.recipe);
            },
          ),
          Visibility(
            visible: sidebarSubitems.recipe,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                children: [
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.add,
                      color: Colors.blueGrey,
                    ),
                    title: const Text(
                      "Adicionar Receita",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    onTap: () {
                      cultureType.setSoja();
                      culture.resetIsCulture();
                      phaseOption.resetPhase();
                      sidebarSubitems.resetAll();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return AddRecipeSelectPage();
                          },
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.edit,
                      color: Colors.blueGrey,
                    ),
                    title: const Text(
                      "Editar Receita",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    onTap: () {
                      cultureType.setSoja();
                      culture.resetIsCulture();
                      phaseOption.resetPhase();
                      sidebarSubitems.resetAll();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return EditRecipeSelectPage();
                          },
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.cleaning_services,
                      color: Colors.blueGrey,
                    ),
                    title: const Text(
                      "Limpar Receita",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    onTap: () {
                      cultureType.setSoja();
                      culture.resetIsCulture();
                      phaseOption.resetPhase();
                      sidebarSubitems.resetAll();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return DelRecipeSelectPage();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          Visibility(
            visible: user.currentUser["permission"] == "Host",
            child: Column(
              children: [
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.account_circle_sharp),
                  title: const Text("Cadastrar Usuário"),
                  onTap: () {
                    sidebarSubitems.resetAll();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const RegisterUserPage();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Platform.isAndroid
          // ?
          Column(
            children: [
              const Divider(),
              ListTile(
                leading: const Icon(Icons.edit_document),
                title: const Text("Relatórios"),
                onTap: () {
                  sidebarSubitems.setProduct(false);
                  sidebarSubitems.setVehicle(false);
                  sidebarSubitems.setReport(!sidebarSubitems.report);
                  sidebarSubitems.setRecipe(false);
                },
              ),
              Visibility(
                visible: sidebarSubitems.report,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      const Divider(),
                      ListTile(
                        leading: const Icon(
                          Icons.today,
                          color: Colors.blueGrey,
                        ),
                        title: const Text(
                          "Relatório Diário",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                        onTap: () {
                          dateProv.setDate(DateTime.now());
                          local.allUnselected();
                          dailyReport.resetControllers();
                          reportType.setDaily();
                          sidebarSubitems.resetAll();
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return DailyReportPage();
                              },
                            ),
                          );
                        },
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(
                          Icons.grass_outlined,
                          color: Colors.blueGrey,
                        ),
                        title: const Text(
                          "Relatório de Cultura",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                        onTap: () async {
                          cultureReport.resetAllNamesCultures();
                          cultureReport.resetAllCultures();
                          cultureReport.resetControllers();
                          cultureReport
                              .setAllCultures(await getCultures.getAll());
                          cultureReport.setAllNamesCultures(
                              await getCultures.getNames());
                          reportType.setCulture();
                          sidebarSubitems.resetAll();
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return CulturesReportPage();
                              },
                            ),
                          );
                        },
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(
                          Icons.now_widgets_sharp,
                          color: Colors.blueGrey,
                        ),
                        title: const Text(
                          "Relatório de Estoque",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                        onTap: () {
                          fullHistory.resetControllers();
                          dateProvStart.resetDate();
                          dateProvEnd.resetDate();
                          local.allUnselected();
                          selectedCategory.allUnselected();
                          stockReport.resetControllers();
                          reportType.setStock();
                          sidebarSubitems.resetAll();
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return StockReportPage();
                              },
                            ),
                          );
                        },
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(
                          Icons.local_gas_station_rounded,
                          color: Colors.blueGrey,
                        ),
                        title: const Text(
                          "Relatório de Abastecimento",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                        onTap: () {
                          fullHistory.resetControllers();
                          dateProvStart.resetDate();
                          dateProvEnd.resetDate();
                          local.allUnselected();
                          fillReport.resetControllers();
                          reportType.setFill();
                          sidebarSubitems.resetAll();
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return FillReportPage();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // : const SizedBox(height: 1),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text("Histórico de Culturas"),
            onTap: () async {
              sidebarSubitems.resetAll();
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
          const Divider(),
          ListTile(
            leading: const Icon(Icons.cloud_download_rounded),
            title: const Text("Sincronizar"),
            onTap: () async {
              sidebarSubitems.resetAll();
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
              sidebarSubitems.resetAll();
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
              sidebarSubitems.resetAll();
              auth.logout(user);
              // ignore: use_build_context_synchronously
              Navigator.of(context).push(
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
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
