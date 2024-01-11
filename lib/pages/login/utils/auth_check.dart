import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/auth_service.dart';
import '../../../providers/providers.dart';
import '../../../shared/get_products.dart';
import '../../sync/sync_page.dart';
import '../login_page.dart';
import 'sync_categories_for_cultures.dart';

// ignore: must_be_immutable
class AuthCheck extends HookConsumerWidget {
  AuthCheck({required this.first, Key? key}) : super(key: key);

  bool first = false;

  final sync = SyncCategoriesForCulture();

  void getAll(
    adubos,
    sementes,
    inseticidas,
    herbicidas,
    fungicidas,
    adjuvantes,
    inoculantes,
    diesel,
    fertilizantesFoliares,
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
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authServiceProvider);
    final adubos = ref.watch(adubosProvider);
    final sementes = ref.watch(sementesProvider);
    final inseticidas = ref.watch(inseticidasProvider);
    final herbicidas = ref.watch(herbicidasProvider);
    final fungicidas = ref.watch(fungicidasProvider);
    final adjuvantes = ref.watch(adjuvantesProvider);
    final inoculantes = ref.watch(inoculantesProvider);
    final diesel = ref.watch(dieselProvider);
    final fertilizantesFoliares = ref.watch(fertilizantesFoliaresProvider);

    final adubos1 = ref.watch(adubos1Provider);
    final adubos2 = ref.watch(adubos2Provider);
    final adubos3 = ref.watch(adubos3Provider);
    final adubos4 = ref.watch(adubos4Provider);
    final adubos5 = ref.watch(adubos5Provider);
    final adubos6 = ref.watch(adubos6Provider);
    final adubos7 = ref.watch(adubos7Provider);
    final adubos8 = ref.watch(adubos8Provider);
    final adubos9 = ref.watch(adubos9Provider);
    final adubos10 = ref.watch(adubos10Provider);
    final sementes1 = ref.watch(sementes1Provider);
    final sementes2 = ref.watch(sementes2Provider);
    final sementes3 = ref.watch(sementes3Provider);
    final sementes4 = ref.watch(sementes4Provider);
    final sementes5 = ref.watch(sementes5Provider);
    final sementes6 = ref.watch(sementes6Provider);
    final sementes7 = ref.watch(sementes7Provider);
    final sementes8 = ref.watch(sementes8Provider);
    final sementes9 = ref.watch(sementes9Provider);
    final sementes10 = ref.watch(sementes10Provider);
    final inseticidas1 = ref.watch(inseticidas1Provider);
    final inseticidas2 = ref.watch(inseticidas2Provider);
    final inseticidas3 = ref.watch(inseticidas3Provider);
    final inseticidas4 = ref.watch(inseticidas4Provider);
    final inseticidas5 = ref.watch(inseticidas5Provider);
    final inseticidas6 = ref.watch(inseticidas6Provider);
    final inseticidas7 = ref.watch(inseticidas7Provider);
    final inseticidas8 = ref.watch(inseticidas8Provider);
    final inseticidas9 = ref.watch(inseticidas9Provider);
    final inseticidas10 = ref.watch(inseticidas10Provider);
    final herbicidas1 = ref.watch(herbicidas1Provider);
    final herbicidas2 = ref.watch(herbicidas2Provider);
    final herbicidas3 = ref.watch(herbicidas3Provider);
    final herbicidas4 = ref.watch(herbicidas4Provider);
    final herbicidas5 = ref.watch(herbicidas5Provider);
    final herbicidas6 = ref.watch(herbicidas6Provider);
    final herbicidas7 = ref.watch(herbicidas7Provider);
    final herbicidas8 = ref.watch(herbicidas8Provider);
    final herbicidas9 = ref.watch(herbicidas9Provider);
    final herbicidas10 = ref.watch(herbicidas10Provider);
    final fungicidas1 = ref.watch(fungicidas1Provider);
    final fungicidas2 = ref.watch(fungicidas2Provider);
    final fungicidas3 = ref.watch(fungicidas3Provider);
    final fungicidas4 = ref.watch(fungicidas4Provider);
    final fungicidas5 = ref.watch(fungicidas5Provider);
    final fungicidas6 = ref.watch(fungicidas6Provider);
    final fungicidas7 = ref.watch(fungicidas7Provider);
    final fungicidas8 = ref.watch(fungicidas8Provider);
    final fungicidas9 = ref.watch(fungicidas9Provider);
    final fungicidas10 = ref.watch(fungicidas10Provider);
    final adjuvantes1 = ref.watch(adjuvantes1Provider);
    final adjuvantes2 = ref.watch(adjuvantes2Provider);
    final adjuvantes3 = ref.watch(adjuvantes3Provider);
    final adjuvantes4 = ref.watch(adjuvantes4Provider);
    final adjuvantes5 = ref.watch(adjuvantes5Provider);
    final adjuvantes6 = ref.watch(adjuvantes6Provider);
    final adjuvantes7 = ref.watch(adjuvantes7Provider);
    final adjuvantes8 = ref.watch(adjuvantes8Provider);
    final adjuvantes9 = ref.watch(adjuvantes9Provider);
    final adjuvantes10 = ref.watch(adjuvantes10Provider);
    final inoculantes1 = ref.watch(inoculantes1Provider);
    final inoculantes2 = ref.watch(inoculantes2Provider);
    final inoculantes3 = ref.watch(inoculantes3Provider);
    final inoculantes4 = ref.watch(inoculantes4Provider);
    final inoculantes5 = ref.watch(inoculantes5Provider);
    final inoculantes6 = ref.watch(inoculantes6Provider);
    final inoculantes7 = ref.watch(inoculantes7Provider);
    final inoculantes8 = ref.watch(inoculantes8Provider);
    final inoculantes9 = ref.watch(inoculantes9Provider);
    final inoculantes10 = ref.watch(inoculantes10Provider);
    final diesel1 = ref.watch(diesel1Provider);
    final diesel2 = ref.watch(diesel2Provider);
    final diesel3 = ref.watch(diesel3Provider);
    final diesel4 = ref.watch(diesel4Provider);
    final diesel5 = ref.watch(diesel5Provider);
    final diesel6 = ref.watch(diesel6Provider);
    final diesel7 = ref.watch(diesel7Provider);
    final diesel8 = ref.watch(diesel8Provider);
    final diesel9 = ref.watch(diesel9Provider);
    final diesel10 = ref.watch(diesel10Provider);
    final fertilizantesFoliares1 = ref.watch(fertilizantesFoliares1Provider);
    final fertilizantesFoliares2 = ref.watch(fertilizantesFoliares2Provider);
    final fertilizantesFoliares3 = ref.watch(fertilizantesFoliares3Provider);
    final fertilizantesFoliares4 = ref.watch(fertilizantesFoliares4Provider);
    final fertilizantesFoliares5 = ref.watch(fertilizantesFoliares5Provider);
    final fertilizantesFoliares6 = ref.watch(fertilizantesFoliares6Provider);
    final fertilizantesFoliares7 = ref.watch(fertilizantesFoliares7Provider);
    final fertilizantesFoliares8 = ref.watch(fertilizantesFoliares8Provider);
    final fertilizantesFoliares9 = ref.watch(fertilizantesFoliares9Provider);
    final fertilizantesFoliares10 = ref.watch(fertilizantesFoliares10Provider);
    final vehicles = ref.watch(vehiclesProvider);
    final locals = ref.watch(localsProvider);
    final recipes = ref.watch(recipeProvider);
    final user = ref.watch(userProvider);

    // print('auth.usuario: ${auth.usuario}');

    if (auth.usuario == null) {
      return LoginPage();
    } else {
      return SyncPage(
        adubos: adubos,
        sementes: sementes,
        inseticidas: inseticidas,
        herbicidas: herbicidas,
        fungicidas: fungicidas,
        adjuvantes: adjuvantes,
        inoculantes: inoculantes,
        diesel: diesel,
        fertilizantesFoliares: fertilizantesFoliares,
        adubos1: adubos1,
        adubos2: adubos2,
        adubos3: adubos3,
        adubos4: adubos4,
        adubos5: adubos5,
        adubos6: adubos6,
        adubos7: adubos7,
        adubos8: adubos8,
        adubos9: adubos9,
        adubos10: adubos10,
        sementes1: sementes1,
        sementes2: sementes2,
        sementes3: sementes3,
        sementes4: sementes4,
        sementes5: sementes5,
        sementes6: sementes6,
        sementes7: sementes7,
        sementes8: sementes8,
        sementes9: sementes9,
        sementes10: sementes10,
        inseticidas1: inseticidas1,
        inseticidas2: inseticidas2,
        inseticidas3: inseticidas3,
        inseticidas4: inseticidas4,
        inseticidas5: inseticidas5,
        inseticidas6: inseticidas6,
        inseticidas7: inseticidas7,
        inseticidas8: inseticidas8,
        inseticidas9: inseticidas9,
        inseticidas10: inseticidas10,
        herbicidas1: herbicidas1,
        herbicidas2: herbicidas2,
        herbicidas3: herbicidas3,
        herbicidas4: herbicidas4,
        herbicidas5: herbicidas5,
        herbicidas6: herbicidas6,
        herbicidas7: herbicidas7,
        herbicidas8: herbicidas8,
        herbicidas9: herbicidas9,
        herbicidas10: herbicidas10,
        fungicidas1: fungicidas1,
        fungicidas2: fungicidas2,
        fungicidas3: fungicidas3,
        fungicidas4: fungicidas4,
        fungicidas5: fungicidas5,
        fungicidas6: fungicidas6,
        fungicidas7: fungicidas7,
        fungicidas8: fungicidas8,
        fungicidas9: fungicidas9,
        fungicidas10: fungicidas10,
        adjuvantes1: adjuvantes1,
        adjuvantes2: adjuvantes2,
        adjuvantes3: adjuvantes3,
        adjuvantes4: adjuvantes4,
        adjuvantes5: adjuvantes5,
        adjuvantes6: adjuvantes6,
        adjuvantes7: adjuvantes7,
        adjuvantes8: adjuvantes8,
        adjuvantes9: adjuvantes9,
        adjuvantes10: adjuvantes10,
        inoculantes1: inoculantes1,
        inoculantes2: inoculantes2,
        inoculantes3: inoculantes3,
        inoculantes4: inoculantes4,
        inoculantes5: inoculantes5,
        inoculantes6: inoculantes6,
        inoculantes7: inoculantes7,
        inoculantes8: inoculantes8,
        inoculantes9: inoculantes9,
        inoculantes10: inoculantes10,
        diesel1: diesel1,
        diesel2: diesel2,
        diesel3: diesel3,
        diesel4: diesel4,
        diesel5: diesel5,
        diesel6: diesel6,
        diesel7: diesel7,
        diesel8: diesel8,
        diesel9: diesel9,
        diesel10: diesel10,
        fertilizantesFoliares1: fertilizantesFoliares1,
        fertilizantesFoliares2: fertilizantesFoliares2,
        fertilizantesFoliares3: fertilizantesFoliares3,
        fertilizantesFoliares4: fertilizantesFoliares4,
        fertilizantesFoliares5: fertilizantesFoliares5,
        fertilizantesFoliares6: fertilizantesFoliares6,
        fertilizantesFoliares7: fertilizantesFoliares7,
        fertilizantesFoliares8: fertilizantesFoliares8,
        fertilizantesFoliares9: fertilizantesFoliares9,
        fertilizantesFoliares10: fertilizantesFoliares10,
        vehicles: vehicles,
        locals: locals,
        recipes: recipes,
        auth: auth,
        first: first,
        user: user,
      );
    }
  }
}
