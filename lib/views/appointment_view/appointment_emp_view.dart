import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttermyappp/controllers/appointment_controller.dart';
import 'package:fluttermyappp/controllers/auth_controller.dart';
import 'package:fluttermyappp/conts/conts.dart';
import 'package:fluttermyappp/views/appointment_detail_view/appointment_detail_view.dart';
import 'package:fluttermyappp/views/login_view/login_view.dart';

class AppointmentEmpView extends StatelessWidget {
  final bool isEmployees;
  const AppointmentEmpView({super.key,  this.isEmployees = true});


  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
        appBar: AppBar(
          title: AppStyles.bold(title: "Appointments",
              color: AppColors.whiteColor,
              size: AppSizes.size18),
          //  actions: [
          //   IconButton(onPressed: () {
          //     AuthController().signout();
          //    Get.offAll(()=>const LoginView());
          //   }, icon: Icon(Icons.power_settings_new_rounded))
          //  ],
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: controller.getAppointments(isEmployees),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var data = snapshot.data?.docs;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemCount: data?.length ?? 0,
                    itemBuilder: (BuildContext, int index) {
                      return ListTile(
                        onTap: (){
                          Get.to(()=> AppointmentDetailView(
                            emp: data[index],
                          ));
                        },
                        leading: CircleAvatar(
                          child: Image.asset(AppAssets.imgHair),
                        ),
                        title: AppStyles.bold(title: data![index][!isEmployees ? 'appWithName' : 'appName']),
                        subtitle: AppStyles.normal(
                            title: "${data[index]['appDay']} - ${data[index]['appTime']}",
                            color: AppColors.textColor.withOpacity(0.5)),
                      );
                    },
                  ),
                );
              }
            }
        )
    );
  }
}