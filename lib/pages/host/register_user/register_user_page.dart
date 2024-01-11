import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flv_farm/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:universal_io/io.dart';

import '../../../core/auth_service.dart';
import '../../home/home_page.dart';
import '../../home/host_home_page.dart';
import 'widgets/drop_dows_users_types.dart';

class RegisterUserPage extends StatefulHookConsumerWidget {
  const RegisterUserPage({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends ConsumerState<RegisterUserPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final FirebaseStorage storage = FirebaseStorage.instance;

  bool loading = false;

  List<Reference> refs = [];
  List<String> arquivos = [];
  bool loadingSign = true;
  bool uploading = false;
  double total = 0;

  register(String hostUser, String hostPassword, String? permission) async {
    setState(() => loading = true);
    try {
      await ref.read(authServiceProvider.notifier).registrar(
          hostUser,
          hostPassword,
          emailController.text,
          passwordController.text,
          nameController.text,
          permission);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authServiceProvider.notifier);
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar usuário'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: Platform.isAndroid
                      ? const EdgeInsets.all(24)
                      : const EdgeInsets.only(
                          top: 24,
                          bottom: 24,
                          right: 400,
                          left: 400,
                        ),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome',
                    ),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'O campo de nome não deve estar vazio!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: Platform.isAndroid
                      ? const EdgeInsets.all(24)
                      : const EdgeInsets.only(
                          top: 24,
                          bottom: 24,
                          right: 400,
                          left: 400,
                        ),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'O campo de email não deve estar vazio!';
                      }
                      String pattern = r'\w+@\w+\.\w+';
                      RegExp regex = RegExp(pattern);
                      if (!regex.hasMatch(emailController.text)) {
                        return 'Informe um email válido!';
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: Platform.isAndroid
                      ? const EdgeInsets.all(24)
                      : const EdgeInsets.only(
                          top: 24,
                          bottom: 24,
                          right: 400,
                          left: 400,
                        ),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: user.selectedPermissionToNewUser != "Host",
                    enabled: user.selectedPermissionToNewUser != "Host",
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
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
                ),
                const SizedBox(height: 10),
                DropDownUsersTypes(
                    user, user.selectedPermissionToNewUser, passwordController),
                const SizedBox(height: 10),
                Platform.isAndroid
                    ? Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: ElevatedButton(
                            onPressed: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              if (formKey.currentState!.validate()) {
                                await register(
                                    auth.usuario!.email.toString(),
                                    '@host2023@',
                                    user.selectedPermissionToNewUser);
                                if (auth.userRegistered && mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Usuário cadastrado com sucesso!'),
                                    ),
                                  );
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const HostHomePage(),
                                    ),
                                  );
                                }
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: (loading)
                                  ? [
                                      const Padding(
                                        padding: EdgeInsets.all(16),
                                        child: SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ]
                                  : [
                                      const Icon(Icons.check),
                                      const Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Text(
                                          'Cadastrar',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                            )),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(
                          top: 24,
                          bottom: 24,
                          left: 400,
                          right: 400,
                        ),
                        child: ElevatedButton(
                            onPressed: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              if (formKey.currentState!.validate()) {
                                await register(
                                    auth.usuario!.email.toString(),
                                    '@host2023@',
                                    user.selectedPermissionToNewUser);
                                if (auth.userRegistered && mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Usuário cadastrado com sucesso!'),
                                    ),
                                  );
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const HostHomePage(),
                                    ),
                                  );
                                }
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: (loading)
                                  ? [
                                      const Padding(
                                        padding: EdgeInsets.all(16),
                                        child: SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ]
                                  : [
                                      const Icon(Icons.check),
                                      const Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Text(
                                          'Cadastrar',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                            )),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
