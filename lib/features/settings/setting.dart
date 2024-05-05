import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_broken/icon_broken.dart';

import 'orders.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  List<String> text =[
    'Orders',
    'My profile',
    'Settings',
    'Help center',
    'Privacy Policy',
    'Invite friends',
    'Logout'
  ];
  List<IconData> icons =[
    IconBroken.Bag_2,
    IconBroken.Profile,
    IconBroken.Setting,
    IconBroken.Danger,
    IconBroken.Close_Square,
    IconBroken.AddUser,
    IconBroken.Logout,
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Color(0xFFF7F7F7),
        title: Text(
          'Settings',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25
          ),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: HexColor('F37A20'),
            ),
            title: Text(
              'Mostafa',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black
              )
            ),
            subtitle: Text(
              'developer',
            )
          ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.separated(
              itemCount: text.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey[300],
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if(index == 0){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Orders()));
                    }
                  },
                  child: ListTile(
                    leading: Icon(
                      icons[index],
                      color: HexColor('F37A20'),
                    ),
                    title: Text(
                      text[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black
                      )
                    )
                  ),
                );
              }
            )
          )
        ],
      ),
    );
  }
}
