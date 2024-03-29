import 'package:flutter/material.dart';

import '../utils/styles.dart';

class PersonDetailsCard extends StatelessWidget {
  // final int userId;
  final String? title;
  final String? description;
  final double? price;
  final double? payPrice;
  final double? claimPrice;

  const PersonDetailsCard({Key? key, this.title, this.description, this.price, this.payPrice, this.claimPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title??"",
                      style: whiteTextStyles['30_bold'],
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      description??"",
                      style: whiteTextStyles['18_normal'],
                    ),
                  ],
                ),
                Text(
                  (price??0).toStringAsFixed(2),
                  style: whiteTextStyles['40_bold'],
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10,),),
                color: Colors.white,
              ),
              clipBehavior: Clip.hardEdge   ,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      (payPrice??0).toStringAsFixed(2),
                      style: TextStyle(fontSize: 22 , color: Colors.green),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      (claimPrice??0).toStringAsFixed(2),
                      style: TextStyle(fontSize: 22 , color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );;
  }
}
