import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/login/login_bloc.dart';
import 'package:flutter_bloc_demo/repository/auth_repository.dart';
import 'package:flutter_bloc_demo/utils/enums.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  late LoginBloc _loginBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc(AuthRepository());
  }

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _loginBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: BlocListener<LoginBloc, LoginState>(
              listenWhen: (current, previous) =>
                  current.loginStatus != previous.loginStatus,
              listener: (context, state) {
                if (state.loginStatus == LoginStatus.error) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(content: Text(state.message.toString())),
                    );
                }

                if (state.loginStatus == LoginStatus.success) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(content: Text(state.message.toString())),
                    );
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (current, previous) =>
                        current.email != previous.email,
                    builder: (context, state) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        focusNode: emailFocusNode,
                        decoration: const InputDecoration(
                            hintText: 'Email', border: OutlineInputBorder()),
                        onChanged: (value) {
                          context
                              .read<LoginBloc>()
                              .add(EmailChanged(email: value));
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter email';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {},
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (current, previous) =>
                        current.password != previous.password,
                    builder: (context, state) {
                      return TextFormField(
                        keyboardType: TextInputType.text,
                        focusNode: passwordFocusNode,
                        decoration: const InputDecoration(
                            hintText: 'Password', border: OutlineInputBorder()),
                        onChanged: (value) {
                          context
                              .read<LoginBloc>()
                              .add(PasswordChanged(password: value));
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter password';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {},
                      );
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (current, previous) =>
                        current.loginStatus != previous.loginStatus,
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(LoginApi());
                          }
                        },
                        child: state.loginStatus == LoginStatus.loading
                            ? const CircularProgressIndicator()
                            : const Text('Login'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
