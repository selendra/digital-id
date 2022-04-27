import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/column_info_c.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/main.dart';
import 'package:student_id/models/asset_list_m.dart';
import 'package:student_id/models/dashboard_m.dart';
import 'package:student_id/provider/identifier_p.dart';
import 'package:student_id/screens/dashboard/edit_info.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/screens/identifier/identifier_option.dart';
import 'package:student_id/theme/theme.dart';

import '../shared/typography.dart';

class PhraseInput extends StatelessWidget {
  final TextEditingController? textEditingController;
  const PhraseInput({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onChanged: (value) {
        //Do something wi
      },
      style: const TextStyle(fontSize: 14, color: Colors.black),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 40),
        labelStyle: const TextStyle(color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class VerifyPassphraseInput extends StatelessWidget {
  final TextEditingController? textEditingController;

  const VerifyPassphraseInput({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: textEditingController,
            onChanged: (value) {
              //Do something wi
            },
            style: const TextStyle(fontSize: 14, color: Colors.black),
            decoration: InputDecoration(
              label: const Text("Verify Passphrase"),
              labelStyle: const TextStyle(color: Colors.grey),
              hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmailInput extends StatelessWidget {

  final TextEditingController? textEditingController;
  final Function()? onFieldSubmitted;

  const EmailInput({Key? key, required this.textEditingController, this.onFieldSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: TextFormField(
        controller: textEditingController,
        onChanged: (value) {
          //Do something wi
        },
        validator: (value) {
          // Check if this field is empty
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }

          // using regular expression
          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
            return "Please enter a valid email address";
          }

          // the email is valid
          return null;
        },
        onFieldSubmitted: (String value){
          onFieldSubmitted!();
        },
        keyboardType: TextInputType.emailAddress,
        style: TypographyHelper.titleTextStyleBlack.copyWith(color: Colors.black87),
        decoration: InputDecoration(
          // label: const Text("Email"),
          //labelStyle: const TextStyle(color: Colors.grey),
          fillColor: Colors.white,
          filled: true, 
          hintText: "Email",
          hintStyle:TypographyHelper.titleTextStyleBlack.copyWith(color: Colors.grey.withOpacity(.75)),
          isDense: true, 
          contentPadding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
          border:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          ),
        ),
      ),
    );
  }
}

class PassInput extends StatelessWidget {

  final String? label;
  final bool? obscureText;
  final TextEditingController? textEditingController;
  final Function()? onFieldSubmitted;
  final Function? validator;

  const PassInput({
    Key? key, 
    this.label, 
    required this.textEditingController, 
    this.onFieldSubmitted, 
    this.obscureText = true,
    this.validator,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            obscureText: obscureText!,
            controller: textEditingController,
            onChanged: (value) {
              //Do something wi
            },
            validator: (value) {
              // Check if this field is empty
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }

              // using regular expression
              if ( value.length < 6) {
                return "Password less than 6 digit";
              }

              // the email is valid
              return null;
            },
            onFieldSubmitted: (String value){
              onFieldSubmitted!();
            },
            keyboardType: TextInputType.emailAddress,
            style: TypographyHelper.titleTextStyleBlack.copyWith(color: Colors.black87),
            decoration: InputDecoration(
              // label: Text(label!),
              // labelStyle: const TextStyle(color: Colors.grey),
              fillColor: Colors.white,
              filled: true, 
              hintText: label!,
              hintStyle:TypographyHelper.titleTextStyleBlack.copyWith(color: Colors.grey.withOpacity(.75)),
              isDense: true, 
              contentPadding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
                borderRadius:const  BorderRadius.all(Radius.circular(50.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyInput extends StatelessWidget {

  final String? label;
  final TextEditingController? textEditingController;
  final Function()? onFieldSubmitted;
  final Function? validator;
  final Function? onChanged;

  const MyInput({Key? key, required this.label, required this.textEditingController, this.onFieldSubmitted, required this.validator, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: textEditingController,
            onChanged: (value) {
              //Do something wi
              if (onChanged != null) onChanged!(value);
            },
            validator: (value) {
              return validator!(value);
            },
            onFieldSubmitted: (String value){
              onFieldSubmitted!();
            },
            style: TypographyHelper.titleTextStyleBlack.copyWith(color: Colors.black87),
            decoration: InputDecoration(
              // label: Text("$label"),
              // labelStyle: const TextStyle(color: Colors.grey),
              fillColor: Colors.white,
              filled: true, 
              hintText: label,
              hintStyle:TypographyHelper.titleTextStyleBlack.copyWith(color: Colors.grey.withOpacity(.75)),
              isDense: true, 
              contentPadding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
              border:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
                borderRadius:const BorderRadius.all(Radius.circular(50.0)),
              ),
              focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
                borderRadius:const BorderRadius.all(Radius.circular(50.0)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
                borderRadius:const BorderRadius.all(Radius.circular(50.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VerifyInput extends StatefulWidget {
  final TextEditingController? textEditingController;
  final Function(String)? onChanged;

  const VerifyInput({required this.textEditingController, this.onChanged, Key? key})
      : super(key: key);

  @override
  State<VerifyInput> createState() => _VerifyInputState();
}

class _VerifyInputState extends State<VerifyInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: TextFormField(
        controller: widget.textEditingController,
        keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ], 
        style: TypographyHelper.titleTextStyleBlack.copyWith(color: Colors.black87),// Only n
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true, 
          hintText: "Verify",
          hintStyle:TypographyHelper.titleTextStyleBlack.copyWith(color: Colors.grey.withOpacity(.75)),
          isDense: true, 
          contentPadding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
          border:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          ),
        ),
        onChanged: widget.onChanged,
        validator: (value) {
          // Check if this field is empty
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }

          // validate verify code under 6 characters
          if (value.length < 6) {
            return "Please enter 6-digit code";
          }

          // validate verify code more than 6 characters
          if (value.length > 6) {
            return "Please enter 6-digit code";
          }

          // the verify code is valid
          return null;
        },
      ),
    );
  }
}

// =============================== Social Media Button ===============================
class GoogleBtn extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  const GoogleBtn({
    this.onPressed,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(width: 0.5, color: Colors.grey.withOpacity(0.2)),
        color: Colors.white,
      ),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(50))
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Image.asset('assets/logos/google-icon.png',height: 30, width: 30)),
            // const SizedBox(
            //   width: 10,
            // ),
            Expanded(
              flex: 4,
              child: Text(title!,textAlign: TextAlign.start, style: TypographyHelper.titleTextStyleBlack.copyWith(fontWeight: FontWeight.w600))),
          ],
        ),
        onPressed: onPressed,
      )
    );
  }
}
class CustomBtn extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  final String? logo;
  const CustomBtn({
    this.onPressed,
    this.title,
    required this.logo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(width: 0.5, color: Colors.grey.withOpacity(0.2)),
        color: Colors.white,
      ),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side:  BorderSide(color: Colors.grey.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(50))
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: SvgPicture.asset('assets/logos/$logo', width: 30)
            ),
            // const SizedBox(
            //   width: 10,
            // ),
            Expanded(
              flex: 4,
              child: Text(title!,textAlign: TextAlign.start, style: TypographyHelper.titleTextStyleBlack.copyWith(fontWeight: FontWeight.w600))
            ),
          ],
        ),
        onPressed: onPressed,
      )
    );
  }
}

class FacebookBtn extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  const FacebookBtn({
    this.onPressed,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 54,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(50)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logos/meta-icon.png', width: 20),
              const SizedBox(
                width: 10,
              ),
              Text(title!,
                  style: const TextStyle(color: Colors.black, fontSize: 16)),
            ],
          ),
          onPressed: onPressed,
        ));
  }
}

class SubmitButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  const SubmitButton({
    this.text, 
    this.onPressed, 
    this.padding = const EdgeInsets.all(20), 
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HexColor primaryColor = HexColor('#00AAFF');
    const accentColor = Color(0xffffffff);

    const double borderRadius = 50;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: primaryColor
            ),
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
                        borderRadius: BorderRadius.circular(borderRadius)),
                  )),
              onPressed: onPressed,
              child: Text(
                text!,
                style: TypographyHelper.titleTextStyleBlack.copyWith(color: accentColor,fontSize: 18,fontWeight: FontWeight.w600),
              ),
            )),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  final Color? colorBtn;
  final Color? colorText;
  final EdgeInsetsGeometry? edgePadding;
  CustomButton({
    this.text, this.colorBtn, this.colorText, this.onPressed, this.edgePadding, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 50;

    return Padding(
      padding: edgePadding ?? EdgeInsets.zero,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: colorBtn),
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                alignment: Alignment.center,
                padding: MaterialStateProperty.all(const EdgeInsets.only(top: 15, bottom: 15)),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    side: BorderSide(color: primaryColor)
                  ),
                )
              ),
              onPressed: onPressed,
              child: Text(
                text!,
                style: TextStyle(color: colorText, fontSize: 16),
              ),
            )),
      )
    );
  }
}

class CustomButtonIcon extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  final Color? colorBtn;
  final Color? colorText;
  final Icon? icon;
  const CustomButtonIcon({
    this.text, 
    this.colorBtn, 
    this.colorText, 
    this.onPressed, 
    this.icon,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 50;

    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.75,
      child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: colorBtn),
          child: ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                alignment: Alignment.center,
                padding: MaterialStateProperty.all(
                    const EdgeInsets.only(top: 10, bottom: 10)),
                backgroundColor:
                    MaterialStateProperty.all(Colors.transparent),
              ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon!,
                Text(
                  text!,
                  style: TextStyle(color: colorText, fontSize: 14),
                ),
              ],
            ),
          )),
    );
  }
}

class EditButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  const EditButton({this.text, this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HexColor primaryColor = HexColor('#00AAFF');
    const accentColor = Color(0xffffffff);

    const double borderRadius = 50;

    return SizedBox(
      width: MediaQuery.of(context).size.width / 5,
      height: MediaQuery.of(context).size.height / 20,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: primaryColor,
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            alignment: Alignment.center,
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius)),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text!,
            style: const TextStyle(color: accentColor, fontSize: 14),
          ),
        ),
      ),
    );
  }
}

class DashboardOptions extends StatelessWidget {
  
  const DashboardOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Consumer<IdentifierProvider>(
            builder: (context, provider, widget){
              return Column(
                children: [
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.people_alt_outlined),
                        iconSize: 40,
                        color: provider.alreadySetup! ? Colors.blue : greyColor,
                      ),

                      provider.alreadySetup! 
                      ? const Positioned(
                        child: Icon(Icons.check, size: 20, color: Colors.blue),
                        right: 0,
                        bottom: 0,
                      ) 
                      : Container()
                    ],
                  ),
                  Text(
                    'Verify',
                    style: TextStyle(color: provider.alreadySetup! ? Colors.blue : greyColor, fontWeight: FontWeight.w600),
                  )
                ],
              );
            },
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  qrCodeAlertDialog(context);
                },
                icon: const Icon(Icons.qr_code_2_outlined),
                iconSize: 40,
                color: greyColor,
              ),
              Text(
                'QR Code',
                style: TextStyle(color: greyColor, fontWeight: FontWeight.w600),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share_outlined),
                iconSize: 40,
                color: greyColor,
              ),
              Text(
                'Share',
                style: TextStyle(color: greyColor, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class PersonlInfo extends StatelessWidget {

  final DashBoardModel? model;
  final Function? edit;
  
  PersonlInfo({Key? key, this.model, this.edit}) : super(key: key);

  Widget _nameInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Name', style: TextStyle(color: greyColor)),
          Text(text!,
            style: TextStyle(color: blackColor, fontWeight: FontWeight.w700)
          ),
        ]
      ),
    );
  }

  Widget _emailInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Email', style: TextStyle(color: greyColor)),
          Text(text!,
            style: TextStyle(color: blackColor, fontWeight: FontWeight.w700)
          ),
        ]
      ),
    );
  }

  Widget _countryInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Country', style: TextStyle(color: greyColor)),
          Text(text!,
            style: TextStyle(color: blackColor, fontWeight: FontWeight.w700)
          ),
        ]
      ),
    );
  }

  Widget _phoneNumberInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Phone Number', style: TextStyle(color: greyColor)),
          Text(text!,
            style: TextStyle(color: blackColor, fontWeight: FontWeight.w700)
          ),
        ]
      ),
    );
  }

  Widget _dobInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Phone Number', style: TextStyle(color: greyColor)),
          Text(text!,
            style: TextStyle(color: blackColor, fontWeight: FontWeight.w700)
          ),
        ]
      ),
    );
  }

  Widget _nationalInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Nationality', style: TextStyle(color: greyColor)),
          Text(text!,
            style: TextStyle(color: blackColor, fontWeight: FontWeight.w700)
          ),
        ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Info(model: model,)
              ), 

              IconButton(
                onPressed: (){
                  edit!();
                }, 
                icon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300]
                  ),
                  padding: const EdgeInsets.all(5),
                  child: model!.isEditing ? const Icon(Icons.edit_off_outlined) : const Icon(Icons.edit_outlined) ,
                )
              )

            ],
          ),

          model!.isEditing == true 
          ? Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingSize, vertical: paddingSize),
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: (){
                  edit!();
                }, 
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    HexColor(AppColors.primary)
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)
                    )
                  ),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  alignment: Alignment.center,
                  child: MyText(
                    text: "Submit Edit",
                    fontWeight: FontWeight.w600,
                    color2: Colors.white,
                  )
                )
              ),
            )
          ) 
          : Container(),

          Consumer<IdentifierProvider>(
            builder: (context, provider, widget){
              return model!.isEditing == false 
              ? Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingSize, vertical: paddingSize),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(
                      Colors.transparent
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.red.withOpacity(0.2)
                    ),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13)
                      )
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const IDOption()));
                  }, 
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(12),
                    // ),
                    alignment: Alignment.center,
                    child: MyText(
                      text: "Get your digital ID",
                      fontWeight: FontWeight.w600,
                      color2: Colors.red,
                    )
                  )
                )
              )

              : Container()
              // : Card(
              //   child: Column(
              //     children: [
              //       Image.file(File(provider.identifierModel!.frontImage!), width: 400, height: 200,)
              //     ],
              //   ),
              // )
              ;
            },
          ),
        ]
      )
    );
  }
}

class LinkedAccountInfo extends StatelessWidget {
  const LinkedAccountInfo({Key? key}) : super(key: key);

  Widget _moodleInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Moodle', style: TextStyle(color: greyColor)),
            Text(text!,
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w700)),
          ]),
    );
  }

  Widget _wordpressInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Wordpress', style: TextStyle(color: greyColor)),
            Text(text!,
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w700)),
          ]),
    );
  }

  Widget _koompiLTEInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('KOOMPI LTE', style: TextStyle(color: greyColor)),
            Text(text!,
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w700)),
          ]),
    );
  }

  Widget _twitterInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Twitter', style: TextStyle(color: greyColor)),
            Text(text!,
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w700)),
          ]),
    );
  }

  Widget _googleInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Google', style: TextStyle(color: greyColor)),
            Text(text!,
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w700)),
          ]),
    );
  }

  Widget _facebookInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Facebook', style: TextStyle(color: greyColor)),
            Text(text!,
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w700)),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleDashboard('Linked Social Media', context),
        _moodleInfo('ebc.kh, kru.org'),
        _wordpressInfo('moc.gov.kh, moh.gov.kh'),
        _koompiLTEInfo('Unbounded'),
        _twitterInfo('Unbounded'),
        _googleInfo('Unbounded'),
        _facebookInfo('Unbounded'),
      ],
    );
  }
}

class CryptosAssetInfo extends StatelessWidget {
  const CryptosAssetInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.fromLTRB(30, 15, 30, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: const BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          child: ListTile(
            leading: Image(image: assetList[index].image!, height: 40, width: 40),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  assetList[index].title!.toUpperCase(),
                  style: TextStyle(color: darkGreen, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
                Text(
                  assetList[index].balance!,
                  style: TextStyle(color: darkGreen, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: assetList.length,
    );
  }
}

class StoragesInfo extends StatelessWidget {
  const StoragesInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleDashboard('Content Storages', context),
      ],
    );
  }
}

class ToolsInfo extends StatelessWidget {
  const ToolsInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleDashboard('Tools', context),
      ],
    );
  }
}

class AddButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  const AddButton({this.text, this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xffffffff);

    const double borderRadius = 12;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
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
                        borderRadius: BorderRadius.circular(borderRadius)),
                  )),
              onPressed: onPressed,
              child: Text(
                text!,
                style: const TextStyle(color: accentColor, fontSize: 18),
              ),
            ),
        ),
      ),
    );
  }
}

class PeerProgress extends StatelessWidget {
  final int num;
  const PeerProgress(this.num, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
      child: SetupProgressIndicator(num),
    );
  }
}
