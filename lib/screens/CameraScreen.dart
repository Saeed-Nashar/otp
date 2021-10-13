

/*
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:async' show Future;

import 'CameraView.dart';

 List<CameraDescription> camras;

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> cameraValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(camras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
           width: double.infinity,
            child: FutureBuilder(
                future: cameraValue,
                builder: (context, snapShot) {
                  if (snapShot.connectionState == ConnectionState.done) {
                    return CameraPreview(_cameraController);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.only(top: 5,bottom: 5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.flash_off,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                         takePhoto(context);
                        },
                        child: Icon(
                            Icons.panorama_fish_eye,
                            color: Colors.white,
                            size: 70,
                          ),
                        ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.flip_camera_ios,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text("Hold for video , tap for photo",style: TextStyle(color: Colors.white,),
                  textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void takePhoto( BuildContext context) async{
     var  path = join((await getTemporaryDirectory()).path,"${DateTime.now()}.png");
     await _cameraController.takePicture();
    Navigator.push(context,MaterialPageRoute(builder: (builder)=>CameraViwe(path:path)));
  }

  getTemporaryDirectory() {}

*/