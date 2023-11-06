import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incubator/views/register_page.dart';

import '../controllers/auth_controller.dart';
import '../controllers/main_wrapper_controller.dart';
import '../utils/color_constants.dart';
import 'forgot_pw_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final MainWrapperController _mainWrapperController =
      Get.find<MainWrapperController>();

  // Text Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Login',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          centerTitle: true,
          actions: [
            Obx(
              () => Switch.adaptive(
                value: _mainWrapperController.isDarkTheme.value,
                onChanged: (newVal) {
                  _mainWrapperController.isDarkTheme.value = newVal;
                  _mainWrapperController
                      .switchTheme(newVal ? ThemeMode.dark : ThemeMode.light);
                },
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const CircleAvatar(
                  //   backgroundImage: AssetImage("assets/images/images1.jpeg"),
                  //   radius: 80.0,
                  // ),
                  Icon(
                    Icons.account_circle_rounded,
                    size: 100,
                    color: ColorConstants.appColors,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //Hello Again!
                  const Text(
                    'Welcome!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Enter your credentials',
                    style: TextStyle(fontSize: 19),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  //Email Text Field

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorConstants.appColors),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: "Email",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  //Password Text Field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorConstants.appColors),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Password",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const ForgotPasswordPage());
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorConstants.appColors),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10.0,
                  ),

                  //Sign In Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: () {
                        AuthController.authInstance.login(
                            _emailController.text.trim(),
                            _passwordController.text.trim());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: ColorConstants.appColors,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 25.0,
                  ),

                  //Not a member? Sign Up Now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Not a member? ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const RegisterPage());
                        },
                        child: Text(
                          'Register now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.appColors),
                        ),
                      ),
                    ],
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
