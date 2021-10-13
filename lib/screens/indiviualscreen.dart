

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../UICard/ReplyCard.dart';
import '../UICard/ownMassegeCard.dart';

class indiviualSccreen extends StatefulWidget {
  final chatmodel;

  const indiviualSccreen( this.chatmodel) ;

  @override
  _indiviualSccreenState createState() => _indiviualSccreenState();
}

class _indiviualSccreenState extends State<indiviualSccreen> {

  FocusNode _focusNode = FocusNode();
  bool show = false;
  TextEditingController _controller = TextEditingController();



 /* Widget emojiSelect() {
    return EmojiPicker(
        rows: 4,
        columns: 7,
        onEmojiSelected: (emoji, category) {
          print(emoji);
          setState(() {
            _controller.text=_controller.text+emoji.emoji;
          });
        }
    );
  }*/
  /*@override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }*/

/*void connect(){
     socket=IO.io("http://192.168.1.107:500",<String,dynamic>{
             "transports":["websocket"],
             "autoConnect":false,
     });
     socket.connect();
     socket.onConnect((data)=>print("Connected"));
     print(socket.connected);
  }*/

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/whatsapp background.png",
              height: MediaQuery.of(context).size.height,
               width: MediaQuery.of(context).size.width,
        ),
        Scaffold(
          appBar: AppBar(
            leadingWidth: 90,
            titleSpacing: 0,
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, size: 24,)),
                CircleAvatar(
                  backgroundColor: Colors.grey,

                  child: SvgPicture.asset(
                    widget.chatmodel.isGroup
                        ? "assets/groups.svg"
                        : "assets/person.svg",
                    color: Colors.white,
                    width: 37,
                    height: 37,
                  ),
                  radius: 25,
                ),
              ],
            ),
            title: Container(
              margin: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.chatmodel.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(widget.chatmodel.time, style: TextStyle(fontSize: 13),)
                ],
              ),
            ),
            actions: [
              IconButton(icon: Icon(Icons.videocam), onPressed: () {},),
              IconButton(
                icon: Icon(Icons.call), onPressed: () {}, color: Colors.white,),
              PopupMenuButton<String>(
                  onSelected: (value) {
                    print(value);
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        child: Text("View contact"), value: "View contact",),
                      PopupMenuItem(child: Text("Media,links and docs"),
                        value: "Media,links and docs",),
                      PopupMenuItem(
                        child: Text("ChatApp web"), value: "ChatApp web",),
                      PopupMenuItem(child: Text("Search"), value: "Search",),
                      PopupMenuItem(child: Text("Mute Notification"),
                        value: "Mute Notification",),
                      PopupMenuItem(child: Text("Wallpaper"), value: "Wallpaper",),
                    ];
                  }),
            ],
          ),


          body: Container(
           color: Colors.blueGrey,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: WillPopScope(
              child: Stack(
                children: [
                  Image.asset("assets/whatsapp background.png",
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height-140,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        ownMessageCard(),
                        ReplyCard(),
                        ownMessageCard(),
                        ReplyCard(),
                        ownMessageCard(),
                        ReplyCard(),
                        ownMessageCard(),
                        ReplyCard(),
                        ownMessageCard(),
                        ReplyCard(),
                        ownMessageCard(),
                        ReplyCard(),
                        ownMessageCard(),
                        ReplyCard(),
                        ownMessageCard(),
                        ReplyCard(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 55,
                              child: Card(
                                margin: EdgeInsets.only(
                                    left: 2, right: 2, bottom: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: TextFormField(
                                  controller: _controller,
                                  focusNode: _focusNode,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  minLines: 1,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Type a message",
                                    prefixIcon: IconButton(
                                      icon: Icon(Icons.emoji_emotions,),
                                      onPressed: () {
                                        setState(() {
                                          show = !show;
                                          _focusNode.unfocus();
                                          _focusNode.canRequestFocus = false;
                                        });
                                      },),
                                    contentPadding: EdgeInsets.all(5),
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(icon: Icon(Icons.attach_file,
                                          color: Colors.green[900],),
                                            onPressed: () {
                                              showModalBottomSheet(context: context,
                                                  backgroundColor: Colors.transparent,
                                                  builder: (builder) =>
                                                      bottomSheet());
                                            }),
                                        IconButton(icon: Icon(Icons.camera_alt,
                                          color: Colors.green[900],),
                                            onPressed: null),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: CircleAvatar(
                                  backgroundColor: Color(0xFF075E54),
                                  radius: 25,
                                  child: IconButton(
                                    icon: Icon(Icons.mic, color: Colors.white,), onPressed: () {  },),
                                ),
                              ),
                            ),
                          ],
                        ),
                        show ? Container()
                        //emojiSelect()
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                }
                else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }
    Widget bottomSheet() {
      return Container(
        height: 279,
        width: MediaQuery.of(context).size.width,
        child: Card(
          margin: EdgeInsets.all(18),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: incorrect(Icons.insert_drive_file, Colors.indigo, "Document")),
               //     SizedBox(width: 40,),
                    Expanded(child:incorrect(Icons.camera_alt, Colors.pink, "Camera")),
                 //   SizedBox(width: 40,),
                    Expanded(child:incorrect(Icons.insert_photo, Colors.purple, "Gallery")),
                 //   SizedBox(width: 40,),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: incorrect(Icons.headset, Colors.orange, "Audio")),
                    //     SizedBox(width: 40,),
                    Expanded(child:incorrect(Icons.location_pin, Colors.teal, "Location")),
                    //   SizedBox(width: 40,),
                    Expanded(child:incorrect(Icons.insert_photo, Colors.blue, "Contact")),
                    //   SizedBox(width: 40,),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

  Widget incorrect(IconData icon,Color color ,String text ){
    return InkWell(
      onTap: (){},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(icon,size: 29,color: Colors.white,),
          ),
          Text(text,style:TextStyle(fontSize: 13),),
        ],

      ),
    );
  }



  }


