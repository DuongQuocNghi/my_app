import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/commons/views/navigation_bar_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/local/private_key.dart';
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
    return const Center(
      child: Text(PrivateKey.KeyA),
    );
  }

}
