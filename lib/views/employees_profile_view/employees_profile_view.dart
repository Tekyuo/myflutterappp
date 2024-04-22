import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttermyappp/controllers/appointment_controller.dart';
import 'package:fluttermyappp/conts/conts.dart';
import 'package:fluttermyappp/res/components/custom_button.dart';
import 'package:fluttermyappp/views/book_appointment_view/book_appointment_view.dart';

class EmployeesProfileView extends StatefulWidget {
  final DocumentSnapshot emp;
  const EmployeesProfileView({super.key, required this.emp});

  @override
  State<EmployeesProfileView> createState() => _EmployeesProfileViewState();
}

class _EmployeesProfileViewState extends State<EmployeesProfileView> {
  @override
  Widget build(BuildContext context)
  {
    var controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        title:AppStyles.bold(title: "Employee Details", color: AppColors.whiteColor, size: AppSizes.size18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              height: 100,
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                      radius: 40,
                      child: widget.emp['empCategory'] == 'Makeup'
                          ? Image.asset(AppAssets.icMakeup)
                          : widget.emp['empCategory'] == 'Haircut'
                          ? Image.asset(AppAssets.icHaircut)
                          : widget.emp['empCategory'] == 'Hairstyles'
                          ? Image.asset(AppAssets.icHairstyle)
                          : widget.emp['empCategory'] == 'Manicure'
                          ? Image.asset(AppAssets.icManicure)
                          : widget.emp['empCategory'] == 'Pedicure'
                          ? Image.asset(AppAssets.icPedicure)
                          : widget.emp['empCategory'] == 'Face cleaning'
                          ? Image.asset(AppAssets.icCleaningFace)
                          : Image.asset(AppAssets.imgHair)
                  ),
                  10.widthBox,
                  Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppStyles.bold(title: widget.emp['empName'], color: AppColors.textColor, size: AppSizes.size14),
                      AppStyles.bold(
                          title: widget.emp['empCategory'],
                          color: AppColors.textColor.withOpacity(0.5),
                          size: AppSizes.size12),
                      const Spacer(),
                      VxRating(
                        selectionColor: AppColors.yellowColor,
                        onRatingUpdate: (value) {
                          FirebaseFirestore.instance.collection('employees').doc(widget.emp['empID']).update({
                            'empRating': value,
                          }).then((_) {
                            FirebaseFirestore.instance.collection('employees').doc(widget.emp['empID']).get().then((doc) {
                            });
                          });
                        },
                        value: double.parse(widget.emp['empRating'].toString()),
                        count: 5,
                        stepInt: true,
                      ),
                    ],
                  ),
                  ),
                  AppStyles.bold(title: "See all reviews", color: AppColors.blueColor, size: AppSizes.size14),
                    ],
              ),
            ),
            10.heightBox,
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.whiteColor,
              ),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: AppStyles.bold(title: "Phone Number", color: AppColors.textColor),
                  subtitle: AppStyles.normal(
                      title: widget.emp['empPhone'], color: AppColors.textColor.withOpacity(0.5), size: AppSizes.size12),
                      trailing: Container(
                        width: 50,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.yellowColor,
                        ),
                        child: Icon(
                            Icons.phone,
                            color: AppColors.whiteColor),
                      ),
                ),
                10.heightBox,
                AppStyles.bold(title: "About", color: AppColors.textColor, size: AppSizes.size16),
                5.heightBox,
                AppStyles.normal(title: widget.emp['empAbout'], color: AppColors.textColor.withOpacity(0.5), size: AppSizes.size14),
                10.heightBox,
                AppStyles.bold(title: "Address", color: AppColors.textColor, size: AppSizes.size16),
                5.heightBox,
                AppStyles.normal(title: widget.emp['empAddress'], color: AppColors.textColor.withOpacity(0.5), size: AppSizes.size14),
                10.heightBox,
                AppStyles.bold(title: "Working Time", color: AppColors.textColor, size: AppSizes.size16),
                5.heightBox,
                AppStyles.normal(title: widget.emp['empTiming'], color: AppColors.textColor.withOpacity(0.5), size: AppSizes.size14),
                10.heightBox,
                AppStyles.bold(title: "Services", color: AppColors.textColor, size: AppSizes.size16),
                5.heightBox,
                AppStyles.normal(title: widget.emp['empService'], color: AppColors.textColor.withOpacity(0.5), size: AppSizes.size14),

              ],
              ),
            ),
              ],
            ),
        ),
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(
            buttonText: "Book an appointment",
            onTap: () {


              Get.to(()=> BookAppointmentView(
                empID: widget.emp['empID'],
                empName: widget.emp['empName'],
                empCategory: widget.emp['empCategory'],
              ));
            },
        ),
      ),
        );
  }
}