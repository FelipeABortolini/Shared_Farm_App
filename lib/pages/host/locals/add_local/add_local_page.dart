import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:universal_io/io.dart';

import '../../../../db/locals/add_locals/add_local.dart';
import '../../../../db/locals/utils/get_last_locals_id.dart';
import '../../../../providers/providers.dart';
import '../../../../shared/alert.dart';
import '../../../../shared/input.dart';
import '../../../../styles/app_text_style.dart';
import '../../../login/utils/auth_check.dart';

// ignore: must_be_immutable
class AddLocalPage extends HookConsumerWidget {
  AddLocalPage({super.key});

  AlertWidget alert = AlertWidget();
  AddLocal addLocal = AddLocal();
  GetLastLocalsID getLastLocalID = GetLastLocalsID();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locals = ref.watch(localsProvider);
    final loading = ref.watch(loadingCultureProvider);

    int number = 0;

    void resetControlls() {
      locals.resetControllers();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Local de Entrega"),
        leading: IconButton(
          onPressed: () {
            resetControlls();
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: (() async {
          if (await confirm(
            context,
            title: const Text('Confirmação'),
            content: const Text('Deseja atualizar a tela?'),
            textOK: const Text('Sim'),
            textCancel: const Text('Não'),
          )) {
            resetControlls();
          }
        }),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Platform.isAndroid
                          ? Input(
                              controller: locals.name,
                              nameField: 'Nome',
                              number: false,
                            )
                          : Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  horizontal: 450),
                              child: Input(
                                controller: locals.name,
                                nameField: 'Nome',
                                number: false,
                              ),
                            ),
                      const SizedBox(height: 200),
                      GestureDetector(
                        onTap: () async {
                          if (!loading.isLoading) {
                            loading.setIsLoading();
                            if (locals.name.text == "") {
                              loading.resetIsLoading();
                              // ignore: use_build_context_synchronously
                              alert.alert(
                                  context,
                                  "O campo nome deve ser preenchido.",
                                  "ATENÇÃO!",
                                  AlertType.info);
                            } else {
                              try {
                                number = await getLastLocalID.get();
                                addLocal.addLocal({
                                  "ID": (number + 1).toString(),
                                  "name": locals.name.text.toUpperCase(),
                                }, number + 1);
                                resetControlls();
                                loading.resetIsLoading();
                                // ignore: use_build_context_synchronously
                                await alert.alert(
                                    context,
                                    "Local de entrega cadastrado com sucesso.",
                                    "SUCESSO!",
                                    AlertType.success);
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AuthCheck(first: false),
                                  ),
                                );
                              } catch (e) {
                                loading.resetIsLoading();
                                // ignore: use_build_context_synchronously
                                alert.alert(
                                    context,
                                    "Erro ao cadastrar local de entrega.",
                                    "ERRO!",
                                    AlertType.error);
                              }
                            }
                          }
                        },
                        child: Platform.isAndroid
                            ? Container(
                                height: 56,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.green[300]),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Padding(
                                          padding: !loading.isLoading
                                              ? const EdgeInsets.only(left: 32)
                                              : const EdgeInsets.only(left: 0),
                                          child: !loading.isLoading
                                              ? Text(
                                                  'Adicionar',
                                                  style: AppTextStyle.style(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              : Lottie.asset(
                                                  'assets/loading.json',
                                                  height: 50,
                                                  width: 50),
                                        ),
                                      ),
                                    ),
                                    !loading.isLoading
                                        ? const Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Icon(Icons.arrow_forward,
                                                color: Colors.white, size: 32),
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                              )
                            : Container(
                                height: 56,
                                width: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.green[300]),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Padding(
                                          padding: !loading.isLoading
                                              ? const EdgeInsets.only(left: 32)
                                              : const EdgeInsets.only(left: 0),
                                          child: !loading.isLoading
                                              ? Text(
                                                  'Adicionar',
                                                  style: AppTextStyle.style(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              : Lottie.asset(
                                                  'assets/loading.json',
                                                  height: 50,
                                                  width: 50),
                                        ),
                                      ),
                                    ),
                                    !loading.isLoading
                                        ? const Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Icon(Icons.arrow_forward,
                                                color: Colors.white, size: 32),
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
