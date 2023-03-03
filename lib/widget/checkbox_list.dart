import 'package:flutter/material.dart';

class CheckboxList extends StatefulWidget {
  final List<String> options;
  final void Function(List<String>) onSelected;

  CheckboxList({required this.options, required this.onSelected});

  @override
  _CheckboxListState createState() => _CheckboxListState();
}

class _CheckboxListState extends State<CheckboxList> {
  late List<bool> _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(widget.options.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: Text('All'),
          value: _isChecked.every((value) => value),
          onChanged: (value) {
            setState(
                  () {
                _isChecked.fillRange(0, _isChecked.length, value ?? false);
                widget.onSelected(
                    _isChecked
                        .asMap().entries.where((element) => element.value).map((e) => widget.options[e.key])
                        .toList()
                );
              },
            );
          },
        ),
        ...List<Widget>.generate(
          widget.options.length,
              (index) {
            return CheckboxListTile(
              title: Text(widget.options[index]),
              value: _isChecked[index],
              onChanged: (value) {
                setState(
                      () {
                    _isChecked[index] = value ?? false;
                    widget.onSelected(
                      _isChecked
                      .asMap().entries.where((element) => element.value).map((e) => widget.options[e.key])
                          .toList()
                    );
                  },
                );
              },
            );
          }

          ,

        )

        ,

      ]

      ,

    );
  }
}
