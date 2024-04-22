import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermyappp/conts/conts.dart';
import 'package:fluttermyappp/views/employees_profile_view/employees_profile_view.dart';

class SearchView extends StatelessWidget {
  final String searchQuery;
  const SearchView({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: AppStyles.bold(title: "Search Results", color: AppColors.whiteColor, size: AppSizes.size18),
      ),
      body: FutureBuilder<QuerySnapshot>(
       future: FirebaseFirestore.instance.collection('employees').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else {


            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 170,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {

                  var emp = snapshot.data!.docs[index];

                  return !(emp['empName'].toString().toLowerCase()).contains(searchQuery.toLowerCase())
                      ? const SizedBox.shrink()

                  :GestureDetector(
                    onTap: () {
                      Get.to(() => EmployeesProfileView(emp: emp));
                    },
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: AppColors.bgDarkColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.only(right: 8),
                      height: 100,
                      width: 150,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            color: AppColors.blueColor,
                            child: Image.asset(
                              AppAssets.imgSignup,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          5.heightBox,
                          AppStyles.normal(title: emp['empName']),
                          VxRating(
                            selectionColor: AppColors.yellowColor,
                            onRatingUpdate: (value){},
                            count: 5,
                            value: double.parse(emp['empRating'].toString()),
                            stepInt: true,
                          ),
                        ],
                      ),
                    ));
                },
              ),
            );
          }
        },
      ),
    );
  }
}