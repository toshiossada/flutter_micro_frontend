import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final VoidCallback logOut;
  const DrawerWidget({
    Key? key,
    required this.logOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child:
                  Center(child: Image.asset('assets/images/logo_ioasys.png')),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color(0xFF8325BB),
                      Color(0xFFAF1A7D),
                      Color(0xFFCB2E6C),
                      Color(0xFFDE94BC),
                    ]),
              ),
            ),
            ListTile(
              trailing: Icon(Icons.logout),
              title: Text('Sair'),
              onTap: logOut,
            ),
          ],
        ),
      ),
    );
  }
}
