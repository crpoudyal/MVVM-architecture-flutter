import 'package:flutter/material.dart';
import 'package:mvvm_architecture_flutter/res/components/round_button.dart';
import 'package:mvvm_architecture_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_architecture_flutter/utils/utils.dart';
import 'package:mvvm_architecture_flutter/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                decoration: const InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, _emailFocusNode, _passwordFocusNode);
                },
              ),
              SizedBox(
                height: height * 0.01,
              ),
              ValueListenableBuilder(
                  valueListenable: _obscurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: InkWell(
                          onTap: () {
                            _obscurePassword.value = !_obscurePassword.value;
                          },
                          child: _obscurePassword.value
                              ? const Icon(Icons.visibility_off_outlined)
                              : const Icon(Icons.visibility_outlined),
                        ),
                      ),
                      obscureText: _obscurePassword.value,
                    );
                  }),
              SizedBox(
                height: height * 0.1,
              ),
              RoundButton(
                title: 'SignUp',
                loading: authViewModel.loading,
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flashBarErrorMessage(
                        "Please enter your email", context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flashBarErrorMessage(
                        "Please enter your password", context);
                  } else if (_passwordController.text.length < 6) {
                    Utils.flashBarErrorMessage(
                        "Please enter 6 digit password", context);
                  } else {
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString(),
                    };
                    authViewModel.loginApi(data, context);
                  }
                },
              ),
              SizedBox(
                height: height * 0.1,
              ),
              InkWell(
                  onTap: () => Navigator.pushNamed(context, RoutesName.login),
                  child: const Text("Already have an account ? Log In")),
            ],
          ),
        ),
      ),
    );
  }
}
