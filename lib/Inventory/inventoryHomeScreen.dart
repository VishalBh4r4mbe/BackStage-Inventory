import 'package:backstage/AppWideDisplay/mainHomePage.dart';
import 'package:backstage/Models/userModels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import './Widgets/inventoryAppDrawer.dart';
import './Widgets/barcodeScan.dart';
import '../AppWideDisplay/mainDrawer.dart';

class InventoryHomeScreen extends StatelessWidget {
  static const routeName = "Inventory Home Screen";

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    if(user == null) {
      return Wrapper();
    }
    Future<bool> _onBackPressed() {
      return showDialog(
        context: context,
        builder:(context) => AlertDialog(
          title: Text('Exit this Screen'),
          actions: <Widget>[
            Container(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(MainHomeScreen.routeName);
                    },
                    child: Text('Yes')
                  ),
                  Divider(),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('No')
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }
    
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Inventory Home Screen"),
          actions: <Widget>[
            BarcodeScanner()
          ],
        ),
        endDrawer: RightAppDrawer(),
        drawer: MainDrawer(),
        
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Center(
          child: Text('This part of the App handes all Inventory functionality'),
        ),
      ),
    );
  }
}


