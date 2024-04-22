import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttermyappp/conts/conts.dart';
import 'package:fluttermyappp/views/category_details_view/category_details_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: AppStyles.bold(title: AppStrings.category, size: AppSizes.size18, color: AppColors.whiteColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 170,
          ),
          itemCount: iconsList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => CategoryDetailsView(catName: iconsTitleList[index]));
              },
              child: FutureBuilder(
                future: FirebaseFirestore.instance.collection('employees').where('empCategory', isEqualTo: iconsTitleList[index]).get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasData) {
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.blueColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              iconsList[index],
                              width: 60,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          30.heightBox,
                          AppStyles.bold(
                            title: iconsTitleList[index],
                            color: AppColors.whiteColor,
                            size: AppSizes.size16,
                          ),
                          10.heightBox,
                          AppStyles.normal(
                            title: "${snapshot.data?.docs.length} employees",
                            color: AppColors.whiteColor.withOpacity(0.5),
                            size: AppSizes.size12,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Text('No data');
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}