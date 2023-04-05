import 'package:aizere_app/common/widgets/app_common_divider_widget.dart';
import 'package:aizere_app/common/widgets/app_search_textfield.dart';
import 'package:aizere_app/common/widgets/app_sliver_header.dart';
import 'package:aizere_app/common/widgets/screen_wrapper.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/library/presentation/ui/widgets/library_tab_bar.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/ui/speech_synthesis_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final _controller = ScrollController();

  @override
  void initState() {
    _tabController = TabController(
      length: 11,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      top: true,
      bottom: false,
      backGround: AppColors.black,
      body: NestedScrollView(
        controller: _controller,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 60,
                  right: 60,
                  bottom: 64,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppIcons.icLogo,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 24,
                ),
                color: Colors.white,
                child: const AppSearchTextField(),
              ),
            ),
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverSubHeader(
                maxSize: 64,
                child: LibraryTabBarIndicator(
                  controller: _tabController,
                ),
              ),
            ),
          ];
        },
        body: ColoredBox(
          color: Colors.white,
          child: TabBarView(
            controller: _tabController,
            children: List.generate(
              11,
              (index) => ListView.separated(
                itemCount: 3,
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                  top: 64,
                ),
                separatorBuilder: (_, __) => const AppCommonDividerWidget(),
                itemBuilder: (context, index) => Material(
                  color: Colors.transparent,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SpeechSynthesisBuild(
                            text: '''
Бір адам жас баласын жанына алды,
Екеуі сайран етіп кетіп қалды.
Қыдырып әрлі-берлі жүрді дағы,
Егінші егін еккен жерге барды.
Аралап әр егінді қарап жүрді,
Кез еді пісіп болған егін түрлі.
Бастарын дәнге толған төмен салып,
Бидайлар бейне тағзым етіп тұрды.
Жалғыз-ақ бір бидай тұр көкке қарап,
Бейне бір жалғыз өзін көпке балап.
Баланың сол бидайға көзі түсіп,
Білмекке кетті көңіл жөнін сұрап:
«Құбылып бидайлар тұр басын салып,
Жіберген мырза Құдай нұрға қанып.
«Әй, әке, мұның мәнін түсіндірші,
Бір іске тұрмын өзім қайран қалып.
Бұл Бидай көтеріп тұр басын көкке,
Қарайды шекірейіп өзі көпке.
Өзіне өзгелерді теңгермейтін,
Соншама бұл бидайдың дәні көп пе?»
«Айтайын мұның мәнін, балам, саған,
Шырағым, түрін көріп таңданба оған.
Өзгесі төмен қарап бүгілгенде,
Ойлама кем екен деп бәрі сонан».
Және де әкесі айтты баласына:
«Сұқтанба құр сорайған қарасына.
Құдайым өзгесіне дән бергенде,
Бұл бидай дәнсіз қапты арасында.
Бидайлар басы толық иіліп тұр,
Дән берген қожасына сыйынып тұр.
Басында бұл бидайдың дәні болмай,
Кекірейіп, көкке қарап, бүлініп тұр.
«Елде көп бұл бидайдай адам, - дейді,
Тәкаппар, оны халық, жаман, - дейді.
- Қалпы емес тәккапарлық данышпанның,
Тұтынба бұл мінезді, балам», - дейді.
                            ''',
                          ),
                        ),
                      );
                    },
                    title: Text(
                      'Егіннің бастары',
                      style: AppTextStyle.body.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: const Text(
                      'Ахмет Байтұрсынұлы',
                      style: AppTextStyle.regular,
                    ),
                    leading: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.monoGrey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SvgPicture.asset(
                        AppIcons.icBook,
                      ),
                    ),
                    trailing: SvgPicture.asset(
                      AppIcons.icPlayFilled,
                      color: AppColors.mainBlue,
                      width: 32,
                      height: 32,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 16,
                    ),
                    dense: false,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
