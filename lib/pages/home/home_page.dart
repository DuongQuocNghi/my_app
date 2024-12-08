import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/commons/supports/alert.dart';
import 'package:my_app/commons/views/navigation_bar_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/local/local.dart';
import 'package:my_app/pages/barcode/barcode_page.dart';
import 'package:my_app/pages/change_language/change_language_page.dart';
import 'package:my_app/pages/change_theme/change_theme_page.dart';
import 'package:my_app/pages/deep_linking/deep_linking_page.dart';
import 'package:my_app/pages/home/bloc/home_bloc.dart';
import 'package:my_app/pages/home/bloc/home_event.dart';
import 'package:my_app/pages/home/bloc/home_state.dart';
import 'package:my_app/pages/qr_code/qr_code_page.dart';

class HomePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute(builder: (context) => const HomePage());
  }

  const HomePage({super.key,});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    Local.dataLocal.getLanguage().then((v){
      if(v!=null && AppLanguage != v){
        setState(() {
          AppLanguage = v;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: Locale(AppLanguage),
      child: BlocProvider(
        create: (_) => HomeBloc()..add(HomeInitial()),
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Column(
                children: [
                  _buildHeader(context, state),
                  _buildBody(context, state)
                ],
              );
            },
          )
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, HomeState state){
    return Column(
      children: [
        NavigationBarView(
          titleText: AppLocalizations.of(context)?.hello,
          actionLeft: const [],
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, HomeState state){
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildItem(title: AppLocalizations.of(context)?.change_language ?? '', onTap: (){
              Navigator.of(context).push(ChangeLanguagePage.route()).then((v)=> setState(() {}));
            }),
            _buildItem(title: AppLocalizations.of(context)?.change_theme ?? '', onTap: (){
              Navigator.of(context).push(ChangeThemePage.route());
            }),
            _buildItem(title: AppLocalizations.of(context)?.deep_linking ?? '', onTap: (){
              Navigator.of(context).push(DeepLinkingPage.route());
            }),
            _buildItem(title: AppLocalizations.of(context)?.qr_code ?? '', onTap: (){
              Navigator.of(context).push(QRCodePage.route());
            }),
            _buildItem(title: AppLocalizations.of(context)?.barcode ?? '', onTap: (){
              Navigator.of(context).push(BarcodePage.route());
            }),
            _buildItem(title: 'Lưu danh bạ',),
            _buildItem(title: 'Bản đồ chỉ đường',),
            _buildItem(title: 'Bản đồ quy hoạch',),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({required String title, Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: GestureDetector(
        onTap: onTap ?? ()=> AppAlert.showWarningToast(AppLocalizations.of(context)?.coming_soon ?? ''),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.onBackground_2,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyle(color: AppColors.onBackground_9),),
                Icon(Icons.arrow_forward_ios, size: 16,color: AppColors.onBackground_9),
              ],
            ),
          ),
        ),
      ),
    );
  }

}