import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speech_synthesis/config/base_provider.dart';

import 'package:speech_synthesis/config/theme.dart';
import 'package:speech_synthesis/presentation/home_page/provider/synthes_provider.dart';
import 'package:speech_synthesis/presentation/widgets/customSpacer.dart';
import 'package:speech_synthesis/presentation/widgets/dash_line.dart';

class SecondSplashPage extends StatelessWidget {
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
              child: Stack(
                children: [
                  Container(
                    width: w,
                    margin: EdgeInsets.only(top: 40),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2. «Дыбыстау»  батырмасын басыңыз”',
                          style: TextStyle(
                            fontSize: 24,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        ColumnSpacer(4),
                        Container(
                          width: w,
                          child: Center(
                            child: Image.asset(
                              AppPngImages.picture_splashPage3,
                              fit: BoxFit.fill,
                              width: 280,
                              height: 280,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 150,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: (){
                        if(!model.player.playing)
                          model.playAssetsAudioFile('assets/audio/audioGreeting.mp3');
                      },
                      child: SvgPicture.asset(
                        AppSvgImages.ic_sound_with_border,
                      ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RowSpacer(2),
                              Container(
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
                              Expanded(
                                child: MySeparator(height: 2, color: AppColors.whiteColor,),
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
                                child: MySeparator(height: 2, color: AppColors.whiteColor,),
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 2, color: Colors.white)
                                ),
                                child: Center(
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteColor
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
