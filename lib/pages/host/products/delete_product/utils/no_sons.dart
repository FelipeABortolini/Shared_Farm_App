import '../../../../../controllers/category_models/adjuvantes_controller.dart';
import '../../../../../controllers/category_models/adubos_controller.dart';
import '../../../../../controllers/category_models/diesel_controller.dart';
import '../../../../../controllers/category_models/fertilizantes_foliares_controller.dart';
import '../../../../../controllers/category_models/fungicidas_controller.dart';
import '../../../../../controllers/category_models/herbicidas_controller.dart';
import '../../../../../controllers/category_models/inoculantes_controller.dart';
import '../../../../../controllers/category_models/inseticidas_controller.dart';
import '../../../../../controllers/category_models/sementes_controller.dart';
import '../../../../../controllers/products/seleceted_category_controller.dart';

bool noSonsFun(
    int level,
    SelectedCategoryController selectedCategory,
    AdubosController adubos,
    SementesController sementes,
    InseticidasController inseticidas,
    FungicidasController fungicidas,
    HerbicidasController herbicidas,
    AdjuvantesController adjuvantes,
    InoculantesController inoculantes,
    DieselController diesel,
    FertilizantesFoliaresController fertilizantesFoliares) {
  bool noSons = false;
  switch (level) {
    case 1:
      if (selectedCategory.adubos) {
        adubos.filteredNivel2.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.sementes) {
        sementes.filteredNivel2.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.inseticidas) {
        inseticidas.filteredNivel2.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.herbicidas) {
        herbicidas.filteredNivel2.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.fungicidas) {
        fungicidas.filteredNivel2.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.adjuvantes) {
        adjuvantes.filteredNivel2.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.inoculantes) {
        inoculantes.filteredNivel2.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.diesel) {
        diesel.filteredNivel2.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.fertilizantesFoliares) {
        fertilizantesFoliares.filteredNivel2.isEmpty
            ? noSons = true
            : noSons = false;
      }
      break;
    case 2:
      if (selectedCategory.adubos) {
        adubos.filteredNivel3.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.sementes) {
        sementes.filteredNivel3.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.inseticidas) {
        inseticidas.filteredNivel3.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.herbicidas) {
        herbicidas.filteredNivel3.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.fungicidas) {
        fungicidas.filteredNivel3.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.adjuvantes) {
        adjuvantes.filteredNivel3.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.inoculantes) {
        inoculantes.filteredNivel3.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.diesel) {
        diesel.filteredNivel3.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.fertilizantesFoliares) {
        fertilizantesFoliares.filteredNivel3.isEmpty
            ? noSons = true
            : noSons = false;
      }
      break;
    case 3:
      if (selectedCategory.adubos) {
        adubos.filteredNivel4.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.sementes) {
        sementes.filteredNivel4.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.inseticidas) {
        inseticidas.filteredNivel4.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.herbicidas) {
        herbicidas.filteredNivel4.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.fungicidas) {
        fungicidas.filteredNivel4.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.adjuvantes) {
        adjuvantes.filteredNivel4.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.inoculantes) {
        inoculantes.filteredNivel4.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.diesel) {
        diesel.filteredNivel4.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.fertilizantesFoliares) {
        fertilizantesFoliares.filteredNivel4.isEmpty
            ? noSons = true
            : noSons = false;
      }
      break;
    case 4:
      if (selectedCategory.adubos) {
        adubos.filteredNivel5.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.sementes) {
        sementes.filteredNivel5.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.inseticidas) {
        inseticidas.filteredNivel5.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.herbicidas) {
        herbicidas.filteredNivel5.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.fungicidas) {
        fungicidas.filteredNivel5.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.adjuvantes) {
        adjuvantes.filteredNivel5.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.inoculantes) {
        inoculantes.filteredNivel5.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.diesel) {
        diesel.filteredNivel5.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.fertilizantesFoliares) {
        fertilizantesFoliares.filteredNivel5.isEmpty
            ? noSons = true
            : noSons = false;
      }
      break;
    case 5:
      if (selectedCategory.adubos) {
        adubos.filteredNivel6.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.sementes) {
        sementes.filteredNivel6.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.inseticidas) {
        inseticidas.filteredNivel6.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.herbicidas) {
        herbicidas.filteredNivel6.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.fungicidas) {
        fungicidas.filteredNivel6.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.adjuvantes) {
        adjuvantes.filteredNivel6.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.inoculantes) {
        inoculantes.filteredNivel6.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.diesel) {
        diesel.filteredNivel6.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.fertilizantesFoliares) {
        fertilizantesFoliares.filteredNivel6.isEmpty
            ? noSons = true
            : noSons = false;
      }
      break;
    case 6:
      if (selectedCategory.adubos) {
        adubos.filteredNivel7.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.sementes) {
        sementes.filteredNivel7.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.inseticidas) {
        inseticidas.filteredNivel7.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.herbicidas) {
        herbicidas.filteredNivel7.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.fungicidas) {
        fungicidas.filteredNivel7.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.adjuvantes) {
        adjuvantes.filteredNivel7.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.inoculantes) {
        inoculantes.filteredNivel7.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.diesel) {
        diesel.filteredNivel7.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.fertilizantesFoliares) {
        fertilizantesFoliares.filteredNivel7.isEmpty
            ? noSons = true
            : noSons = false;
      }
      break;
    case 7:
      if (selectedCategory.adubos) {
        adubos.filteredNivel8.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.sementes) {
        sementes.filteredNivel8.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.inseticidas) {
        inseticidas.filteredNivel8.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.herbicidas) {
        herbicidas.filteredNivel8.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.fungicidas) {
        fungicidas.filteredNivel8.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.adjuvantes) {
        adjuvantes.filteredNivel8.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.inoculantes) {
        inoculantes.filteredNivel8.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.diesel) {
        diesel.filteredNivel8.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.fertilizantesFoliares) {
        fertilizantesFoliares.filteredNivel8.isEmpty
            ? noSons = true
            : noSons = false;
      }
      break;
    case 8:
      if (selectedCategory.adubos) {
        adubos.filteredNivel9.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.sementes) {
        sementes.filteredNivel9.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.inseticidas) {
        inseticidas.filteredNivel9.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.herbicidas) {
        herbicidas.filteredNivel9.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.fungicidas) {
        fungicidas.filteredNivel9.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.adjuvantes) {
        adjuvantes.filteredNivel9.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.inoculantes) {
        inoculantes.filteredNivel9.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.diesel) {
        diesel.filteredNivel9.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.fertilizantesFoliares) {
        fertilizantesFoliares.filteredNivel9.isEmpty
            ? noSons = true
            : noSons = false;
      }
      break;
    case 9:
      if (selectedCategory.adubos) {
        adubos.filteredNivel10.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.sementes) {
        sementes.filteredNivel10.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.inseticidas) {
        inseticidas.filteredNivel10.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.herbicidas) {
        herbicidas.filteredNivel10.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.fungicidas) {
        fungicidas.filteredNivel10.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.adjuvantes) {
        adjuvantes.filteredNivel10.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.inoculantes) {
        inoculantes.filteredNivel10.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.diesel) {
        diesel.filteredNivel10.isEmpty ? noSons = true : noSons = false;
      } else if (selectedCategory.fertilizantesFoliares) {
        fertilizantesFoliares.filteredNivel10.isEmpty
            ? noSons = true
            : noSons = false;
      }
      break;
  }
  return noSons;
}
