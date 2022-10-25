import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../model/post-model.dart';

class MyLikesPage extends StatefulWidget {
  const MyLikesPage({Key? key}) : super(key: key);

  @override
  State<MyLikesPage> createState() => _MyLikesPageState();
}

class _MyLikesPageState extends State<MyLikesPage> {

  List<Post> items = [];
  String post_img1 = "https://firebasestorage.googleapis.com/v0/b/koreanguideway.appspot.com/o/develop%2Fpost.png?alt=media&token=f0b1ba56-4bf4-4df2-9f43-6b8665cdc964";
  String post_img2 = "https://firebasestorage.googleapis.com/v0/b/koreanguideway.appspot.com/o/develop%2Fpost2.png?alt=media&token=ac0c131a-4e9e-40c0-a75a-88e586b28b72";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items.add(Post(postImage: post_img1, caption: "Discover more great images on our sponsor's site"));
    items.add(Post(postImage: post_img2, caption: "Discover more great images on our sponsor's site"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Likes",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Billabong",
              fontSize: 30,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (ctx, index){
            return _itemOfPost(items[index]);
          },
        )
    );
  }

  //List elementlari
  Widget _itemOfPost(Post post){
    return Container(
      margin: const EdgeInsets.only(bottom: 1),
      color: Colors.white,
      child: Column(
        children: [
          const Divider(),

          //#userInfo
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [

                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: const Image(
                          image: AssetImage("assets/images/ic_person.png"),
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(width: 10,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Username",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black
                            ),
                          ),
                          Text(
                            "October 23, 2022",
                            style: TextStyle(
                                fontWeight: FontWeight.normal
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(SimpleLineIcons.options),
                  )
                ],
              )
          ),

          //#Image
          //Image.network(post.postImage, fit: BoxFit.cover,),
          CachedNetworkImage(
            imageUrl: post.postImage,
            //Rasm ko'ringuncha nimadir aylanib turadi ==> placeholder
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),

          //#Likeshare
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: (){},
                icon: const Icon(FontAwesome.heart, color: Colors.red,),
              ),
              IconButton(
                onPressed: (){},
                icon: const Icon(FontAwesome.send),
              )
            ],
          ),

          //#Caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                text: post.caption,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

}
