import 'package:cloud_firestore/cloud_firestore.dart';

import '../../database.dart';

class GetRecipes extends Database{

  Future<List<Map<String, List<Map<String, dynamic>>>>> get() async {
    
    QuerySnapshot<Map<String, dynamic>>? query;

    List<Map<String, List<Map<String, dynamic>>>> finalList = [];

    Map<String, List<Map<String, dynamic>>> mapPhasesSoja = {};

    // ============================= SOJA ===========================================
    List<Map<String, dynamic>> sojaAplicacaoDessecacao = [];
    await db.collection("receitas").doc("soja").collection("APLICAÇÃO DESSECAÇÃO").get().then((value) => query=value);
    if(query != null){
      sojaAplicacaoDessecacao = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesSoja.addEntries({"APLICAÇÃO DESSECAÇÃO": sojaAplicacaoDessecacao}.entries);

    List<Map<String, dynamic>> sojaAplicacaoSequencialDessecacao = [];
    await db.collection("receitas").doc("soja").collection("APLICAÇÃO SEQUENCIAL DESSECAÇÃO").get().then((value) => query=value);
    if(query != null){
      sojaAplicacaoSequencialDessecacao = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesSoja.addEntries({"APLICAÇÃO SEQUENCIAL DESSECAÇÃO": sojaAplicacaoSequencialDessecacao}.entries);

    List<Map<String, dynamic>> sojaPlantio = [];
    await db.collection("receitas").doc("soja").collection("PLANTIO").get().then((value) => query=value);
    if(query != null){
      sojaPlantio = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesSoja.addEntries({"PLANTIO": sojaPlantio}.entries);

    List<Map<String, dynamic>> sojaAplicacaoV3V4 = [];
    await db.collection("receitas").doc("soja").collection("APLICAÇÃO V3_V4").get().then((value) => query=value);
    if(query != null){
      sojaAplicacaoV3V4 = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesSoja.addEntries({"APLICAÇÃO V3_V4": sojaAplicacaoV3V4}.entries);

    List<Map<String, dynamic>> sojaAplicacaoCobertura = [];
    await db.collection("receitas").doc("soja").collection("APLICAÇÃO COBERTURA").get().then((value) => query=value);
    if(query != null){
      sojaAplicacaoCobertura = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesSoja.addEntries({"APLICAÇÃO COBERTURA": sojaAplicacaoCobertura}.entries);

    List<Map<String, dynamic>> sojaAplicacaoV8V9 = [];
    await db.collection("receitas").doc("soja").collection("APLICAÇÃO V8_V9").get().then((value) => query=value);
    if(query != null){
      sojaAplicacaoV8V9 = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesSoja.addEntries({"APLICAÇÃO V8_V9": sojaAplicacaoV8V9}.entries);

    List<Map<String, dynamic>> sojaAplicacaoR1R3 = [];
    await db.collection("receitas").doc("soja").collection("APLICAÇÃO R1_R3").get().then((value) => query=value);
    if(query != null){
      sojaAplicacaoR1R3 = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesSoja.addEntries({"APLICAÇÃO R1_R3": sojaAplicacaoR1R3}.entries);

    List<Map<String, dynamic>> sojaAplicacaoR5R52 = [];
    await db.collection("receitas").doc("soja").collection("APLICAÇÃO R5_R5.2").get().then((value) => query=value);
    if(query != null){
      sojaAplicacaoR5R52 = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesSoja.addEntries({"APLICAÇÃO R5_R5.2": sojaAplicacaoR5R52}.entries);

    List<Map<String, dynamic>> sojaColheita = [];
    await db.collection("receitas").doc("soja").collection("COLHEITA").get().then((value) => query=value);
    if(query != null){
      sojaColheita = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesSoja.addEntries({"COLHEITA": sojaColheita}.entries);

    // ==========================================
    finalList.add(mapPhasesSoja);
    // ==========================================

    Map<String, List<Map<String, dynamic>>> mapPhasesMilho = {};

    // ============================= MILHO ===========================================
    List<Map<String, dynamic>> milhoPlantio = [];
    await db.collection("receitas").doc("milho").collection("PLANTIO").get().then((value) => query=value);
    if(query != null){
      milhoPlantio = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesMilho.addEntries({"PLANTIO": milhoPlantio}.entries);

    List<Map<String, dynamic>> milhoPalitinho = [];
    await db.collection("receitas").doc("milho").collection("PALITINHO").get().then((value) => query=value);
    if(query != null){
      milhoPalitinho = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesMilho.addEntries({"PALITINHO": milhoPalitinho}.entries);

    List<Map<String, dynamic>> milhoAplicacaoV2V3 = [];
    await db.collection("receitas").doc("milho").collection("APLICAÇÃO V2-V3").get().then((value) => query=value);
    if(query != null){
      milhoAplicacaoV2V3 = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesMilho.addEntries({"APLICAÇÃO V2-V3": milhoAplicacaoV2V3}.entries);

    List<Map<String, dynamic>> milhoAplicacaoV4V5 = [];
    await db.collection("receitas").doc("milho").collection("APLICAÇÃO V4-V5").get().then((value) => query=value);
    if(query != null){
      milhoAplicacaoV4V5 = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesMilho.addEntries({"APLICAÇÃO V4-V5": milhoAplicacaoV4V5}.entries);

    List<Map<String, dynamic>> milhoAplicacaoV8V10 = [];
    await db.collection("receitas").doc("milho").collection("APLICAÇÃO V8-V10").get().then((value) => query=value);
    if(query != null){
      milhoAplicacaoV8V10 = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesMilho.addEntries({"APLICAÇÃO V8-V10": milhoAplicacaoV8V10}.entries);

    List<Map<String, dynamic>> milhoAplicacaoR4R5 = [];
    await db.collection("receitas").doc("milho").collection("APLICAÇÃO R4-R5").get().then((value) => query=value);
    if(query != null){
      milhoAplicacaoR4R5 = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesMilho.addEntries({"APLICAÇÃO R4-R5": milhoAplicacaoR4R5}.entries);

    // List<Map<String, dynamic>> milhoColheita = [];
    // await db.collection("receitas").doc("milho").collection("COLHEITA").get().then((value) => query=value);
    // if(query != null){
    //   milhoColheita = query!.docs.map((doc) => doc.data()).toList();
    // }
    // mapPhasesMilho.addEntries({"COLHEITA": milhoColheita}.entries);

    // ==========================================
    finalList.add(mapPhasesMilho);
    // ==========================================

    Map<String, List<Map<String, dynamic>>> mapPhasesTrigo = {};

    // ============================= TRIGO ===========================================
    List<Map<String, dynamic>> trigoAplicacaoDessecacao = [];
    await db.collection("receitas").doc("trigo").collection("APLICAÇÃO DESSECAÇÃO").get().then((value) => query=value);
    if(query != null){
      trigoAplicacaoDessecacao = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesTrigo.addEntries({"APLICAÇÃO DESSECAÇÃO": trigoAplicacaoDessecacao}.entries);

    List<Map<String, dynamic>> trigoAplicacaoSequencial = [];
    await db.collection("receitas").doc("trigo").collection("APLICAÇÃO SEQUENCIAL").get().then((value) => query=value);
    if(query != null){
      trigoAplicacaoSequencial = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesTrigo.addEntries({"APLICAÇÃO SEQUENCIAL": trigoAplicacaoSequencial}.entries);

    List<Map<String, dynamic>> trigoPlantio = [];
    await db.collection("receitas").doc("trigo").collection("PLANTIO").get().then((value) => query=value);
    if(query != null){
      trigoPlantio = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesTrigo.addEntries({"PLANTIO": trigoPlantio}.entries);

    List<Map<String, dynamic>> trigoAplicacaoHerbicida = [];
    await db.collection("receitas").doc("trigo").collection("APLICAÇÃO HERBICIDA").get().then((value) => query=value);
    if(query != null){
      trigoAplicacaoHerbicida = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesTrigo.addEntries({"APLICAÇÃO HERBICIDA": trigoAplicacaoHerbicida}.entries);

    List<Map<String, dynamic>> trigoAplicacaoCobertura = [];
    await db.collection("receitas").doc("trigo").collection("APLICAÇÃO COBERTURA").get().then((value) => query=value);
    if(query != null){
      trigoAplicacaoCobertura = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesTrigo.addEntries({"APLICAÇÃO COBERTURA": trigoAplicacaoCobertura}.entries);

    List<Map<String, dynamic>> trigoAlongamento = [];
    await db.collection("receitas").doc("trigo").collection("ALONGAMENTO").get().then((value) => query=value);
    if(query != null){
      trigoAlongamento = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesTrigo.addEntries({"ALONGAMENTO": trigoAlongamento}.entries);

    List<Map<String, dynamic>> trigoEmborrachamento = [];
    await db.collection("receitas").doc("trigo").collection("EMBORRACHAMENTO").get().then((value) => query=value);
    if(query != null){
      trigoEmborrachamento = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesTrigo.addEntries({"EMBORRACHAMENTO": trigoEmborrachamento}.entries);

    List<Map<String, dynamic>> trigoEspigamentoFlorescimento = [];
    await db.collection("receitas").doc("trigo").collection("ESPIGAMENTO_FLORESCIMENTO").get().then((value) => query=value);
    if(query != null){
      trigoEspigamentoFlorescimento = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesTrigo.addEntries({"ESPIGAMENTO_FLORESCIMENTO": trigoEspigamentoFlorescimento}.entries);

    List<Map<String, dynamic>> trigoEnximentoDeGraos = [];
    await db.collection("receitas").doc("trigo").collection("ENXIMENTO DE GRÃOS").get().then((value) => query=value);
    if(query != null){
      trigoEnximentoDeGraos = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesTrigo.addEntries({"ENXIMENTO DE GRÃOS": trigoEnximentoDeGraos}.entries);

    List<Map<String, dynamic>> trigoMaturacaoFinal = [];
    await db.collection("receitas").doc("trigo").collection("MATURAÇÃO FINAL").get().then((value) => query=value);
    if(query != null){
      trigoMaturacaoFinal = query!.docs.map((doc) => doc.data()).toList();
    }
    mapPhasesTrigo.addEntries({"MATURAÇÃO FINAL": trigoMaturacaoFinal}.entries);

    // List<Map<String, dynamic>> trigoColheita = [];
    // await db.collection("receitas").doc("trigo").collection("COLHEITA").get().then((value) => query=value);
    // if(query != null){
    //   trigoColheita = query!.docs.map((doc) => doc.data()).toList();
    // }
    // mapPhasesTrigo.addEntries({"COLHEITA": trigoColheita}.entries);

    // ==========================================
    finalList.add(mapPhasesTrigo);
    // ==========================================

    return finalList;
  }
}