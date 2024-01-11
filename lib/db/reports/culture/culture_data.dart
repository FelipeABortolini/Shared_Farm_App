import '../../../controllers/report/culture/colheita_table_controller.dart';
import '../../../controllers/report/culture/culture_report_controller.dart';
import '../../../controllers/report/culture/culture_table_controller.dart';
import '../../../controllers/report/culture/product_culture_report_controller.dart';
import '../../../pages/culture/utils/kgInBag.dart';
import '../../database.dart';
import '../user_name.dart';

class CultureData extends Database {
  List<Map<String, dynamic>> filterCultures(
      CultureReportController cultureReport) {
    List<Map<String, dynamic>> filteredCultures = [];

    for (var doc in cultureReport.allCultures) {
      if (doc["cultureName"] == cultureReport.selectedCulture) {
        filteredCultures.add(doc);
      }
    }

    return filteredCultures;
  }

  void setStartDate(CultureReportController cultureReport,
      List<Map<String, dynamic>> cultures) {
    int startDate = 10000000000000;
    int date = 0;
    for (var doc in cultures) {
      date = doc["dateOutput"].millisecondsSinceEpoch - 10800000;
      if (date <= startDate) {
        startDate = date;
      }
    }

    DateTime day = DateTime.fromMillisecondsSinceEpoch(startDate);
    cultureReport.setStartDate(
        "${day.day.toString().padLeft(2, '0')}/${day.month.toString().padLeft(2, '0')}/${day.year}");
  }

  void setEndDate(CultureReportController cultureReport,
      List<Map<String, dynamic>> cultures) {
    int endDate = 0;
    int date = 0;
    String currentPhase = "";

    for (var doc in cultures) {
      date = doc["dateOutput"].millisecondsSinceEpoch - 10800000;
      if (date >= endDate) {
        currentPhase = doc["phase"];
        endDate = date;
      }
    }

    if (cultures[cultures.length - 1]["opened"] == true) {
      cultureReport.setEndDate("Em andamento - $currentPhase");
    } else {
      DateTime day = DateTime.fromMillisecondsSinceEpoch(endDate);
      cultureReport.setEndDate(
          "${day.day.toString().padLeft(2, '0')}/${day.month.toString().padLeft(2, '0')}/${day.year}");
    }
  }

  Future<void> get(CultureReportController cultureReport) async {
    UserName userName = UserName();

    int id = 1;
    int idCol = 1;

    List<Map<String, dynamic>> filteredCultures = filterCultures(cultureReport);

    if (cultureReport.selectedCulture.substring(0, 4) == "SOJA") {
      cultureReport.setCultureType("SOJA");
    } else if (cultureReport.selectedCulture.substring(0, 5) == "MILHO") {
      cultureReport.setCultureType("MILHO");
    } else if (cultureReport.selectedCulture.substring(0, 5) == "TRIGO") {
      cultureReport.setCultureType("TRIGO");
    }

    cultureReport.setCultureName(cultureReport.selectedCulture);

    List splitted = cultureReport.selectedCulture.split(" ");

    if (splitted[splitted.length - 1] == "TEREZINHA") {
      cultureReport.setLocal("Santa Terezinha");
    } else if (splitted[splitted.length - 1] == "REAL") {
      cultureReport.setLocal("Real");
    } else if (splitted[splitted.length - 1] == "JOÃO") {
      cultureReport.setLocal("São João");
    } else if (splitted[splitted.length - 1] == "JORGE") {
      cultureReport.setLocal("São Jorge");
    } else if (splitted[splitted.length - 1] == "CRUZEIRO") {
      cultureReport.setLocal("Cruzeiro");
    } else if (splitted[splitted.length - 1] == "CAMPINHO") {
      cultureReport.setLocal("Campinho");
    }

    setStartDate(cultureReport, filteredCultures);

    setEndDate(cultureReport, filteredCultures);

    for (var doc in filteredCultures) {
      CultureTableController tableModel = CultureTableController();
      ColheitaTableController colheitaTableModel = ColheitaTableController();

      tableModel.setPhase(doc["phase"]);

      if (tableModel.phase == "COLHEITA") {
        colheitaTableModel.setId(idCol++);
        // colheitaTableModel.setGrossQuantity(doc["grossQuantity"]);
        colheitaTableModel.setClassifiedQttBags(
            double.parse(doc["classifiedQttBags"].toString()));
        cultureReport.setTotalBags(
            double.parse(cultureReport.totalBags.toString()) +
                double.parse(doc["classifiedQttBags"].toString()));
        colheitaTableModel.setClassifiedQttKg(
            double.parse(doc["classifiedQttKg"].toString()));
        cultureReport.setTotalKg(
            double.parse(cultureReport.totalKg.toString()) +
                double.parse(doc["classifiedQttKg"].toString()));

        colheitaTableModel.setNetQuantityKg(doc["netQuantity"]);
        colheitaTableModel.setNetQuantityBags(
            (double.parse(doc["netQuantity"]) / kgInBag).round().toString());
        cultureReport.setTotalKgNet(
            double.parse(cultureReport.totalKgNet.toString()) +
                double.parse(doc["netQuantity"].toString()));
        cultureReport.setTotalBagsNet(cultureReport.totalBagsNet +
            double.parse(colheitaTableModel.netQuantityBags));
        colheitaTableModel.setImpurity(doc["impurity"]);
        colheitaTableModel.setDamaged(doc["damaged"]);
        colheitaTableModel.setMoisture(doc["moisture"]);
        colheitaTableModel.setVehicle(doc["vehicle"]);
        colheitaTableModel.setPlate(doc["plate"]);
        colheitaTableModel.setLocalDelivery(doc["localEntrega"]);
        colheitaTableModel.setUser(await userName.get(doc["user"]));
        colheitaTableModel.setDifPerc(double.parse(doc["percentualDifference"].toString()));

        DateTime day = DateTime.fromMillisecondsSinceEpoch(
            doc["dateOutput"].millisecondsSinceEpoch - 10800000);
        colheitaTableModel.setDate(
            "${day.day.toString().padLeft(2, '0')}/${day.month.toString().padLeft(2, '0')}/${day.year}");

        colheitaTableModel.setHour(
            "${DateTime.fromMillisecondsSinceEpoch(doc["dateOutput"].millisecondsSinceEpoch - 10800000).hour.toString().padLeft(2, '0')}:${DateTime.fromMillisecondsSinceEpoch(doc["dateOutput"].millisecondsSinceEpoch - 10800000).minute.toString().padLeft(2, '0')}");

        cultureReport.addColheitaTableElement(colheitaTableModel);
      } else {
        DateTime day = DateTime.fromMillisecondsSinceEpoch(
            doc["dateOutput"].millisecondsSinceEpoch - 10800000);
        tableModel.setDate(
            "${day.day.toString().padLeft(2, '0')}/${day.month.toString().padLeft(2, '0')}/${day.year}");

        tableModel.setHour(
            "${DateTime.fromMillisecondsSinceEpoch(doc["dateOutput"].millisecondsSinceEpoch - 10800000).hour.toString().padLeft(2, '0')}:${DateTime.fromMillisecondsSinceEpoch(doc["dateOutput"].millisecondsSinceEpoch - 10800000).minute.toString().padLeft(2, '0')}");

        tableModel.setUser(await userName.get(doc["user"]));

        for (var prod in doc["products"]) {
          ProductCultureReportController p = ProductCultureReportController();
          p.setId(id++);
          p.setUnity(prod["unity"]);
          p.setProduct(prod["product"]);
          p.setActivePrinciple(prod["active_principle"]);
          p.setQuantity(double.parse(prod["quantity"]));
          p.setNewQtt(double.parse(prod["newQtt"].toString()));
          // p.setNewLocalQtt(double.parse(prod["newLocalQtt"].toString()));
          tableModel.addProd(p);
        }
      }

      cultureReport.table.add(tableModel);
    }
  }
}
