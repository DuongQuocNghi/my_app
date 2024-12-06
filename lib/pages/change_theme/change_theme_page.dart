import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/assets/colors.dart';
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
          backgroundColor: Colors.teal,
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
                children: [
                  Expanded(child: _buildColor(context, AppLightTheme(), name: 'LightTheme')),
                  const SizedBox(width: 16,),
                  Expanded(child: _buildColor(context, AppDarkTheme(), name: 'DarkTheme')),
                ],
              ),
              const SizedBox(height: 16,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColor(BuildContext context, AppColor apColor, {String? name, Function()? onTap}){
    return GestureDetector(
      onTap: (){
        setState(() {
          AppColors = apColor;
        });
      },
      child: Column(
        children: [
          Icon(AppColors.runtimeType == apColor.runtimeType ? Icons.check_circle_rounded:Icons.circle_outlined),
          const SizedBox(height: 8,),
          Container(
            decoration: BoxDecoration(
              color: apColor?.background,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name ?? '', style: TextStyle(color: apColor?.onBackground_9 ?? Colors.transparent),),
                  const SizedBox(height: 8,),
                  _buildItemColor(context, color: apColor?.highlight_1, name: 'highlight_1', apColor: apColor),
                  _buildItemColor(context, color: apColor?.highlight_2, name: 'highlight_2', apColor: apColor),
                  _buildItemColor(context, color: apColor?.highlight_3, name: 'highlight_3', apColor: apColor),
                  _buildItemColor(context, color: apColor?.green_1, name: 'green_1', apColor: apColor),
                  _buildItemColor(context, color: apColor?.green_2, name: 'green_2', apColor: apColor),
                  _buildItemColor(context, color: apColor?.green_3, name: 'green_3', apColor: apColor),
                  _buildItemColor(context, color: apColor?.green_4, name: 'green_4', apColor: apColor),
                  _buildItemColor(context, color: apColor?.red_1, name: 'red_1', apColor: apColor),
                  _buildItemColor(context, color: apColor?.red_2, name: 'red_2', apColor: apColor),
                  _buildItemColor(context, color: apColor?.red_3, name: 'red_3', apColor: apColor),
                  _buildItemColor(context, color: apColor?.red_4, name: 'red_4', apColor: apColor),
                  _buildItemColor(context, color: apColor?.blue_1, name: 'blue_1', apColor: apColor),
                  _buildItemColor(context, color: apColor?.blue_2, name: 'blue_2', apColor: apColor),
                  _buildItemColor(context, color: apColor?.blue_3, name: 'blue_3', apColor: apColor),
                  _buildItemColor(context, color: apColor?.blue_4, name: 'blue_4', apColor: apColor),
                  _buildItemColor(context, color: apColor?.violet_1, name: 'violet_1', apColor: apColor),
                  _buildItemColor(context, color: apColor?.violet_2, name: 'violet_2', apColor: apColor),
                  _buildItemColor(context, color: apColor?.violet_3, name: 'violet_3', apColor: apColor),
                  _buildItemColor(context, color: apColor?.violet_4, name: 'violet_4', apColor: apColor),
                  _buildItemColor(context, color: apColor?.onSupportLight, name: 'onSupportLight', apColor: apColor),
                  _buildItemColor(context, color: apColor?.background, name: 'background', apColor: apColor),
                  _buildItemColor(context, color: apColor?.surface, name: 'surface', apColor: apColor),
                  _buildItemColor(context, color: apColor?.onBackground_1, name: 'onBackground_1', apColor: apColor),
                  _buildItemColor(context, color: apColor?.onBackground_2, name: 'onBackground_2', apColor: apColor),
                  _buildItemColor(context, color: apColor?.onBackground_3, name: 'onBackground_3', apColor: apColor),
                  _buildItemColor(context, color: apColor?.onBackground_4, name: 'onBackground_4', apColor: apColor),
                  _buildItemColor(context, color: apColor?.onBackground_5, name: 'onBackground_5', apColor: apColor),
                  _buildItemColor(context, color: apColor?.onBackground_6, name: 'onBackground_6', apColor: apColor),
                  _buildItemColor(context, color: apColor?.onBackground_7, name: 'onBackground_7', apColor: apColor),
                  _buildItemColor(context, color: apColor?.onBackground_8, name: 'onBackground_8', apColor: apColor),
                  _buildItemColor(context, color: apColor?.onBackground_9, name: 'onBackground_9', apColor: apColor),
                  _buildItemColor(context, color: apColor?.primary_0, name: 'primary_0', apColor: apColor),
                  _buildItemColor(context, color: apColor?.primary_1, name: 'primary_1', apColor: apColor),
                  _buildItemColor(context, color: apColor?.primary_2, name: 'primary_2', apColor: apColor),
                  _buildItemColor(context, color: apColor?.primary_3, name: 'primary_3', apColor: apColor),
                  _buildItemColor(context, color: apColor?.primary_4, name: 'primary_4', apColor: apColor),
                  _buildItemColor(context, color: apColor?.primary_5, name: 'primary_5', apColor: apColor),
                  _buildItemColor(context, color: apColor?.primary_6, name: 'primary_6', apColor: apColor),
                  _buildItemColor(context, color: apColor?.primary_7, name: 'primary_7', apColor: apColor),
                  _buildItemColor(context, color: apColor?.primary_8, name: 'primary_8', apColor: apColor),
                  _buildItemColor(context, color: apColor?.primary_9, name: 'primary_9', apColor: apColor),
                  _buildItemColor(context, colors: apColor?.primaryGradient, name: 'primaryGradient', apColor: apColor),
                  _buildItemColor(context, color: apColor?.onPrimaryDark, name: 'onPrimaryDark', apColor: apColor),
                  _buildItemColor(context, color: apColor?.onSupportLight, name: 'onSupportLight', apColor: apColor),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: AppButton(title: 'primary',).primary(apColor: apColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: AppButton(title: 'secondary',).secondary(apColor: apColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: AppButton(title: 'subtle',).subtle(apColor: apColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: AppButton(title: 'outline',).outline(apColor: apColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemColor(BuildContext context, {Color? color, List<Color>? colors, String? name, AppColor? apColor}){
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: color,
              gradient: colors == null ? null : LinearGradient(colors: colors),
              border: Border.all(color: apColor?.onBackground_9 ?? Colors.transparent)
            ),
          ),
          const SizedBox(width: 8,),
          Expanded(child: Text(name ?? color?.toString() ?? '', style: TextStyle(color: apColor?.onBackground_9 ?? Colors.transparent),)),
        ],
      ),
    );
  }
}
