import 'package:aizere_app/common/widgets/app_custom_app_bar.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  int selectedLanguageIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> languages = [
      'Қазақша',
      'English',
      'Русский',
    ];
    return Scaffold(
      appBar: const AppCustomAppBar(
        title: 'Язык приложение',
        isSettings: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        itemBuilder: (context, index) {
          final isSelected = index == selectedLanguageIndex;
          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              setState(() {
                selectedLanguageIndex = index;
              });
            },
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.grey,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languages[index],
                      style: AppTextStyle.body.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SvgPicture.asset(
                      AppIcons.icTick,
                      color:
                          isSelected ? AppColors.mainBlue : Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (c, i) => const SizedBox(
          height: 16,
        ),
        itemCount: languages.length,
      ),
    );
  }
}
