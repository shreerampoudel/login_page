import 'package:flutter/material.dart';
import 'package:login_app/first_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController=TextEditingController();
        TextEditingController passwordController=TextEditingController();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(255, 217, 0, 255),Color.fromARGB(255, 0, 136, 247), Color.fromARGB(255, 253, 17, 0)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome to Login Page!!!",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Color.fromARGB(255, 60, 255, 0)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                ),
              ),SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                  ),
                  
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context){
                      return const FirstScreen();
                    },
                  ));
                },

                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),color: Color.fromARGB(255, 6, 255, 14)
                    ),
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
