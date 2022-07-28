import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/sized_box.dart';

// ignore: must_be_immutable
class CommonBurgerShowWidget extends StatelessWidget {
  List imagelist = [];
   CommonBurgerShowWidget({

    Key? key,
    required this.imagelist
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 200,
          width: double.infinity,
          child: ListView.separated(
            itemCount: imagelist.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            separatorBuilder: (context, index) => sizeW10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      height: 190,
                      width: 190,
                      decoration: BoxDecoration(
                        borderRadius: circle10,
                     
                      ),
                      child:ClipRRect(
                              borderRadius: circle30,
                        child: Image.asset(imagelist[index],fit: BoxFit.cover,),
                      ),
                    ),
                       
                      Positioned(
                        bottom: 0,

                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))),

                          
                          
                          height: 65,
                          width: 190,
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Cheese Burger",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                 Padding(
                                   padding: EdgeInsets.all(5.0),
                                   child: Text(" ₹ 400",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: kred),),
                                 ),
                              ],
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              );
            },
          )),
    );
  }
}