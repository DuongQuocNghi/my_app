import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/commons/views/navigation_bar_view.dart';
import 'package:my_app/local/local.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/pages/save_contacts/bloc/save_contacts_bloc.dart';
import 'package:my_app/pages/save_contacts/bloc/save_contacts_event.dart';
import 'package:my_app/pages/save_contacts/bloc/save_contacts_state.dart';

class SaveContactsPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute(builder: (context) => const SaveContactsPage());
  }

  const SaveContactsPage({super.key,});

  @override
  State<StatefulWidget> createState() => _SaveContactsPageState();
}

class _SaveContactsPageState extends State<SaveContactsPage> {

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
      locale: Locale(appLanguage),
      child: BlocProvider(
        create: (_) => SaveContactsBloc()..add(SaveContactsInitial()),
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: BlocBuilder<SaveContactsBloc, SaveContactsState>(
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

  Widget _buildHeader(BuildContext context, SaveContactsState state){
    return Column(
      children: [
        NavigationBarView(
          titleText: AppLocalizations.of(context)?.save_contacts,
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, SaveContactsState state){
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
