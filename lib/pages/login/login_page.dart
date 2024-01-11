import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flv_farm/pages/login/utils/auth_check.dart';
import 'package:flv_farm/shared/get_products.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:universal_io/io.dart';

import '../../../core/auth_service.dart';
import '../../providers/providers.dart';
import '../forgot_password/forgot_password_page.dart';
import '../../../styles/app_color.dart';
import '../../../styles/app_text_style.dart';
import 'controllers/loading_login_controller.dart';
import 'utils/sync_categories_for_cultures.dart';

class LoginPage extends HookConsumerWidget {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final sync = SyncCategoriesForCulture();

  final parentCollectionRef = FirebaseFirestore.instance.collection('insumos');

  void getAll(
    adubos,
    sementes,
    inseticidas,
    herbicidas,
    fungicidas,
    adjuvantes,
    inoculantes,
    diesel,
    fertilizantesFoliares,
  ) async {
    await getProducts(adubos, "adubo");
    await getProducts(sementes, "semente");
    await getProducts(inseticidas, "inseticida");
    await getProducts(herbicidas, "herbicida");
    await getProducts(fungicidas, "fungicida");
    await getProducts(adjuvantes, "adjuvante");
    await getProducts(inoculantes, "inoculante");
    await getProducts(diesel, "diesel");
    await getProducts(fertilizantesFoliares, "fertilizanteFoliar");
  }

  LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authServiceProvider.notifier);
    final isSecure = ref.watch(isSecureProvider);
    final loading = ref.watch(loadingLoginProvider);

    login(LoadingLoginController loading) async {
      loading.setLoading();
      try {
        await ref
            .read(authServiceProvider.notifier)
            .login(loginController.text, passwordController.text);
      } on AuthException catch (e) {
        loading.resetLoading();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message)));
        if (e.message == 'Sem acesso à internet.') {}
      }
      loading.resetLoading();
    }

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Platform.isAndroid
                ? Positioned(
                    top: 0,
                    // bottom: MediaQuery.of(context).size.height / 2,
                    child: Image.asset(
                      "assets/images/test.png",
                      width: MediaQuery.of(context).size.width,
                    ),
                  )
                : Positioned(
                    top: 0,
                    // bottom: MediaQuery.of(context).size.height / 2,
                    child: Image.asset(
                      "assets/images/test.png",
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
            // Center(
            // child:
            Positioned(
              top: 155,
              child: SingleChildScrollView(
                child: Container(
                  height: Platform.isAndroid
                      ? MediaQuery.of(context).size.height
                      : 400,
                  width: Platform.isAndroid
                      ? MediaQuery.of(context).size.width
                      : 600,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Platform.isAndroid
                              ? AppColor.primaryLight
                              : AppColor.primaryLightWeb,
                          Platform.isAndroid
                              ? AppColor.primary
                              : AppColor.primaryWeb
                        ]),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(38),
                      topLeft: Radius.circular(38),
                      bottomLeft: Radius.circular(38),
                      bottomRight: Radius.circular(38),
                    ),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        // ignore: prefer_const_constructors
                        SizedBox(height: 20),
                        TextFormField(
                          controller: loginController,
                          decoration: InputDecoration(
                            labelText: 'Usuário',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.8)),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.8)),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.8)),
                            ),
                            labelStyle: AppTextStyle.style(
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                          style: AppTextStyle.style(
                            color: Colors.black.withOpacity(0.8),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'O campo de email não deve estar vazio!';
                            }
                            String pattern = r'\w+@\w+\.\w+';
                            RegExp regex = RegExp(pattern);
                            if (!regex.hasMatch(loginController.text)) {
                              return 'Informe um email válido!';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 40),
                        TextFormField(
                          controller: passwordController,
                          obscureText: isSecure.isSecure,
                          style: AppTextStyle.style(
                            color: Colors.black.withOpacity(0.8),
                          ),
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(15),
                              child: GestureDetector(
                                onTap: () {
                                  isSecure.toggleIsSecure();
                                },
                                child: Icon(
                                  Icons.remove_red_eye,
                                  color: isSecure.isSecure
                                      ? Colors.black.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.4),
                                ),
                              ),
                            ),
                            labelText: 'Senha',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.8)),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.8)),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.8)),
                            ),
                            labelStyle: AppTextStyle.style(
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informa sua senha!';
                            } else if (value.length < 6) {
                              return 'Sua senha deve ter no mínimo 6 caracteres';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 40),
                        GestureDetector(
                          onTap: () async {
                            FocusScope.of(context).requestFocus(FocusNode());
                            if (formKey.currentState!.validate()) {
                              await login(loading);
                              if (auth.usuario != null) {
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AuthCheck(first: true),
                                  ),
                                );
                              }
                            }
                          },
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: !loading.isLoading
                                  ? LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        AppColor.button,
                                        AppColor.button.withOpacity(0.7)
                                      ],
                                    )
                                  : LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        AppColor.buttonLoading,
                                        AppColor.buttonLoading.withOpacity(0.7)
                                      ],
                                    ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(5, 5),
                                  blurRadius: 10,
                                )
                              ],
                            ),
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
                                              'ENTRAR',
                                              style: AppTextStyle.style(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          : Lottie.asset('assets/loading.json',
                                              height: 50, width: 50),
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
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Esqueceu a senha?',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
