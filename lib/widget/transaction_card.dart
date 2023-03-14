import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/styles.dart';

class TransactionCard extends StatelessWidget {

  final double? price;
  final String? reason;
  final String? date;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const TransactionCard({Key? key ,  this.price,  this.reason,  this.date , this.onTap , this.onLongPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black12,
                ),
                child: Center(
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        (price??0).toStringAsFixed(2),
                        style: TextStyle(
                          color: (price??0) < 0 ? Colors.red : Colors.green,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      reason??"",
                      style: blackTextStyles['18_normal'],
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      date!=null ? DateFormat('yyyy-mm-dd hh:mm:ss.000').parse(date!).toString().split(' ')[0] : '', // todo , splitting to show date only
                      style: TextStyle(fontSize: 12 , color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
