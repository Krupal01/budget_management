import 'package:budget_management/bloc/transaction_cubit.dart';
import 'package:budget_management/bloc/user_cubit.dart';
import 'package:budget_management/model/json_formatted.dart';
import 'package:budget_management/utils/constants.dart';
import 'package:budget_management/utils/styles.dart';
import 'package:budget_management/widget/RoundedPrimaryButton.dart';
import 'package:budget_management/widget/back_icon_button.dart';
import 'package:budget_management/widget/main_app_bar.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/checkbox_list.dart';

class AddTransactionScreen extends StatefulWidget {
  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _reason;
  Participant? _payee;
  double? _price;
  DateTime? _selectedDate;
  List<Participant?> _selectedPerson = [];
  bool? _isAnyChecked = null;
  TextEditingController _dateController = TextEditingController();

  final TextEditingController iconController = TextEditingController();

  void _submitForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid || !(_isAnyChecked ?? false)) {
      _isAnyChecked ??= false;
      setState(() {});
      return;
    }
    BlocProvider.of<TransactionCubit>(context).addTransaction(1, Transaction(payee: _payee , reason: _reason ,price: _price , date: _selectedDate.toString() , participants: _selectedPerson));
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

  String? _validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Date is required';
    }
    return null;
  }

  String? _validatePayee(String? value) {
    if (value == null) {
      return 'Please select payee';
    }
    return null;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        print('selected date$_selectedDate}');
        _dateController.text = '${_selectedDate?.day}/${_selectedDate?.month}/${_selectedDate?.year}';
      });
    }
  }

  String? _validateReason(String? value) {
    if (value == null || value.isEmpty) {
      return 'Reason is required';
    }
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<UserCubit>(context).getUser(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<String>> iconEntries =
        <DropdownMenuItem<String>>[];

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
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    if (state is UserGetSuccess) {
                      return DropdownButtonFormField(
                        items: state.user
                            .getParticipantsWithUser()
                            ?.where((element) =>
                                (element != null && !element.isNullOrEmpty()))
                            .map(
                              (e) => DropdownMenuItem<String>(
                                child: Text(e?.name ?? " "),
                                value: e?.name ?? " ",
                              ),
                            )
                            .toList(),
                        decoration: InputDecoration(labelText: 'Payee'),
                        onChanged: (value) {},
                        onSaved: (newValue) {
                          _payee = state.user
                              .getParticipantsWithUser()
                              ?.firstWhere(
                                  (element) => element?.name == newValue);
                        },
                        validator: _validatePayee,
                        isDense: true,
                        isExpanded: true,
                        menuMaxHeight: 300,
                      );
                    } else {
                      return DropdownButtonFormField(
                        items: iconEntries,
                        decoration: InputDecoration(labelText: 'Payee'),
                        onChanged: (value) {},
                        onSaved: (newValue) {
                          _payee = null;
                        },
                        validator: _validatePayee,
                        isDense: true,
                        isExpanded: true,
                        menuMaxHeight: 300,
                      );
                    }
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Reason',
                  ),
                  validator: _validateReason,
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
                TextFormField(
                  controller: _dateController ,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                    labelText: 'Date',
                  ),
                  validator: _validateDate,
                ),
                const SizedBox(height: 16.0),
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    if (state is UserGetSuccess) {
                      return CheckboxList(
                        options: state.user
                                .getParticipantsWithUser()
                                ?.where((element) => (element != null &&
                                    !element.isNullOrEmpty()))
                                .map((e) => e!.name!)
                                .toList() ??
                            [],
                        onSelected: (p0) {
                          _selectedPerson.clear();
                          _selectedPerson.addAll(state.user
                                  .getParticipantsWithUser()
                                  ?.where(
                                      (element) => p0.contains(element?.name))
                                  .toList() ??
                              []);

                          print(_selectedPerson.length);
                          _isAnyChecked = p0.isNotEmpty;
                          print(_isAnyChecked);
                          setState(() {});
                        },
                      );
                    } else if (state is UserLoading) {
                      return CircularProgressIndicator();
                    } else {
                      return Text(
                        "something wrong",
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      );
                    }
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
                SizedBox(height: 16.0),
                BlocConsumer<TransactionCubit , TransactionState>(builder: (context, state) {
                  if(state is TransactionLoading){
                    return CircularProgressIndicator();
                  }
                  else if(state is TransactionError){
                    return Text("Something Wrong" , style: TextStyle(color: Colors.red , fontSize: 16),);
                  }
                  else{
                    return Container(height: 0,);
                  }
                }, listener: (context, state) {
                  if(state is TransactionAddSuccess){
                    Navigator.of(context).pop();
                  }
                },),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
