

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas4tpm/detail.dart';
import 'package:tugas4tpm/dashboard.dart';

import 'website.dart';

class Webmenu extends StatefulWidget {
  const Webmenu({Key? key}) : super(key: key);

  @override
  State<Webmenu> createState() => _WebmenuState();
}

class _WebmenuState extends State<Webmenu> {
  @override
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Dashboard(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(


        appBar: AppBar(
          title: Text("Dashboard"),

        ),
        body: ListView.builder(

          itemCount: popularWebsites.length,
          itemBuilder: (context,index){
            final WebsiteData web = popularWebsites[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(web:web)));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 4.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 100.0,
                      height: 120.0,
                      child: CircleAvatar(

                        radius: 65.0,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(web.image,
                        ),

                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          bottomLeft: Radius.circular(12.0),
                        ),

                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            web.name,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            web.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),

    );
  }
}



