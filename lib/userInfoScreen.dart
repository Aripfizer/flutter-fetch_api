import 'package:flutter/material.dart';
import 'dart:io';

import 'package:user_manager_api/user.dart';

class UserInfoScreen extends StatelessWidget {
  final User user;
  const UserInfoScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(user.firstname + " " + user.lastname),
      ),
      body:  ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    width: 200,
                    height: 200,
                    child: Image.network(
                      user.picture,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(user.lastname.toUpperCase(), style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    )),
                    Text(user.firstname, style: const TextStyle(
                        fontSize: 25,
                    )),
                ],
              )
            ],
          ),
          Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Text("<< " + user.citation + " >>",
                  softWrap: true,
                    style: const TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                )
              ],
            ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                    children: [
                      const Expanded(
                          child: Text("Sexe :", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ))
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Text(user.gender, style: const TextStyle(
                          fontSize: 20
                        )),
                      )
                    ],
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                    children: [
                      const Expanded(
                          child: Text("Email :", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ))
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Text(user.mail, style: const TextStyle(
                          fontSize: 20
                        )),
                      )
                    ],
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                    children: [
                      const Expanded(
                          child: Text("Adresse :", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ))
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Text(user.adress, style: const TextStyle(
                          fontSize: 20
                        )),
                      )
                    ],
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                    children: [
                      const Expanded(
                          child: Text("Date de Naissance :", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ))
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Text(user.birthday, style: const TextStyle(
                          fontSize: 20
                        )),
                      )
                    ],
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                    children: [
                      const Expanded(
                          child: Text("Téléphone :", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ))
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Text(user.phone, style: const TextStyle(
                          fontSize: 20
                        )),
                      )
                    ],
                  ),
              ),
            ],
          )
        ],
      )
    );
  }

}

