import '../../../../controllers/category_models/category_model.dart';

void filterSons(CategoryModel adubos, int nivel) {
  switch (nivel) {
    case 2:
      for (var adubo in adubos.nivel2) {
        if (adubo["dad"] == adubos.selectedNivel1) {
          adubos.filteredNivel2.add(adubo);
        }
      }
    case 3:
      for (var adubo in adubos.nivel3) {
        if (adubo["dad"] == adubos.selectedNivel2) {
          adubos.filteredNivel3.add(adubo);
        }
      }
    case 4:
      for (var adubo in adubos.nivel4) {
        if (adubo["dad"] == adubos.selectedNivel3) {
          adubos.filteredNivel4.add(adubo);
        }
      }
    case 5:
      for (var adubo in adubos.nivel5) {
        if (adubo["dad"] == adubos.selectedNivel4) {
          adubos.filteredNivel5.add(adubo);
        }
      }
    case 6:
      for (var adubo in adubos.nivel6) {
        if (adubo["dad"] == adubos.selectedNivel5) {
          adubos.filteredNivel6.add(adubo);
        }
      }
    case 7:
      for (var adubo in adubos.nivel7) {
        if (adubo["dad"] == adubos.selectedNivel6) {
          adubos.filteredNivel7.add(adubo);
        }
      }
    case 8:
      for (var adubo in adubos.nivel8) {
        if (adubo["dad"] == adubos.selectedNivel7) {
          adubos.filteredNivel8.add(adubo);
        }
      }
    case 9:
      for (var adubo in adubos.nivel9) {
        if (adubo["dad"] == adubos.selectedNivel8) {
          adubos.filteredNivel9.add(adubo);
        }
      }
    case 10:
      for (var adubo in adubos.nivel10) {
        if (adubo["dad"] == adubos.selectedNivel9) {
          adubos.filteredNivel10.add(adubo);
        }
      }
  }
}
