import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/camera_c.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/main.dart';
import 'package:student_id/models/digital_id_m.dart';
import 'package:student_id/screens/digital_id/selfie/selfie.dart';
import 'package:student_id/services/services_s.dart';

class BackSideBody extends StatelessWidget {

  final DigitalIDModel? model;
  final Function? pickImage;

  const BackSideBody({Key? key, this.model, this.pickImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarCustom("Back Side", context, centerTitle: true),
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
              //           text: "Please submit a valid issued ${model!.title}.",
              //           bottom: paddingSize,
              //         ),

              //         MyText(
              //             width: 300,
              //             bottom: paddingSize,
              //             text: "Both Front and Back ${model!.title}."),

              //         // Front
              //         model!.frontImage != ''
              //           ? MyText(text: "Front")
              //           : Container(),
              //         Card(
              //           child: model!.frontImage == ''
              //               ? Container(
              //                   width: 400,
              //                   height: MediaQuery.of(context).size.width / 2.5,
              //                   child:
              //                       Image.asset(AppConfig.illusPath + "id.jpg"))
              //               : Image.file(
              //                   File(model!.frontImage!),
              //                   height: 200,
              //                   width: 400,
              //                 ),
              //         ),

              //         // Back
              //         model!.backImage != ''
              //             ? MyText(text: "Back")
              //             : Container(),
              //         model!.backImage == ''
              //             ? Container()
              //             : Card(
              //                 child: Image.file(File(model!.backImage!),
              //                     height: 200, width: 400))
              //       ],
              //     ),
              //   ),
              // ),
              model!.backImage == ''
              ? Container(
                  width: 400,
                  height: MediaQuery.of(context).size.width / 2.5,
                  child: Image.asset(AppConfig.illusPath+"back_side_id.jpg")
              )
              : Image.file(
                  File(model!.backImage!),
                  height: 200,
                  width: 400,
                ),

              MyText(
                top: paddingSize,
                bottom: paddingSize,
                width: 311,
                fontWeight: FontWeight.bold,
                text: "Position your document inside the frame. Make sure that all the data is clearly visible."
              ),

              Padding(
                padding: EdgeInsets.all(paddingSize),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () async {
                          try {
                            // ImagePicker _picker = ImagePicker();
                            // await _picker.pickImage(source: ImageSource.camera);
                            final img = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CameraApp())) ??
                                '';
                            if (model!.backImage == '') {
                              await pickImage!(img, 'front');
                            } else {
                              await pickImage!(img, 'back');
                            }
                          } catch (e) {
                            print("Error CameraApp $e");
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.camera),
                            MyText(text: "Take a photo")
                          ],
                        )
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: () async {
                            try {
                              // final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                              // final pickedFile = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
                              // if (model!.frontImage == '') {
                              //   await pickImage!(pickedFile!.path, 'front');
                              // } else {
                              //   await pickImage!(pickedFile!.path, 'back');
                              // }
                              
                              final pickedFile = await Services.pickImage(ImageSource.gallery);
                              if (model!.backImage == '') {
                                await pickImage!(pickedFile.path, 'front');
                              } else {
                                await pickImage!(pickedFile.path, 'back');
                              }
                            } catch (e) {}
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.upload),
                              MyText(text: "Upload image")
                            ],
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            left: paddingSize,
            right: paddingSize,
            bottom: paddingSize,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
              ),
                onPressed:  model!.backImage == '' ? null : () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelfieSide())
                            );
                },
                child: Container(
                height: btnHeight,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14)
                ),
                child: MyText(
                  text: "Next Step",
                  color2: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )
              )
            ),
          )
        ],
      ),
    );
  }
}
