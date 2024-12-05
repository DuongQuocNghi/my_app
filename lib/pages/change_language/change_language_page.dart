import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/commons/views/button.dart';
import 'package:my_app/commons/views/navigation_bar_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/pages/change_language/bloc/change_language_bloc.dart';
import 'package:my_app/pages/change_language/bloc/change_language_event.dart';
import 'package:my_app/pages/change_language/bloc/change_language_state.dart';

class ChangeLanguagePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute(builder: (context) => const ChangeLanguagePage());
  }

  const ChangeLanguagePage({super.key,});

  @override
  State<StatefulWidget> createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {

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
      create: (_) => ChangeLanguageBloc()..add(ChangeLanguageInitial()),
      child: Scaffold(
        body: BlocBuilder<ChangeLanguageBloc, ChangeLanguageState>(
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
          titleText: AppLocalizations.of(context)?.change_language,
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, ChangeLanguageState state){
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ApButton(title: 'asd',).outline()
          ],
        ),
      ),
    );
  }
}
