import 'package:flutter/material.dart';
import 'post.dart';
import 'package:example/wp-api.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

class Berita extends StatefulWidget {
  @override
  _BeritaState createState() => _BeritaState();
}

class _BeritaState extends State<Berita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Berita"),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchWpPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map wppost = snapshot.data[index];

                    return PostTile(
                      href: wppost["_links"]["featured_media"][0]["href"],
                      title:
                          wppost["title"]["rendered"].replaceAll("#038;", ""),
                      desc: wppost["excerpt"]["rendered"],
                      content: wppost["content"]["rendered"],
                    );
                  });
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class PostTile extends StatefulWidget {
  final String href, title, desc, content;
  PostTile({this.content, this.desc, this.href, this.title});

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  var imageUrl = "";

  Widget shortDescriptionView() {
    return HtmlView(
      data: widget.desc,
      onLaunchFail: (url) {
        print("launch $url failed");
      },
      scrollable: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Post(
                      imageUrl: imageUrl,
                      title: widget.title,
                      desc: widget.content,
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(top: 8),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            FutureBuilder(
              future: fetchWpPostImageUrl(widget.href),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  imageUrl = snapshot.data["guid"]["rendered"];
                  return Image.network(snapshot.data["guid"]["rendered"]);
                }

                return CircularProgressIndicator();
              },
            ),
            SizedBox(height: 8),
            Text(
              widget.title,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(widget.desc)
          ])),
    );
  }
}
