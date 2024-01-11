import '../../../controllers/culture/culture_type_controller.dart';
import '../../../controllers/products/add_level_controller.dart';
import '../../../controllers/culture/amount_products_controller.dart';
import '../../../controllers/category_models/adjuvantes_controller.dart';
import '../../../controllers/category_models/adubos_controller.dart';
import '../../../controllers/category_models/category_model.dart';
import '../../../controllers/category_models/diesel_controller.dart';
import '../../../controllers/category_models/fertilizantes_foliares_controller.dart';
import '../../../controllers/category_models/fungicidas_controller.dart';
import '../../../controllers/category_models/herbicidas_controller.dart';
import '../../../controllers/category_models/inoculantes_controller.dart';
import '../../../controllers/category_models/inseticidas_controller.dart';
import '../../../controllers/category_models/sementes_controller.dart';
import '../../../controllers/products/products_controller.dart';
import '../../../controllers/recipe_controller.dart';
import '../../../controllers/products/seleceted_category_controller.dart';
import '../../../controllers/culture/select_phase_controller.dart';
import '../../../db/products/add_products/get_dad_infos.dart';
import '../../../db/products/utils/get_number_product.dart';
import '../../host/products/utils/filter_sons.dart';

Future<void> updateToRecipe(
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
  RecipeController recipeOption,
  SelectPhaseController phaseOption,
  CultureTypeController cultureType,
  AmountProductsController amountProducts,
) async {
  String currentQuantity = "";
  String currentCode = "";
  String currentCategory = "";
  String currentProduct = "";
  String currentUnity = "";
  int currentLevel = 0;
  String currentDad = "";
  int i = 0;

  if (cultureType.soja) {
    // ================================= APLICAÇÃO DESSECAÇÃO SOJA ==========================================

    if (phaseOption.phase == "APLICAÇÃO DESSECAÇÃO" &&
        recipeOption.soja["APLICAÇÃO DESSECAÇÃO"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.soja["APLICAÇÃO DESSECAÇÃO"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.soja["APLICAÇÃO DESSECAÇÃO"]!.length) {
          currentQuantity =
              recipeOption.soja["APLICAÇÃO DESSECAÇÃO"]![i]["quantity"];
          currentCode = recipeOption.soja["APLICAÇÃO DESSECAÇÃO"]![i]["code"];
          currentCategory =
              recipeOption.soja["APLICAÇÃO DESSECAÇÃO"]![i]["category"];
          currentProduct =
              recipeOption.soja["APLICAÇÃO DESSECAÇÃO"]![i]["product"];
          currentUnity = recipeOption.soja["APLICAÇÃO DESSECAÇÃO"]![i]["unity"];
          currentLevel = recipeOption.soja["APLICAÇÃO DESSECAÇÃO"]![i]["level"];
          currentDad = recipeOption.soja["APLICAÇÃO DESSECAÇÃO"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= APLICAÇÃO SEQUENCIAL DESSECAÇÃO SOJA ==========================================

    if (phaseOption.phase == "APLICAÇÃO SEQUENCIAL DESSECAÇÃO" &&
        recipeOption.soja["APLICAÇÃO SEQUENCIAL DESSECAÇÃO"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.soja["APLICAÇÃO SEQUENCIAL DESSECAÇÃO"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.soja["APLICAÇÃO SEQUENCIAL DESSECAÇÃO"]!.length) {
          currentQuantity = recipeOption
              .soja["APLICAÇÃO SEQUENCIAL DESSECAÇÃO"]![i]["quantity"];
          currentCode =
              recipeOption.soja["APLICAÇÃO SEQUENCIAL DESSECAÇÃO"]![i]["code"];
          currentCategory = recipeOption
              .soja["APLICAÇÃO SEQUENCIAL DESSECAÇÃO"]![i]["category"];
          currentProduct = recipeOption
              .soja["APLICAÇÃO SEQUENCIAL DESSECAÇÃO"]![i]["product"];
          currentUnity =
              recipeOption.soja["APLICAÇÃO SEQUENCIAL DESSECAÇÃO"]![i]["unity"];
          currentLevel =
              recipeOption.soja["APLICAÇÃO SEQUENCIAL DESSECAÇÃO"]![i]["level"];
          currentDad =
              recipeOption.soja["APLICAÇÃO SEQUENCIAL DESSECAÇÃO"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= PLANTIO SOJA ==========================================

    if (phaseOption.phase == "PLANTIO" &&
        recipeOption.soja["PLANTIO"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.soja["PLANTIO"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.soja["PLANTIO"]!.length) {
          currentQuantity = recipeOption.soja["PLANTIO"]![i]["quantity"];
          currentCode = recipeOption.soja["PLANTIO"]![i]["code"];
          currentCategory = recipeOption.soja["PLANTIO"]![i]["category"];
          currentProduct = recipeOption.soja["PLANTIO"]![i]["product"];
          currentUnity = recipeOption.soja["PLANTIO"]![i]["unity"];
          currentLevel = recipeOption.soja["PLANTIO"]![i]["level"];
          currentDad = recipeOption.soja["PLANTIO"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= APLICAÇÃO V3_V4 SOJA ==========================================

    if (phaseOption.phase == "APLICAÇÃO V3/V4" &&
        recipeOption.soja["APLICAÇÃO V3_V4"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.soja["APLICAÇÃO V3_V4"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.soja["APLICAÇÃO V3_V4"]!.length) {
          currentQuantity =
              recipeOption.soja["APLICAÇÃO V3_V4"]![i]["quantity"];
          currentCode = recipeOption.soja["APLICAÇÃO V3_V4"]![i]["code"];
          currentCategory =
              recipeOption.soja["APLICAÇÃO V3_V4"]![i]["category"];
          currentProduct = recipeOption.soja["APLICAÇÃO V3_V4"]![i]["product"];
          currentUnity = recipeOption.soja["APLICAÇÃO V3_V4"]![i]["unity"];
          currentLevel = recipeOption.soja["APLICAÇÃO V3_V4"]![i]["level"];
          currentDad = recipeOption.soja["APLICAÇÃO V3_V4"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= APLICAÇÃO COBERTURA SOJA ==========================================

    if (phaseOption.phase == "APLICAÇÃO COBERTURA" &&
        recipeOption.soja["APLICAÇÃO COBERTURA"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.soja["APLICAÇÃO COBERTURA"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.soja["APLICAÇÃO COBERTURA"]!.length) {
          currentQuantity =
              recipeOption.soja["APLICAÇÃO COBERTURA"]![i]["quantity"];
          currentCode = recipeOption.soja["APLICAÇÃO COBERTURA"]![i]["code"];
          currentCategory =
              recipeOption.soja["APLICAÇÃO COBERTURA"]![i]["category"];
          currentProduct =
              recipeOption.soja["APLICAÇÃO COBERTURA"]![i]["product"];
          currentUnity = recipeOption.soja["APLICAÇÃO COBERTURA"]![i]["unity"];
          currentLevel = recipeOption.soja["APLICAÇÃO COBERTURA"]![i]["level"];
          currentDad = recipeOption.soja["APLICAÇÃO COBERTURA"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= APLICAÇÃO V8_V9 SOJA ==========================================

    if (phaseOption.phase == "APLICAÇÃO V8/V9" &&
        recipeOption.soja["APLICAÇÃO V8_V9"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.soja["APLICAÇÃO V8_V9"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.soja["APLICAÇÃO V8_V9"]!.length) {
          currentQuantity =
              recipeOption.soja["APLICAÇÃO V8_V9"]![i]["quantity"];
          currentCode = recipeOption.soja["APLICAÇÃO V8_V9"]![i]["code"];
          currentCategory =
              recipeOption.soja["APLICAÇÃO V8_V9"]![i]["category"];
          currentProduct = recipeOption.soja["APLICAÇÃO V8_V9"]![i]["product"];
          currentUnity = recipeOption.soja["APLICAÇÃO V8_V9"]![i]["unity"];
          currentLevel = recipeOption.soja["APLICAÇÃO V8_V9"]![i]["level"];
          currentDad = recipeOption.soja["APLICAÇÃO V8_V9"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= APLICAÇÃO R1_R3 SOJA ==========================================

    if (phaseOption.phase == "APLICAÇÃO R1/R3" &&
        recipeOption.soja["APLICAÇÃO R1_R3"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.soja["APLICAÇÃO R1_R3"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.soja["APLICAÇÃO R1_R3"]!.length) {
          currentQuantity =
              recipeOption.soja["APLICAÇÃO R1_R3"]![i]["quantity"];
          currentCode = recipeOption.soja["APLICAÇÃO R1_R3"]![i]["code"];
          currentCategory =
              recipeOption.soja["APLICAÇÃO R1_R3"]![i]["category"];
          currentProduct = recipeOption.soja["APLICAÇÃO R1_R3"]![i]["product"];
          currentUnity = recipeOption.soja["APLICAÇÃO R1_R3"]![i]["unity"];
          currentLevel = recipeOption.soja["APLICAÇÃO R1_R3"]![i]["level"];
          currentDad = recipeOption.soja["APLICAÇÃO R1_R3"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= APLICAÇÃO R5_R5.2 SOJA ==========================================

    if (phaseOption.phase == "APLICAÇÃO R5/R5.2" &&
        recipeOption.soja["APLICAÇÃO R5_R5.2"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.soja["APLICAÇÃO R5_R5.2"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.soja["APLICAÇÃO R5_R5.2"]!.length) {
          currentQuantity =
              recipeOption.soja["APLICAÇÃO R5_R5.2"]![i]["quantity"];
          currentCode = recipeOption.soja["APLICAÇÃO R5_R5.2"]![i]["code"];
          currentCategory =
              recipeOption.soja["APLICAÇÃO R5_R5.2"]![i]["category"];
          currentProduct =
              recipeOption.soja["APLICAÇÃO R5_R5.2"]![i]["product"];
          currentUnity = recipeOption.soja["APLICAÇÃO R5_R5.2"]![i]["unity"];
          currentLevel = recipeOption.soja["APLICAÇÃO R5_R5.2"]![i]["level"];
          currentDad = recipeOption.soja["APLICAÇÃO R5_R5.2"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= COLHEITA SOJA ==========================================

    // if (phaseOption.phase == "COLHEITA" &&
    //     recipeOption.soja["COLHEITA"] != null) {
    //   amountProducts
    //       .setInitialAmount(recipeOption.soja["COLHEITA"]!.length);
    //   for (i = 0; i < 10; i++) {
    //     if (i < recipeOption.soja["COLHEITA"]!.length) {
    //       currentQuantity = recipeOption.soja["COLHEITA"]![i]["quantity"];
    //       currentCode = recipeOption.soja["COLHEITA"]![i]["code"];
    //       currentCategory = recipeOption.soja["COLHEITA"]![i]["category"];
    //       currentProduct = recipeOption.soja["COLHEITA"]![i]["product"];
    //       currentUnity = recipeOption.soja["COLHEITA"]![i]["unity"];
    //       currentLevel = recipeOption.soja["COLHEITA"]![i]["level"];
    //       currentDad = recipeOption.soja["COLHEITA"]![i]["dad"];
    //       if (i == 0) {
    //         setSelectedCategory(selectedCategory1, currentCategory);
    //         prod1.setName(currentProduct);
    //         prod1.setUnity(currentUnity);
    //         addLev1.setLevel(currentLevel);
    //         prod1.setQuantity(currentQuantity);
    //         prod1.setCategory(currentCategory);
    //         prod1.setCode(currentCode);
    //         prod1.setDad(currentDad);
    //         prod1.setTotalQuantity(currentQuantity);
    //         prod1.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(1);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos1, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes1, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas1, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas1, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas1, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes1, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes1, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel1, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares1, currentCode, currentCategory);
    //         }
    //       } else if (i == 1) {
    //         setSelectedCategory(selectedCategory2, currentCategory);
    //         prod2.setName(currentProduct);
    //         prod2.setUnity(currentUnity);
    //         addLev2.setLevel(currentLevel);
    //         prod2.setQuantity(currentQuantity);
    //         prod2.setCategory(currentCategory);
    //         prod2.setCode(currentCode);
    //         prod2.setDad(currentDad);
    //         prod2.setTotalQuantity(currentQuantity);
    //         prod2.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(2);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos2, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes2, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas2, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas2, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas2, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes2, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes2, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel2, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares2, currentCode, currentCategory);
    //         }
    //       } else if (i == 2) {
    //         setSelectedCategory(selectedCategory3, currentCategory);
    //         prod3.setName(currentProduct);
    //         prod3.setUnity(currentUnity);
    //         addLev3.setLevel(currentLevel);
    //         prod3.setQuantity(currentQuantity);
    //         prod3.setCategory(currentCategory);
    //         prod3.setCode(currentCode);
    //         prod3.setDad(currentDad);
    //         prod3.setTotalQuantity(currentQuantity);
    //         prod3.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(3);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos3, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes3, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas3, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas3, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas3, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes3, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes3, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel3, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares3, currentCode, currentCategory);
    //         }
    //       } else if (i == 3) {
    //         setSelectedCategory(selectedCategory4, currentCategory);
    //         prod4.setName(currentProduct);
    //         prod4.setUnity(currentUnity);
    //         addLev4.setLevel(currentLevel);
    //         prod4.setQuantity(currentQuantity);
    //         prod4.setCategory(currentCategory);
    //         prod4.setCode(currentCode);
    //         prod4.setDad(currentDad);
    //         prod4.setTotalQuantity(currentQuantity);
    //         prod4.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(4);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos4, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes4, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas4, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas4, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas4, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes4, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes4, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel4, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares4, currentCode, currentCategory);
    //         }
    //       } else if (i == 4) {
    //         setSelectedCategory(selectedCategory5, currentCategory);
    //         prod5.setName(currentProduct);
    //         prod5.setUnity(currentUnity);
    //         addLev5.setLevel(currentLevel);
    //         prod5.setQuantity(currentQuantity);
    //         prod5.setCategory(currentCategory);
    //         prod5.setCode(currentCode);
    //         prod5.setDad(currentDad);
    //         prod5.setTotalQuantity(currentQuantity);
    //         prod5.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(5);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos5, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes5, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas5, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas5, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas5, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes5, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes5, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel5, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares5, currentCode, currentCategory);
    //         }
    //       } else if (i == 5) {
    //         setSelectedCategory(selectedCategory6, currentCategory);
    //         prod6.setName(currentProduct);
    //         prod6.setUnity(currentUnity);
    //         addLev6.setLevel(currentLevel);
    //         prod6.setQuantity(currentQuantity);
    //         prod6.setCategory(currentCategory);
    //         prod6.setCode(currentCode);
    //         prod6.setDad(currentDad);
    //         prod6.setTotalQuantity(currentQuantity);
    //         prod6.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(6);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos6, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes6, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas6, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas6, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas6, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes6, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes6, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel6, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares6, currentCode, currentCategory);
    //         }
    //       } else if (i == 6) {
    //         setSelectedCategory(selectedCategory7, currentCategory);
    //         prod7.setName(currentProduct);
    //         prod7.setUnity(currentUnity);
    //         addLev7.setLevel(currentLevel);
    //         prod7.setQuantity(currentQuantity);
    //         prod7.setCategory(currentCategory);
    //         prod7.setCode(currentCode);
    //         prod7.setDad(currentDad);
    //         prod7.setTotalQuantity(currentQuantity);
    //         prod7.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(7);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos7, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes7, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas7, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas7, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas7, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes7, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes7, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel7, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares7, currentCode, currentCategory);
    //         }
    //       } else if (i == 7) {
    //         setSelectedCategory(selectedCategory8, currentCategory);
    //         prod8.setName(currentProduct);
    //         prod8.setUnity(currentUnity);
    //         addLev8.setLevel(currentLevel);
    //         prod8.setQuantity(currentQuantity);
    //         prod8.setCategory(currentCategory);
    //         prod8.setCode(currentCode);
    //         prod8.setDad(currentDad);
    //         prod8.setTotalQuantity(currentQuantity);
    //         prod8.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(8);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos8, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes8, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas8, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas8, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas8, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes8, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes8, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel8, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares8, currentCode, currentCategory);
    //         }
    //       } else if (i == 8) {
    //         setSelectedCategory(selectedCategory9, currentCategory);
    //         prod9.setName(currentProduct);
    //         prod9.setUnity(currentUnity);
    //         addLev9.setLevel(currentLevel);
    //         prod9.setQuantity(currentQuantity);
    //         prod9.setCategory(currentCategory);
    //         prod9.setCode(currentCode);
    //         prod9.setDad(currentDad);
    //         prod9.setTotalQuantity(currentQuantity);
    //         prod9.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(9);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos9, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes9, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas9, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas9, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas9, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes9, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes9, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel9, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares9, currentCode, currentCategory);
    //         }
    //       } else if (i == 9) {
    //         setSelectedCategory(selectedCategory10, currentCategory);
    //         prod10.setName(currentProduct);
    //         prod10.setUnity(currentUnity);
    //         addLev10.setLevel(currentLevel);
    //         prod10.setQuantity(currentQuantity);
    //         prod10.setCategory(currentCategory);
    //         prod10.setCode(currentCode);
    //         prod10.setDad(currentDad);
    //         prod10.setTotalQuantity(currentQuantity);
    //         prod10.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(10);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos10, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes10, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas10, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas10, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas10, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes10, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes10, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel10, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares10, currentCode, currentCategory);
    //         }
    //       }
    //     }
    //   }
    // }
  } else if (cultureType.milho) {
    // ================================= PLANTIO MILHO ==========================================

    if (phaseOption.phase == "PLANTIO" &&
        recipeOption.milho["PLANTIO"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.milho["PLANTIO"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.milho["PLANTIO"]!.length) {
          currentQuantity =
              recipeOption.milho["PLANTIO"]![i]["quantity"];
          currentCode = recipeOption.milho["PLANTIO"]![i]["code"];
          currentCategory =
              recipeOption.milho["PLANTIO"]![i]["category"];
          currentProduct =
              recipeOption.milho["PLANTIO"]![i]["product"];
          currentUnity =
              recipeOption.milho["PLANTIO"]![i]["unity"];
          currentLevel =
              recipeOption.milho["PLANTIO"]![i]["level"];
          currentDad = recipeOption.milho["PLANTIO"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= PALITINHO MILHO ==========================================

    if (phaseOption.phase == "PALITINHO" &&
        recipeOption.milho["PALITINHO"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.milho["PALITINHO"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.milho["PALITINHO"]!.length) {
          currentQuantity = recipeOption
              .milho["PALITINHO"]![i]["quantity"];
          currentCode =
              recipeOption.milho["PALITINHO"]![i]["code"];
          currentCategory = recipeOption
              .milho["PALITINHO"]![i]["category"];
          currentProduct = recipeOption
              .milho["PALITINHO"]![i]["product"];
          currentUnity = recipeOption
              .milho["PALITINHO"]![i]["unity"];
          currentLevel = recipeOption
              .milho["PALITINHO"]![i]["level"];
          currentDad =
              recipeOption.milho["PALITINHO"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= APLICAÇÃO V2-V3 MILHO ==========================================

    if (phaseOption.phase == "APLICAÇÃO V2-V3" &&
        recipeOption.milho["APLICAÇÃO V2-V3"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.milho["APLICAÇÃO V2-V3"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.milho["APLICAÇÃO V2-V3"]!.length) {
          currentQuantity = recipeOption.milho["APLICAÇÃO V2-V3"]![i]["quantity"];
          currentCode = recipeOption.milho["APLICAÇÃO V2-V3"]![i]["code"];
          currentCategory = recipeOption.milho["APLICAÇÃO V2-V3"]![i]["category"];
          currentProduct = recipeOption.milho["APLICAÇÃO V2-V3"]![i]["product"];
          currentUnity = recipeOption.milho["APLICAÇÃO V2-V3"]![i]["unity"];
          currentLevel = recipeOption.milho["APLICAÇÃO V2-V3"]![i]["level"];
          currentDad = recipeOption.milho["APLICAÇÃO V2-V3"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= APLICAÇÃO V4-V5 MILHO ==========================================

    if (phaseOption.phase == "APLICAÇÃO V4-V5" &&
        recipeOption.milho["APLICAÇÃO V4-V5"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.milho["APLICAÇÃO V4-V5"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.milho["APLICAÇÃO V4-V5"]!.length) {
          currentQuantity =
              recipeOption.milho["APLICAÇÃO V4-V5"]![i]["quantity"];
          currentCode = recipeOption.milho["APLICAÇÃO V4-V5"]![i]["code"];
          currentCategory =
              recipeOption.milho["APLICAÇÃO V4-V5"]![i]["category"];
          currentProduct = recipeOption.milho["APLICAÇÃO V4-V5"]![i]["product"];
          currentUnity = recipeOption.milho["APLICAÇÃO V4-V5"]![i]["unity"];
          currentLevel = recipeOption.milho["APLICAÇÃO V4-V5"]![i]["level"];
          currentDad = recipeOption.milho["APLICAÇÃO V4-V5"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= APLICAÇÃO V8-V10 MILHO ==========================================

    if (phaseOption.phase == "APLICAÇÃO V8-V10" &&
        recipeOption.milho["APLICAÇÃO V8-V10"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.milho["APLICAÇÃO V8-V10"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.milho["APLICAÇÃO V8-V10"]!.length) {
          currentQuantity =
              recipeOption.milho["APLICAÇÃO V8-V10"]![i]["quantity"];
          currentCode = recipeOption.milho["APLICAÇÃO V8-V10"]![i]["code"];
          currentCategory =
              recipeOption.milho["APLICAÇÃO V8-V10"]![i]["category"];
          currentProduct =
              recipeOption.milho["APLICAÇÃO V8-V10"]![i]["product"];
          currentUnity = recipeOption.milho["APLICAÇÃO V8-V10"]![i]["unity"];
          currentLevel = recipeOption.milho["APLICAÇÃO V8-V10"]![i]["level"];
          currentDad = recipeOption.milho["APLICAÇÃO V8-V10"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= APLICAÇÃO R4-R5 MILHO ==========================================

    if (phaseOption.phase == "APLICAÇÃO R4-R5" &&
        recipeOption.milho["APLICAÇÃO R4-R5"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.milho["APLICAÇÃO R4-R5"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.milho["APLICAÇÃO R4-R5"]!.length) {
          currentQuantity =
              recipeOption.milho["APLICAÇÃO R4-R5"]![i]["quantity"];
          currentCode = recipeOption.milho["APLICAÇÃO R4-R5"]![i]["code"];
          currentCategory =
              recipeOption.milho["APLICAÇÃO R4-R5"]![i]["category"];
          currentProduct = recipeOption.milho["APLICAÇÃO R4-R5"]![i]["product"];
          currentUnity = recipeOption.milho["APLICAÇÃO R4-R5"]![i]["unity"];
          currentLevel = recipeOption.milho["APLICAÇÃO R4-R5"]![i]["level"];
          currentDad = recipeOption.milho["APLICAÇÃO R4-R5"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= COLHEITA MILHO ==========================================

    // if (phaseOption.phase == "COLHEITA" &&
    //     recipeOption.milho["COLHEITA"] != null) {
    //   amountProducts
    //       .setInitialAmount(recipeOption.milho["COLHEITA"]!.length);
    //   for (i = 0; i < 10; i++) {
    //     if (i < recipeOption.milho["COLHEITA"]!.length) {
    //       currentQuantity = recipeOption.milho["COLHEITA"]![i]["quantity"];
    //       currentCode = recipeOption.milho["COLHEITA"]![i]["code"];
    //       currentCategory = recipeOption.milho["COLHEITA"]![i]["category"];
    //       currentProduct = recipeOption.milho["COLHEITA"]![i]["product"];
    //       currentUnity = recipeOption.milho["COLHEITA"]![i]["unity"];
    //       currentLevel = recipeOption.milho["COLHEITA"]![i]["level"];
    //       currentDad = recipeOption.milho["COLHEITA"]![i]["dad"];
    //       if (i == 0) {
    //         setSelectedCategory(selectedCategory1, currentCategory);
    //         prod1.setName(currentProduct);
    //         prod1.setUnity(currentUnity);
    //         addLev1.setLevel(currentLevel);
    //         prod1.setQuantity(currentQuantity);
    //         prod1.setCategory(currentCategory);
    //         prod1.setCode(currentCode);
    //         prod1.setDad(currentDad);
    //         prod1.setTotalQuantity(currentQuantity);
    //         prod1.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(1);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos1, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes1, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas1, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas1, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas1, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes1, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes1, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel1, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares1, currentCode, currentCategory);
    //         }
    //       } else if (i == 1) {
    //         setSelectedCategory(selectedCategory2, currentCategory);
    //         prod2.setName(currentProduct);
    //         prod2.setUnity(currentUnity);
    //         addLev2.setLevel(currentLevel);
    //         prod2.setQuantity(currentQuantity);
    //         prod2.setCategory(currentCategory);
    //         prod2.setCode(currentCode);
    //         prod2.setDad(currentDad);
    //         prod2.setTotalQuantity(currentQuantity);
    //         prod2.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(2);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos2, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes2, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas2, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas2, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas2, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes2, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes2, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel2, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares2, currentCode, currentCategory);
    //         }
    //       } else if (i == 2) {
    //         setSelectedCategory(selectedCategory3, currentCategory);
    //         prod3.setName(currentProduct);
    //         prod3.setUnity(currentUnity);
    //         addLev3.setLevel(currentLevel);
    //         prod3.setQuantity(currentQuantity);
    //         prod3.setCategory(currentCategory);
    //         prod3.setCode(currentCode);
    //         prod3.setDad(currentDad);
    //         prod3.setTotalQuantity(currentQuantity);
    //         prod3.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(3);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos3, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes3, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas3, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas3, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas3, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes3, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes3, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel3, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares3, currentCode, currentCategory);
    //         }
    //       } else if (i == 3) {
    //         setSelectedCategory(selectedCategory4, currentCategory);
    //         prod4.setName(currentProduct);
    //         prod4.setUnity(currentUnity);
    //         addLev4.setLevel(currentLevel);
    //         prod4.setQuantity(currentQuantity);
    //         prod4.setCategory(currentCategory);
    //         prod4.setCode(currentCode);
    //         prod4.setDad(currentDad);
    //         prod4.setTotalQuantity(currentQuantity);
    //         prod4.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(4);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos4, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes4, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas4, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas4, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas4, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes4, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes4, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel4, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares4, currentCode, currentCategory);
    //         }
    //       } else if (i == 4) {
    //         setSelectedCategory(selectedCategory5, currentCategory);
    //         prod5.setName(currentProduct);
    //         prod5.setUnity(currentUnity);
    //         addLev5.setLevel(currentLevel);
    //         prod5.setQuantity(currentQuantity);
    //         prod5.setCategory(currentCategory);
    //         prod5.setCode(currentCode);
    //         prod5.setDad(currentDad);
    //         prod5.setTotalQuantity(currentQuantity);
    //         prod5.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(5);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos5, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes5, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas5, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas5, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas5, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes5, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes5, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel5, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares5, currentCode, currentCategory);
    //         }
    //       } else if (i == 5) {
    //         setSelectedCategory(selectedCategory6, currentCategory);
    //         prod6.setName(currentProduct);
    //         prod6.setUnity(currentUnity);
    //         addLev6.setLevel(currentLevel);
    //         prod6.setQuantity(currentQuantity);
    //         prod6.setCategory(currentCategory);
    //         prod6.setCode(currentCode);
    //         prod6.setDad(currentDad);
    //         prod6.setTotalQuantity(currentQuantity);
    //         prod6.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(6);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos6, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes6, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas6, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas6, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas6, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes6, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes6, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel6, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares6, currentCode, currentCategory);
    //         }
    //       } else if (i == 6) {
    //         setSelectedCategory(selectedCategory7, currentCategory);
    //         prod7.setName(currentProduct);
    //         prod7.setUnity(currentUnity);
    //         addLev7.setLevel(currentLevel);
    //         prod7.setQuantity(currentQuantity);
    //         prod7.setCategory(currentCategory);
    //         prod7.setCode(currentCode);
    //         prod7.setDad(currentDad);
    //         prod7.setTotalQuantity(currentQuantity);
    //         prod7.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(7);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos7, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes7, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas7, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas7, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas7, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes7, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes7, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel7, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares7, currentCode, currentCategory);
    //         }
    //       } else if (i == 7) {
    //         setSelectedCategory(selectedCategory8, currentCategory);
    //         prod8.setName(currentProduct);
    //         prod8.setUnity(currentUnity);
    //         addLev8.setLevel(currentLevel);
    //         prod8.setQuantity(currentQuantity);
    //         prod8.setCategory(currentCategory);
    //         prod8.setCode(currentCode);
    //         prod8.setDad(currentDad);
    //         prod8.setTotalQuantity(currentQuantity);
    //         prod8.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(8);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos8, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes8, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas8, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas8, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas8, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes8, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes8, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel8, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares8, currentCode, currentCategory);
    //         }
    //       } else if (i == 8) {
    //         setSelectedCategory(selectedCategory9, currentCategory);
    //         prod9.setName(currentProduct);
    //         prod9.setUnity(currentUnity);
    //         addLev9.setLevel(currentLevel);
    //         prod9.setQuantity(currentQuantity);
    //         prod9.setCategory(currentCategory);
    //         prod9.setCode(currentCode);
    //         prod9.setDad(currentDad);
    //         prod9.setTotalQuantity(currentQuantity);
    //         prod9.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(9);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos9, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes9, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas9, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas9, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas9, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes9, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes9, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel9, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares9, currentCode, currentCategory);
    //         }
    //       } else if (i == 9) {
    //         setSelectedCategory(selectedCategory10, currentCategory);
    //         prod10.setName(currentProduct);
    //         prod10.setUnity(currentUnity);
    //         addLev10.setLevel(currentLevel);
    //         prod10.setQuantity(currentQuantity);
    //         prod10.setCategory(currentCategory);
    //         prod10.setCode(currentCode);
    //         prod10.setDad(currentDad);
    //         prod10.setTotalQuantity(currentQuantity);
    //         prod10.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(10);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos10, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes10, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas10, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas10, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas10, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes10, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes10, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel10, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares10, currentCode, currentCategory);
    //         }
    //       }
    //     }
    //   }
    // }
  } else if (cultureType.trigo) {
    // ================================= APLICAÇÃO DESSECAÇÃO TRIGO ==========================================

    if (phaseOption.phase == "APLICAÇÃO DESSECAÇÃO" &&
        recipeOption.trigo["APLICAÇÃO DESSECAÇÃO"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.soja["APLICAÇÃO DESSECAÇÃO"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.trigo["APLICAÇÃO DESSECAÇÃO"]!.length) {
          currentQuantity =
              recipeOption.trigo["APLICAÇÃO DESSECAÇÃO"]![i]["quantity"];
          currentCode = recipeOption.trigo["APLICAÇÃO DESSECAÇÃO"]![i]["code"];
          currentCategory =
              recipeOption.trigo["APLICAÇÃO DESSECAÇÃO"]![i]["category"];
          currentProduct =
              recipeOption.trigo["APLICAÇÃO DESSECAÇÃO"]![i]["product"];
          currentUnity =
              recipeOption.trigo["APLICAÇÃO DESSECAÇÃO"]![i]["unity"];
          currentLevel =
              recipeOption.trigo["APLICAÇÃO DESSECAÇÃO"]![i]["level"];
          currentDad = recipeOption.trigo["APLICAÇÃO DESSECAÇÃO"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= APLICAÇÃO SEQUENCIAL TRIGO ==========================================

    if (phaseOption.phase == "APLICAÇÃO SEQUENCIAL" &&
        recipeOption.trigo["APLICAÇÃO SEQUENCIAL"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.trigo["APLICAÇÃO SEQUENCIAL"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.trigo["APLICAÇÃO SEQUENCIAL"]!.length) {
          currentQuantity = recipeOption
              .trigo["APLICAÇÃO SEQUENCIAL"]![i]["quantity"];
          currentCode =
              recipeOption.trigo["APLICAÇÃO SEQUENCIAL"]![i]["code"];
          currentCategory = recipeOption
              .trigo["APLICAÇÃO SEQUENCIAL"]![i]["category"];
          currentProduct = recipeOption
              .trigo["APLICAÇÃO SEQUENCIAL"]![i]["product"];
          currentUnity = recipeOption
              .trigo["APLICAÇÃO SEQUENCIAL"]![i]["unity"];
          currentLevel = recipeOption
              .trigo["APLICAÇÃO SEQUENCIAL"]![i]["level"];
          currentDad =
              recipeOption.trigo["APLICAÇÃO SEQUENCIAL"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= PLANTIO TRIGO ==========================================

    if (phaseOption.phase == "PLANTIO" &&
        recipeOption.trigo["PLANTIO"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.trigo["PLANTIO"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.trigo["PLANTIO"]!.length) {
          currentQuantity = recipeOption.trigo["PLANTIO"]![i]["quantity"];
          currentCode = recipeOption.trigo["PLANTIO"]![i]["code"];
          currentCategory = recipeOption.trigo["PLANTIO"]![i]["category"];
          currentProduct = recipeOption.trigo["PLANTIO"]![i]["product"];
          currentUnity = recipeOption.trigo["PLANTIO"]![i]["unity"];
          currentLevel = recipeOption.trigo["PLANTIO"]![i]["level"];
          currentDad = recipeOption.trigo["PLANTIO"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= APLICAÇÃO HERBICIDA TRIGO ==========================================

    if (phaseOption.phase == "APLICAÇÃO HERBICIDA" &&
        recipeOption.trigo["APLICAÇÃO HERBICIDA"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.trigo["APLICAÇÃO HERBICIDA"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.trigo["APLICAÇÃO HERBICIDA"]!.length) {
          currentQuantity =
              recipeOption.trigo["APLICAÇÃO HERBICIDA"]![i]["quantity"];
          currentCode = recipeOption.trigo["APLICAÇÃO HERBICIDA"]![i]["code"];
          currentCategory =
              recipeOption.trigo["APLICAÇÃO HERBICIDA"]![i]["category"];
          currentProduct = recipeOption.trigo["APLICAÇÃO HERBICIDA"]![i]["product"];
          currentUnity = recipeOption.trigo["APLICAÇÃO HERBICIDA"]![i]["unity"];
          currentLevel = recipeOption.trigo["APLICAÇÃO HERBICIDA"]![i]["level"];
          currentDad = recipeOption.trigo["APLICAÇÃO HERBICIDA"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= APLICAÇÃO COBERTURA TRIGO ==========================================

    if (phaseOption.phase == "APLICAÇÃO COBERTURA" &&
        recipeOption.trigo["APLICAÇÃO COBERTURA"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.trigo["APLICAÇÃO COBERTURA"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.trigo["APLICAÇÃO COBERTURA"]!.length) {
          currentQuantity =
              recipeOption.trigo["APLICAÇÃO COBERTURA"]![i]["quantity"];
          currentCode = recipeOption.trigo["APLICAÇÃO COBERTURA"]![i]["code"];
          currentCategory =
              recipeOption.trigo["APLICAÇÃO COBERTURA"]![i]["category"];
          currentProduct =
              recipeOption.trigo["APLICAÇÃO COBERTURA"]![i]["product"];
          currentUnity = recipeOption.trigo["APLICAÇÃO COBERTURA"]![i]["unity"];
          currentLevel = recipeOption.trigo["APLICAÇÃO COBERTURA"]![i]["level"];
          currentDad = recipeOption.trigo["APLICAÇÃO COBERTURA"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= ALONGAMENTO TRIGO ==========================================

    if (phaseOption.phase == "ALONGAMENTO" &&
        recipeOption.trigo["ALONGAMENTO"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.trigo["ALONGAMENTO"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.trigo["ALONGAMENTO"]!.length) {
          currentQuantity =
              recipeOption.trigo["ALONGAMENTO"]![i]["quantity"];
          currentCode = recipeOption.trigo["ALONGAMENTO"]![i]["code"];
          currentCategory =
              recipeOption.trigo["ALONGAMENTO"]![i]["category"];
          currentProduct = recipeOption.trigo["ALONGAMENTO"]![i]["product"];
          currentUnity = recipeOption.trigo["ALONGAMENTO"]![i]["unity"];
          currentLevel = recipeOption.trigo["ALONGAMENTO"]![i]["level"];
          currentDad = recipeOption.trigo["ALONGAMENTO"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= EMBORRACHAMENTO TRIGO ==========================================

    if (phaseOption.phase == "EMBORRACHAMENTO" &&
        recipeOption.trigo["EMBORRACHAMENTO"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.trigo["EMBORRACHAMENTO"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.trigo["EMBORRACHAMENTO"]!.length) {
          currentQuantity =
              recipeOption.trigo["EMBORRACHAMENTO"]![i]["quantity"];
          currentCode = recipeOption.trigo["EMBORRACHAMENTO"]![i]["code"];
          currentCategory =
              recipeOption.trigo["EMBORRACHAMENTO"]![i]["category"];
          currentProduct = recipeOption.trigo["EMBORRACHAMENTO"]![i]["product"];
          currentUnity = recipeOption.trigo["EMBORRACHAMENTO"]![i]["unity"];
          currentLevel = recipeOption.trigo["EMBORRACHAMENTO"]![i]["level"];
          currentDad = recipeOption.trigo["EMBORRACHAMENTO"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= ESPIGAMENTO_FLORESCIMENTO TRIGO ==========================================

    if (phaseOption.phase == "ESPIGAMENTO/FLORESCIMENTO" &&
        recipeOption.trigo["ESPIGAMENTO_FLORESCIMENTO"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.trigo["ESPIGAMENTO_FLORESCIMENTO"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.trigo["ESPIGAMENTO_FLORESCIMENTO"]!.length) {
          currentQuantity =
              recipeOption.trigo["ESPIGAMENTO_FLORESCIMENTO"]![i]["quantity"];
          currentCode = recipeOption.trigo["ESPIGAMENTO_FLORESCIMENTO"]![i]["code"];
          currentCategory =
              recipeOption.trigo["ESPIGAMENTO_FLORESCIMENTO"]![i]["category"];
          currentProduct =
              recipeOption.trigo["ESPIGAMENTO_FLORESCIMENTO"]![i]["product"];
          currentUnity = recipeOption.trigo["ESPIGAMENTO_FLORESCIMENTO"]![i]["unity"];
          currentLevel = recipeOption.trigo["ESPIGAMENTO_FLORESCIMENTO"]![i]["level"];
          currentDad = recipeOption.trigo["ESPIGAMENTO_FLORESCIMENTO"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }

    // ================================= ENXIMENTO DE GRÃOS TRIGO ==========================================

    if (phaseOption.phase == "ENXIMENTO DE GRÃOS" &&
        recipeOption.trigo["ENXIMENTO DE GRÃOS"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.trigo["ENXIMENTO DE GRÃOS"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.trigo["ENXIMENTO DE GRÃOS"]!.length) {
          currentQuantity = recipeOption.trigo["ENXIMENTO DE GRÃOS"]![i]["quantity"];
          currentCode = recipeOption.trigo["ENXIMENTO DE GRÃOS"]![i]["code"];
          currentCategory = recipeOption.trigo["ENXIMENTO DE GRÃOS"]![i]["category"];
          currentProduct = recipeOption.trigo["ENXIMENTO DE GRÃOS"]![i]["product"];
          currentUnity = recipeOption.trigo["ENXIMENTO DE GRÃOS"]![i]["unity"];
          currentLevel = recipeOption.trigo["ENXIMENTO DE GRÃOS"]![i]["level"];
          currentDad = recipeOption.trigo["ENXIMENTO DE GRÃOS"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }
    // ================================= MATURAÇÃO FINAL TRIGO ==========================================

    if (phaseOption.phase == "MATURAÇÃO FINAL" &&
        recipeOption.trigo["MATURAÇÃO FINAL"] != null) {
      amountProducts
          .setInitialAmount(recipeOption.trigo["MATURAÇÃO FINAL"]!.length);
      for (i = 0; i < 10; i++) {
        if (i < recipeOption.trigo["MATURAÇÃO FINAL"]!.length) {
          currentQuantity = recipeOption.trigo["MATURAÇÃO FINAL"]![i]["quantity"];
          currentCode = recipeOption.trigo["MATURAÇÃO FINAL"]![i]["code"];
          currentCategory = recipeOption.trigo["MATURAÇÃO FINAL"]![i]["category"];
          currentProduct = recipeOption.trigo["MATURAÇÃO FINAL"]![i]["product"];
          currentUnity = recipeOption.trigo["MATURAÇÃO FINAL"]![i]["unity"];
          currentLevel = recipeOption.trigo["MATURAÇÃO FINAL"]![i]["level"];
          currentDad = recipeOption.trigo["MATURAÇÃO FINAL"]![i]["dad"];
          if (i == 0) {
            setSelectedCategory(selectedCategory1, currentCategory);
            prod1.setName(currentProduct);
            prod1.setUnity(currentUnity);
            addLev1.setLevel(currentLevel);
            prod1.setQuantity(currentQuantity);
            prod1.setCategory(currentCategory);
            prod1.setCode(currentCode);
            prod1.setDad(currentDad);
            prod1.setTotalQuantity(currentQuantity);
            prod1.setRealQuantity(currentQuantity);
            amountProducts.setAmount(1);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos1, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes1, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas1, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas1, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas1, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes1, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes1, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel1, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares1, currentCode, currentCategory);
            }
          } else if (i == 1) {
            setSelectedCategory(selectedCategory2, currentCategory);
            prod2.setName(currentProduct);
            prod2.setUnity(currentUnity);
            addLev2.setLevel(currentLevel);
            prod2.setQuantity(currentQuantity);
            prod2.setCategory(currentCategory);
            prod2.setCode(currentCode);
            prod2.setDad(currentDad);
            prod2.setTotalQuantity(currentQuantity);
            prod2.setRealQuantity(currentQuantity);
            amountProducts.setAmount(2);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos2, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes2, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas2, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas2, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas2, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes2, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes2, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel2, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares2, currentCode, currentCategory);
            }
          } else if (i == 2) {
            setSelectedCategory(selectedCategory3, currentCategory);
            prod3.setName(currentProduct);
            prod3.setUnity(currentUnity);
            addLev3.setLevel(currentLevel);
            prod3.setQuantity(currentQuantity);
            prod3.setCategory(currentCategory);
            prod3.setCode(currentCode);
            prod3.setDad(currentDad);
            prod3.setTotalQuantity(currentQuantity);
            prod3.setRealQuantity(currentQuantity);
            amountProducts.setAmount(3);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos3, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes3, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas3, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas3, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas3, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes3, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes3, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel3, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares3, currentCode, currentCategory);
            }
          } else if (i == 3) {
            setSelectedCategory(selectedCategory4, currentCategory);
            prod4.setName(currentProduct);
            prod4.setUnity(currentUnity);
            addLev4.setLevel(currentLevel);
            prod4.setQuantity(currentQuantity);
            prod4.setCategory(currentCategory);
            prod4.setCode(currentCode);
            prod4.setDad(currentDad);
            prod4.setTotalQuantity(currentQuantity);
            prod4.setRealQuantity(currentQuantity);
            amountProducts.setAmount(4);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos4, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes4, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas4, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas4, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas4, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes4, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes4, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel4, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares4, currentCode, currentCategory);
            }
          } else if (i == 4) {
            setSelectedCategory(selectedCategory5, currentCategory);
            prod5.setName(currentProduct);
            prod5.setUnity(currentUnity);
            addLev5.setLevel(currentLevel);
            prod5.setQuantity(currentQuantity);
            prod5.setCategory(currentCategory);
            prod5.setCode(currentCode);
            prod5.setDad(currentDad);
            prod5.setTotalQuantity(currentQuantity);
            prod5.setRealQuantity(currentQuantity);
            amountProducts.setAmount(5);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos5, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes5, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas5, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas5, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas5, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes5, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes5, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel5, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares5, currentCode, currentCategory);
            }
          } else if (i == 5) {
            setSelectedCategory(selectedCategory6, currentCategory);
            prod6.setName(currentProduct);
            prod6.setUnity(currentUnity);
            addLev6.setLevel(currentLevel);
            prod6.setQuantity(currentQuantity);
            prod6.setCategory(currentCategory);
            prod6.setCode(currentCode);
            prod6.setDad(currentDad);
            prod6.setTotalQuantity(currentQuantity);
            prod6.setRealQuantity(currentQuantity);
            amountProducts.setAmount(6);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos6, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes6, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas6, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas6, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas6, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes6, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes6, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel6, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares6, currentCode, currentCategory);
            }
          } else if (i == 6) {
            setSelectedCategory(selectedCategory7, currentCategory);
            prod7.setName(currentProduct);
            prod7.setUnity(currentUnity);
            addLev7.setLevel(currentLevel);
            prod7.setQuantity(currentQuantity);
            prod7.setCategory(currentCategory);
            prod7.setCode(currentCode);
            prod7.setDad(currentDad);
            prod7.setTotalQuantity(currentQuantity);
            prod7.setRealQuantity(currentQuantity);
            amountProducts.setAmount(7);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos7, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes7, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas7, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas7, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas7, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes7, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes7, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel7, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares7, currentCode, currentCategory);
            }
          } else if (i == 7) {
            setSelectedCategory(selectedCategory8, currentCategory);
            prod8.setName(currentProduct);
            prod8.setUnity(currentUnity);
            addLev8.setLevel(currentLevel);
            prod8.setQuantity(currentQuantity);
            prod8.setCategory(currentCategory);
            prod8.setCode(currentCode);
            prod8.setDad(currentDad);
            prod8.setTotalQuantity(currentQuantity);
            prod8.setRealQuantity(currentQuantity);
            amountProducts.setAmount(8);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos8, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes8, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas8, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas8, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas8, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes8, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes8, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel8, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares8, currentCode, currentCategory);
            }
          } else if (i == 8) {
            setSelectedCategory(selectedCategory9, currentCategory);
            prod9.setName(currentProduct);
            prod9.setUnity(currentUnity);
            addLev9.setLevel(currentLevel);
            prod9.setQuantity(currentQuantity);
            prod9.setCategory(currentCategory);
            prod9.setCode(currentCode);
            prod9.setDad(currentDad);
            prod9.setTotalQuantity(currentQuantity);
            prod9.setRealQuantity(currentQuantity);
            amountProducts.setAmount(9);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos9, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes9, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas9, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas9, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas9, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes9, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes9, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel9, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares9, currentCode, currentCategory);
            }
          } else if (i == 9) {
            setSelectedCategory(selectedCategory10, currentCategory);
            prod10.setName(currentProduct);
            prod10.setUnity(currentUnity);
            addLev10.setLevel(currentLevel);
            prod10.setQuantity(currentQuantity);
            prod10.setCategory(currentCategory);
            prod10.setCode(currentCode);
            prod10.setDad(currentDad);
            prod10.setTotalQuantity(currentQuantity);
            prod10.setRealQuantity(currentQuantity);
            amountProducts.setAmount(10);

            if (currentCategory == "adubo") {
              setSelectedProducts(adubos10, currentCode, currentCategory);
            } else if (currentCategory == "semente") {
              setSelectedProducts(sementes10, currentCode, currentCategory);
            } else if (currentCategory == "herbicida") {
              setSelectedProducts(herbicidas10, currentCode, currentCategory);
            } else if (currentCategory == "fungicida") {
              setSelectedProducts(fungicidas10, currentCode, currentCategory);
            } else if (currentCategory == "inseticida") {
              setSelectedProducts(inseticidas10, currentCode, currentCategory);
            } else if (currentCategory == "adjuvante") {
              setSelectedProducts(adjuvantes10, currentCode, currentCategory);
            } else if (currentCategory == "inoculante") {
              setSelectedProducts(inoculantes10, currentCode, currentCategory);
            } else if (currentCategory == "diesel") {
              setSelectedProducts(diesel10, currentCode, currentCategory);
            } else if (currentCategory == "fertilizanteFoliar") {
              setSelectedProducts(
                  fertilizantesFoliares10, currentCode, currentCategory);
            }
          }
        }
      }
    }
    // ================================= COLHEITA TRIGO ==========================================

    // if (phaseOption.phase == "COLHEITA" &&
    //     recipeOption.trigo["COLHEITA"] != null) {
    //   amountProducts
    //       .setInitialAmount(recipeOption.trigo["COLHEITA"]!.length);
    //   for (i = 0; i < 10; i++) {
    //     if (i < recipeOption.trigo["COLHEITA"]!.length) {
    //       currentQuantity = recipeOption.trigo["COLHEITA"]![i]["quantity"];
    //       currentCode = recipeOption.trigo["COLHEITA"]![i]["code"];
    //       currentCategory = recipeOption.trigo["COLHEITA"]![i]["category"];
    //       currentProduct = recipeOption.trigo["COLHEITA"]![i]["product"];
    //       currentUnity = recipeOption.trigo["COLHEITA"]![i]["unity"];
    //       currentLevel = recipeOption.trigo["COLHEITA"]![i]["level"];
    //       currentDad = recipeOption.trigo["COLHEITA"]![i]["dad"];
    //       if (i == 0) {
    //         setSelectedCategory(selectedCategory1, currentCategory);
    //         prod1.setName(currentProduct);
    //         prod1.setUnity(currentUnity);
    //         addLev1.setLevel(currentLevel);
    //         prod1.setQuantity(currentQuantity);
    //         prod1.setCategory(currentCategory);
    //         prod1.setCode(currentCode);
    //         prod1.setDad(currentDad);
    //         prod1.setTotalQuantity(currentQuantity);
    //         prod1.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(1);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos1, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes1, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas1, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas1, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas1, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes1, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes1, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel1, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares1, currentCode, currentCategory);
    //         }
    //       } else if (i == 1) {
    //         setSelectedCategory(selectedCategory2, currentCategory);
    //         prod2.setName(currentProduct);
    //         prod2.setUnity(currentUnity);
    //         addLev2.setLevel(currentLevel);
    //         prod2.setQuantity(currentQuantity);
    //         prod2.setCategory(currentCategory);
    //         prod2.setCode(currentCode);
    //         prod2.setDad(currentDad);
    //         prod2.setTotalQuantity(currentQuantity);
    //         prod2.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(2);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos2, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes2, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas2, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas2, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas2, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes2, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes2, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel2, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares2, currentCode, currentCategory);
    //         }
    //       } else if (i == 2) {
    //         setSelectedCategory(selectedCategory3, currentCategory);
    //         prod3.setName(currentProduct);
    //         prod3.setUnity(currentUnity);
    //         addLev3.setLevel(currentLevel);
    //         prod3.setQuantity(currentQuantity);
    //         prod3.setCategory(currentCategory);
    //         prod3.setCode(currentCode);
    //         prod3.setDad(currentDad);
    //         prod3.setTotalQuantity(currentQuantity);
    //         prod3.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(3);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos3, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes3, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas3, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas3, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas3, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes3, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes3, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel3, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares3, currentCode, currentCategory);
    //         }
    //       } else if (i == 3) {
    //         setSelectedCategory(selectedCategory4, currentCategory);
    //         prod4.setName(currentProduct);
    //         prod4.setUnity(currentUnity);
    //         addLev4.setLevel(currentLevel);
    //         prod4.setQuantity(currentQuantity);
    //         prod4.setCategory(currentCategory);
    //         prod4.setCode(currentCode);
    //         prod4.setDad(currentDad);
    //         prod4.setTotalQuantity(currentQuantity);
    //         prod4.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(4);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos4, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes4, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas4, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas4, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas4, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes4, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes4, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel4, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares4, currentCode, currentCategory);
    //         }
    //       } else if (i == 4) {
    //         setSelectedCategory(selectedCategory5, currentCategory);
    //         prod5.setName(currentProduct);
    //         prod5.setUnity(currentUnity);
    //         addLev5.setLevel(currentLevel);
    //         prod5.setQuantity(currentQuantity);
    //         prod5.setCategory(currentCategory);
    //         prod5.setCode(currentCode);
    //         prod5.setDad(currentDad);
    //         prod5.setTotalQuantity(currentQuantity);
    //         prod5.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(5);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos5, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes5, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas5, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas5, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas5, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes5, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes5, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel5, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares5, currentCode, currentCategory);
    //         }
    //       } else if (i == 5) {
    //         setSelectedCategory(selectedCategory6, currentCategory);
    //         prod6.setName(currentProduct);
    //         prod6.setUnity(currentUnity);
    //         addLev6.setLevel(currentLevel);
    //         prod6.setQuantity(currentQuantity);
    //         prod6.setCategory(currentCategory);
    //         prod6.setCode(currentCode);
    //         prod6.setDad(currentDad);
    //         prod6.setTotalQuantity(currentQuantity);
    //         prod6.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(6);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos6, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes6, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas6, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas6, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas6, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes6, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes6, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel6, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares6, currentCode, currentCategory);
    //         }
    //       } else if (i == 6) {
    //         setSelectedCategory(selectedCategory7, currentCategory);
    //         prod7.setName(currentProduct);
    //         prod7.setUnity(currentUnity);
    //         addLev7.setLevel(currentLevel);
    //         prod7.setQuantity(currentQuantity);
    //         prod7.setCategory(currentCategory);
    //         prod7.setCode(currentCode);
    //         prod7.setDad(currentDad);
    //         prod7.setTotalQuantity(currentQuantity);
    //         prod7.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(7);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos7, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes7, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas7, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas7, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas7, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes7, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes7, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel7, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares7, currentCode, currentCategory);
    //         }
    //       } else if (i == 7) {
    //         setSelectedCategory(selectedCategory8, currentCategory);
    //         prod8.setName(currentProduct);
    //         prod8.setUnity(currentUnity);
    //         addLev8.setLevel(currentLevel);
    //         prod8.setQuantity(currentQuantity);
    //         prod8.setCategory(currentCategory);
    //         prod8.setCode(currentCode);
    //         prod8.setDad(currentDad);
    //         prod8.setTotalQuantity(currentQuantity);
    //         prod8.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(8);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos8, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes8, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas8, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas8, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas8, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes8, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes8, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel8, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares8, currentCode, currentCategory);
    //         }
    //       } else if (i == 8) {
    //         setSelectedCategory(selectedCategory9, currentCategory);
    //         prod9.setName(currentProduct);
    //         prod9.setUnity(currentUnity);
    //         addLev9.setLevel(currentLevel);
    //         prod9.setQuantity(currentQuantity);
    //         prod9.setCategory(currentCategory);
    //         prod9.setCode(currentCode);
    //         prod9.setDad(currentDad);
    //         prod9.setTotalQuantity(currentQuantity);
    //         prod9.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(9);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos9, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes9, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas9, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas9, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas9, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes9, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes9, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel9, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares9, currentCode, currentCategory);
    //         }
    //       } else if (i == 9) {
    //         setSelectedCategory(selectedCategory10, currentCategory);
    //         prod10.setName(currentProduct);
    //         prod10.setUnity(currentUnity);
    //         addLev10.setLevel(currentLevel);
    //         prod10.setQuantity(currentQuantity);
    //         prod10.setCategory(currentCategory);
    //         prod10.setCode(currentCode);
    //         prod10.setDad(currentDad);
    //         prod10.setTotalQuantity(currentQuantity);
    //         prod10.setRealQuantity(currentQuantity);
    //         amountProducts.setAmount(10);

    //         if (currentCategory == "adubo") {
    //           setSelectedProducts(adubos10, currentCode, currentCategory);
    //         } else if (currentCategory == "semente") {
    //           setSelectedProducts(sementes10, currentCode, currentCategory);
    //         } else if (currentCategory == "herbicida") {
    //           setSelectedProducts(herbicidas10, currentCode, currentCategory);
    //         } else if (currentCategory == "fungicida") {
    //           setSelectedProducts(fungicidas10, currentCode, currentCategory);
    //         } else if (currentCategory == "inseticida") {
    //           setSelectedProducts(inseticidas10, currentCode, currentCategory);
    //         } else if (currentCategory == "adjuvante") {
    //           setSelectedProducts(adjuvantes10, currentCode, currentCategory);
    //         } else if (currentCategory == "inoculante") {
    //           setSelectedProducts(inoculantes10, currentCode, currentCategory);
    //         } else if (currentCategory == "diesel") {
    //           setSelectedProducts(diesel10, currentCode, currentCategory);
    //         } else if (currentCategory == "fertilizanteFoliar") {
    //           setSelectedProducts(
    //               fertilizantesFoliares10, currentCode, currentCategory);
    //         }
    //       }
    //     }
    //   }
    // }
  }
}

void setSelectedCategory(
    SelectedCategoryController selCat, String currentCategory) {
  if (currentCategory == "adubo") {
    selCat.setAdubos();
  } else if (currentCategory == "semente") {
    selCat.setSementes();
  } else if (currentCategory == "herbicida") {
    selCat.setHerbicidas();
  } else if (currentCategory == "fungicida") {
    selCat.setFungicidas();
  } else if (currentCategory == "inseticida") {
    selCat.setInseticidas();
  } else if (currentCategory == "adjuvante") {
    selCat.setAdjuvantes();
  } else if (currentCategory == "inoculante") {
    selCat.setInoculantes();
  } else if (currentCategory == "diesel") {
    selCat.setDiesel();
  } else if (currentCategory == "fertilizanteFoliar") {
    selCat.setFertilizantesFoliares();
  }
}

void setSelectedProducts(
    CategoryModel product, String currentCode, String currentCategory) async {
  bool succes = false;

  GetDadInfos getDadInfos = GetDadInfos();
  GetNumberProduct numberProduct = GetNumberProduct();
  int? numDad;

  for (var p in product.nivel1) {
    if (p["code"] == currentCode) {
      product.setSelectedNivel1(currentCode);
      succes = true;
    }
  }
  if (!succes) {
    for (var p in product.nivel2) {
      if (p["code"] == currentCode) {
        product.setSelectedNivel2(currentCode);
        product.setSelectedNivel1(p["dad"]);
        filterSons(product, 2);
        succes = true;
      }
    }
  }
  if (!succes) {
    for (var p in product.nivel3) {
      if (p["code"] == currentCode) {
        product.setSelectedNivel3(currentCode);

        numDad = await numberProduct.get(currentCategory, p["dad"], 2);
        Map<String, dynamic>? nvl2 =
            await getDadInfos.get(currentCategory, 2, numDad!);
        product.setSelectedNivel2(nvl2!["code"]);
        filterSons(product, 3);

        numDad = await numberProduct.get(currentCategory, nvl2["dad"], 1);
        Map<String, dynamic>? nvl1 =
            await getDadInfos.get(currentCategory, 1, numDad!);
        product.setSelectedNivel1(nvl1!["code"]);
        filterSons(product, 2);
        succes = true;
      }
    }
  }
  if (!succes) {
    for (var p in product.nivel4) {
      if (p["code"] == currentCode) {
        product.setSelectedNivel4(currentCode);

        numDad = await numberProduct.get(currentCategory, p["dad"], 3);
        Map<String, dynamic>? nvl3 =
            await getDadInfos.get(currentCategory, 3, numDad!);
        product.setSelectedNivel3(nvl3!["code"]);
        filterSons(product, 4);

        numDad = await numberProduct.get(currentCategory, nvl3["dad"], 2);
        Map<String, dynamic>? nvl2 =
            await getDadInfos.get(currentCategory, 2, numDad!);
        product.setSelectedNivel2(nvl2!["code"]);
        filterSons(product, 3);

        numDad = await numberProduct.get(currentCategory, nvl2["dad"], 1);
        Map<String, dynamic>? nvl1 =
            await getDadInfos.get(currentCategory, 1, numDad!);
        product.setSelectedNivel1(nvl1!["code"]);
        filterSons(product, 2);
        succes = true;
      }
    }
  }
  if (!succes) {
    for (var p in product.nivel5) {
      if (p["code"] == currentCode) {
        product.setSelectedNivel5(currentCode);

        numDad = await numberProduct.get(currentCategory, p["dad"], 4);
        Map<String, dynamic>? nvl4 =
            await getDadInfos.get(currentCategory, 4, numDad!);
        product.setSelectedNivel4(nvl4!["code"]);
        filterSons(product, 5);

        numDad = await numberProduct.get(currentCategory, nvl4["dad"], 3);
        Map<String, dynamic>? nvl3 =
            await getDadInfos.get(currentCategory, 3, numDad!);
        product.setSelectedNivel3(nvl3!["code"]);
        filterSons(product, 4);

        numDad = await numberProduct.get(currentCategory, nvl3["dad"], 2);
        Map<String, dynamic>? nvl2 =
            await getDadInfos.get(currentCategory, 2, numDad!);
        product.setSelectedNivel2(nvl2!["code"]);
        filterSons(product, 3);

        numDad = await numberProduct.get(currentCategory, nvl2["dad"], 1);
        Map<String, dynamic>? nvl1 =
            await getDadInfos.get(currentCategory, 1, numDad!);
        product.setSelectedNivel1(nvl1!["code"]);
        filterSons(product, 2);
        succes = true;
      }
    }
  }
  if (!succes) {
    for (var p in product.nivel6) {
      if (p["code"] == currentCode) {
        product.setSelectedNivel6(currentCode);

        numDad = await numberProduct.get(currentCategory, p["dad"], 5);
        Map<String, dynamic>? nvl5 =
            await getDadInfos.get(currentCategory, 5, numDad!);
        product.setSelectedNivel5(nvl5!["code"]);
        filterSons(product, 6);

        numDad = await numberProduct.get(currentCategory, nvl5["dad"], 4);
        Map<String, dynamic>? nvl4 =
            await getDadInfos.get(currentCategory, 4, numDad!);
        product.setSelectedNivel4(nvl4!["code"]);
        filterSons(product, 5);

        numDad = await numberProduct.get(currentCategory, nvl4["dad"], 3);
        Map<String, dynamic>? nvl3 =
            await getDadInfos.get(currentCategory, 3, numDad!);
        product.setSelectedNivel3(nvl3!["code"]);
        filterSons(product, 4);

        numDad = await numberProduct.get(currentCategory, nvl3["dad"], 2);
        Map<String, dynamic>? nvl2 =
            await getDadInfos.get(currentCategory, 2, numDad!);
        product.setSelectedNivel2(nvl2!["code"]);
        filterSons(product, 3);

        numDad = await numberProduct.get(currentCategory, nvl2["dad"], 1);
        Map<String, dynamic>? nvl1 =
            await getDadInfos.get(currentCategory, 1, numDad!);
        product.setSelectedNivel1(nvl1!["code"]);
        filterSons(product, 2);
        succes = true;
      }
    }
  }
  if (!succes) {
    for (var p in product.nivel7) {
      if (p["code"] == currentCode) {
        product.setSelectedNivel7(currentCode);

        numDad = await numberProduct.get(currentCategory, p["dad"], 6);
        Map<String, dynamic>? nvl6 =
            await getDadInfos.get(currentCategory, 6, numDad!);
        product.setSelectedNivel6(nvl6!["code"]);
        filterSons(product, 7);

        numDad = await numberProduct.get(currentCategory, nvl6["dad"], 5);
        Map<String, dynamic>? nvl5 =
            await getDadInfos.get(currentCategory, 5, numDad!);
        product.setSelectedNivel5(nvl5!["code"]);
        filterSons(product, 6);

        numDad = await numberProduct.get(currentCategory, nvl5["dad"], 4);
        Map<String, dynamic>? nvl4 =
            await getDadInfos.get(currentCategory, 4, numDad!);
        product.setSelectedNivel4(nvl4!["code"]);
        filterSons(product, 5);

        numDad = await numberProduct.get(currentCategory, nvl4["dad"], 3);
        Map<String, dynamic>? nvl3 =
            await getDadInfos.get(currentCategory, 3, numDad!);
        product.setSelectedNivel3(nvl3!["code"]);
        filterSons(product, 4);

        numDad = await numberProduct.get(currentCategory, nvl3["dad"], 2);
        Map<String, dynamic>? nvl2 =
            await getDadInfos.get(currentCategory, 2, numDad!);
        product.setSelectedNivel2(nvl2!["code"]);
        filterSons(product, 3);

        numDad = await numberProduct.get(currentCategory, nvl2["dad"], 1);
        Map<String, dynamic>? nvl1 =
            await getDadInfos.get(currentCategory, 1, numDad!);
        product.setSelectedNivel1(nvl1!["code"]);
        filterSons(product, 2);
        succes = true;
      }
    }
  }
  if (!succes) {
    for (var p in product.nivel8) {
      if (p["code"] == currentCode) {
        product.setSelectedNivel8(currentCode);

        numDad = await numberProduct.get(currentCategory, p["dad"], 7);
        Map<String, dynamic>? nvl7 =
            await getDadInfos.get(currentCategory, 7, numDad!);
        product.setSelectedNivel7(nvl7!["code"]);
        filterSons(product, 8);

        numDad = await numberProduct.get(currentCategory, nvl7["dad"], 6);
        Map<String, dynamic>? nvl6 =
            await getDadInfos.get(currentCategory, 6, numDad!);
        product.setSelectedNivel6(nvl6!["code"]);
        filterSons(product, 7);

        numDad = await numberProduct.get(currentCategory, nvl6["dad"], 5);
        Map<String, dynamic>? nvl5 =
            await getDadInfos.get(currentCategory, 5, numDad!);
        product.setSelectedNivel5(nvl5!["code"]);
        filterSons(product, 6);

        numDad = await numberProduct.get(currentCategory, nvl5["dad"], 4);
        Map<String, dynamic>? nvl4 =
            await getDadInfos.get(currentCategory, 4, numDad!);
        product.setSelectedNivel4(nvl4!["code"]);
        filterSons(product, 5);

        numDad = await numberProduct.get(currentCategory, nvl4["dad"], 3);
        Map<String, dynamic>? nvl3 =
            await getDadInfos.get(currentCategory, 3, numDad!);
        product.setSelectedNivel3(nvl3!["code"]);
        filterSons(product, 4);

        numDad = await numberProduct.get(currentCategory, nvl3["dad"], 2);
        Map<String, dynamic>? nvl2 =
            await getDadInfos.get(currentCategory, 2, numDad!);
        product.setSelectedNivel2(nvl2!["code"]);
        filterSons(product, 3);

        numDad = await numberProduct.get(currentCategory, nvl2["dad"], 1);
        Map<String, dynamic>? nvl1 =
            await getDadInfos.get(currentCategory, 1, numDad!);
        product.setSelectedNivel1(nvl1!["code"]);
        filterSons(product, 2);
        succes = true;
      }
    }
  }
  if (!succes) {
    for (var p in product.nivel9) {
      if (p["code"] == currentCode) {
        product.setSelectedNivel9(currentCode);

        numDad = await numberProduct.get(currentCategory, p["dad"], 8);
        Map<String, dynamic>? nvl8 =
            await getDadInfos.get(currentCategory, 8, numDad!);
        product.setSelectedNivel8(nvl8!["code"]);
        filterSons(product, 9);

        numDad = await numberProduct.get(currentCategory, nvl8["dad"], 7);
        Map<String, dynamic>? nvl7 =
            await getDadInfos.get(currentCategory, 7, numDad!);
        product.setSelectedNivel7(nvl7!["code"]);
        filterSons(product, 8);

        numDad = await numberProduct.get(currentCategory, nvl7["dad"], 6);
        Map<String, dynamic>? nvl6 =
            await getDadInfos.get(currentCategory, 6, numDad!);
        product.setSelectedNivel6(nvl6!["code"]);
        filterSons(product, 7);

        numDad = await numberProduct.get(currentCategory, nvl6["dad"], 5);
        Map<String, dynamic>? nvl5 =
            await getDadInfos.get(currentCategory, 5, numDad!);
        product.setSelectedNivel5(nvl5!["code"]);
        filterSons(product, 6);

        numDad = await numberProduct.get(currentCategory, nvl5["dad"], 4);
        Map<String, dynamic>? nvl4 =
            await getDadInfos.get(currentCategory, 4, numDad!);
        product.setSelectedNivel4(nvl4!["code"]);
        filterSons(product, 5);

        numDad = await numberProduct.get(currentCategory, nvl4["dad"], 3);
        Map<String, dynamic>? nvl3 =
            await getDadInfos.get(currentCategory, 3, numDad!);
        product.setSelectedNivel3(nvl3!["code"]);
        filterSons(product, 4);

        numDad = await numberProduct.get(currentCategory, nvl3["dad"], 2);
        Map<String, dynamic>? nvl2 =
            await getDadInfos.get(currentCategory, 2, numDad!);
        product.setSelectedNivel2(nvl2!["code"]);
        filterSons(product, 3);

        numDad = await numberProduct.get(currentCategory, nvl2["dad"], 1);
        Map<String, dynamic>? nvl1 =
            await getDadInfos.get(currentCategory, 1, numDad!);
        product.setSelectedNivel1(nvl1!["code"]);
        filterSons(product, 2);
        succes = true;
      }
    }
  }
  if (!succes) {
    for (var p in product.nivel10) {
      if (p["code"] == currentCode) {
        product.setSelectedNivel10(currentCode);

        numDad = await numberProduct.get(currentCategory, p["dad"], 9);
        Map<String, dynamic>? nvl9 =
            await getDadInfos.get(currentCategory, 9, numDad!);
        product.setSelectedNivel9(nvl9!["code"]);
        filterSons(product, 10);

        numDad = await numberProduct.get(currentCategory, nvl9["dad"], 8);
        Map<String, dynamic>? nvl8 =
            await getDadInfos.get(currentCategory, 8, numDad!);
        product.setSelectedNivel8(nvl8!["code"]);
        filterSons(product, 9);

        numDad = await numberProduct.get(currentCategory, nvl8["dad"], 7);
        Map<String, dynamic>? nvl7 =
            await getDadInfos.get(currentCategory, 7, numDad!);
        product.setSelectedNivel7(nvl7!["code"]);
        filterSons(product, 8);

        numDad = await numberProduct.get(currentCategory, nvl7["dad"], 6);
        Map<String, dynamic>? nvl6 =
            await getDadInfos.get(currentCategory, 6, numDad!);
        product.setSelectedNivel6(nvl6!["code"]);
        filterSons(product, 7);

        numDad = await numberProduct.get(currentCategory, nvl6["dad"], 5);
        Map<String, dynamic>? nvl5 =
            await getDadInfos.get(currentCategory, 5, numDad!);
        product.setSelectedNivel5(nvl5!["code"]);
        filterSons(product, 6);

        numDad = await numberProduct.get(currentCategory, nvl5["dad"], 4);
        Map<String, dynamic>? nvl4 =
            await getDadInfos.get(currentCategory, 4, numDad!);
        product.setSelectedNivel4(nvl4!["code"]);
        filterSons(product, 5);

        numDad = await numberProduct.get(currentCategory, nvl4["dad"], 3);
        Map<String, dynamic>? nvl3 =
            await getDadInfos.get(currentCategory, 3, numDad!);
        product.setSelectedNivel3(nvl3!["code"]);
        filterSons(product, 4);

        numDad = await numberProduct.get(currentCategory, nvl3["dad"], 2);
        Map<String, dynamic>? nvl2 =
            await getDadInfos.get(currentCategory, 2, numDad!);
        product.setSelectedNivel2(nvl2!["code"]);
        filterSons(product, 3);

        numDad = await numberProduct.get(currentCategory, nvl2["dad"], 1);
        Map<String, dynamic>? nvl1 =
            await getDadInfos.get(currentCategory, 1, numDad!);
        product.setSelectedNivel1(nvl1!["code"]);
        filterSons(product, 2);
        succes = true;
      }
    }
  }
}
