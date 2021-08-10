import 'package:example/SecondScreen.dart';
import 'package:flutter/material.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SMKN 2 Banjar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: MultiLevelDrawer(
          backgroundColor: Color.fromRGBO(220, 220, 220, 1),
          rippleColor: Color.fromRGBO(220, 220, 220, 1),
          subMenuBackgroundColor: Color.fromRGBO(220, 220, 220, 1),
          divisionColor: Colors.grey,
          header: Container(
            height: size.height * 0.25,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/SMKN 2 Banjar.png",
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("SMKN 2 Banjar")
              ],
            )),
          ),
          children: [
            MLMenuItem(
                leading: Icon(Icons.article),
                content: Text(
                  "Berita",
                ),
                onClick: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SecondScreen()));
                }),
            MLMenuItem(
                leading: Icon(Icons.people),
                trailing: Icon(Icons.arrow_right),
                content: Text("Civitas"),
                onClick: () {},
                subMenuItems: [
                  MLSubmenu(
                      onClick: () {}, submenuContent: Text("Kepala Sekolah")),
                  MLSubmenu(
                      onClick: () {},
                      submenuContent: Text("Wakil Kepala Sekolah")),
                  MLSubmenu(
                      onClick: () {},
                      submenuContent: Text("Kepala Program Studi")),
                  MLSubmenu(onClick: () {}, submenuContent: Text("Guru"))
                ]),
            MLMenuItem(
                leading: Icon(Icons.library_books),
                trailing: Icon(Icons.arrow_right),
                content: Text("Pelajaran"),
                onClick: () {},
                subMenuItems: [
                  MLSubmenu(onClick: () {}, submenuContent: Text("Normatif")),
                  MLSubmenu(onClick: () {}, submenuContent: Text("Adaptif")),
                  MLSubmenu(onClick: () {}, submenuContent: Text("Produktif"))
                ]),
            MLMenuItem(
                leading: Icon(Icons.group_work),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "Kegiatan",
                ),
                subMenuItems: [
                  MLSubmenu(onClick: () {}, submenuContent: Text("Pameran")),
                  MLSubmenu(onClick: () {}, submenuContent: Text("Pelatihan")),
                  MLSubmenu(onClick: () {}, submenuContent: Text("Wawancara"))
                ],
                onClick: () {}),
            MLMenuItem(
                leading: Icon(Icons.notifications_outlined),
                content: Text(
                  "Publikasi",
                ),
                onClick: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SecondScreen()));
                }),
            MLMenuItem(
                leading: Icon(Icons.camera),
                content: Text(
                  "Galeri",
                ),
                onClick: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SecondScreen()));
                }),
            MLMenuItem(
                leading: Icon(Icons.priority_high),
                content: Text(
                  "Tentang",
                ),
                onClick: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SecondScreen()));
                }),
            MLMenuItem(
                leading: Icon(Icons.contact_page),
                content: Text(
                  "Kontak",
                ),
                onClick: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SecondScreen()));
                }),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(220, 220, 220, 1),
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Home",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(240, 248, 255, 1),
                  ]),
            ),
            child: Center()),
      ),
    );
  }
}
