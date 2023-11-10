import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/database.dart';
import 'package:flutter_application_3/model/user.dart';

class ManageUserNameState extends StatefulWidget {
  AppUser? data;
  ManageUserNameState({this.data, super.key});

  @override
  State<ManageUserNameState> createState() => _ManageUserNameStateState();
}

class _ManageUserNameStateState extends State<ManageUserNameState> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String type='Add';

  @override
  void initState() {
    super.initState();
    if(widget.data==null)
    {
      type='Add';
      // add
    }
    else{
      type='Edit';
      // update
      _nameController.text=widget.data!.name!;
      _phoneController.text=widget.data!.phone!;
      _emailController.text=widget.data!.email!;
      _passwordController.text=widget.data!.password!;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$type User'),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  hintText: 'Enter your phone number',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: false,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {

                      if(type=='Add')
                      {
                      await Database.insertUser(_nameController.text, _phoneController.text, _emailController.text, _passwordController.text);

                      }
                      else{
                      await Database.updateUser(_nameController.text, _phoneController.text, _emailController.text,_passwordController.text, widget.data!.id!);
                        
                      }
                      Navigator.pop(context, 'updated');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Processing Data'),
                        ),
                      );
                    }
                  },
                  child:  Text(

                    type),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

