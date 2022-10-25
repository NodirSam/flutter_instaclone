import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyUploadPage extends StatefulWidget {
  const MyUploadPage({Key? key}) : super(key: key);

  @override
  State<MyUploadPage> createState() => _MyUploadPageState();
}

class _MyUploadPageState extends State<MyUploadPage> {

  var captionController = TextEditingController();

   File?  _image;

   //Rasmni tanlab oladi
  _imgFromGallery() async {
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }


  //Rasm va Caption ni olib serverga jo'natadi
  _uploadNewPost(){
    String caption = captionController.text.toString().trim();
    if(caption.isEmpty) return;
    if(_image == null) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Upload",
          style: TextStyle(
            color: Colors.black, fontSize: 25, fontFamily: "Billabong"
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              _uploadNewPost();
            },
            icon: const Icon(
              Icons.post_add,
              color: Color.fromRGBO(245, 96, 64, 1),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  _imgFromGallery();
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width,
                  color: Colors.grey.withOpacity(0.4),
                  child: _image ==null ? const Center(
                    child: Icon(Icons.add_a_photo, size: 60, color: Colors.grey,),
                  ):Stack(
                    children: [
                      Image.file(_image!, width: double.infinity, height: double.infinity,
                      fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.black12,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _image = null;
                                });
                              },
                              icon: const Icon(Icons.highlight_remove),
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ),
              ),

              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: TextField(
                  controller: captionController,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: "Caption",
                    helperStyle: TextStyle(fontSize: 17, color: Colors.black38),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
