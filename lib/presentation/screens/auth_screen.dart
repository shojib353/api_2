import 'package:flutter/material.dart';
import '../../core/services/api_service.dart';
import '../../data/models/post_response.dart';


class AuthView extends StatefulWidget {
  AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {

  final ApiService apiService = ApiService();

  PostResponse? res;

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  final confpasswordController = TextEditingController();

  var rememberMe = false;

  String validatePhone(String value) {
    final phone = RegExp(r'[0-9]{9}$');
    if (value.isEmpty) {
      return 'Enter Your phone Number';
    } else if (!phone.hasMatch(value)) {
      return 'Invalid';
    }
    return 'Correct';
  }


  String validateEmail(String value) {
    final email = RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    if (value.isEmpty) {
      return 'Enter Your Email';
    } else if (!email.hasMatch(value)) {
      return 'Invalid';
    }
    return 'Correct';
  }

  String validatePassword(String value){
    if (value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return 'Correct';
  }

  String validateConfpassword(String value){
    if (value.isEmpty) {
      return 'Please enter your password';
    }
    else if(value != passwordController.text){
      return 'Not Match';
    }
    return 'Match';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade800,
      appBar: AppBar(

        title: const Text('Register here',
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                          ),
                          hintText: 'Full Name',
                          hintStyle: const TextStyle(
                              color: Colors.black

                          ),
                        ),
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Enter your name';
                          }
                        },
                      ),

                      const SizedBox(height: 20,),

                      TextFormField(
                        validator: (value) => validateEmail(value!),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                          ),
                          hintText: 'Email',
                          hintStyle: const TextStyle(
                              color: Colors.black

                          ),
                        ),

                      ),
                      const SizedBox(height: 20,),

                      TextFormField(
                        validator: (value) => validatePhone(value!),

                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        controller: phoneController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                          ),
                          hintText: 'Phone Number',
                          hintStyle: const TextStyle(
                              color: Colors.black

                          ),
                        ),
                        keyboardType: TextInputType.number,

                      ),

                      const SizedBox(height: 20,),
                      TextFormField(
                        validator: (value) => validatePassword(value!),

                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        obscureText: false,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.white,

                          prefixIcon: const Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                              Icons.key,
                              color: Colors.black,
                            ),
                          ),
                          suffixIcon: const Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                              Icons.remove_red_eye,
                              color: Colors.grey,
                            ),

                          ),
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                              color: Colors.black

                          ),

                        ),
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(

                        validator: (value) => validateConfpassword(value!),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        obscureText: false,
                        controller: confpasswordController,

                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: const TextStyle(
                              color: Colors.black
                          ),

                          prefixIcon: const Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                              Icons.key,
                              color: Colors.black,
                            ),
                          ),
                          suffixIcon: const Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                              Icons.remove_red_eye,
                              color: Colors.grey,
                            ),

                          ),
                          hintText: 'Confirm Password',
                          hintStyle: const TextStyle(
                              color: Colors.black

                          ),
                        ),
                      ),
                    ],
                  )),

              const SizedBox(height: 20,),
              // CheckboxListTile(
              //     value: rememberMe,
              //     onChanged: (value) {
              //       rememberMe = value!;
              //       print("Value----->$rememberMe");
              //     },
              //   title: const Text('Remember Me'),
              // ),
              ElevatedButton(

                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      validatePhone(phoneController.text);
                      validateEmail(emailController.text);
                    }
                    var futurePostResponse = apiService.postData("fullName", "email", "number", "password");


                    futurePostResponse.then((value) {
                      res = value;
                      print(res?.toJson());
                    },);

                  },
                  child: const Text("Done",
                    style: TextStyle(
                        color: Colors.white
                    ),)
              ),
            ],
          ),
        ),
      ),
    );
  }
}