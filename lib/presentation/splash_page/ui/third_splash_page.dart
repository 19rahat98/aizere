import 'package:flutter/material.dart';
import 'package:speech_synthesis/config/base_provider.dart';

import 'package:speech_synthesis/config/theme.dart';
import 'package:speech_synthesis/presentation/home_page/provider/synthes_provider.dart';
import 'package:speech_synthesis/presentation/home_page/ui/home_page_screen.dart';
import 'package:speech_synthesis/presentation/widgets/customSpacer.dart';
import 'package:speech_synthesis/presentation/widgets/dash_line.dart';

class ThirdSplashPage extends StatelessWidget {
  final String requestUrl;

  const ThirdSplashPage({Key key, @required this.requestUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BaseProvider<SynthesisProvider>(
      model: SynthesisProvider(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.appMainColor,
          body: SafeArea(
            bottom: false,
            child: Container(
              width: w,
              height: h,
              //padding: EdgeInsets.only(top: 40, bottom: 70),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: 320,
                      height: 550,
                      child: Image.asset(
                        AppPngImages.picture_splashPage2,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    width: w,
                    margin: EdgeInsets.only(top: 40),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '3. Қолданбаға фонда жұмыс істеуге рұқсат беріңіз',
                          style: TextStyle(
                            fontSize: 24,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 24,
                    right: 24,
                    //alignment: Alignment.bottomCenter,
                    child: Container(
                      width: w * 0.8,
                      margin: EdgeInsets.only(bottom: 70),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () async {
                                model.setValueToSP(true);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePageScreen(
                                      requestUrl: requestUrl,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.whiteColor,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Рұқсат ету'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 18, color: AppColors.appMainColor, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ColumnSpacer(2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RowSpacer(2),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.appMainColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: MySeparator(
                                  height: 2,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.appMainColor,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: MySeparator(
                                  height: 2,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.appMainColor,
                                    ),
                                  ),
                                ),
                              ),
                              RowSpacer(1.4),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
