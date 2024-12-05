import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/commons/supports/alert.dart';
import 'package:my_app/commons/views/navigation_bar_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/pages/change_language/change_language_page.dart';
import 'package:my_app/pages/home/bloc/home_bloc.dart';
import 'package:my_app/pages/home/bloc/home_event.dart';
import 'package:my_app/pages/home/bloc/home_state.dart';

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
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(HomeInitial()),
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Column(
              children: [
                _buildHeader(),
                _buildBody(context, state)
              ],
            );
          },
        )
      ),
    );
  }

  Widget _buildHeader(){
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
              Navigator.of(context).push(ChangeLanguagePage.route());
            }),
            _buildItem(title: AppLocalizations.of(context)?.change_theme ?? '',),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({required String title, Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: GestureDetector(
        onTap: onTap ?? ()=> ApAlert.showWarningToast(AppLocalizations.of(context)?.coming_soon ?? ''),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                const Icon(Icons.arrow_forward_ios, size: 16,),
              ],
            ),
          ),
        ),
      ),
    );
  }

}