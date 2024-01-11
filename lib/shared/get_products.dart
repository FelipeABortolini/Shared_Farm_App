import '../controllers/category_models/category_model.dart';
import '../db/products/utils/get_levels.dart';

Future<int> getProducts(CategoryModel adubos, String categoryString) async {
  final getLevels = GetLevels();

  adubos.nivel1 = await getLevels.getLevel(categoryString, 1);
  adubos.nivel2 = await getLevels.getLevel(categoryString, 2);
  adubos.nivel3 = await getLevels.getLevel(categoryString, 3);
  adubos.nivel4 = await getLevels.getLevel(categoryString, 4);
  adubos.nivel5 = await getLevels.getLevel(categoryString, 5);
  adubos.nivel6 = await getLevels.getLevel(categoryString, 6);
  adubos.nivel7 = await getLevels.getLevel(categoryString, 7);
  adubos.nivel8 = await getLevels.getLevel(categoryString, 8);
  adubos.nivel9 = await getLevels.getLevel(categoryString, 9);
  adubos.nivel10 = await getLevels.getLevel(categoryString, 10);

  return 0;
}
