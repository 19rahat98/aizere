import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_synthesis/config/base_provider.dart';
import 'package:speech_synthesis/config/theme.dart';
import 'package:speech_synthesis/presentation/home_page/provider/synthes_provider.dart';
import 'package:speech_synthesis/presentation/widgets/customSpacer.dart';
import 'package:speech_synthesis/presentation/widgets/keyboard_dismisser.dart';

class HomePageScreen extends StatefulWidget {

  final String requestUrl;

  const HomePageScreen({Key key,@required this.requestUrl}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.appMainColor,
      body: KeyboardDismisser(
        child: BaseProvider<SynthesisProvider>(
            model: SynthesisProvider(),
            builder: (context, model, child) {
            return SafeArea(
              bottom: false,
              child: LayoutBuilder(builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.only(
                      top: 16.h,
                    ),
                    physics: BouncingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: constraints.maxWidth,
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: SvgPicture.asset(
                                    AppSvgImages.ic_main_application_label,
                                    width: 140,
                                    height: 35,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 20),
                                  child: IconButton(
                                    iconSize: 24.h,
                                    icon: SvgPicture.asset(
                                      AppSvgImages.ic_backspace,
                                    ),
                                    onPressed: () {
                                      model.textEditingController.clear();
                                      model.newTextValue = true;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    topLeft: Radius.circular(20.0),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: w,
                                        margin: EdgeInsets.only(top: 20),
                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        alignment: Alignment.topLeft,
                                        child: Form(
                                          autovalidateMode: AutovalidateMode.always,
                                          key: _formKey,
                                          child: TextFormField(
                                            toolbarOptions: ToolbarOptions(
                                              copy: true,
                                              cut: true,
                                              paste: true,
                                              selectAll: true,
                                            ),
                                            keyboardType: TextInputType.multiline,
                                            maxLines: 15,
                                            controller: model.textEditingController,
                                            style: TextStyle(
                                              height: 1.4,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            onChanged: (value){
                                              model.newTextValue = true;
                                            },
                                            validator: (textValue){
                                              if(textValue.length < 1)
                                                return 'Сөзді енгізіңіз';
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              alignLabelWithHint: true,
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              hintText: 'Сөзді енгізіңіз',
                                              hintStyle: TextStyle(
                                                fontSize: 18.sp,
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
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        ColumnSpacer(2.6),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 16),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Жылдамдық (${model.playerSpeed.toStringAsFixed(2)}х)',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18.sp,
                                                      fontWeight: FontWeight.bold),),
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Container(
                                                child: Slider.adaptive(
                                                    value: model.playerSpeed,
                                                    min: 0.5,
                                                    max: 2.0,
                                                    divisions: 10,
                                                    activeColor: AppColors.sliderColor,
                                                    inactiveColor: Colors.black,
                                                    label: 'Оқу жылдамдамдығы: ${model.playerSpeed.toStringAsFixed(2)}x',
                                                    onChanged: (double newValue) {
                                                      //model.changePlayerSpeed(_value);
                                                      model.changePlayerSpeed(newValue);
                                                      model.playerSpeed = newValue;
                                                    },
                                                    semanticFormatterCallback: (double newValue) {
                                                      return '${newValue.round()} dollars';
                                                    }
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        ColumnSpacer(2.6),
                                      ],
                                    ),

                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    height: 60.h,
                                                    margin: EdgeInsets.symmetric(horizontal: 16),
                                                    child: ElevatedButton(
                                                      onPressed: () async{
                                                        if(!model.loadingState && _formKey.currentState.validate())
                                                          model.playAudio(
                                                            widget.requestUrl,
                                                          );
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        primary: AppColors.appCustomPurpleColor,
                                                        textStyle: TextStyle(
                                                            fontSize: 18.sp,
                                                            fontWeight: FontWeight.bold),),
                                                      child: Container(
                                                        padding: EdgeInsets.symmetric(horizontal: 12),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        child: !model.playingAudio ?  Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            SvgPicture.asset(AppSvgImages.ic_play_button),
                                                            Text('Тыңдау'.toUpperCase()),
                                                            SizedBox(),
                                                          ],
                                                        ) : Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Icon(Icons.pause, size: 36,),
                                                            Text('Кідірту'.toUpperCase()),
                                                            SizedBox(),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if(model.loadingState)
                                                    Container(
                                                      height: 60.h,
                                                      margin: EdgeInsets.symmetric(horizontal: 16),
                                                      color: Colors.transparent.withOpacity(0.6),
                                                      child: Center(
                                                        child: CircularProgressIndicator(),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 60.h,
                                              width: 60.h,
                                              margin: EdgeInsets.only(right: 16),
                                              child: ElevatedButton(
                                                onPressed: (){
                                                  model.stopPlayer();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: AppColors.sliderColor,
                                                  padding: EdgeInsets.all(0),
                                                  textStyle: TextStyle(
                                                      fontSize: 18.sp,
                                                      fontWeight: FontWeight.bold),),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Icon(Icons.stop, size: 34,)
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        ColumnSpacer(5),
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
                }
              ),
            );
          }
        ),
      ),
    );
  }
}
