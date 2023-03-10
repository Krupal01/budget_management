import 'package:budget_management/utils/constants.dart';
import 'package:budget_management/widget/RoundedPrimaryButton.dart';
import 'package:budget_management/widget/back_icon_button.dart';
import 'package:budget_management/widget/main_app_bar.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';

import '../widget/checkbox_list.dart';

class AddTransactionScreen extends StatefulWidget {
  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _payee, _reason;
  double? _price;
  DateTime? _selectedDate;
  List<String> _selectedPerson = [];
  bool? _isAnyChecked = null;

  final TextEditingController iconController = TextEditingController();

  void _submitForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid || !(_isAnyChecked ?? false)) {
      _isAnyChecked ??= false;
      setState(() {});
      return;
    }
    Navigator.of(context).pushNamed(DASHBOARD_SCREEN);
    // code to submit form
  }

  String? _validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Price is required';
    }
    final double? price = double.tryParse(value!);
    if (price == null) {
      return 'Price must be a valid number';
    }
    if (price <= 0) {
      return 'Price must be greater than zero';
    }
    return null;
  }

  String? _validateDate(DateTime? value) {
    if (value == null) {
      return 'Date is required';
    }
    return null;
  }

  String? _validatePayee(String? value){
    if(value ==null){
      return 'Please select payee';
    }
    return null;
  }

  String? _validateReason(String? value) {
    if (value == null || value.isEmpty) {
      return 'Reason is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<String>> iconEntries =
        <DropdownMenuItem<String>>[];

    for (int i in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) {
      iconEntries.add(DropdownMenuItem<String>(
        child: Text(i.toString()),
        value: i.toString(),
      ));
    }

    return Scaffold(
      appBar: MainAppBar(
        title: 'Add New Transaction',
        leading: BackIconButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DropdownButtonFormField(
                  items: iconEntries,
                  decoration: InputDecoration(
                    labelText: 'Payee'
                  ),
                  onChanged: (value) {},
                  onSaved: (newValue) {
                    _payee = newValue;
                  },
                  validator: _validatePayee,
                  isDense: true,
                  isExpanded: true,
                  menuMaxHeight: 300,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Reason',
                  ),
                  validator: _validatePrice,
                  onSaved: (value) {
                    _reason = value!;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Price',
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: _validatePrice,
                  onSaved: (value) {
                    _price = double.tryParse(value!)!;
                  },
                ),
                SizedBox(height: 16.0),
                InkWell(
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                    );
                    setState(() {
                      _selectedDate = pickedDate;
                    });
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Date',
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedDate == null
                              ? 'Select a date'
                              : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                CheckboxList(
                  options: ["persion1", "persion2", "persion3", "persion4"],
                  onSelected: (p0) {
                    print(p0);
                    _isAnyChecked = p0.isNotEmpty;
                    print(_isAnyChecked);
                    setState(() {});
                  },
                ),
                if (_isAnyChecked == false)
                  Text(
                    "Please select atleast one person",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                SizedBox(height: 16.0),
                RoundedPrimaryButton(
                  buttonText: 'Submit',
                  onPressed: _submitForm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
