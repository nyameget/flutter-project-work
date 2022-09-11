// ignore_for_file: empty_constructor_bodies

class UserModel {
  late String username;
  late String name;
  late String email;
  late String year;
  late String password;

  UserModel(
    this.username,
    this.name,
    this.email,
    this.year,
    this.password,
  );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'username': username,
      'name': name,
      'email': email,
      'year': year,
      'password': password,
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    username = map['username'];
    name = map['name'];
    email = map['email'];
    year = map['year'];
    password = map['password'];
  }
}

class MessageModel {
  late String message;
  late int messageid;

  MessageModel(this.messageid, this.message);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'messageid': messageid,
      'message': message,
    };
    return map;
  }

  MessageModel.fromMap(Map<String, dynamic> map) {
    messageid = map['messageid'];
    message = map['message'];
  }
}
