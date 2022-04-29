import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/alert_dialog_c.dart';
import 'package:student_id/components/components_c.dart';
import 'package:student_id/components/image_edit_c.dart';
import 'package:student_id/components/qr_scanner/qr_scanner.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/components/walletConnect_c.dart';
import 'package:student_id/models/dashboard_m.dart';
import 'package:student_id/models/digital_id_m.dart';
import 'package:student_id/provider/api_provider.dart';
import 'package:student_id/provider/digital_id_p.dart';
import 'package:student_id/provider/home_p.dart';
import 'package:student_id/services/storage.dart';

import '../shared/typography.dart';

// =============================== Reuse Widget ===============================
void showAlertDialog(TextEditingController phraseKey, BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: HexColor('#EDEDED'),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        content: SizedBox(
          width: MediaQuery.of(context).size.width / 1.3,
          height: MediaQuery.of(context).size.height / 2.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Social Wallets",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              const Text(
                "Generate Private/Public Key with close friends’ contacts; phone numbers and/or email addresses and/or names.\nA secure key to everything yours, make sure you save or remember it well",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              const Text(
                "12 words* separated by space",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),
              PhraseInput(textEditingController: phraseKey),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: primaryColor),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          alignment: Alignment.center,
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.only(top: 15, bottom: 15)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                          )),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    )),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void qrCodeAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        backgroundColor: HexColor('#EDEDED'),
        content: SizedBox(
          width: MediaQuery.of(context).size.width / 1.3,
          height: MediaQuery.of(context).size.height / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'My QR Code',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 20),
              QrImage(
                data: 'This QR code has an embedded image as well',
                version: QrVersions.auto,
                size: 250,
                gapless: false,
                embeddedImage:
                    const AssetImage('assets/logos/telegram-logo.png'),
                embeddedImageStyle: QrEmbeddedImageStyle(
                  size: const Size(80, 80),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: primaryColor),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          alignment: Alignment.center,
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.only(top: 15, bottom: 15)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                          )),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'OK',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    )),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget selLogo(BuildContext context) {
  return Image.asset('assets/logos/sel.png', width: 100, height: 100);
}

Widget profileWidget(BuildContext context, {@required DashBoardModel? model, @required Function? pickImage}) {
  return Stack(
    children: <Widget>[

      Stack(
        children: [

          model!.cover.contains("https")
          ? Image.network(
            model.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.3,
            fit: BoxFit.cover,
          )
          : Image.file(
            File(model.cover),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.3,
            fit: BoxFit.cover,
          ),
          
          if (model.isEditing)
          InkWell(
            onTap: () async {
              await Components().imageOption(context: context, getImage: pickImage, label: "cover");
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.3,
              color: Colors.black.withOpacity(0.4),
              child: MyText(text: "+ Upload image", color2: Colors.white, top: paddingSize*2,),
            ),
          )
        ],
      ),
      
      SizedBox(
        width: (MediaQuery.of(context).size.width),
        height: MediaQuery.of(context).size.height / 3.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Stack(
              children: [

                ImageEditComponent(
                  image: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: model.profile.contains("https")
                        ? Image.network(
                          model.profile,
                          height: 110,
                          width: 110,
                          fit: BoxFit.cover,
                        )
                        : Image.file(
                          File(model.profile),
                          height: 110,
                          width: 110,
                          fit: BoxFit.cover,
                        )
                      ),
                  ),
                ),
                
                if (model.isEditing)
                InkWell(
                  onTap: () async {
                    await Components().imageOption(context: context, getImage: pickImage, label: "profile");
                  },
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.black.withOpacity(0.4),
                    child: ClipOval(
                      child: Container(
                        height: 110,
                        width: 110,
                        color: Colors.black.withOpacity(0.5),
                        child: Center(
                          child: MyText(text: "Upload image", color2: Colors.white),
                        ),
                      ),
                    )
                  ),
                )
              ],
            ),

            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(  
                model.name == '' ? "N/A" : model.name,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),

      // AppBar
      Positioned(
        top: 5,
        left: 5,
        right: 5,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [

              Padding(
                padding: EdgeInsets.only(left: 5),
                child: IconButton(
                  iconSize: 40,
                  onPressed: () async {

                    Navigator.push(context, MaterialPageRoute(builder: (context) => Account()));
                  }, 
                  icon: Row(
                    children: [
                      
                      Icon(
                        Icons.account_circle_outlined,
                        color: Colors.white,
                        size: 30,
                      ),

                      MyText(
                        text: Provider.of<ApiProvider>(context, listen: false).accountM.name ?? "",
                        color2: Colors.white,
                      )
                    ]
                  ),
                ),
              ),

              Expanded(child: Container()),

              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () async {
                      String result = await Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => QrScanner())
                      );
                      print("result $result");
                    }, 
                    icon: Icon(Icons.qr_code_scanner_outlined, color: Colors.white,)
                  ),
                ),
              )
            ]
          ),
        )
      )

    ],
  );
}

Widget divider(String title) {
  return Container(
    color: Colors.white.withOpacity(0.5),
    child: Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: const Divider(
              color: Colors.black,
              height: 50,
            )),
      ),
      Text(title, style:TypographyHelper.subTitleTextStyleBlack.copyWith(fontWeight: FontWeight.w400,color: Colors.grey)),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: const Divider(
              color: Colors.black,
              height: 50,
            )),
      ),
    ]),
  );
}

Widget titleDashboard(String title, BuildContext context, {Widget? title2, TabController? tabController}) {
  return Container(
    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
    width: MediaQuery.of(context).size.width,
    color: greyBackgroundColor,
    child: Row(
      children: [
        MyText(
          text: title,
          color2: greyColor,
          // color2: greyColor,
          fontWeight: FontWeight.w700,
          right: 5,
          fontSize: 16,
        ),
        title2 != null
        ? Expanded(
          child: title2
        )
        : Container()
      ],
    ),
  );
}

Widget getBalanceBox(
    String title, TextEditingController? data, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, left: 70, right: 70),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(color: greyColor, fontWeight: FontWeight.w700)),
        Container(
          color: greyBackgroundColor,
          child: TextField(
            readOnly: true,
            enabled: false,
            controller: data!,
            style: const TextStyle(fontWeight: FontWeight.w700),
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class SetupProgressIndicator extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final int step;

  SetupProgressIndicator(
    this.step, {
    Key? key,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).padding,
      color: whiteColor,
      child: StepProgressIndicator(
        totalSteps: 2,
        currentStep: step,
        selectedColor: primaryColor,
        unselectedColor: greyColor,
        roundedEdges: const Radius.circular(90),
        size: 8,
      ),
    );
  }
}

PreferredSizeWidget appbarCustom(String title, BuildContext context) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new,color: Colors.black,),
      onPressed: (){
        Navigator.pop(context);
      },
    ),
  );
}
