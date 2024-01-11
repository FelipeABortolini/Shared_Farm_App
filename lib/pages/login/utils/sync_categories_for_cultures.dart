import '../../../controllers/category_models/fertilizantes_foliares_controller.dart';
import '../../../controllers/category_models/adjuvantes_controller.dart';
import '../../../controllers/category_models/adubos_controller.dart';
import '../../../controllers/category_models/diesel_controller.dart';
import '../../../controllers/category_models/fungicidas_controller.dart';
import '../../../controllers/category_models/herbicidas_controller.dart';
import '../../../controllers/category_models/inoculantes_controller.dart';
import '../../../controllers/category_models/inseticidas_controller.dart';
import '../../../controllers/category_models/sementes_controller.dart';

class SyncCategoriesForCulture {
  void sync(
      List<AdubosController> adubos,
      List<SementesController> sementes,
      List<InseticidasController> inseticidas,
      List<HerbicidasController> herbicidas,
      List<FungicidasController> fungicidas,
      List<AdjuvantesController> adjuvantes,
      List<InoculantesController> inoculantes,
      List<DieselController> diesel,
      List<FertilizantesFoliaresController> fertilizantesFoliares) {
    for(int i = 1; i < 11; i++){
      adubos[i].nivel1 = adubos[0].nivel1;
      sementes[i].nivel1 = sementes[0].nivel1;
      inseticidas[i].nivel1 = inseticidas[0].nivel1;
      herbicidas[i].nivel1 = herbicidas[0].nivel1;
      fungicidas[i].nivel1 = fungicidas[0].nivel1;
      adjuvantes[i].nivel1 = adjuvantes[0].nivel1;
      inoculantes[i].nivel1 = inoculantes[0].nivel1;
      diesel[i].nivel1 = diesel[0].nivel1;
      fertilizantesFoliares[i].nivel1 = fertilizantesFoliares[0].nivel1;
      
      adubos[i].nivel2 = adubos[0].nivel2;
      sementes[i].nivel2 = sementes[0].nivel2;
      inseticidas[i].nivel2 = inseticidas[0].nivel2;
      herbicidas[i].nivel2 = herbicidas[0].nivel2;
      fungicidas[i].nivel2 = fungicidas[0].nivel2;
      adjuvantes[i].nivel2 = adjuvantes[0].nivel2;
      inoculantes[i].nivel2 = inoculantes[0].nivel2;
      diesel[i].nivel2 = diesel[0].nivel2;
      fertilizantesFoliares[i].nivel2 = fertilizantesFoliares[0].nivel2;

      adubos[i].nivel3 = adubos[0].nivel3;
      sementes[i].nivel3 = sementes[0].nivel3;
      inseticidas[i].nivel3 = inseticidas[0].nivel3;
      herbicidas[i].nivel3 = herbicidas[0].nivel3;
      fungicidas[i].nivel3 = fungicidas[0].nivel3;
      adjuvantes[i].nivel3 = adjuvantes[0].nivel3;
      inoculantes[i].nivel3 = inoculantes[0].nivel3;
      diesel[i].nivel3 = diesel[0].nivel3;
      fertilizantesFoliares[i].nivel3 = fertilizantesFoliares[0].nivel3;

      adubos[i].nivel4 = adubos[0].nivel4;
      sementes[i].nivel4 = sementes[0].nivel4;
      inseticidas[i].nivel4 = inseticidas[0].nivel4;
      herbicidas[i].nivel4 = herbicidas[0].nivel4;
      fungicidas[i].nivel4 = fungicidas[0].nivel4;
      adjuvantes[i].nivel4 = adjuvantes[0].nivel4;
      inoculantes[i].nivel4 = inoculantes[0].nivel4;
      diesel[i].nivel4 = diesel[0].nivel4;
      fertilizantesFoliares[i].nivel4 = fertilizantesFoliares[0].nivel4;

      adubos[i].nivel5 = adubos[0].nivel5;
      sementes[i].nivel5 = sementes[0].nivel5;
      inseticidas[i].nivel5 = inseticidas[0].nivel5;
      herbicidas[i].nivel5 = herbicidas[0].nivel5;
      fungicidas[i].nivel5 = fungicidas[0].nivel5;
      adjuvantes[i].nivel5 = adjuvantes[0].nivel5;
      inoculantes[i].nivel5 = inoculantes[0].nivel5;
      diesel[i].nivel5 = diesel[0].nivel5;
      fertilizantesFoliares[i].nivel5 = fertilizantesFoliares[0].nivel5;

      adubos[i].nivel6 = adubos[0].nivel6;
      sementes[i].nivel6 = sementes[0].nivel6;
      inseticidas[i].nivel6 = inseticidas[0].nivel6;
      herbicidas[i].nivel6 = herbicidas[0].nivel6;
      fungicidas[i].nivel6 = fungicidas[0].nivel6;
      adjuvantes[i].nivel6 = adjuvantes[0].nivel6;
      inoculantes[i].nivel6 = inoculantes[0].nivel6;
      diesel[i].nivel6 = diesel[0].nivel6;
      fertilizantesFoliares[i].nivel6 = fertilizantesFoliares[0].nivel6;

      adubos[i].nivel7 = adubos[0].nivel7;
      sementes[i].nivel7 = sementes[0].nivel7;
      inseticidas[i].nivel7 = inseticidas[0].nivel7;
      herbicidas[i].nivel7 = herbicidas[0].nivel7;
      fungicidas[i].nivel7 = fungicidas[0].nivel7;
      adjuvantes[i].nivel7 = adjuvantes[0].nivel7;
      inoculantes[i].nivel7 = inoculantes[0].nivel7;
      diesel[i].nivel7 = diesel[0].nivel7;
      fertilizantesFoliares[i].nivel7 = fertilizantesFoliares[0].nivel7;

      adubos[i].nivel8 = adubos[0].nivel8;
      sementes[i].nivel8 = sementes[0].nivel8;
      inseticidas[i].nivel8 = inseticidas[0].nivel8;
      herbicidas[i].nivel8 = herbicidas[0].nivel8;
      fungicidas[i].nivel8 = fungicidas[0].nivel8;
      adjuvantes[i].nivel8 = adjuvantes[0].nivel8;
      inoculantes[i].nivel8 = inoculantes[0].nivel8;
      diesel[i].nivel8 = diesel[0].nivel8;
      fertilizantesFoliares[i].nivel8 = fertilizantesFoliares[0].nivel8;

      adubos[i].nivel9 = adubos[0].nivel9;
      sementes[i].nivel9 = sementes[0].nivel9;
      inseticidas[i].nivel9 = inseticidas[0].nivel9;
      herbicidas[i].nivel9 = herbicidas[0].nivel9;
      fungicidas[i].nivel9 = fungicidas[0].nivel9;
      adjuvantes[i].nivel9 = adjuvantes[0].nivel9;
      inoculantes[i].nivel9 = inoculantes[0].nivel9;
      diesel[i].nivel9 = diesel[0].nivel9;
      fertilizantesFoliares[i].nivel9 = fertilizantesFoliares[0].nivel9;

      adubos[i].nivel10 = adubos[0].nivel10;
      sementes[i].nivel10 = sementes[0].nivel10;
      inseticidas[i].nivel10 = inseticidas[0].nivel10;
      herbicidas[i].nivel10 = herbicidas[0].nivel10;
      fungicidas[i].nivel10 = fungicidas[0].nivel10;
      adjuvantes[i].nivel10 = adjuvantes[0].nivel10;
      inoculantes[i].nivel10 = inoculantes[0].nivel10;
      diesel[i].nivel10 = diesel[0].nivel10;
      fertilizantesFoliares[i].nivel10 = fertilizantesFoliares[0].nivel10;
    }
  }
}
