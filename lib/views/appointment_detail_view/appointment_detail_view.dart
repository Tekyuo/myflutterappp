import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttermyappp/conts/conts.dart';

class AppointmentDetailView extends StatelessWidget {
  final DocumentSnapshot emp;

  const AppointmentDetailView({super.key, required this.emp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppStyles.bold(title: emp['appWithName'],
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
            AppStyles.normal(title: emp['appDay']),
            10.heightBox,
            AppStyles.bold(title: "Select appointment time"),
            5.heightBox,
            AppStyles.normal(title: emp['appTime']),
            20.heightBox,
            AppStyles.bold(title: "Mobile phone"),
            5.heightBox,
            AppStyles.normal(title: emp['appMobile']),
            10.heightBox,
            AppStyles.bold(title: "Full name:"),
            5.heightBox,
            AppStyles.normal(title: emp['appName']),
            10.heightBox,
            AppStyles.bold(title: "Message:"),
            5.heightBox,
            AppStyles.normal(title: emp['appMsg']),
          ],
        ),
      ),
    );
  }
}