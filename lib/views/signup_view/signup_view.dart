import 'package:flutter/cupertino.dart';
import 'package:fluttermyappp/controllers/auth_controller.dart';
import 'package:fluttermyappp/res/components/custom_button.dart';
import 'package:fluttermyappp/res/components/custom_textfield.dart';
import 'package:fluttermyappp/conts/conts.dart';
import 'package:fluttermyappp/views/appointment_view/appointment_view.dart';
import 'package:fluttermyappp/views/home_view/home.dart';
import 'package:fluttermyappp/views/home_view/home_emp.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  var isEmployees = false;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return Scaffold(
      body: Container(
          margin: const EdgeInsets.only(top: 40),
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.imgSignup,
                    width: 200,
                    color: AppColors.blueColor,
                  ),
                  10.heightBox,
                  AppStyles.bold(title: AppStrings.signupNow, size: AppSizes.size18, alignment: TextAlign.center)
                ],
              ),
              30.heightBox,
              Expanded(
                  child: Form(
                    child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomTextField(hint: AppStrings.fullname,
                                textController: controller.fullnameController),
                            10.heightBox,
                            CustomTextField(hint: AppStrings.email,
                                textController: controller.emailController),
                            10.heightBox,
                            CustomTextField(hint: AppStrings.password,
                                textController: controller.passwordController),
                            10.heightBox,
                            SwitchListTile(
                                title: "Sign up as a employee".text.make(),
                                value: isEmployees,
                                onChanged: (newValue){
                                  setState(() {
                                    isEmployees = newValue;
                              });
                            }),
                            Visibility(
                              visible: isEmployees,
                              child: Column(
                                children: [
                                  CustomTextField(
                                      hint: "About",
                                      textController: controller.aboutController),
                                  10.heightBox,
                                  CustomTextField(
                                      hint: "Category",
                                      textController: controller.categoryController),
                                  10.heightBox,
                                  CustomTextField(
                                      hint: "Services",
                                      textController: controller.servicesController),
                                  10.heightBox,
                                  CustomTextField(
                                      hint: "Address",
                                      textController: controller.addressController),
                                  10.heightBox,
                                  CustomTextField(
                                      hint: "Phone Mobile",
                                      textController: controller.phoneController),
                                  10.heightBox,
                                  CustomTextField(
                                      hint: "Timing",
                                      textController: controller.timingController),
                                  10.heightBox,
                                ],
                              ),
                            ),
                            20.heightBox,
                            CustomButton(
                              buttonText: AppStrings.signup,
                              onTap: () async{
                                await controller.signupUser(isEmployees);
                                if(controller.userCredential != null) {
                                  if(isEmployees) {
                                    Get.to(() => const HomeEmp());
                                  }else{
                                  Get.offAll(()=> const Home());
                                }
                                }
                            }),
                            20.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppStyles.normal(title: AppStrings.alreadyHaveAccount),
                                8.widthBox,
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: AppStyles.bold(title: AppStrings.login),
                                ),
                              ],
                            ),
                          ],
                        ))),
              ),
            ],
          )),
    );
  }
}