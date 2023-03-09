import 'package:budget_management/data/local_database.dart';
import 'dart:async';

import 'package:flutter/foundation.dart';

import '../model/json_formatted.dart';

class LocalService {
  Future<List<User>> getUsers() async {
    await Future.delayed(Duration(seconds: 2));
    return LocalDatabase.userList;
  }

  Future<void> addUser(User user) async {
    await Future.delayed(Duration(seconds: 2));
    LocalDatabase.addUser(user);
  }

  Future<User> getUserById(int userId) async {
    await Future.delayed(Duration(seconds: 2));
    return LocalDatabase.getUserById(userId) ?? (throw NullThrownError());
  }

  Future<void> updateUser(User user) async {
    await Future.delayed(Duration(seconds: 2));
    LocalDatabase.updateUser(user);
  }

  Future<void> deleteUser(int userId) async {
    await Future.delayed(Duration(seconds: 2));
    LocalDatabase.deleteUser(userId);
  }

  Future<void> addParticipant(int userId, Participant participant) async {
    await Future.delayed(Duration(seconds: 2));
    LocalDatabase.addParticipant(userId, participant);
  }

  Future<Participant> getParticipantById(int userId, int participantId) async {
    await Future.delayed(Duration(seconds: 2));
    return LocalDatabase.getParticipantById(userId, participantId) ??
        (throw NullThrownError());
  }

  Future<List<Participant?>> getParticipants(int userId) async {
    await Future.delayed(Duration(seconds: 2));
    return LocalDatabase.getParticipants(userId) ??
        (throw NullThrownError());
  }

  Future<List<Participant?>> getParticipantsWithUser(int userId) async {
    await Future.delayed(Duration(seconds: 2));
    return LocalDatabase.getParticipantsWithUser(userId) ??
        (throw NullThrownError());
  }

  Future<void> updateParticipant(int userId, Participant participant) async {
    await Future.delayed(Duration(seconds: 2));
    LocalDatabase.updateParticipant(userId, participant);
  }

  Future<void> deleteParticipant(int userId, int participantId) async {
    await Future.delayed(Duration(seconds: 2));
    LocalDatabase.deleteParticipant(userId, participantId);
  }

  Future<void> addTransaction(int userId, Transaction transaction) async {
    await Future.delayed(Duration(seconds: 2));
    LocalDatabase.addTransaction(userId, transaction);
  }

  Future<List<Transaction?>> getTransaction(int userId) async {
    await Future.delayed(Duration(seconds: 2));
    return LocalDatabase.getTransactions(userId) ??
        (throw NullThrownError());
  }
  Future<Transaction> getTransactionById(int userId, int transactionId) async {
    await Future.delayed(Duration(seconds: 2));
    return LocalDatabase.getTransactionById(userId, transactionId) ??
        (throw NullThrownError());
  }

  Future<void> updateTransaction(int userId, Transaction transaction) async {
    await Future.delayed(Duration(seconds: 2));
    LocalDatabase.updateTransaction(userId, transaction);
  }

  Future<void> deleteTransaction(int userId, int transactionId) async {
    if (kDebugMode) {
      throw Exception('Cannot delete transaction in debug mode');
    } else {
      await Future.delayed(Duration(seconds: 2));
      LocalDatabase.deleteTransaction(userId, transactionId);
    }
  }

  Future<List<Transaction?>> getTransactionByParticipate(int userId , Participant participant) async {
    await Future.delayed(Duration(seconds: 2));
    return LocalDatabase.getTransactionByParticipant(userId, participant) ??
        (throw NullThrownError());
  }

}
