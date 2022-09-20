
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/constants/sized_box.dart';

import '../pages/food categorty module/DetailedCategoriesPage.dart';

// ignore: must_be_immutable
class CategoriesWidgetFoodspage extends StatelessWidget {

String burgerType;
int index;
Stream<QuerySnapshot<Map<String, dynamic>>>? streamName;
  CategoriesWidgetFoodspage({Key? key, required this.burgerType,required this.index, required this.streamName})
      : super(key: key);

      

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()async{

                 log("tapped>>>>>>>>>>>>>>>>>>>>>>>$index");
            
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailedCategoriesPage(categoryindex: index, ),
                                      ));
       
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Stack(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 208, 192, 192)
                          .withOpacity(0.7),
                      borderRadius: circle30),
                  height: 130,
                  width: 360,
                ),
              ),
              Positioned(
                bottom: 15,
                left: 25,
                child: Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(borderRadius: circle20),
                    child: ClipRRect(
                      borderRadius: circle20,
                      child: Image.asset(
                        burgerNewArrival1,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 135,
                child: Center(
                  child: SizedBox(
                    height: 100,
                    width: 200,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              iconDiscount,
                              color: kred,
                            ),
                            sizeW10,
                            const Text(
                              "Discount Up to 10%",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: kred),
                            ),
                          ],
                        ),
                        sizeH20,
                        Text(
                          burgerType,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 111, 105, 104)),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
