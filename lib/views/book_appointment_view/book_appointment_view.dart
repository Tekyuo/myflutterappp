import 'package:fluttermyappp/controllers/appointment_controller.dart';
import 'package:fluttermyappp/conts/conts.dart';
import 'package:fluttermyappp/res/components/custom_button.dart';
import 'package:fluttermyappp/res/components/custom_textfield.dart';
import 'package:flutter/material.dart';

class BookAppointmentView extends StatelessWidget {
  final String empID;
  final String empName;
  final String empCategory;
  const BookAppointmentView({super.key, required this.empID, required this.empName, required this.empCategory});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        title: AppStyles.bold(title: empName,
            color: AppColors.whiteColor,
            size: AppSizes.size18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppStyles.bold(title: "Select appointment day"),
            5.heightBox,
            CustomTextField(hint: "Select day", textController: controller.appDayController),
            10.heightBox,
            AppStyles.bold(title: "Select appointment time"),
            5.heightBox,
            CustomTextField(hint: "Select time", textController: controller.appTimeController),
            20.heightBox,
            AppStyles.bold(title: "Mobile phone"),
            5.heightBox,
            CustomTextField(hint: "Enter your mobile phone", textController: controller.appMobileController),
            10.heightBox,
            AppStyles.bold(title: "Full name:"),
            5.heightBox,
            CustomTextField(hint: "Enter your name", textController: controller.appNameController),
            10.heightBox,
            AppStyles.bold(title: "Message:"),
            5.heightBox,
            CustomTextField(hint: "Enter your message", textController: controller.appMessageController),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() => Padding(
          padding: const EdgeInsets.all(10.0),
          child: controller.isLoading.value ? Center (child: CircularProgressIndicator(),
          )
          :CustomButton(
            buttonText: "Book an appointment",
            onTap: () async {
              await controller.bookAppointment(empID, empName, context);
            },
          ),
        ),
      ),
    );
  }
}