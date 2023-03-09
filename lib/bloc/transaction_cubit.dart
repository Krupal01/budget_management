import 'package:bloc/bloc.dart';
import 'package:budget_management/data/local_service.dart';
import 'package:budget_management/model/json_formatted.dart';
import 'package:meta/meta.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final LocalService localService;
  TransactionCubit({required this.localService}) : super(TransactionInitial());

  Future<void> addTransaction(int userId , Transaction transaction) async {
    emit(TransactionLoading());
    try{
      localService.addTransaction(userId, transaction);
      emit(TransactionAddSuccess());
    }catch(e){
      emit(TransactionError(e.toString()));
    }
  }

  Future<void> deleteTransaction(int userId , int transactionId) async {
    emit(TransactionLoading());
    try{
      localService.deleteTransaction(userId, transactionId);
      emit(TransactionDeleteSuccess());
    }catch(e){
      emit(TransactionError(e.toString()));
    }
  }

  Future<void> updateTransaction(int userId , Transaction transaction) async {
    emit(TransactionLoading());
    try{
      localService.updateTransaction(userId, transaction);
      emit(TransactionUpdateSuccess());
    }catch(e){
      emit(TransactionError(e.toString()));
    }
  }

  Future<void> getTransactionById(int userId , int transactionId) async {
    emit(TransactionLoading());
    try{
      localService.getTransactionById(userId, transactionId).then((value) => emit(TransactionGetSuccess(value)));
    }catch(e){
      emit(TransactionError(e.toString()));
    }
  }
}
