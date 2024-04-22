import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttermyappp/controllers/home_controller.dart';
import 'package:fluttermyappp/conts/conts.dart';
import 'package:fluttermyappp/res/components/custom_textfield.dart';
import 'package:fluttermyappp/views/category_details_view/category_details_view.dart';
import 'package:fluttermyappp/views/category_view/category_view.dart';
import 'package:fluttermyappp/views/employees_profile_view/employees_profile_view.dart';
import 'package:fluttermyappp/views/search_view/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: AppStyles.bold(title: "${AppStrings.welcome} User", color: AppColors.whiteColor, size: AppSizes.size18),
      ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 100,
            color: AppColors.blueColor,
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(

                    textController: controller.searchQueryController,
                    hint: AppStrings.search,
                    borderColor: AppColors.whiteColor,
                    textColor: AppColors.whiteColor,
                    inputColor: AppColors.whiteColor,
                  ),
                ),
                10.widthBox,
                IconButton(
                    onPressed: () {
                      Get.to(()=>SearchView(
                          searchQuery: controller.searchQueryController.text
                      ));
                    },
                    icon: Icon(
                        Icons.search,
                        color: AppColors.whiteColor,
                ))
              ],
            ),
          ),
          20.heightBox,
          Padding(
            padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
          SizedBox(
            height: 80,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(()=>CategoryDetailsView(catName: iconsTitleList[index]));
                  },
                  child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.blueColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(right: 8),
                  child: Column(
                    children: [
                      Image.asset(
                        iconsList[index],
                        width: 30,
                        color: AppColors.whiteColor,
                      ),
                      5.heightBox,
                      AppStyles.normal(title: iconsTitleList[index], color: AppColors.whiteColor),
                    ],
                  ),
                  ),
                );
            },
          ),
          ),
              20.heightBox,
              Align(alignment: Alignment.centerLeft, child: AppStyles.bold(title: "Popular Employees", color: AppColors.blueColor, size: AppSizes.size18),
              ),
              10.heightBox,
             FutureBuilder<QuerySnapshot>(
                 future: controller.getEmployeesList(),
                 builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                   if (!snapshot.hasData){
                   return Center(
                     child: CircularProgressIndicator(),
                   );
                 } else {
                     var data = snapshot.data?.docs;
                    return SizedBox(
                       height: 150,
                       child: ListView.builder(
                         scrollDirection: Axis.horizontal,
                         itemCount: data?.length ?? 0,
                         itemBuilder: (BuildContext context, int index) {
                           return GestureDetector(
                             onTap: () {
                               Get.to(() => EmployeesProfileView(emp: data[index]));
                             },
                             child: Container(
                               clipBehavior: Clip.hardEdge,
                               decoration: BoxDecoration(
                                 color: AppColors.bgDarkColor,
                                 borderRadius: BorderRadius.circular(12),
                               ),
                               margin: const EdgeInsets.only(right: 8),
                               height: 100,
                               width: 100,
                               child: Column(
                                 children: [
                                   Container(
                                     width: 150,
                                     alignment: Alignment.center,
                                     color: AppColors.blueColor,

                                     child: data![index]['empCategory'] == 'Makeup'
                                         ? Image.asset(AppAssets.icMakeup, width: 100, fit: BoxFit.cover)
                                         : data![index]['empCategory'] == 'Haircut'
                                         ? Image.asset(AppAssets.icHaircut, width: 100, fit: BoxFit.cover)
                                         : data![index]['empCategory'] == 'Hairstyles'
                                         ? Image.asset(AppAssets.icHairstyle, width: 100, fit: BoxFit.cover)
                                         : data![index]['empCategory'] == 'Manicure'
                                         ? Image.asset(AppAssets.icManicure, width: 100, fit: BoxFit.cover)
                                         : data![index]['empCategory'] == 'Pedicure'
                                         ? Image.asset(AppAssets.icPedicure, width: 100, fit: BoxFit.cover)
                                         : data![index]['empCategory'] == 'Face cleaning'
                                         ? Image.asset(AppAssets.icCleaningFace, width: 100, fit: BoxFit.cover)
                                         : Image.asset(AppAssets.imgHair, width: 100, fit: BoxFit.cover)
                                   ),
                                   5.heightBox,
                                   AppStyles.normal(title: data![index]['empName']),
                                   5.heightBox,
                                   AppStyles.normal(title: data![index]['empCategory'], color: Colors.black54),
                                 ],
                               ),
                             ),
                           );
                         },
                       ),
                     );
                   }
                 }
             ),
              5.heightBox,
              GestureDetector(
                onTap: () {
                 Get.to(() => CategoryView());
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AppStyles.normal(title: "View All", color: AppColors.blueColor),
              ),
              ),
              20.heightBox,
             /* Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    4,
                        (index) => Container(
                          decoration: BoxDecoration(
                            color: AppColors.blueColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Image.asset(AppAssets.icBody, width: 25, color: AppColors.whiteColor),
                              5.heightBox,
                              AppStyles.normal(title: "Lab Test", color: AppColors.whiteColor),
                            ],
                          )
                        )),
              )*/
            ],
          ),
          ),
        ],
      ),
    )
    );
  }
}