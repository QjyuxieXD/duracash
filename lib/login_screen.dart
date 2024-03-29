import 'package:firebase_auth/firebase_auth.dart';
import 'rounded_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/material.dart';

// Code for designing the UI of our text field where the user writes his email id or password
const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Email Input Field
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                  // Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              // Password Input Field
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                  // Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password.',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              // Login Button
              RoundedButton(
                colour: Colors.lightBlueAccent,
                title: 'Log In',
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    // Sign in with email and password
                    final user = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    if (user != null) {
                      // Navigate to the home screen after successful login
                      Navigator.pushNamed(context, 'home_roma');
                    }
                  } catch (e) {
                    // Print any errors for debugging
                    print(e);
                  }
                  setState(() {
                    showSpinner = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'home_roma.dart';
// import 'drawer.dart';

// const kTextFieldDecoration = InputDecoration(
//   hintText: 'Enter a value',
//   hintStyle: TextStyle(color: Colors.grey),
//   contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//   border: OutlineInputBorder(
//     borderRadius: BorderRadius.all(Radius.circular(32.0)),
//   ),
//   enabledBorder: OutlineInputBorder(
//     borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
//     borderRadius: BorderRadius.all(Radius.circular(32.0)),
//   ),
//   focusedBorder: OutlineInputBorder(
//     borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
//     borderRadius: BorderRadius.all(Radius.circular(32.0)),
//   ),
// );

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   String email;
//   String password;
//   bool showSpinner = false;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ModalProgressHUD(
//         inAsyncCall: showSpinner,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               // Email Input Field
//               TextField(
//                 keyboardType: TextInputType.emailAddress,
//                 textAlign: TextAlign.center,
//                 onChanged: (value) {
//                   setState(() {
//                     email = value;
//                   });
//                 },
//                 decoration: kTextFieldDecoration.copyWith(
//                   hintText: 'Enter your email',
//                 ),
//               ),
//               SizedBox(
//                 height: 8.0,
//               ),
//               // Password Input Field
//               TextField(
//                 obscureText: true,
//                 textAlign: TextAlign.center,
//                 onChanged: (value) {
//                   setState(() {
//                     password = value;
//                   });
//                 },
//                 decoration: kTextFieldDecoration.copyWith(
//                   hintText: 'Enter your password.',
//                 ),
//               ),
//               SizedBox(
//                 height: 24.0,
//               ),
//               // Login Button
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.lightBlueAccent,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(32.0),
//                   ),
//                 ),
//                 onPressed: () async {
//                   setState(() {
//                     showSpinner = true;
//                   });
//                   try {
//                     // Sign in with email and password
//                     final userCredential = await _auth.signInWithEmailAndPassword(
//                       email: email,
//                       password: password,
//                     );

//                     if (userCredential.user != null) {
//                       // Navigate to the home screen after successful login
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => BelajarNavBar(drawer: DrawerWidget(user: userCredential.user)),
//                         ),
//                       );
//                     }
//                   } catch (e) {
//                     // Print any errors for debugging
//                     print(e);
//                   }
//                   setState(() {
//                     showSpinner = false;
//                   });
//                 },
//                 child: Text('Log In'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
