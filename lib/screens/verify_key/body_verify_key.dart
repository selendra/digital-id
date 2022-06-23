import 'package:digital_id/all_export.dart';
import 'package:digital_id/components/custom_button.c.dart';
import 'package:digital_id/components/seeds_c.dart';
import 'package:digital_id/models/create_key_m.dart';
import 'package:flutter/material.dart';

class VerifyPassphraseBody extends StatelessWidget {

  final CreateKeyModel? createKeyModel;
  final Function? verify;
  final Function? onTap;
  final Function? remove3Seeds;

  const VerifyPassphraseBody({
    Key? key, 
    this.createKeyModel,
    this.verify,
    this.onTap,
    this.remove3Seeds
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: HexColor(AppColors.darkBgd),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(left: paddingSize, right: paddingSize, bottom: paddingSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[


                SeedContents(
                  title: 'Verify Seed', 
                  subTitle: 'Almost done. Please input the words in the numerical order.'
                ),
  
                SizedBox(height: 7),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: HexColor(AppColors.whiteColor).withOpacity(0.06),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: SeedsCompoent().getColumn(context, createKeyModel!.tmpSeed!, 0, moreSize: 2.5),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: SeedsCompoent().getColumn(context, createKeyModel!.tmpSeed!, 1, moreSize: 2.5),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: SeedsCompoent().getColumn(context, createKeyModel!.tmpSeed!, 2, moreSize: 2.5),
                          ),
                        ],
                      ),
                    ],
                  )
                ),
  
                if (createKeyModel!.tmpThreeNum!.isNotEmpty) Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: createKeyModel!.tmpThreeNum!.length,
                      itemBuilder: (context, i){
                        return SeedsCompoent().seedContainer(context, createKeyModel!.lsSeeds![int.parse(createKeyModel!.tmpThreeNum![i])], int.parse(createKeyModel!.tmpThreeNum![i]), i, onTap);
                      }
                    ),
                  ),
                ),
  
                SizedBox(height: 3),
                // Display Refresh Button When User Fill Out All
                if (createKeyModel!.tmpThreeNum!.length == 0)
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Iconsax.refresh, color: HexColor(AppColors.whiteColor)),
                          SizedBox(width: 9),
                          MyText(
                            text: "Try Again",
                            fontSize: 14,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,  
                          ),
                        ],
                      ),
                    ),
                    onTap: () => remove3Seeds!()
                  ),
                ),
  
                Flexible(child: Container()),
                MyGradientButton(
                  textButton: "Continue",
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  action: () {
                    verify!();
                  },
                )
              ],
            ),
          ),
        ),
      )
    );
  }

}
