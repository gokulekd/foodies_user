import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/constants/sized_box.dart';

class BurgerOfferWidget extends StatelessWidget {
  const BurgerOfferWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 200,
          width: double.infinity,
          child: ListView.separated(
            itemCount: burgerOfferList.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            separatorBuilder: (context, index) => sizeW10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: circle30,
                 
                  ),
                  child: ClipRRect(
                          borderRadius: circle30,
                    child: Image.asset(burgerOfferList[index],fit: BoxFit.cover,),
                  ),
                ),
              );
            },
          )),
    );
  }
}