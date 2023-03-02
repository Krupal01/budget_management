import 'package:flutter/material.dart';

import '../utils/styles.dart';

class TransactionCard extends StatelessWidget {

  final double price;
  final String reason;
  final int dateInMillis;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const TransactionCard({Key? key , required this.price, required this.reason, required this.dateInMillis , this.onTap , this.onLongPress}) : super(key: key);

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
                        price.toStringAsFixed(2),
                        style: TextStyle(
                          color: price < 0 ? Colors.red : Colors.green,
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
                      reason,
                      style: blackTextStyles['18_normal'],
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      DateTime.fromMillisecondsSinceEpoch(dateInMillis).toString(),
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
