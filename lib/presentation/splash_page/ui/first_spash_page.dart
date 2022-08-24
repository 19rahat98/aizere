import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_synthesis/config/base_provider.dart';

import 'package:speech_synthesis/config/theme.dart';
import 'package:speech_synthesis/presentation/splash_page/provider/splash_provider.dart';
import 'package:speech_synthesis/presentation/widgets/customSpacer.dart';
import 'package:speech_synthesis/presentation/widgets/dash_line.dart';

class FistSplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.appMainColor,
      body: BaseProvider<SplashProvider>(
          model: SplashProvider(),
          builder: (context, model, child) {
          return SafeArea(
            bottom: false,
            child: Container(
              width: w,
              height: h,
              padding: EdgeInsets.only(top: 40, bottom: 70.h),
              child: Stack(
                children: [
                  Container(
                    width: w,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Қош келдіңіз!'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        ColumnSpacer(2.6),
                        Text(
                          '1. Алдымен мәтінді енгізіңіз',
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        ColumnSpacer(2.6),
                        Container(
                          width: w,
                          child: Center(
                            child: Image.asset(
                              AppPngImages.picture_splashPage1,
                              height: 100.h,
                              width: 185.w,
                            ),
                          ),
                        ),

                        ColumnSpacer(5),
                        Container(
                          width: w,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          padding: EdgeInsets.only(top: 25, bottom: 25, right: 20, left: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.whiteColor,
                          ),
                          child: TextFormField(
                            initialValue: '''Сәлем. Менің есімім Айзере. Мен саған кез келген мәтінді оқып бере аламын.''',
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              cut: true,
                              paste: true,
                              selectAll: true,
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: 6,
                            //controller: textEditingController,
                            readOnly: true,
                            style: TextStyle(
                              height: 1.4,
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            /*onTap:(){
                              Clipboard.setData(ClipboardData(text: '''Для начала работы введите Ваш текст сюда. Подберите подходящий голос и скорость.
Для начала работы введите Ваш текст сюда. Подберите подходящий голос и скорость.''')).whenComplete(() {
                                final snackBar = SnackBar(
                                  content: Text('Текст скопирован в буфер обмена'),
                                  action: SnackBarAction(
                                    label: 'OK',
                                    onPressed: () {},
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              });
                            },*/
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000).withOpacity(0.42),
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000).withOpacity(0.42),
                                ),
                                contentPadding: EdgeInsets.all(0),
                              ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: w * .8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Container(
                              width: 60.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.appMainColor,
                                    ),
                                  ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: MySeparator(height: 2, color: AppColors.whiteColor,),
                          ),
                          Container(
                            width: 60.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.white)
                            ),
                            child: Center(
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.whiteColor
                                  ),
                                ),
                            ),
                          ),
                          Expanded(
                            child: MySeparator(height: 2, color: AppColors.whiteColor,),
                          ),
                          Container(
                            width: 60.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 2, color: Colors.white)
                            ),
                            child: Center(
                              child: Text(
                                '3',
                                style: TextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.whiteColor
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
