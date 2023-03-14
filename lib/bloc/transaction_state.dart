part of 'transaction_cubit.dart';

@immutable
abstract class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionError extends TransactionState {
  final String errorMessage;

  TransactionError(this.errorMessage);
}

class TransactionAddSuccess extends TransactionState {}

class TransactionUpdateSuccess extends TransactionState {}

class TransactionDeleteSuccess extends TransactionState {}

class TransactionGetSuccess extends TransactionState {
  final Transaction transaction;

  TransactionGetSuccess(this.transaction);
}

class TransactionListGetSuccess extends TransactionState {
  final List<Transaction?>? transactions;

  TransactionListGetSuccess(this.transactions);
}
