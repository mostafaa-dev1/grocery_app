import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Orders',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25
          )
        ),
      ),
      body: Column(
        children: [
          ToggleSwitch(
            initialLabelIndex: 0,
            totalSwitches: 2,
            labels: ['Ongoing', 'History'],
            radiusStyle: false,
            activeFgColor: Colors.white,
            activeBgColor: [HexColor('F37A20')],
            inactiveBgColor: Colors.grey[300],
            inactiveFgColor: Colors.black,
            minWidth: 200,
            onToggle: (index) {
              print('switched to: $index');
            },
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 1,
                  color: Colors.grey[300],
                  indent: 20,
                  endIndent: 20,
                );
              },
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: HexColor('F37A20'),
                      child: Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Order #335',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )
                    ),
                    subtitle: Text(
                      'Delivered | 12/12/2022',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.green[300]
                      )
                    ),
                    trailing: Text(
                      '\$500.00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      )
                    )
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
