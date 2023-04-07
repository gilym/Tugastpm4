import 'package:flutter/material.dart';
import 'package:tugas4tpm/datadiri.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: PageScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          final datadiri Data = data[index];
          return Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                      'https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg'),
                ),
                SizedBox(height: 16.0),
                Text(
                  Data.name,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  Data.kelas,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  Data.nim,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Divider(
                  thickness: 1.2,
                ),
                ListTile(
                  leading: Icon(
                    Icons.menu_open_rounded,

                  ),
                  title: Text(
                    'Detail',
                    style: TextStyle(
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_drop_down,
                  ),
                  onTap: () {
                    showDetail(context,Data.ttl,Data.cita_cita);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  void showDetail(BuildContext context , ttl , cita) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.cake),
              title: Text(ttl),
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text(cita),
            ),
          ],
        );
      },
    );
  }
}
