import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/commons/views/navigation_bar_view.dart';
import 'package:my_app/pages/demo/bloc/demo_bloc.dart';
import 'package:my_app/pages/demo/bloc/demo_event.dart';
import 'package:my_app/pages/demo/bloc/demo_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DemoPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute(builder: (context) => const DemoPage());
  }

  const DemoPage({super.key,});

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // List load more
  // late BuildContext contextPage;
  // final ScrollController _scrollController = ScrollController();
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _scrollController.addListener(_onScroll);
  // }
  //
  // @override
  // void dispose() {
  //   _scrollController
  //     ..removeListener(_onScroll)
  //     ..dispose();
  //   super.dispose();
  // }
  //
  // void _onScroll() {
  //   if (_isBottom) contextPage.read<DemoBloc>().add(DemoFetch());
  // }
  //
  // bool get _isBottom {
  //   if (!_scrollController.hasClients) return false;
  //   final maxScroll = _scrollController.position.maxScrollExtent;
  //   final currentScroll = _scrollController.offset;
  //   return currentScroll >= (maxScroll * 0.8);
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DemoBloc()..add(DemoInitial()),
      child: Scaffold(
        body: BlocBuilder<DemoBloc, DemoState>(
        // List load more
        // body: BlocConsumer<DemoBloc, DemoState>(
        //     listener: (context, state){
        //     contextPage = context;
        //   },
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
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, DemoState state){
    return Expanded(
      child: CustomScrollView(
        // List load more
        // controller: _scrollController,
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
