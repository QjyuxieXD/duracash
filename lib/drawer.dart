import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home_roma.dart';
import 'login_screen.dart';
import 'informasi_toko.dart';

class DrawerWidget extends StatelessWidget {
  final User user;

  DrawerWidget({this.user, String displayName});
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  currentAccountPicture: ClipOval(
                    child: Image(
                      image: NetworkImage(
                          'https://i.pinimg.com/236x/0e/16/21/0e162133b4ece9ea4ce147b2f7140748.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  accountName: Text('Selamat Datang, ${_auth.currentUser?.displayName ?? "Pengguna"}'),
                  // accountEmail: Text('@${user?.displayName ?? 'Guest'}'),
                  accountEmail: Text(_auth.currentUser?.email ?? "",),
                ),
                // ... rest of the drawer items
                ListTile(
          leading: Icon(Icons.settings),
          title: Text('Informasi toko'),
          onTap: () {
            // Navigate to InformasiTokoScreen when the ListTile is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InformasiToko()),
            );
          },
        ),
                Divider(height: 15, thickness: 1),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
                  child: Text("Lainnya",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      )),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Informasi toko'),
                ),

                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Log Out'),
                  onTap: () async {
                    // Log out and navigate to the login screen
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
