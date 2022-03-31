import 'dart:convert';

List<User> postFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

class User {
    final int? id;
    final String firstname;
    final String lastname;
    final String birthday;
    final String adress;
    final String phone;
    final String mail;
    final String gender;
    final String picture;
    final String citation;

    User({required this.id, required this.firstname, required this.lastname, required this.birthday, required this.adress,
      required this.phone, required this.mail, required this.gender, required this.picture, required this.citation});


    @override
  String toString() {
    return 'User{id: $id, firstname: $firstname, lastname: $lastname, birthday: $birthday, adress: $adress, phone: $phone, mail: $mail, gender: $gender, picture: $picture, citation: $citation}';
  }

    factory User.fromJson(Map<String, dynamic> json) {

      return  User(
        id:0,
        firstname: json['name']['first'],
        lastname: json['name']['last'],
        birthday: json['dob']['date'],
        adress: json['location']['city'],
        phone: json['phone'],
        mail: json['email'],
        gender: json['gender'],
        picture: json['picture']['medium'],
        citation: json['location']['timezone']['description'],
      );
    }




/*
  Map<String, dynamic> toMap() {
      return {
        'id': id,
        'isAsset' : isAsset,
        'firstname': firstname,
        'lastname': lastname,
        'birthday': birthday,
        'adress': adress,
        'phone': phone,
        'mail': mail,
        'gender': gender,
        'picture': picture,
        'citation': citation,
      };
    }

    factory User.fromMap(Map<String, dynamic> map) => User(
      map['id'],
      map['isAsset'],
      map['firstname'],
      map['lastname'],
      map['birthday'],
      map['adress'],
      map['phone'],
      map['mail'],
      map['gender'],
      map['picture'],
      map['citation'],
    );

 */


}