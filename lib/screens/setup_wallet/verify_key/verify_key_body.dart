import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/services/storage.dart';

class VerifyPassphraseBody extends StatelessWidget {
  final TextEditingController phraseKey;
  final String? rd1, rd2, rd3;
  final Function? verify;

  const VerifyPassphraseBody({
    Key? key, 
    required this.phraseKey,
    this.rd1,
    this.rd2,
    this.rd3,
    this.verify
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    var correctHeight = height - padding.top - padding.bottom;

    return Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? correctHeight
                  : MediaQuery.of(context).size.height * 2,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(children: <Widget>[
                  const PeerProgress(2),
                  SizedBox(
                    height: 100,
                    child: Center(
                      child: Text(
                        'Verify Phrase',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Text(
                                  'Enter the following word from your recovery phrase to complete the set up process.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "Word #$rd1, Word #$rd2, and Word #$rd3",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue
                                ),
                              ),
                              const SizedBox(height: 20),
                              VerifyPassphraseInput(textEditingController: phraseKey),
                              const SizedBox(height: 20),
                              CustomButton(
                                colorBtn: primaryColor,
                                colorText: whiteColor,
                                text: 'Verify',
                                onPressed: () async {
                                  await verify!();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ));
  }
}
