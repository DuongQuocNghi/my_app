import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/commons/supports/alert.dart';
import 'package:my_app/commons/views/button.dart';
import 'package:my_app/commons/views/navigation_bar_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/local/local.dart';
import 'package:my_app/pages/change_theme/bloc/change_theme_bloc.dart';
import 'package:my_app/pages/change_theme/bloc/change_theme_event.dart';
import 'package:my_app/pages/change_theme/bloc/change_theme_state.dart';

class ChangeThemePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute(builder: (context) => const ChangeThemePage());
  }

  const ChangeThemePage({super.key,});

  @override
  State<StatefulWidget> createState() => _ChangeThemePageState();
}

class _ChangeThemePageState extends State<ChangeThemePage> {

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
    return Localizations.override(
      context: context,
      locale: Locale(AppLanguage),
      child: BlocProvider(
        create: (_) => ChangeThemeBloc()..add(ChangeThemeInitial()),
        child: Scaffold(
          body: BlocBuilder<ChangeThemeBloc, ChangeThemeState>(
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

  Widget _buildHeader(BuildContext context, ChangeThemeState state){
    return Column(
      children: [
        NavigationBarView(
          titleText: AppLocalizations.of(context)?.change_theme,
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, ChangeThemeState state){
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)?.language ?? ''),
                  AppButton(
                    title: AppLocalizations.of(context)?.language_app,
                    onPressed: (){
                      AppAlert.showPopupMenuBottom(
                        context,
                        items: [
                          MenuBottom(
                              title: lookupAppLocalizations(const Locale('vi')).language_app,
                              data: 'vi'
                          ),
                          MenuBottom(
                              title: lookupAppLocalizations(const Locale('en')).language_app,
                              data: 'en'
                          ),
                        ],
                        onPressed:(value) {
                          var data = value['data'];
                          setState(() {
                            AppLanguage = data;
                          });
                          Local.dataLocal.saveLanguage(data);
                        }
                      );
                    },
                  ).outline()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
