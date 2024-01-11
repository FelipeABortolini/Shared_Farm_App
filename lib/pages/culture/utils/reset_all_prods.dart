import '../../../controllers/products/add_level_controller.dart';
import '../../../controllers/culture/amount_products_controller.dart';
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

void resetAllProds(
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
  AdubosController adubos10,
  SementesController sementes1,
  SementesController sementes2,
  SementesController sementes3,
  SementesController sementes4,
  SementesController sementes5,
  SementesController sementes6,
  SementesController sementes7,
  SementesController sementes8,
  SementesController sementes9,
  SementesController sementes10,
  InseticidasController inseticidas1,
  InseticidasController inseticidas2,
  InseticidasController inseticidas3,
  InseticidasController inseticidas4,
  InseticidasController inseticidas5,
  InseticidasController inseticidas6,
  InseticidasController inseticidas7,
  InseticidasController inseticidas8,
  InseticidasController inseticidas9,
  InseticidasController inseticidas10,
  HerbicidasController herbicidas1,
  HerbicidasController herbicidas2,
  HerbicidasController herbicidas3,
  HerbicidasController herbicidas4,
  HerbicidasController herbicidas5,
  HerbicidasController herbicidas6,
  HerbicidasController herbicidas7,
  HerbicidasController herbicidas8,
  HerbicidasController herbicidas9,
  HerbicidasController herbicidas10,
  FungicidasController fungicidas1,
  FungicidasController fungicidas2,
  FungicidasController fungicidas3,
  FungicidasController fungicidas4,
  FungicidasController fungicidas5,
  FungicidasController fungicidas6,
  FungicidasController fungicidas7,
  FungicidasController fungicidas8,
  FungicidasController fungicidas9,
  FungicidasController fungicidas10,
  AdjuvantesController adjuvantes1,
  AdjuvantesController adjuvantes2,
  AdjuvantesController adjuvantes3,
  AdjuvantesController adjuvantes4,
  AdjuvantesController adjuvantes5,
  AdjuvantesController adjuvantes6,
  AdjuvantesController adjuvantes7,
  AdjuvantesController adjuvantes8,
  AdjuvantesController adjuvantes9,
  AdjuvantesController adjuvantes10,
  InoculantesController inoculantes1,
  InoculantesController inoculantes2,
  InoculantesController inoculantes3,
  InoculantesController inoculantes4,
  InoculantesController inoculantes5,
  InoculantesController inoculantes6,
  InoculantesController inoculantes7,
  InoculantesController inoculantes8,
  InoculantesController inoculantes9,
  InoculantesController inoculantes10,
  DieselController diesel1,
  DieselController diesel2,
  DieselController diesel3,
  DieselController diesel4,
  DieselController diesel5,
  DieselController diesel6,
  DieselController diesel7,
  DieselController diesel8,
  DieselController diesel9,
  DieselController diesel10,
  FertilizantesFoliaresController fertilizantesFoliares1,
  FertilizantesFoliaresController fertilizantesFoliares2,
  FertilizantesFoliaresController fertilizantesFoliares3,
  FertilizantesFoliaresController fertilizantesFoliares4,
  FertilizantesFoliaresController fertilizantesFoliares5,
  FertilizantesFoliaresController fertilizantesFoliares6,
  FertilizantesFoliaresController fertilizantesFoliares7,
  FertilizantesFoliaresController fertilizantesFoliares8,
  FertilizantesFoliaresController fertilizantesFoliares9,
  FertilizantesFoliaresController fertilizantesFoliares10,
  AddLevelController addLev1,
  AddLevelController addLev2,
  AddLevelController addLev3,
  AddLevelController addLev4,
  AddLevelController addLev5,
  AddLevelController addLev6,
  AddLevelController addLev7,
  AddLevelController addLev8,
  AddLevelController addLev9,
  AddLevelController addLev10,
  AmountProductsController amountProducts,
) {
  amountProducts.setAmount(1);

  addLev1.resetLevel();
  addLev2.resetLevel();
  addLev3.resetLevel();
  addLev4.resetLevel();
  addLev5.resetLevel();
  addLev6.resetLevel();
  addLev7.resetLevel();
  addLev8.resetLevel();
  addLev9.resetLevel();
  addLev10.resetLevel();

  adubos1.setNoSelection();
  adubos2.setNoSelection();
  adubos3.setNoSelection();
  adubos4.setNoSelection();
  adubos5.setNoSelection();
  adubos6.setNoSelection();
  adubos7.setNoSelection();
  adubos8.setNoSelection();
  adubos9.setNoSelection();
  adubos10.setNoSelection();
  sementes1.setNoSelection();
  sementes2.setNoSelection();
  sementes3.setNoSelection();
  sementes4.setNoSelection();
  sementes5.setNoSelection();
  sementes6.setNoSelection();
  sementes7.setNoSelection();
  sementes8.setNoSelection();
  sementes9.setNoSelection();
  sementes10.setNoSelection();
  inseticidas1.setNoSelection();
  inseticidas2.setNoSelection();
  inseticidas3.setNoSelection();
  inseticidas4.setNoSelection();
  inseticidas5.setNoSelection();
  inseticidas6.setNoSelection();
  inseticidas7.setNoSelection();
  inseticidas8.setNoSelection();
  inseticidas9.setNoSelection();
  inseticidas10.setNoSelection();
  herbicidas1.setNoSelection();
  herbicidas2.setNoSelection();
  herbicidas3.setNoSelection();
  herbicidas4.setNoSelection();
  herbicidas5.setNoSelection();
  herbicidas6.setNoSelection();
  herbicidas7.setNoSelection();
  herbicidas8.setNoSelection();
  herbicidas9.setNoSelection();
  herbicidas10.setNoSelection();
  fungicidas1.setNoSelection();
  fungicidas2.setNoSelection();
  fungicidas3.setNoSelection();
  fungicidas4.setNoSelection();
  fungicidas5.setNoSelection();
  fungicidas6.setNoSelection();
  fungicidas7.setNoSelection();
  fungicidas8.setNoSelection();
  fungicidas9.setNoSelection();
  fungicidas10.setNoSelection();
  adjuvantes1.setNoSelection();
  adjuvantes2.setNoSelection();
  adjuvantes3.setNoSelection();
  adjuvantes4.setNoSelection();
  adjuvantes5.setNoSelection();
  adjuvantes6.setNoSelection();
  adjuvantes7.setNoSelection();
  adjuvantes8.setNoSelection();
  adjuvantes9.setNoSelection();
  adjuvantes10.setNoSelection();
  inoculantes1.setNoSelection();
  inoculantes2.setNoSelection();
  inoculantes3.setNoSelection();
  inoculantes4.setNoSelection();
  inoculantes5.setNoSelection();
  inoculantes6.setNoSelection();
  inoculantes7.setNoSelection();
  inoculantes8.setNoSelection();
  inoculantes9.setNoSelection();
  inoculantes10.setNoSelection();
  diesel1.setNoSelection();
  diesel2.setNoSelection();
  diesel3.setNoSelection();
  diesel4.setNoSelection();
  diesel5.setNoSelection();
  diesel6.setNoSelection();
  diesel7.setNoSelection();
  diesel8.setNoSelection();
  diesel9.setNoSelection();
  diesel10.setNoSelection();
  fertilizantesFoliares1.setNoSelection();
  fertilizantesFoliares2.setNoSelection();
  fertilizantesFoliares3.setNoSelection();
  fertilizantesFoliares4.setNoSelection();
  fertilizantesFoliares5.setNoSelection();
  fertilizantesFoliares6.setNoSelection();
  fertilizantesFoliares7.setNoSelection();
  fertilizantesFoliares8.setNoSelection();
  fertilizantesFoliares9.setNoSelection();
  fertilizantesFoliares10.setNoSelection();

  adubos1.resetAll();
  adubos2.resetAll();
  adubos3.resetAll();
  adubos4.resetAll();
  adubos5.resetAll();
  adubos6.resetAll();
  adubos7.resetAll();
  adubos8.resetAll();
  adubos9.resetAll();
  adubos10.resetAll();
  sementes1.resetAll();
  sementes2.resetAll();
  sementes3.resetAll();
  sementes4.resetAll();
  sementes5.resetAll();
  sementes6.resetAll();
  sementes7.resetAll();
  sementes8.resetAll();
  sementes9.resetAll();
  sementes10.resetAll();
  inseticidas1.resetAll();
  inseticidas2.resetAll();
  inseticidas3.resetAll();
  inseticidas4.resetAll();
  inseticidas5.resetAll();
  inseticidas6.resetAll();
  inseticidas7.resetAll();
  inseticidas8.resetAll();
  inseticidas9.resetAll();
  inseticidas10.resetAll();
  herbicidas1.resetAll();
  herbicidas2.resetAll();
  herbicidas3.resetAll();
  herbicidas4.resetAll();
  herbicidas5.resetAll();
  herbicidas6.resetAll();
  herbicidas7.resetAll();
  herbicidas8.resetAll();
  herbicidas9.resetAll();
  herbicidas10.resetAll();
  fungicidas1.resetAll();
  fungicidas2.resetAll();
  fungicidas3.resetAll();
  fungicidas4.resetAll();
  fungicidas5.resetAll();
  fungicidas6.resetAll();
  fungicidas7.resetAll();
  fungicidas8.resetAll();
  fungicidas9.resetAll();
  fungicidas10.resetAll();
  adjuvantes1.resetAll();
  adjuvantes2.resetAll();
  adjuvantes3.resetAll();
  adjuvantes4.resetAll();
  adjuvantes5.resetAll();
  adjuvantes6.resetAll();
  adjuvantes7.resetAll();
  adjuvantes8.resetAll();
  adjuvantes9.resetAll();
  adjuvantes10.resetAll();
  inoculantes1.resetAll();
  inoculantes2.resetAll();
  inoculantes3.resetAll();
  inoculantes4.resetAll();
  inoculantes5.resetAll();
  inoculantes6.resetAll();
  inoculantes7.resetAll();
  inoculantes8.resetAll();
  inoculantes9.resetAll();
  inoculantes10.resetAll();
  diesel1.resetAll();
  diesel2.resetAll();
  diesel3.resetAll();
  diesel4.resetAll();
  diesel5.resetAll();
  diesel6.resetAll();
  diesel7.resetAll();
  diesel8.resetAll();
  diesel9.resetAll();
  diesel10.resetAll();
  fertilizantesFoliares1.resetAll();
  fertilizantesFoliares2.resetAll();
  fertilizantesFoliares3.resetAll();
  fertilizantesFoliares4.resetAll();
  fertilizantesFoliares5.resetAll();
  fertilizantesFoliares6.resetAll();
  fertilizantesFoliares7.resetAll();
  fertilizantesFoliares8.resetAll();
  fertilizantesFoliares9.resetAll();
  fertilizantesFoliares10.resetAll();

  prod1.resetControllers();
  prod2.resetControllers();
  prod3.resetControllers();
  prod4.resetControllers();
  prod5.resetControllers();
  prod6.resetControllers();
  prod7.resetControllers();
  prod8.resetControllers();
  prod9.resetControllers();
  prod10.resetControllers();
  selectedCategory1.resetControllers();
  selectedCategory2.resetControllers();
  selectedCategory3.resetControllers();
  selectedCategory4.resetControllers();
  selectedCategory5.resetControllers();
  selectedCategory6.resetControllers();
  selectedCategory7.resetControllers();
  selectedCategory8.resetControllers();
  selectedCategory9.resetControllers();
  selectedCategory10.resetControllers();
}
