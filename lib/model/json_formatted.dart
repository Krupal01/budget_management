
class Participant {
  int? participantid;
  String? name;
  int? mobile;
  double? payprice;
  double? claimprice;

  Participant({this.participantid, this.name, this.mobile, this.payprice, this.claimprice});

  Participant.fromJson(Map<String, dynamic> json) {
    participantid = json['participant_id'];
    name = json['name'];
    mobile = json['mobile'];
    payprice = json['pay_price'];
    claimprice = json['claim_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['participant_id'] = participantid;
    data['name'] = name;
    data['mobile'] = mobile;
    data['pay_price'] = payprice;
    data['claim_price'] = claimprice;
    return data;
  }
}

class Payee {
  String? name;
  int? mobile;

  Payee({this.name, this.mobile});

  Payee.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['mobile'] = mobile;
    return data;
  }
}

class Root {
  User? user;

  Root({this.user});

  Root.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User?.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user'] = user!.toJson();
    return data;
  }
}

class Transaction {
  int? transactionid;
  Payee? payee;
  String? reason;
  double? price;
  String? date;
  List<Participant?>? participants;

  Transaction({this.transactionid, this.payee, this.reason, this.price, this.date, this.participants});

  Transaction.fromJson(Map<String, dynamic> json) {
    transactionid = json['transaction_id'];
    payee = json['payee'] != null ? Payee?.fromJson(json['payee']) : null;
    reason = json['reason'];
    price = json['price'];
    date = json['date'];
    if (json['participants'] != null) {
      participants = <Participant>[];
      json['participants'].forEach((v) {
        participants!.add(Participant.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['transaction_id'] = transactionid;
    data['payee'] = payee!.toJson();
    data['reason'] = reason;
    data['price'] = price;
    data['date'] = date;
    data['participants'] =participants != null ? participants!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}

class User {
  int? userid;
  int? mobile;
  String? name;
  double? payprice;
  double? claimprice;
  List<Participant?>? participants;
  List<Transaction?>? transactions;

  User({this.userid, this.mobile, this.name, this.payprice, this.claimprice, this.participants, this.transactions});

  User.fromJson(Map<String, dynamic> json) {
    userid = json['user_id'];
    mobile = json['mobile'];
    name = json['name'];
    payprice = json['pay_price'];
    claimprice = json['claim_price'];
    if (json['participants'] != null) {
      participants = <Participant>[];
      json['participants'].forEach((v) {
        participants!.add(Participant.fromJson(v));
      });
    }
    if (json['transactions'] != null) {
      transactions = <Transaction>[];
      json['transactions'].forEach((v) {
        transactions!.add(Transaction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = userid;
    data['mobile'] = mobile;
    data['name'] = name;
    data['pay_price'] = payprice;
    data['claim_price'] = claimprice;
    data['participants'] =participants != null ? participants!.map((v) => v?.toJson()).toList() : null;
    data['transactions'] =transactions != null ? transactions!.map((v) => v?.toJson()).toList() : null;
    return data;
  }

  Participant getUserAsParticipant(){
    return Participant(
      participantid: 0,
      name: name,
      mobile: mobile,
      payprice: payprice,
      claimprice: claimprice,
    );
  }
}







