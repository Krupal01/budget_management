import 'package:budget_management/utils/styles.dart';
import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  final double number;
  final String name;
  final double? redNumber;
  final double? greenNumber;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  PersonCard(
      {required this.number, required this.name, this.redNumber, this.greenNumber , this.onTap , this.onLongPress});

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
                        number.toStringAsFixed(2),
                        style: TextStyle(
                          color: number < 0 ? Colors.red : Colors.green,
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
                      name,
                      style: blackTextStyles['18_normal'],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (greenNumber != null)
                          Text(
                            greenNumber!.toStringAsFixed(2),
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16.0,
                            ),
                          ),
                        if (greenNumber != null && redNumber != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('/' , style: blackTextStyles['18_normal'],),
                          ),
                        if (redNumber != null)
                          Text(
                            redNumber!.toStringAsFixed(2),
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.0,
                            ),
                          ),
                      ],
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
