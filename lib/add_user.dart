import 'package:flutter/material.dart';
import 'package:lab_10_provider/user_provider.dart';
import 'package:provider/provider.dart';

class AddBookPage extends StatefulWidget {
  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final _form = GlobalKey<FormState>();
  final _id = TextEditingController();
  final _name = TextEditingController();
  final _age = TextEditingController();
  final _salary = TextEditingController();
  final _mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: Form(
        key: _form,
        child: ListView(
          children: <Widget>[
            buildIdField(),
            buildNameField(),
            buildAgeField(),
            buildSalaryField(),
            buildMobileField(),
            buildSaveButton()
          ],
        ),
      ),
    );
  }

  RaisedButton buildSaveButton() {
    return RaisedButton(
        child: Text('Save'),
        onPressed: () async {
          if (this._form.currentState.validate()) {
            print('save button press');
            User data = User(
                id: _id.text,
                name: _name.text,
                age: int.parse(_age.text),
                mobile: _mobile.text,
                salary: int.parse(_salary.text));
            var nuser = Provider.of<UserProvider>(context, listen: false);
            nuser.addNewUser(data);
            Navigator.pop(context);
          } else {
            Scaffold.of(this._form.currentContext).showSnackBar(
              SnackBar(
                content: Text('Please validate value'),
              ),
            );
          }
        });
  }

  TextFormField buildIdField() {
    return TextFormField(
      controller: _id,
      decoration: InputDecoration(
        labelText: 'id',
        icon: Icon(Icons.book),
      ),
      validator: (value) => value.isEmpty ? 'Please fill in id' : null,
    );
  }

  TextFormField buildNameField() {
    return TextFormField(
      controller: _name,
      decoration: InputDecoration(
        labelText: 'name',
        icon: Icon(Icons.people),
      ),
      validator: (value) => value.isEmpty ? 'Please fill in name' : null,
    );
  }

  TextFormField buildMobileField() {
    return TextFormField(
      controller: _mobile,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'mobile',
        icon: Icon(Icons.list),
      ),
      validator: (value) =>
          value.isEmpty ? 'Please fill in mobile number' : null,
    );
  }

  TextFormField buildAgeField() {
    return TextFormField(
        controller: _age,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'age',
          icon: Icon(Icons.list),
        ),
        validator: (value) {
          if (value.isEmpty)
            return 'Please fill in age';
          else {
            int age = int.parse(value);
            if (age < 0)
              return 'Please fill in age';
            else
              return null;
          }
        });
  }

  TextFormField buildSalaryField() {
    return TextFormField(
        controller: _salary,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'salary',
          icon: Icon(Icons.list),
        ),
        validator: (value) {
          if (value.isEmpty)
            return 'Please fill in salary';
          else {
            int salary = int.parse(value);
            if (salary < 0)
              return 'Please fill in salary';
            else
              return null;
          }
        });
  }
}
