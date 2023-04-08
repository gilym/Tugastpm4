import 'package:flutter/material.dart';
import 'website.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatefulWidget {
  final WebsiteData web;
  const Detail({Key? key, required this.web}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.web.name),
        centerTitle: true,
        actions: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                widget.web.isFavorite = !widget.web.isFavorite;
              });

              SnackBar snackBar = SnackBar(
                content: (widget.web.isFavorite)
                    ? Text("Berhasil Menambahka Ke Favorite")
                    : Text("Berhasil Menghapus Dari Favorite"),
                backgroundColor: Colors.black,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Icon(
              (widget.web.isFavorite) ? Icons.favorite : Icons.favorite_border,
              color: Colors.redAccent,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 15),
          Center(
            child: CircleAvatar(
              radius: 65.0,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(widget.web.image),
            ),
          ),
          SizedBox(height: 25),
          Center(
            child: Text(
              widget.web.name,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.web.description,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ExpansionTile(
              title: Text(
                "Tags",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              children: [
                SizedBox(height: 10),
                Center(
                  child: Wrap(
                    spacing: 10,
                    children: widget.web.tags.map((tag) {
                      return Chip(
                        label: Text(
                          tag,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.blueGrey,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ExpansionTile(
              title: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              children: [
                SizedBox(height: 10),
                Center(
                  child: Wrap(
                    spacing: 10,
                    children: widget.web.category.map((category) {
                      return Chip(
                        label: Text(
                          category,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.blueGrey,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          SizedBox(height: 25),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 4,
                child: ElevatedButton(
                  onPressed: () {
                    _launchUrl(widget.web.url);
                  },
                  child: Text(
                    "Launch",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could Not Launch $_url');
    }
  }
}
