

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas4tpm/detail.dart';
import 'package:tugas4tpm/dashboard.dart';

import 'website.dart';

class Favoriteweb extends StatefulWidget {
  const Favoriteweb({Key? key}) : super(key: key);

  @override
  State<Favoriteweb> createState() => _FavoritewebState();
}

class _FavoritewebState extends State<Favoriteweb> {
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

  final List<WebsiteData> favoriteWebsites = popularWebsites.where((web) => web.isFavorite == true).toList();
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Dashboard"),
    ),
    body:  favoriteWebsites.isEmpty
        ? Center(child: Text("No favorite websites"))
        :ListView.builder(
      itemCount: favoriteWebsites.length,
      itemBuilder: (context, index) {
        final WebsiteData web = favoriteWebsites[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Detail(web: web)),
            );
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
            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      width: 100.0,
                      height: 120.0,
                      child: CircleAvatar(
                        radius: 65.0,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                          web.image,
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
                Positioned(
                  top: 8.0,
                  right: 8.0,
                  child: IconButton(
                    icon: Icon(
                      web.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {

                    },
                  ),
                ),
              ],
            ),
          )

        );
      },
    ),
    );
  }
}



