import 'package:cherry_toast/cherry_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../controllers/auth_controller.dart';
import '../controllers/main_wrapper_controller.dart';
import '../utils/color_constants.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final MainWrapperController _mainWrapperController =
      Get.find<MainWrapperController>();

  // Text Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  // final _aboutController = TextEditingController();
  final _phoneController = TextEditingController();

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    // _aboutController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign up',
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
        body: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.account_circle_rounded,
                size: 100,
                color: ColorConstants.appColors,
              ),
              //Hello Again!
              const Text(
                'Hello!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Welcome signup here!',
                style: TextStyle(fontSize: 19),
              ),
              const SizedBox(
                height: 20.0,
              ),

              //First Name Text Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.appColors),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _firstNameController,
                      decoration: const InputDecoration(
                        labelText: "First Name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 10.0,
              ),

              //Last Name Text Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.appColors),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _lastNameController,
                      decoration: const InputDecoration(
                        labelText: "Last Name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 10.0,
              ),

              //Email Text Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.appColors),
                      borderRadius: BorderRadius.circular(12.0)),
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
              //Phone Text Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorConstants.appColors),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: SizedBox(
                        height: 50,
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            if (kDebugMode) {
                              print(number.phoneNumber);
                            }
                            _phoneController.text = number.phoneNumber!;
                          },
                          onInputValidated: (bool value) {
                            if (kDebugMode) {
                              print(value);
                            }
                          },
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            setSelectorButtonAsPrefixIcon: false,
                            leadingPadding: 10,
                            showFlags: true,
                            trailingSpace: true,
                          ),
                          spaceBetweenSelectorAndTextField: 3,
                          initialValue: PhoneNumber(isoCode: 'MW'),
                          textFieldController: TextEditingController(),
                          formatInput: false,
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          inputDecoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            floatingLabelAlignment:
                                FloatingLabelAlignment.start,
                          ),
                          textStyle: const TextStyle(color: Colors.black),
                          onSaved: (PhoneNumber number) {
                            if (kDebugMode) {
                              print('On Saved: $number');
                            }
                          },
                        ),
                      ),
                    ),
                  ],
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
                      borderRadius: BorderRadius.circular(12.0)),
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

              //Confirm Password Text Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.appColors),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Confirm Password",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
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
                    try {
                      if (passwordConfirmed()) {
                        // this is for the register function in auth controller
                        AuthController.authInstance.register(
                            _firstNameController.text.trim(),
                            _lastNameController.text.trim(),
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                            _phoneController.text.trim(),
                            'Eggy'
                            // _aboutController.text.trim(),
                            );
                      } else {
                        CherryToast.error(
                          title: const Text(
                            'Error',
                          ),
                          action: const Text(
                            'Passwords Don\'t Match!',
                          ),
                        ).show(context);
                      }
                    } on FirebaseAuthException catch (e) {
                      CherryToast.error(
                        title: const Text(
                          'Error',
                        ),
                        action: Text(
                          e.message!,
                        ),
                      ).show(context);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: ColorConstants.appColors,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign Up',
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
                    'Already Registered? ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const LoginPage());
                      //   Get.to(LoginPage());
                      //   // Get.off(LoginPage());
                    },
                    child: Text(
                      'Login now',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.appColors),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
