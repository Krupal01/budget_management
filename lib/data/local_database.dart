import 'package:budget_management/model/json_formatted.dart';

class LocalDatabase {
  static List<User> userList = [
    User(
      userid: 1,
      mobile: 1234567890,
      name: 'John Doe',
      payprice: 100.0,
      claimprice: 50.0,
      participants: [
        Participant(
          participantid: 0,
          name: 'John Doe',
          mobile: 1234567890,
          payprice: 100.0,
          claimprice: 50.0,
        ),
        Participant(
          participantid: 1,
          name: 'Alice',
          mobile: 9876543210,
          payprice: 60.0,
          claimprice: 30.0,
        ),
        Participant(
          participantid: 2,
          name: 'Bob',
          mobile: 8765432109,
          payprice: 40.0,
          claimprice: 20.0,
        ),
      ],
      transactions: [
        Transaction(
          transactionid: 1,
          payee: Payee(
            name: 'John Doe',
            mobile: 1234567890,
          ),
          reason: 'Lunch',
          price: 100.0,
          date: "2019-07-19 8:40:23.000",
          participants: [
            Participant(
              participantid: 0,
              name: 'John Doe',
              mobile: 1234567890,
              payprice: 100.0,
              claimprice: 50.0,
            ),
            Participant(
              participantid: 1,
              name: 'Alice',
              mobile: 9876543210,
              payprice: 60.0,
              claimprice: 30.0,
            ),
            Participant(
              participantid: 2,
              name: 'Bob',
              mobile: 8765432109,
              payprice: 40.0,
              claimprice: 20.0,
            ),
          ],
        ),
        Transaction(
          transactionid: 2,
          payee: Payee(
            name: 'Alice',
            mobile: 9876543210,
          ),
          reason: 'Dinner',
          price: 80.0,
          date: "2019-07-19 8:40:23.000",
          participants: [
            Participant(
              participantid: 0,
              name: 'John Doe',
              mobile: 1234567890,
              payprice: 100.0,
              claimprice: 50.0,
            ),
            Participant(
              participantid: 1,
              name: 'Alice',
              mobile: 9876543210,
              payprice: 60.0,
              claimprice: 30.0,
            ),
            Participant(
              participantid: 2,
              name: 'Bob',
              mobile: 8765432109,
              payprice: 40.0,
              claimprice: 20.0,
            ),
          ],
        ),
      ],
    ),
    User(
      userid: 2,
      mobile: 2345678901,
      name: 'Jane Smith',
      payprice: null,
      claimprice: null,
      participants: null,
      transactions: null,
    ),
  ];

  static void addUser(User user) {
    userList.add(user);
  }

  static User? getUserById(int userId) {
    return userList.firstWhere((user) => user.userid == userId);
  }

  static void updateUser(User user) {
    int index = userList.indexWhere((u) => u.userid == user.userid);
    if (index != -1) {
      userList[index] = user;
    }
  }

  static void deleteUser(int userId) {
    userList.removeWhere((user) => user.userid == userId);
  }

  static void addParticipant(int userId, Participant participant) {
    User? user = getUserById(userId);
    if (user != null) {
      user.participants?.add(participant);
    }
  }

  static List<Participant?>? getParticipantsWithUser(int userId) {
    User? user = getUserById(userId);
    if (user != null) {
      return user.participants;
    }
  }

  static List<Participant?>? getParticipants(int userId){
    User? user = getUserById(userId);
    if (user != null) {
      return user.participants?.where((element) => (element?.name != user.name && element?.mobile != user.mobile)).toList();
    }
  }

  static Participant? getParticipantById(int userId, int participantId) {
    User? user = getUserById(userId);
    if (user != null) {
      return user.participants?.firstWhere(
          (participant) => participant?.participantid == participantId,
          orElse: () => null);
    }
    return null;
  }

  static void updateParticipant(int userId, Participant participant) {
    User? user = getUserById(userId);
    if (user != null) {
      int index = user.participants?.indexWhere(
              (p) => p?.participantid == participant.participantid) ??
          -1;
      if (index != -1) {
        user.participants![index] = participant;
      }
    }
  }

  static void deleteParticipant(int userId, int participantId) {
    User? user = getUserById(userId);
    if (user != null) {
      user.participants?.removeWhere(
          (participant) => participant?.participantid == participantId);
    }
  }

  static void addTransaction(int userId, Transaction transaction) {
    User? user = getUserById(userId);
    if (user != null) {
      user.transactions?.add(transaction);
    }
  }

  static Transaction? getTransactionById(int userId, int transactionId) {
    User? user = getUserById(userId);
    if (user != null) {
      return user.transactions?.firstWhere(
          (transaction) => transaction?.transactionid == transactionId,
          orElse: () => null);
    }
    return null;
  }

  static List<Transaction?>? getTransactions(int userId) {
    User? user = getUserById(userId);
    if (user != null) {
      return user.transactions;
    }
    return null;
  }

  static List<Transaction?>? getTransactionByParticipant(
      int userId, Participant participant) {
    User? user = getUserById(userId);
    if (user != null) {
      return user.transactions
          ?.where((element) =>
              element?.participants?.contains(participant) ?? false)
          .toList();
    }
    return null;
  }

  static void updateTransaction(int userId, Transaction transaction) {
    User? user = getUserById(userId);
    if (user != null) {
      int index = user.transactions?.indexWhere(
              (t) => t?.transactionid == transaction.transactionid) ??
          -1;
      if (index != -1) {
        user.transactions![index] = transaction;
      }
    }
  }

  static void deleteTransaction(int userId, int transactionId) {
    User? user = getUserById(userId);
    if (user != null) {
      user.transactions?.removeWhere(
          (transaction) => transaction?.transactionid == transactionId);
    }
  }

}
