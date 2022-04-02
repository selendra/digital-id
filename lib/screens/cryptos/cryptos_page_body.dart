import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';

class CryptosPageBody extends StatelessWidget {
  const CryptosPageBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: MyNestedScrollView(
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const DashboardOptions(),
                titleDashboard('Cryptos Assets', context),
                const CryptosAssetInfo(),
                AddButton(
                  text: 'Add Asset',
                  onPressed: () {}
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}