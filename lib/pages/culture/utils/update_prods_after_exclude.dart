import '../../../controllers/category_models/adjuvantes_controller.dart';
import '../../../controllers/category_models/adubos_controller.dart';
import '../../../controllers/category_models/diesel_controller.dart';
import '../../../controllers/category_models/fertilizantes_foliares_controller.dart';
import '../../../controllers/category_models/fungicidas_controller.dart';
import '../../../controllers/category_models/herbicidas_controller.dart';
import '../../../controllers/category_models/inoculantes_controller.dart';
import '../../../controllers/category_models/inseticidas_controller.dart';
import '../../../controllers/category_models/sementes_controller.dart';
import '../../../controllers/products/products_controller.dart';
import '../../../controllers/products/seleceted_category_controller.dart';
import 'update_to_recipe.dart';

void updateProdsAfterExclude(
  int num,
  ProductsController prod1,
  ProductsController prod2,
  ProductsController prod3,
  ProductsController prod4,
  ProductsController prod5,
  ProductsController prod6,
  ProductsController prod7,
  ProductsController prod8,
  ProductsController prod9,
  ProductsController prod10,
  SelectedCategoryController selectedCategory1,
  SelectedCategoryController selectedCategory2,
  SelectedCategoryController selectedCategory3,
  SelectedCategoryController selectedCategory4,
  SelectedCategoryController selectedCategory5,
  SelectedCategoryController selectedCategory6,
  SelectedCategoryController selectedCategory7,
  SelectedCategoryController selectedCategory8,
  SelectedCategoryController selectedCategory9,
  SelectedCategoryController selectedCategory10,
  AdubosController adubos1,
  AdubosController adubos2,
  AdubosController adubos3,
  AdubosController adubos4,
  AdubosController adubos5,
  AdubosController adubos6,
  AdubosController adubos7,
  AdubosController adubos8,
  AdubosController adubos9,
  SementesController sementes1,
  SementesController sementes2,
  SementesController sementes3,
  SementesController sementes4,
  SementesController sementes5,
  SementesController sementes6,
  SementesController sementes7,
  SementesController sementes8,
  SementesController sementes9,
  InseticidasController inseticidas1,
  InseticidasController inseticidas2,
  InseticidasController inseticidas3,
  InseticidasController inseticidas4,
  InseticidasController inseticidas5,
  InseticidasController inseticidas6,
  InseticidasController inseticidas7,
  InseticidasController inseticidas8,
  InseticidasController inseticidas9,
  HerbicidasController herbicidas1,
  HerbicidasController herbicidas2,
  HerbicidasController herbicidas3,
  HerbicidasController herbicidas4,
  HerbicidasController herbicidas5,
  HerbicidasController herbicidas6,
  HerbicidasController herbicidas7,
  HerbicidasController herbicidas8,
  HerbicidasController herbicidas9,
  FungicidasController fungicidas1,
  FungicidasController fungicidas2,
  FungicidasController fungicidas3,
  FungicidasController fungicidas4,
  FungicidasController fungicidas5,
  FungicidasController fungicidas6,
  FungicidasController fungicidas7,
  FungicidasController fungicidas8,
  FungicidasController fungicidas9,
  AdjuvantesController adjuvantes1,
  AdjuvantesController adjuvantes2,
  AdjuvantesController adjuvantes3,
  AdjuvantesController adjuvantes4,
  AdjuvantesController adjuvantes5,
  AdjuvantesController adjuvantes6,
  AdjuvantesController adjuvantes7,
  AdjuvantesController adjuvantes8,
  AdjuvantesController adjuvantes9,
  InoculantesController inoculantes1,
  InoculantesController inoculantes2,
  InoculantesController inoculantes3,
  InoculantesController inoculantes4,
  InoculantesController inoculantes5,
  InoculantesController inoculantes6,
  InoculantesController inoculantes7,
  InoculantesController inoculantes8,
  InoculantesController inoculantes9,
  DieselController diesel1,
  DieselController diesel2,
  DieselController diesel3,
  DieselController diesel4,
  DieselController diesel5,
  DieselController diesel6,
  DieselController diesel7,
  DieselController diesel8,
  DieselController diesel9,
  FertilizantesFoliaresController fertilizantesFoliares1,
  FertilizantesFoliaresController fertilizantesFoliares2,
  FertilizantesFoliaresController fertilizantesFoliares3,
  FertilizantesFoliaresController fertilizantesFoliares4,
  FertilizantesFoliaresController fertilizantesFoliares5,
  FertilizantesFoliaresController fertilizantesFoliares6,
  FertilizantesFoliaresController fertilizantesFoliares7,
  FertilizantesFoliaresController fertilizantesFoliares8,
  FertilizantesFoliaresController fertilizantesFoliares9,
) {
  if (num <= 1) {
    selectedCategory1.resetControllers();
    prod1.resetControllers();
    adubos1.resetAll();
    sementes1.resetAll();
    herbicidas1.resetAll();
    fungicidas1.resetAll();
    inseticidas1.resetAll();
    adjuvantes1.resetAll();
    inoculantes1.resetAll();
    diesel1.resetAll();
    fertilizantesFoliares1.resetAll();

    prod1.setProd(prod2);
    if (prod2.category.text == "adubo") {
      selectedCategory1.setAdubos();
      setSelectedProducts(adubos1, prod1.code.text, prod1.category.text);
    } else if (prod2.category.text == "semente") {
      selectedCategory1.setSementes();
      setSelectedProducts(sementes1, prod1.code.text, prod1.category.text);
    } else if (prod2.category.text == "herbicida") {
      selectedCategory1.setHerbicidas();
      setSelectedProducts(herbicidas1, prod1.code.text, prod1.category.text);
    } else if (prod2.category.text == "fungicida") {
      selectedCategory1.setFungicidas();
      setSelectedProducts(fungicidas1, prod1.code.text, prod1.category.text);
    } else if (prod2.category.text == "inseticida") {
      selectedCategory1.setInseticidas();
      setSelectedProducts(inseticidas1, prod1.code.text, prod1.category.text);
    } else if (prod2.category.text == "adjuvante") {
      selectedCategory1.setAdjuvantes();
      setSelectedProducts(adjuvantes1, prod1.code.text, prod1.category.text);
    } else if (prod2.category.text == "inoculante") {
      selectedCategory1.setInoculantes();
      setSelectedProducts(inoculantes1, prod1.code.text, prod1.category.text);
    } else if (prod2.category.text == "diesel") {
      selectedCategory1.setDiesel();
      setSelectedProducts(diesel1, prod1.code.text, prod1.category.text);
    } else if (prod2.category.text == "fertilizanteFoliar") {
      selectedCategory1.setFertilizantesFoliares();
      setSelectedProducts(
          fertilizantesFoliares1, prod1.code.text, prod1.category.text);
    }
  }
  if (num <= 2) {
    selectedCategory2.resetControllers();
    prod2.resetControllers();
    adubos2.resetAll();
    sementes2.resetAll();
    herbicidas2.resetAll();
    fungicidas2.resetAll();
    inseticidas2.resetAll();
    adjuvantes2.resetAll();
    inoculantes2.resetAll();
    diesel2.resetAll();
    fertilizantesFoliares2.resetAll();

    prod2.setProd(prod3);
    if (prod3.category.text == "adubo") {
      selectedCategory2.setAdubos();
      setSelectedProducts(adubos2, prod2.code.text, prod2.category.text);
    } else if (prod3.category.text == "semente") {
      selectedCategory2.setSementes();
      setSelectedProducts(sementes2, prod2.code.text, prod2.category.text);
    } else if (prod3.category.text == "herbicida") {
      selectedCategory2.setHerbicidas();
      setSelectedProducts(herbicidas2, prod2.code.text, prod2.category.text);
    } else if (prod3.category.text == "fungicida") {
      selectedCategory2.setFungicidas();
      setSelectedProducts(fungicidas2, prod2.code.text, prod2.category.text);
    } else if (prod3.category.text == "inseticida") {
      selectedCategory2.setInseticidas();
      setSelectedProducts(inseticidas2, prod2.code.text, prod2.category.text);
    } else if (prod3.category.text == "adjuvante") {
      selectedCategory2.setAdjuvantes();
      setSelectedProducts(adjuvantes2, prod2.code.text, prod2.category.text);
    } else if (prod3.category.text == "inoculante") {
      selectedCategory2.setInoculantes();
      setSelectedProducts(inoculantes2, prod2.code.text, prod2.category.text);
    } else if (prod3.category.text == "diesel") {
      selectedCategory2.setDiesel();
      setSelectedProducts(diesel2, prod2.code.text, prod2.category.text);
    } else if (prod3.category.text == "fertilizanteFoliar") {
      selectedCategory2.setFertilizantesFoliares();
      setSelectedProducts(
          fertilizantesFoliares2, prod2.code.text, prod2.category.text);
    }
  }
  if (num <= 3) {
    selectedCategory3.resetControllers();
    prod3.resetControllers();
    adubos3.resetAll();
    sementes3.resetAll();
    herbicidas3.resetAll();
    fungicidas3.resetAll();
    inseticidas3.resetAll();
    adjuvantes3.resetAll();
    inoculantes3.resetAll();
    diesel3.resetAll();
    fertilizantesFoliares3.resetAll();

    prod3.setProd(prod4);
    if (prod4.category.text == "adubo") {
      selectedCategory3.setAdubos();
      setSelectedProducts(adubos3, prod3.code.text, prod3.category.text);
    } else if (prod4.category.text == "semente") {
      selectedCategory3.setSementes();
      setSelectedProducts(sementes3, prod3.code.text, prod3.category.text);
    } else if (prod4.category.text == "herbicida") {
      selectedCategory3.setHerbicidas();
      setSelectedProducts(herbicidas3, prod3.code.text, prod3.category.text);
    } else if (prod4.category.text == "fungicida") {
      selectedCategory3.setFungicidas();
      setSelectedProducts(fungicidas3, prod3.code.text, prod3.category.text);
    } else if (prod4.category.text == "inseticida") {
      selectedCategory3.setInseticidas();
      setSelectedProducts(inseticidas3, prod3.code.text, prod3.category.text);
    } else if (prod4.category.text == "adjuvante") {
      selectedCategory3.setAdjuvantes();
      setSelectedProducts(adjuvantes3, prod3.code.text, prod3.category.text);
    } else if (prod4.category.text == "inoculante") {
      selectedCategory3.setInoculantes();
      setSelectedProducts(inoculantes3, prod3.code.text, prod3.category.text);
    } else if (prod4.category.text == "diesel") {
      selectedCategory3.setDiesel();
      setSelectedProducts(diesel3, prod3.code.text, prod3.category.text);
    } else if (prod4.category.text == "fertilizanteFoliar") {
      selectedCategory3.setFertilizantesFoliares();
      setSelectedProducts(
          fertilizantesFoliares3, prod3.code.text, prod3.category.text);
    }
  }
  if (num <= 4) {
    selectedCategory4.resetControllers();
    prod4.resetControllers();
    adubos4.resetAll();
    sementes4.resetAll();
    herbicidas4.resetAll();
    fungicidas4.resetAll();
    inseticidas4.resetAll();
    adjuvantes4.resetAll();
    inoculantes4.resetAll();
    diesel4.resetAll();
    fertilizantesFoliares4.resetAll();

    prod4.setProd(prod5);
    if (prod5.category.text == "adubo") {
      selectedCategory4.setAdubos();
      setSelectedProducts(adubos4, prod4.code.text, prod4.category.text);
    } else if (prod5.category.text == "semente") {
      selectedCategory4.setSementes();
      setSelectedProducts(sementes4, prod4.code.text, prod4.category.text);
    } else if (prod5.category.text == "herbicida") {
      selectedCategory4.setHerbicidas();
      setSelectedProducts(herbicidas4, prod4.code.text, prod4.category.text);
    } else if (prod5.category.text == "fungicida") {
      selectedCategory4.setFungicidas();
      setSelectedProducts(fungicidas4, prod4.code.text, prod4.category.text);
    } else if (prod5.category.text == "inseticida") {
      selectedCategory4.setInseticidas();
      setSelectedProducts(inseticidas4, prod4.code.text, prod4.category.text);
    } else if (prod5.category.text == "adjuvante") {
      selectedCategory4.setAdjuvantes();
      setSelectedProducts(adjuvantes4, prod4.code.text, prod4.category.text);
    } else if (prod5.category.text == "inoculante") {
      selectedCategory4.setInoculantes();
      setSelectedProducts(inoculantes4, prod4.code.text, prod4.category.text);
    } else if (prod5.category.text == "diesel") {
      selectedCategory4.setDiesel();
      setSelectedProducts(diesel4, prod4.code.text, prod4.category.text);
    } else if (prod5.category.text == "fertilizanteFoliar") {
      selectedCategory4.setFertilizantesFoliares();
      setSelectedProducts(
          fertilizantesFoliares4, prod4.code.text, prod4.category.text);
    }
  }
  if (num <= 5) {
    selectedCategory5.resetControllers();
    prod5.resetControllers();
    adubos5.resetAll();
    sementes5.resetAll();
    herbicidas5.resetAll();
    fungicidas5.resetAll();
    inseticidas5.resetAll();
    adjuvantes5.resetAll();
    inoculantes5.resetAll();
    diesel5.resetAll();
    fertilizantesFoliares5.resetAll();

    prod5.setProd(prod6);
    if (prod6.category.text == "adubo") {
      selectedCategory5.setAdubos();
      setSelectedProducts(adubos5, prod5.code.text, prod5.category.text);
    } else if (prod6.category.text == "semente") {
      selectedCategory5.setSementes();
      setSelectedProducts(sementes5, prod5.code.text, prod5.category.text);
    } else if (prod6.category.text == "herbicida") {
      selectedCategory5.setHerbicidas();
      setSelectedProducts(herbicidas5, prod5.code.text, prod5.category.text);
    } else if (prod6.category.text == "fungicida") {
      selectedCategory5.setFungicidas();
      setSelectedProducts(fungicidas5, prod5.code.text, prod5.category.text);
    } else if (prod6.category.text == "inseticida") {
      selectedCategory5.setInseticidas();
      setSelectedProducts(inseticidas5, prod5.code.text, prod5.category.text);
    } else if (prod6.category.text == "adjuvante") {
      selectedCategory5.setAdjuvantes();
      setSelectedProducts(adjuvantes5, prod5.code.text, prod5.category.text);
    } else if (prod6.category.text == "inoculante") {
      selectedCategory5.setInoculantes();
      setSelectedProducts(inoculantes5, prod5.code.text, prod5.category.text);
    } else if (prod6.category.text == "diesel") {
      selectedCategory5.setDiesel();
      setSelectedProducts(diesel5, prod5.code.text, prod5.category.text);
    } else if (prod6.category.text == "fertilizanteFoliar") {
      selectedCategory5.setFertilizantesFoliares();
      setSelectedProducts(
          fertilizantesFoliares5, prod5.code.text, prod5.category.text);
    }
  }
  if (num <= 6) {
    selectedCategory6.resetControllers();
    prod6.resetControllers();
    adubos6.resetAll();
    sementes6.resetAll();
    herbicidas6.resetAll();
    fungicidas6.resetAll();
    inseticidas6.resetAll();
    adjuvantes6.resetAll();
    inoculantes6.resetAll();
    diesel6.resetAll();
    fertilizantesFoliares6.resetAll();

    prod6.setProd(prod7);
    if (prod7.category.text == "adubo") {
      selectedCategory6.setAdubos();
      setSelectedProducts(adubos6, prod6.code.text, prod6.category.text);
    } else if (prod7.category.text == "semente") {
      selectedCategory6.setSementes();
      setSelectedProducts(sementes6, prod6.code.text, prod6.category.text);
    } else if (prod7.category.text == "herbicida") {
      selectedCategory6.setHerbicidas();
      setSelectedProducts(herbicidas6, prod6.code.text, prod6.category.text);
    } else if (prod7.category.text == "fungicida") {
      selectedCategory6.setFungicidas();
      setSelectedProducts(fungicidas6, prod6.code.text, prod6.category.text);
    } else if (prod7.category.text == "inseticida") {
      selectedCategory6.setInseticidas();
      setSelectedProducts(inseticidas6, prod6.code.text, prod6.category.text);
    } else if (prod7.category.text == "adjuvante") {
      selectedCategory6.setAdjuvantes();
      setSelectedProducts(adjuvantes6, prod6.code.text, prod6.category.text);
    } else if (prod7.category.text == "inoculante") {
      selectedCategory6.setInoculantes();
      setSelectedProducts(inoculantes6, prod6.code.text, prod6.category.text);
    } else if (prod7.category.text == "diesel") {
      selectedCategory6.setDiesel();
      setSelectedProducts(diesel6, prod6.code.text, prod6.category.text);
    } else if (prod7.category.text == "fertilizanteFoliar") {
      selectedCategory6.setFertilizantesFoliares();
      setSelectedProducts(
          fertilizantesFoliares6, prod6.code.text, prod6.category.text);
    }
  }
  if (num <= 7) {
    selectedCategory7.resetControllers();
    prod7.resetControllers();
    adubos7.resetAll();
    sementes7.resetAll();
    herbicidas7.resetAll();
    fungicidas7.resetAll();
    inseticidas7.resetAll();
    adjuvantes7.resetAll();
    inoculantes7.resetAll();
    diesel7.resetAll();
    fertilizantesFoliares7.resetAll();

    prod7.setProd(prod8);
    if (prod8.category.text == "adubo") {
      selectedCategory7.setAdubos();
      setSelectedProducts(adubos7, prod7.code.text, prod7.category.text);
    } else if (prod8.category.text == "semente") {
      selectedCategory7.setSementes();
      setSelectedProducts(sementes7, prod7.code.text, prod7.category.text);
    } else if (prod8.category.text == "herbicida") {
      selectedCategory7.setHerbicidas();
      setSelectedProducts(herbicidas7, prod7.code.text, prod7.category.text);
    } else if (prod8.category.text == "fungicida") {
      selectedCategory7.setFungicidas();
      setSelectedProducts(fungicidas7, prod7.code.text, prod7.category.text);
    } else if (prod8.category.text == "inseticida") {
      selectedCategory7.setInseticidas();
      setSelectedProducts(inseticidas7, prod7.code.text, prod7.category.text);
    } else if (prod8.category.text == "adjuvante") {
      selectedCategory7.setAdjuvantes();
      setSelectedProducts(adjuvantes7, prod7.code.text, prod7.category.text);
    } else if (prod8.category.text == "inoculante") {
      selectedCategory7.setInoculantes();
      setSelectedProducts(inoculantes7, prod7.code.text, prod7.category.text);
    } else if (prod8.category.text == "diesel") {
      selectedCategory7.setDiesel();
      setSelectedProducts(diesel7, prod7.code.text, prod7.category.text);
    } else if (prod8.category.text == "fertilizanteFoliar") {
      selectedCategory7.setFertilizantesFoliares();
      setSelectedProducts(
          fertilizantesFoliares7, prod7.code.text, prod7.category.text);
    }
  }
  if (num <= 8) {
    selectedCategory8.resetControllers();
    prod8.resetControllers();
    adubos8.resetAll();
    sementes8.resetAll();
    herbicidas8.resetAll();
    fungicidas8.resetAll();
    inseticidas8.resetAll();
    adjuvantes8.resetAll();
    inoculantes8.resetAll();
    diesel8.resetAll();
    fertilizantesFoliares8.resetAll();

    prod8.setProd(prod9);
    if (prod9.category.text == "adubo") {
      selectedCategory8.setAdubos();
      setSelectedProducts(adubos8, prod8.code.text, prod8.category.text);
    } else if (prod9.category.text == "semente") {
      selectedCategory8.setSementes();
      setSelectedProducts(sementes8, prod8.code.text, prod8.category.text);
    } else if (prod9.category.text == "herbicida") {
      selectedCategory8.setHerbicidas();
      setSelectedProducts(herbicidas8, prod8.code.text, prod8.category.text);
    } else if (prod9.category.text == "fungicida") {
      selectedCategory8.setFungicidas();
      setSelectedProducts(fungicidas8, prod8.code.text, prod8.category.text);
    } else if (prod9.category.text == "inseticida") {
      selectedCategory8.setInseticidas();
      setSelectedProducts(inseticidas8, prod8.code.text, prod8.category.text);
    } else if (prod9.category.text == "adjuvante") {
      selectedCategory8.setAdjuvantes();
      setSelectedProducts(adjuvantes8, prod8.code.text, prod8.category.text);
    } else if (prod9.category.text == "inoculante") {
      selectedCategory8.setInoculantes();
      setSelectedProducts(inoculantes8, prod8.code.text, prod8.category.text);
    } else if (prod9.category.text == "diesel") {
      selectedCategory8.setDiesel();
      setSelectedProducts(diesel8, prod8.code.text, prod8.category.text);
    } else if (prod9.category.text == "fertilizanteFoliar") {
      selectedCategory8.setFertilizantesFoliares();
      setSelectedProducts(
          fertilizantesFoliares8, prod8.code.text, prod8.category.text);
    }
  }
  if (num <= 9) {
    selectedCategory9.resetControllers();
    prod9.resetControllers();
    adubos9.resetAll();
    sementes9.resetAll();
    herbicidas9.resetAll();
    fungicidas9.resetAll();
    inseticidas9.resetAll();
    adjuvantes9.resetAll();
    inoculantes9.resetAll();
    diesel9.resetAll();
    fertilizantesFoliares9.resetAll();

    prod9.setProd(prod10);
    if (prod10.category.text == "adubo") {
      selectedCategory9.setAdubos();
      setSelectedProducts(adubos9, prod9.code.text, prod9.category.text);
    } else if (prod10.category.text == "semente") {
      selectedCategory9.setSementes();
      setSelectedProducts(sementes9, prod9.code.text, prod9.category.text);
    } else if (prod10.category.text == "herbicida") {
      selectedCategory9.setHerbicidas();
      setSelectedProducts(herbicidas9, prod9.code.text, prod9.category.text);
    } else if (prod10.category.text == "fungicida") {
      selectedCategory9.setFungicidas();
      setSelectedProducts(fungicidas9, prod9.code.text, prod9.category.text);
    } else if (prod10.category.text == "inseticida") {
      selectedCategory9.setInseticidas();
      setSelectedProducts(inseticidas9, prod9.code.text, prod9.category.text);
    } else if (prod10.category.text == "adjuvante") {
      selectedCategory9.setAdjuvantes();
      setSelectedProducts(adjuvantes9, prod9.code.text, prod9.category.text);
    } else if (prod10.category.text == "inoculante") {
      selectedCategory9.setInoculantes();
      setSelectedProducts(inoculantes9, prod9.code.text, prod9.category.text);
    } else if (prod10.category.text == "diesel") {
      selectedCategory9.setDiesel();
      setSelectedProducts(diesel9, prod9.code.text, prod9.category.text);
    } else if (prod10.category.text == "fertilizanteFoliar") {
      selectedCategory9.setFertilizantesFoliares();
      setSelectedProducts(
          fertilizantesFoliares9, prod9.code.text, prod9.category.text);
    }
  }
}
