import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_project/modals/meal_model.dart';
import 'package:task_project/provider/meal_provider.dart';

class MealTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<MealModel> mealData;
  final Function() onTap;
  const MealTile({
    super.key,
    required this.title,
    required this.icon,
    required this.mealData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MealDataProvider>(
      builder: (context, mealProvider, child) {
        return Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60.sp,
                        width: 60.sp,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          icon,
                          size: 25.sp,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w500),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 2),
                            decoration: BoxDecoration(
                                color: mealData.isEmpty ? Colors.grey : null,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: mealData.isNotEmpty
                                        ? Colors.green
                                        : Colors.transparent)),
                            child: mealData.isNotEmpty
                                ? Text(
                                    "Save",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 11.sp),
                                  )
                                : Text(
                                    "No Products",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11.sp),
                                  ),
                          ),
                        ],
                      )
                    ],
                  ),
                  if (mealData.isNotEmpty) const SizedBox(height: 10),
                  if (mealData.isNotEmpty)
                    Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10),
                                bottom: Radius.circular(20))),
                        child: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: mealData.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  mealData[index].mealName,
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                              Text(
                                                "${mealData[index].mealCalories} Cals",
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            mealProvider.deleteItem(
                                                mealData, index);
                                          },
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(left: 20),
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red.shade200),
                                            child: Icon(
                                              Icons.close,
                                              size: 15.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Divider(
                                      color: Colors.white,
                                      thickness: 3,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                );
                              },
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Total",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.green.shade400),
                                        ),
                                      ),
                                      Text(
                                        "${mealProvider.calculateTotalCals(mealData)} Cals",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.green.shade400,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  padding: const EdgeInsets.all(4),
                                  child: const Icon(
                                    Icons.close,
                                    size: 20,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ))
                ],
              ),
            ),
            InkWell(
              onTap: onTap,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
