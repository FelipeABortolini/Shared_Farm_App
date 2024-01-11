import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/culture/delete_phase_controller.dart';
import '../controllers/culture/loading_culture_controller.dart';
import '../controllers/date_picker_month_controller.dart';
import '../controllers/locals_controller.dart';
import '../controllers/products/add_level_controller.dart';
import '../controllers/culture/amount_products_controller.dart';
import '../controllers/category_models/adjuvantes_controller.dart';
import '../controllers/category_models/adubos_controller.dart';
import '../controllers/category_models/diesel_controller.dart';
import '../controllers/category_models/fertilizantes_foliares_controller.dart';
import '../controllers/category_models/fungicidas_controller.dart';
import '../controllers/category_models/herbicidas_controller.dart';
import '../controllers/category_models/inoculantes_controller.dart';
import '../controllers/category_models/inseticidas_controller.dart';
import '../controllers/category_models/sementes_controller.dart';
import '../controllers/culture/colheita_controller.dart';
import '../controllers/culture/culture_controller.dart';
import '../controllers/culture/culture_stage_controller.dart';
import '../controllers/culture/culture_type_controller.dart';
import '../controllers/culture/culture_year_controller.dart';
import '../controllers/culture/date_picker_controller.dart';
import '../controllers/products/delete_in_product_controller.dart';
import '../controllers/report/culture/culture_report_controller.dart';
import '../controllers/report/daily/daily_report_controller.dart';
import '../controllers/report/fill/fill_report_controller.dart';
import '../controllers/report/stock/full_history_controller.dart';
import '../controllers/report/stock/stock_report_controller.dart';
import '../controllers/user_controller.dart';
import '../controllers/vehicles/delete_fill_vehicle_controller.dart';
import '../controllers/vehicles/fill_vehicle_controller.dart';
import '../controllers/culture/hour_picker_controller.dart';
import '../controllers/culture/index_culture_selected_controller.dart';
import '../controllers/culture/local_controller.dart';
import '../controllers/pdf_view_controller.dart';
import '../controllers/recipe_controller.dart';
import '../controllers/report/report_type_controller.dart';
import '../controllers/sidebar_subitems_controller.dart';
import '../controllers/vehicles/vehicles_controller.dart';
import '../controllers/products/products_controller.dart';
import '../controllers/products/seleceted_category_controller.dart';
import '../controllers/culture/select_phase_controller.dart';
import '../controllers/culture/user_cultures_controller.dart';
import '../pages/login/controllers/is_secure_controller.dart';
import '../pages/login/controllers/loading_login_controller.dart';

final datePickerProvider = ChangeNotifierProvider(
  (ref) => DatePickerController(),
);

final deleteFillVehicleProvider = ChangeNotifierProvider(
  (ref) => DeleteFillVehicleController(),
);

final deleteInProductProvider = ChangeNotifierProvider(
  (ref) => DeleteInProductController(),
);

final datePickerStartProvider = ChangeNotifierProvider(
  (ref) => DatePickerMonthController(),
);

final datePickerEndProvider = ChangeNotifierProvider(
  (ref) => DatePickerController(),
);

final fullHistoryProvider = ChangeNotifierProvider(
  (ref) => FullHistoryController(),
);

final hourPickerProvider = ChangeNotifierProvider(
  (ref) => HourPickerController(),
);

final fillVehicleProvider = ChangeNotifierProvider(
  (ref) => FillVehicleController(),
);

final isSecureProvider = ChangeNotifierProvider(
  (ref) => IsSecureController(),
);

final loadingLoginProvider = ChangeNotifierProvider(
  (ref) => LoadingLoginController(),
);

final productProvider = ChangeNotifierProvider(
  (ref) => ProductsController(),
);

final vehiclesProvider = ChangeNotifierProvider(
  (ref) => VehiclesController(),
);

final localsProvider = ChangeNotifierProvider(
  (ref) => LocalsController(),
);

final prod1Provider = ChangeNotifierProvider(
  (ref) => ProductsController(),
);

final prod2Provider = ChangeNotifierProvider(
  (ref) => ProductsController(),
);

final prod3Provider = ChangeNotifierProvider(
  (ref) => ProductsController(),
);

final prod4Provider = ChangeNotifierProvider(
  (ref) => ProductsController(),
);

final prod5Provider = ChangeNotifierProvider(
  (ref) => ProductsController(),
);

final prod6Provider = ChangeNotifierProvider(
  (ref) => ProductsController(),
);

final prod7Provider = ChangeNotifierProvider(
  (ref) => ProductsController(),
);

final prod8Provider = ChangeNotifierProvider(
  (ref) => ProductsController(),
);

final prod9Provider = ChangeNotifierProvider(
  (ref) => ProductsController(),
);

final prod10Provider = ChangeNotifierProvider(
  (ref) => ProductsController(),
);

final adubosProvider = ChangeNotifierProvider(
  (ref) => AdubosController(),
);

final adubos1Provider = ChangeNotifierProvider(
  (ref) => AdubosController(),
);

final adubos2Provider = ChangeNotifierProvider(
  (ref) => AdubosController(),
);

final adubos3Provider = ChangeNotifierProvider(
  (ref) => AdubosController(),
);

final adubos4Provider = ChangeNotifierProvider(
  (ref) => AdubosController(),
);

final adubos5Provider = ChangeNotifierProvider(
  (ref) => AdubosController(),
);

final adubos6Provider = ChangeNotifierProvider(
  (ref) => AdubosController(),
);

final adubos7Provider = ChangeNotifierProvider(
  (ref) => AdubosController(),
);

final adubos8Provider = ChangeNotifierProvider(
  (ref) => AdubosController(),
);

final adubos9Provider = ChangeNotifierProvider(
  (ref) => AdubosController(),
);

final adubos10Provider = ChangeNotifierProvider(
  (ref) => AdubosController(),
);

final sementesProvider = ChangeNotifierProvider(
  (ref) => SementesController(),
);

final sementes1Provider = ChangeNotifierProvider(
  (ref) => SementesController(),
);

final sementes2Provider = ChangeNotifierProvider(
  (ref) => SementesController(),
);

final sementes3Provider = ChangeNotifierProvider(
  (ref) => SementesController(),
);

final sementes4Provider = ChangeNotifierProvider(
  (ref) => SementesController(),
);

final sementes5Provider = ChangeNotifierProvider(
  (ref) => SementesController(),
);

final sementes6Provider = ChangeNotifierProvider(
  (ref) => SementesController(),
);

final sementes7Provider = ChangeNotifierProvider(
  (ref) => SementesController(),
);

final sementes8Provider = ChangeNotifierProvider(
  (ref) => SementesController(),
);

final sementes9Provider = ChangeNotifierProvider(
  (ref) => SementesController(),
);

final sementes10Provider = ChangeNotifierProvider(
  (ref) => SementesController(),
);

final inseticidasProvider = ChangeNotifierProvider(
  (ref) => InseticidasController(),
);

final inseticidas1Provider = ChangeNotifierProvider(
  (ref) => InseticidasController(),
);

final inseticidas2Provider = ChangeNotifierProvider(
  (ref) => InseticidasController(),
);

final inseticidas3Provider = ChangeNotifierProvider(
  (ref) => InseticidasController(),
);

final inseticidas4Provider = ChangeNotifierProvider(
  (ref) => InseticidasController(),
);

final inseticidas5Provider = ChangeNotifierProvider(
  (ref) => InseticidasController(),
);

final inseticidas6Provider = ChangeNotifierProvider(
  (ref) => InseticidasController(),
);

final inseticidas7Provider = ChangeNotifierProvider(
  (ref) => InseticidasController(),
);

final inseticidas8Provider = ChangeNotifierProvider(
  (ref) => InseticidasController(),
);

final inseticidas9Provider = ChangeNotifierProvider(
  (ref) => InseticidasController(),
);

final inseticidas10Provider = ChangeNotifierProvider(
  (ref) => InseticidasController(),
);

final herbicidasProvider = ChangeNotifierProvider(
  (ref) => HerbicidasController(),
);

final herbicidas1Provider = ChangeNotifierProvider(
  (ref) => HerbicidasController(),
);

final herbicidas2Provider = ChangeNotifierProvider(
  (ref) => HerbicidasController(),
);

final herbicidas3Provider = ChangeNotifierProvider(
  (ref) => HerbicidasController(),
);

final herbicidas4Provider = ChangeNotifierProvider(
  (ref) => HerbicidasController(),
);

final herbicidas5Provider = ChangeNotifierProvider(
  (ref) => HerbicidasController(),
);

final herbicidas6Provider = ChangeNotifierProvider(
  (ref) => HerbicidasController(),
);

final herbicidas7Provider = ChangeNotifierProvider(
  (ref) => HerbicidasController(),
);

final herbicidas8Provider = ChangeNotifierProvider(
  (ref) => HerbicidasController(),
);

final herbicidas9Provider = ChangeNotifierProvider(
  (ref) => HerbicidasController(),
);

final herbicidas10Provider = ChangeNotifierProvider(
  (ref) => HerbicidasController(),
);

final fungicidasProvider = ChangeNotifierProvider(
  (ref) => FungicidasController(),
);

final fungicidas1Provider = ChangeNotifierProvider(
  (ref) => FungicidasController(),
);

final fungicidas2Provider = ChangeNotifierProvider(
  (ref) => FungicidasController(),
);

final fungicidas3Provider = ChangeNotifierProvider(
  (ref) => FungicidasController(),
);

final fungicidas4Provider = ChangeNotifierProvider(
  (ref) => FungicidasController(),
);

final fungicidas5Provider = ChangeNotifierProvider(
  (ref) => FungicidasController(),
);

final fungicidas6Provider = ChangeNotifierProvider(
  (ref) => FungicidasController(),
);

final fungicidas7Provider = ChangeNotifierProvider(
  (ref) => FungicidasController(),
);

final fungicidas8Provider = ChangeNotifierProvider(
  (ref) => FungicidasController(),
);

final fungicidas9Provider = ChangeNotifierProvider(
  (ref) => FungicidasController(),
);

final fungicidas10Provider = ChangeNotifierProvider(
  (ref) => FungicidasController(),
);

final adjuvantesProvider = ChangeNotifierProvider(
  (ref) => AdjuvantesController(),
);


final adjuvantes1Provider = ChangeNotifierProvider(
  (ref) => AdjuvantesController(),
);

final adjuvantes2Provider = ChangeNotifierProvider(
  (ref) => AdjuvantesController(),
);

final adjuvantes3Provider = ChangeNotifierProvider(
  (ref) => AdjuvantesController(),
);

final adjuvantes4Provider = ChangeNotifierProvider(
  (ref) => AdjuvantesController(),
);

final adjuvantes5Provider = ChangeNotifierProvider(
  (ref) => AdjuvantesController(),
);

final adjuvantes6Provider = ChangeNotifierProvider(
  (ref) => AdjuvantesController(),
);

final adjuvantes7Provider = ChangeNotifierProvider(
  (ref) => AdjuvantesController(),
);

final adjuvantes8Provider = ChangeNotifierProvider(
  (ref) => AdjuvantesController(),
);

final adjuvantes9Provider = ChangeNotifierProvider(
  (ref) => AdjuvantesController(),
);

final adjuvantes10Provider = ChangeNotifierProvider(
  (ref) => AdjuvantesController(),
);

final inoculantesProvider = ChangeNotifierProvider(
  (ref) => InoculantesController(),
);


final inoculantes1Provider = ChangeNotifierProvider(
  (ref) => InoculantesController(),
);

final inoculantes2Provider = ChangeNotifierProvider(
  (ref) => InoculantesController(),
);

final inoculantes3Provider = ChangeNotifierProvider(
  (ref) => InoculantesController(),
);

final inoculantes4Provider = ChangeNotifierProvider(
  (ref) => InoculantesController(),
);

final inoculantes5Provider = ChangeNotifierProvider(
  (ref) => InoculantesController(),
);

final inoculantes6Provider = ChangeNotifierProvider(
  (ref) => InoculantesController(),
);

final inoculantes7Provider = ChangeNotifierProvider(
  (ref) => InoculantesController(),
);

final inoculantes8Provider = ChangeNotifierProvider(
  (ref) => InoculantesController(),
);

final inoculantes9Provider = ChangeNotifierProvider(
  (ref) => InoculantesController(),
);

final inoculantes10Provider = ChangeNotifierProvider(
  (ref) => InoculantesController(),
);

final dieselProvider = ChangeNotifierProvider(
  (ref) => DieselController(),
);


final diesel1Provider = ChangeNotifierProvider(
  (ref) => DieselController(),
);

final diesel2Provider = ChangeNotifierProvider(
  (ref) => DieselController(),
);

final diesel3Provider = ChangeNotifierProvider(
  (ref) => DieselController(),
);

final diesel4Provider = ChangeNotifierProvider(
  (ref) => DieselController(),
);

final diesel5Provider = ChangeNotifierProvider(
  (ref) => DieselController(),
);

final diesel6Provider = ChangeNotifierProvider(
  (ref) => DieselController(),
);

final diesel7Provider = ChangeNotifierProvider(
  (ref) => DieselController(),
);

final diesel8Provider = ChangeNotifierProvider(
  (ref) => DieselController(),
);

final diesel9Provider = ChangeNotifierProvider(
  (ref) => DieselController(),
);

final diesel10Provider = ChangeNotifierProvider(
  (ref) => DieselController(),
);

final fertilizantesFoliaresProvider = ChangeNotifierProvider(
  (ref) => FertilizantesFoliaresController(),
);


final fertilizantesFoliares1Provider = ChangeNotifierProvider(
  (ref) => FertilizantesFoliaresController(),
);

final fertilizantesFoliares2Provider = ChangeNotifierProvider(
  (ref) => FertilizantesFoliaresController(),
);

final fertilizantesFoliares3Provider = ChangeNotifierProvider(
  (ref) => FertilizantesFoliaresController(),
);

final fertilizantesFoliares4Provider = ChangeNotifierProvider(
  (ref) => FertilizantesFoliaresController(),
);

final fertilizantesFoliares5Provider = ChangeNotifierProvider(
  (ref) => FertilizantesFoliaresController(),
);

final fertilizantesFoliares6Provider = ChangeNotifierProvider(
  (ref) => FertilizantesFoliaresController(),
);

final fertilizantesFoliares7Provider = ChangeNotifierProvider(
  (ref) => FertilizantesFoliaresController(),
);

final fertilizantesFoliares8Provider = ChangeNotifierProvider(
  (ref) => FertilizantesFoliaresController(),
);

final fertilizantesFoliares9Provider = ChangeNotifierProvider(
  (ref) => FertilizantesFoliaresController(),
);

final fertilizantesFoliares10Provider = ChangeNotifierProvider(
  (ref) => FertilizantesFoliaresController(),
);

final addLevelProvider = ChangeNotifierProvider(
  (ref) => AddLevelController(),
);

final addLevel1Provider = ChangeNotifierProvider(
  (ref) => AddLevelController(),
);

final addLevel2Provider = ChangeNotifierProvider(
  (ref) => AddLevelController(),
);

final addLevel3Provider = ChangeNotifierProvider(
  (ref) => AddLevelController(),
);

final addLevel4Provider = ChangeNotifierProvider(
  (ref) => AddLevelController(),
);

final addLevel5Provider = ChangeNotifierProvider(
  (ref) => AddLevelController(),
);

final addLevel6Provider = ChangeNotifierProvider(
  (ref) => AddLevelController(),
);

final addLevel7Provider = ChangeNotifierProvider(
  (ref) => AddLevelController(),
);

final addLevel8Provider = ChangeNotifierProvider(
  (ref) => AddLevelController(),
);

final addLevel9Provider = ChangeNotifierProvider(
  (ref) => AddLevelController(),
);

final addLevel10Provider = ChangeNotifierProvider(
  (ref) => AddLevelController(),
);

final selectedCategoryProvider = ChangeNotifierProvider(
  (ref) => SelectedCategoryController(),
);

final selectedCategory1Provider = ChangeNotifierProvider(
  (ref) => SelectedCategoryController(),
);

final selectedCategory2Provider = ChangeNotifierProvider(
  (ref) => SelectedCategoryController(),
);

final selectedCategory3Provider = ChangeNotifierProvider(
  (ref) => SelectedCategoryController(),
);

final selectedCategory4Provider = ChangeNotifierProvider(
  (ref) => SelectedCategoryController(),
);

final selectedCategory5Provider = ChangeNotifierProvider(
  (ref) => SelectedCategoryController(),
);

final selectedCategory6Provider = ChangeNotifierProvider(
  (ref) => SelectedCategoryController(),
);

final selectedCategory7Provider = ChangeNotifierProvider(
  (ref) => SelectedCategoryController(),
);

final selectedCategory8Provider = ChangeNotifierProvider(
  (ref) => SelectedCategoryController(),
);

final selectedCategory9Provider = ChangeNotifierProvider(
  (ref) => SelectedCategoryController(),
);

final selectedCategory10Provider = ChangeNotifierProvider(
  (ref) => SelectedCategoryController(),
);

final selectPhaseProvider = ChangeNotifierProvider(
  (ref) => SelectPhaseController(),
);

final cultureProvider = ChangeNotifierProvider(
  (ref) => CultureController(),
);

final colheitaProvider = ChangeNotifierProvider(
  (ref) => ColheitaController(),
);

final recipeProvider = ChangeNotifierProvider(
  (ref) => RecipeController(),
);

final userProvider = ChangeNotifierProvider(
  (ref) => UserController(),
);

final amountProductsProvider = ChangeNotifierProvider(
  (ref) => AmountProductsController(),
);

final userCulturesProvider = ChangeNotifierProvider(
  (ref) => UserCulturesController(),
);

final indexCultureSelectedProvider = ChangeNotifierProvider(
  (ref) => IndexCultureSelectedController(),
);

final cultureStageProvider = ChangeNotifierProvider(
  (ref) => CultureStageController(),
);

final sidebarSubitemsProvider = ChangeNotifierProvider(
  (ref) => SidebarSubitemsController(),
);

final cultureTypeProvider = ChangeNotifierProvider(
  (ref) => CultureTypeController(),
);

final localProvider = ChangeNotifierProvider(
  (ref) => LocalController(),
);

final cultureYearProvider = ChangeNotifierProvider(
  (ref) => CultureYearController(),
);

final pdfViewerProvider = ChangeNotifierProvider(
  (ref) => PdfViewerController(),
);

final reportTypeProvider = ChangeNotifierProvider(
  (ref) => ReportTypeController(),
);

final dailyReportProvider = ChangeNotifierProvider(
  (ref) => DailyReportController(),
);

final cultureReportProvider = ChangeNotifierProvider(
  (ref) => CultureReportController(),
);

final stockReportProvider = ChangeNotifierProvider(
  (ref) => StockReportController(),
);

final fillReportProvider = ChangeNotifierProvider(
  (ref) => FillReportController(),
);

final loadingCultureProvider = ChangeNotifierProvider(
  (ref) => LoadingCultureController(),
);

final deletePhaseControllerProvider = ChangeNotifierProvider(
  (ref) => DeletePhaseController(),
);