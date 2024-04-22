import 'package:fluttermyappp/controllers/auth_controller.dart';
import 'package:fluttermyappp/res/components/custom_button.dart';
import 'package:fluttermyappp/res/components/custom_textfield.dart';
import 'package:fluttermyappp/conts/conts.dart';
import 'package:fluttermyappp/views/appointment_view/appointment_view.dart';
import 'package:fluttermyappp/views/home_view/home.dart';
import 'package:fluttermyappp/views/home_view/home_emp.dart';
import 'package:fluttermyappp/views/signup_view/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var isEmpl = false;

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
                        AppAssets.icLogin,
                        color: AppColors.blueColor,
                        width: 200,
                      ),
                      10.heightBox,
                      AppStyles.bold(title: AppStrings.welcomeBack, size: AppSizes.size18),
                      AppStyles.bold(title: AppStrings.weAreExcited),
                    ],
              ),
              30.heightBox,
              Expanded(
                    child: Form(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomTextField(hint: AppStrings.email, textController: controller.emailController,),
                            10.heightBox,
                            CustomTextField(hint: AppStrings.password, textController: controller.passwordController,),
                            10.heightBox,
                          //  SwitchListTile(value: isEmpl, onChanged: (newValue) {
                          //    setState(() {
                           //     isEmpl = newValue;
                          //    });
                          //  },title: "Sign in as a employee".text.make()),
                         //   20.heightBox,
                            Align(
                              alignment: Alignment.centerRight,
                              child: AppStyles.normal(title: AppStrings.forgetPassword)
                            ),
                            20.heightBox,
                            CustomButton(
                              buttonText: AppStrings.login,
                              onTap: ()  async{
                                await controller.loginUser(isEmpl);
                                if(controller.userCredential != null) {
                               //   if (isEmpl) {
                               //     Get.to(() => const HomeEmp());
                                //  } else {
                              //    Get.to(() => const Home());
                             //   }
                                }
                              }),
                            20.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppStyles.normal(title: AppStrings.dontHaveAccount),
                                8.widthBox,
                                GestureDetector(
                                  onTap: (){
                                    Get.to(()=> const SignupView());
                                  },
                                  child: AppStyles.bold(title: AppStrings.signup),
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