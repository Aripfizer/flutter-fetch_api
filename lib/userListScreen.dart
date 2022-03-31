import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:user_manager_api/user.dart';
import 'package:http/http.dart' as http;
import 'package:user_manager_api/userInfoScreen.dart';
import 'dart:io';
import 'api.dart';
import 'db.dart';

Future<List<User>> fetchUsers(String url) async {

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body)['results'];

    return parsed.map<User>((json) => User.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load Users');
  }
}


class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late Future<List<User>> futureUsers;

  @override
  void initState(){
    super.initState();
    futureUsers =  fetchUsers("https://randomuser.me/api/?page=3&results=15&nat=fr");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List des utilisteurs "),
        leading: const Icon(Icons.person),
      ),
      body: FutureBuilder<List<User>>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<User>? users = snapshot.data;
            users = users?.reversed.toList();
            return ListView.builder(
              itemCount: users?.length,
              itemBuilder: (context, int index)
              {
                final User user = users![index];
                return buidUserItem(user: user);
              },
            );
          } else
          {
            return const Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    value: null,
                    backgroundColor: Colors.blue,
                    valueColor: AlwaysStoppedAnimation(Colors.green),
                  ),
                ),
            );
          }
        }
      ),
    );
  }
}



class buidUserItem extends StatelessWidget
{
  final User user;

   const buidUserItem({Key? key, required this.user}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) =>  UserInfoScreen(user: user)
          )
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 8,
        child: Row(
          children: <Widget>[
            Image.network(
              user.picture,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(user.firstname + " " + user.lastname.toUpperCase(), style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  Text(user.mail, style: const TextStyle(
                      fontSize: 18
                  ),)
                ],
              ),
            )
          ],
        ),

      ),
    );
  }

}