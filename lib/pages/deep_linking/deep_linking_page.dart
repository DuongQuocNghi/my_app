import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/commons/views/navigation_bar_view.dart';
import 'package:my_app/local/local.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/pages/deep_linking/bloc/deep_linking_bloc.dart';
import 'package:my_app/pages/deep_linking/bloc/deep_linking_event.dart';
import 'package:my_app/pages/deep_linking/bloc/deep_linking_state.dart';

// https://docs.flutter.dev/ui/navigation/deep-linking
class DeepLinkingPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute(builder: (context) => DeepLinkingPage());
  }

  DeepLinkingPage({super.key, this.data});
  String? data;

  @override
  State<StatefulWidget> createState() => _DeepLinkingPageState();
}

class _DeepLinkingPageState extends State<DeepLinkingPage> {

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
        create: (_) => DeepLinkingBloc()..add(DeepLinkingInitial()),
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: BlocBuilder<DeepLinkingBloc, DeepLinkingState>(
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

  Widget _buildHeader(BuildContext context, DeepLinkingState state){
    return Column(
      children: [
        NavigationBarView(
          titleText: AppLocalizations.of(context)?.deep_linking,
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, DeepLinkingState state){
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(widget.data ?? ''),
          ],
        ),
      ),
    );
  }

}
