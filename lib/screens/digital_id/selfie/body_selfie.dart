import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/camera_c.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/main.dart';
import 'package:student_id/models/digital_id_m.dart';
import 'package:student_id/services/services_s.dart';

class SelfieSideBody extends StatelessWidget {

  final DigitalIDModel? model;
  final Function? pickImage;
  final Function? submit;

  const SelfieSideBody({ Key? key, this.model, this.pickImage, this.submit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarCustom("Selfie With Front Side", context),  
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Hint To upload Card
              // Card(
              //   margin: EdgeInsets.all(paddingSize),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     padding: EdgeInsets.all(paddingSize),
              //     child: Column(
              //       children: [
              //         MyText(
              //           width: 300,
              //           bottom: paddingSize,
              //           text: "Please submit a valid issued ${model!.title}}, with your face"
              //         ),

              //         MyText(
              //           width: 300,
              //           bottom: paddingSize,
              //           text: "Both Front and Back ${model!.title}."
              //         ),

              //         // Front
              //         model!.selfieImage != '' ? MyText(
              //           text: "Front"
              //         ) : Container(),
              //         Card(
              //           child: model!.selfieImage == '' ? Container(
              //             width: 400,
              //             height: MediaQuery.of(context).size.width/2.5,
              //             child: Image.asset(AppConfig.illusPath+"face.jpg")
              //           ) : Image.file(File(model!.selfieImage!), height: 200, width: 400),
              //         ),

              //         // Back
              //         model!.backFaceImage != '' ? MyText(
              //           text: "Back"
              //         ) : Container(),
              //         model!.backFaceImage == '' ? Container( ) : Card(child: Image.file(File(model!.backFaceImage!), height: 200, width: 400))
              //       ],
              //     ),
              //   ),
              // ),
              model!.selfieImage == ''
              ? Container(
                  width: 400,
                  height: MediaQuery.of(context).size.width / 2.5,
                  child: Image.asset(AppConfig.illusPath+"front_side_id.jpg")
              )
              : Image.file(
                  File(model!.selfieImage!),
                  height: 200,
                  width: 400,
                ),

              MyText(
                top: paddingSize,
                bottom: paddingSize,
                text: "Position your document inside the frame. Make sure that all the data is clearly visible."
              ),

              Padding(
                padding: EdgeInsets.all(paddingSize),
                child: TextButton(
                  child: MyText(
                    text: "Take a selfie"
                  ),
                  onPressed: () async {
                    try {

                      final img = await Navigator.push(context, MaterialPageRoute(builder: (context) => CameraApp())) ?? '';

                      // final pickedFile = await ;
                      print("Selfie ${img}");
                      if (img != null){
                        await pickImage!(img, 'front');
                      }
                      // if (model!.selfieImage == ''){
                      // } else {
                      //   await pickImage!(pickedFile, 'back');
                      // }
                    } catch (e){
                      print("Error $e");
                    }
                  }
                ),
              )
            ],
          ),

          Positioned(
            left: paddingSize,
            right: paddingSize,
            bottom: paddingSize,
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: model!.selfieImage == '' ? null : () async {
                  await submit!();
                }, 
                child: MyText(
                  text: "Submit", color2: Colors.white,
                )
              )
            ),
          )
        ],
      ),
    );
  }
}