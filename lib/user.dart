import 'package:flutter/material.dart';
import 'package:lab_10_provider/user_provider.dart';
import 'package:provider/provider.dart';

class BookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Users "),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.pushNamed(context, '/adduser');
                })
          ],
        ),
        body: Consumer<UserProvider>(
          builder: (BuildContext context, UserProvider provider, Widget child) {
            return ListView.builder(
              itemCount: provider.users.length,
              itemBuilder: (BuildContext context, int index) {
                var useri = provider.users[index];
                var name = useri.age.toString() + ' ' + useri.salary.toString();
                return ListTile(
                  title: Text(useri.id + ' ' + useri.name),
                  subtitle: Text(name),
                  trailing: Text(useri.mobile),
                  // provider.users[index];
                );
              },
            );
          },
        ));
  }
}
