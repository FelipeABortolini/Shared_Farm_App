import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../controllers/culture/local_controller.dart';
import '../../../controllers/products/seleceted_category_controller.dart';
import '../../../controllers/report/stock/stock_report_controller.dart';
import '../../../controllers/report/stock/stock_table_current_controller.dart';
import '../../../controllers/report/stock/stock_table_ins_controller.dart';
import '../../../controllers/report/stock/stock_table_outs_controller.dart';
import '../../database.dart';
import '../../products/add_products/get_dad_infos.dart';
import '../../products/utils/get_number_product.dart';
import '../user_name.dart';

class StockData extends Database {
  List<Map<String, dynamic>> filterByDate(
      List<Map<String, dynamic>> list, int startDate, int endDate) {
    List<Map<String, dynamic>> filteredList = [];

    double secProvidedStartDate = startDate - (startDate % 86400000);
    double secProvidedEndDate = endDate - (endDate % 86400000);

    secProvidedStartDate = startDate / 1000;
    secProvidedEndDate = endDate / 1000;
    double secRegisteredDate = 0;

    Timestamp time;

    for (var doc in list) {
      time = doc["dateInput"];
      secRegisteredDate = time.millisecondsSinceEpoch / 1000;
      if (secProvidedStartDate < secRegisteredDate &&
          secProvidedEndDate + 86400 > secRegisteredDate) {
        filteredList.add(doc);
      }
    }

    return filteredList;
  }

  List<Map<String, dynamic>> filterByCategory(
      List<Map<String, dynamic>> list, List<String> categories) {
    List<Map<String, dynamic>> filteredList = [];

    for (var doc in list) {
      if (categories.contains(doc["category"])) {
        filteredList.add(doc);
      }
    }

    return filteredList;
  }

  List<Map<String, dynamic>> filterByLocal(
      List<Map<String, dynamic>> list, List<String> locals) {
    List<Map<String, dynamic>> filteredList = [];

    for (var doc in list) {
      if (locals.contains(doc["local"])) {
        filteredList.add(doc);
      }
    }

    return filteredList;
  }

  String toCamelCase(String input) {
    if (input.isEmpty) {
      return '';
    }

    List<String> words = input.split(' ');
    String camelCaseText = words[0].toLowerCase();

    for (int i = 1; i < words.length; i++) {
      String firstLetter = words[i][0].toUpperCase();
      String restOfWord = words[i].substring(1).toLowerCase();
      camelCaseText += firstLetter + restOfWord;
    }

    if (camelCaseText == "sãoJoão") {
      camelCaseText = "saoJoao";
    } else if (camelCaseText == "sãoJorge") {
      camelCaseText = "saoJorge";
    }

    return camelCaseText;
  }

  Future<void> get(
    StockReportController stockReport,
    int startdate,
    int endDate,
    LocalController local,
    SelectedCategoryController selectedCategory,
    bool fullHistory,
  ) async {
    UserName userName = UserName();
    int idIns = 1;
    int idOuts = 1;
    int idAllLocal = 1;
    int idAll = 1;

    if (selectedCategory.adubos) {
      stockReport.categories.add("adubo");
    }
    if (selectedCategory.sementes) {
      stockReport.categories.add("semente");
    }
    if (selectedCategory.herbicidas) {
      stockReport.categories.add("herbicida");
    }
    if (selectedCategory.inseticidas) {
      stockReport.categories.add("inseticida");
    }
    if (selectedCategory.fungicidas) {
      stockReport.categories.add("fungicida");
    }
    if (selectedCategory.adjuvantes) {
      stockReport.categories.add("adjuvante");
    }
    if (selectedCategory.inoculantes) {
      stockReport.categories.add("inoculante");
    }
    if (selectedCategory.diesel) {
      stockReport.categories.add("diesel");
    }
    if (selectedCategory.fertilizantesFoliares) {
      stockReport.categories.add("fertilizanteFoliar");
    }

    if (local.santaTerezinha) {
      stockReport.locals.add("Santa Terezinha");
    }
    if (local.real) {
      stockReport.locals.add("Real");
    }
    if (local.saoJoao) {
      stockReport.locals.add("São João");
    }
    if (local.saoJorge) {
      stockReport.locals.add("São Jorge");
    }
    if (local.cruzeiro) {
      stockReport.locals.add("Cruzeiro");
    }
    if (local.campinho) {
      stockReport.locals.add("Campinho");
    }

    List<Map<String, dynamic>> ins = [];
    await db.collection("entradas").get().then((value) {
      for (var doc in value.docs) {
        if (doc.data().isNotEmpty) {
          ins.add(doc.data());
        }
      }
    });

    List<Map<String, dynamic>> filterCategoryIns =
        filterByCategory(ins, stockReport.categories);

    List<Map<String, dynamic>> filterLocalIns =
        filterByLocal(filterCategoryIns, stockReport.locals);

    List<Map<String, dynamic>> filterIns = [];

    if (fullHistory) {
      filterIns = filterLocalIns;
    } else {
      filterIns = filterByDate(filterLocalIns, startdate, endDate);
    }

    List<Map<String, dynamic>> outs = [];

    await db.collection("saidas").get().then((value) {
      for (var doc in value.docs) {
        if (doc.data().isNotEmpty) {
          outs.add(doc.data());
        }
      }
    });

    List<Map<String, dynamic>> filterCategoryOuts =
        filterByCategory(outs, stockReport.categories);

    List<Map<String, dynamic>> filterLocalOuts =
        filterByLocal(filterCategoryOuts, stockReport.locals);

    List<Map<String, dynamic>> filterOuts = [];

    if (fullHistory) {
      filterOuts = filterLocalOuts;
    } else {
      filterOuts = filterByDate(filterLocalOuts, startdate, endDate);
    }

    for (var doc in filterIns) {
      if (doc["product"] != "DIESEL") {
        StockTableInsController tableInsModel = StockTableInsController();
        tableInsModel.setId(idIns++);
        tableInsModel.setProduct(doc["product"]);
        tableInsModel.setActivePrinciple(doc["activePrinciple"]);
        tableInsModel.setQuantity(double.parse(doc["quantity"].toString()));
        tableInsModel.setNewQtt(double.parse(doc["newQtt"].toString()));
        // tableInsModel
            // .setNewLocalQtt(double.parse(doc["newLocalQtt"].toString()));

        DateTime day = DateTime.fromMillisecondsSinceEpoch(
            doc["dateInput"].millisecondsSinceEpoch);
        tableInsModel.setDate(
            "${day.day.toString().padLeft(2, '0')}/${day.month.toString().padLeft(2, '0')}/${day.year}");

        tableInsModel.setLocal(doc["local"]);
        tableInsModel.setUnity(doc["unity"]);
        stockReport.tableIns.add(tableInsModel);
      }
    }

    for (var doc in filterOuts) {
      if (doc["product"] != "diesel") {
        StockTableOutsController tableOutsModel = StockTableOutsController();
        tableOutsModel.setId(idOuts++);
        tableOutsModel.setProduct(doc["product"]);
        tableOutsModel.setActivePrinciple(doc["activePrinciple"]);
        tableOutsModel.setQuantity(double.parse(doc["quantity"].toString()));
        tableOutsModel.setNewQtt(double.parse(doc["newQtt"].toString()));
        // tableOutsModel
        //     .setNewLocalQtt(double.parse(doc["newLocalQtt"].toString()));

        DateTime day = DateTime.fromMillisecondsSinceEpoch(
            doc["dateInput"].millisecondsSinceEpoch);
        tableOutsModel.setDate(
            "${day.day.toString().padLeft(2, '0')}/${day.month.toString().padLeft(2, '0')}/${day.year}");

        tableOutsModel.setHour(
            "${DateTime.fromMillisecondsSinceEpoch(doc["dateInput"].millisecondsSinceEpoch - 10800000).hour.toString().padLeft(2, '0')}:${DateTime.fromMillisecondsSinceEpoch(doc["dateInput"].millisecondsSinceEpoch - 10800000).minute.toString().padLeft(2, '0')}");

        tableOutsModel.setLocal(doc["local"]);
        tableOutsModel.setCulture(doc["culture"]);
        tableOutsModel.setPhase(doc["phase"]);
        tableOutsModel.setVehicle(doc["vehicle"]);
        tableOutsModel.setPlate(doc["plate"]);
        tableOutsModel.setUnity(doc["unity"]);
        tableOutsModel.setUser(await userName.get(doc["user"]));
        stockReport.tableOuts.add(tableOutsModel);
      }
    }

    final numberProduct = GetNumberProduct();
    GetDadInfos getDadInfos = GetDadInfos();

    for (int j = 1; j < 11; j++) {
      QuerySnapshot<Map<String, dynamic>>? query;
      await db.collectionGroup("nivel$j").get().then((value) => query = value);
      List<Map<String, dynamic>> list = [];
      if (query != null) {
        list = query!.docs.map((doc) => doc.data()).toList();
      }

      for (var doc in list) {
        if (doc.isNotEmpty) {
          if (doc["sons"].isEmpty &&
              stockReport.categories.contains(doc["category"]) &&
              doc["name"] != "DIESEL") {
            for (int i = 0; i < stockReport.locals.length; i++) {
              StockTableCurrentController tableCurrent =
                  StockTableCurrentController();
              tableCurrent.setId(idAllLocal++);
              tableCurrent.setProduct(doc["name"]);

              if (j > 1) {
                int? numDad =
                    await numberProduct.get(doc["category"], doc["dad"], j - 1);
                Map<String, dynamic>? dadInfos =
                    await getDadInfos.get(doc["category"], j - 1, numDad!);

                tableCurrent.setActivePrinciple(dadInfos!["name"]);
              }
              tableCurrent.setQuantity(double.parse(
                  doc[toCamelCase(stockReport.locals[i])].toString()));
              tableCurrent.setLocal(stockReport.locals[i]);
              tableCurrent.setUnity(doc["unity"]);
              stockReport.addTableLocalCurrentElement(tableCurrent);
            }
          }
        }
      }

      for (var doc in list) {
        if (doc.isNotEmpty) {
          if (doc["sons"].isEmpty &&
              stockReport.categories.contains(doc["category"]) &&
              doc["name"] != "DIESEL") {
            StockTableCurrentController tableCurrent =
                StockTableCurrentController();
            tableCurrent.setId(idAll++);
            tableCurrent.setProduct(doc["name"]);

            if (j > 1) {
              int? numDad =
                  await numberProduct.get(doc["category"], doc["dad"], j - 1);
              Map<String, dynamic>? dadInfos =
                  await getDadInfos.get(doc["category"], j - 1, numDad!);

              tableCurrent.setActivePrinciple(dadInfos!["name"]);
            }
            tableCurrent.setQuantity(double.parse(doc["quantity"].toString()));
            tableCurrent.setUnity(doc["unity"]);
            stockReport.addTableAllCurrentElement(tableCurrent);
          }
        }
      }
    }
  }
}
