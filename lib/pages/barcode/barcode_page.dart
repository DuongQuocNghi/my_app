import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/commons/views/button.dart';
import 'package:my_app/commons/views/navigation_bar_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/local/local.dart';
import 'package:my_app/pages/barcode/bloc/barcode_bloc.dart';
import 'package:my_app/pages/barcode/bloc/barcode_event.dart';
import 'package:my_app/pages/barcode/bloc/barcode_state.dart';
import 'package:my_app/pages/scan_code/scan_code_page.dart';

// demo: https://davbfr.github.io/dart_barcode/#/
class BarcodePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute(builder: (context) => const BarcodePage());
  }

  const BarcodePage({super.key,});

  @override
  State<StatefulWidget> createState() => _BarcodePageState();
}

class _BarcodePageState extends State<BarcodePage> {

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
        create: (_) => BarcodeBloc()..add(BarcodeInitial()),
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: BlocBuilder<BarcodeBloc, BarcodeState>(
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

  Widget _buildHeader(BuildContext context, BarcodeState state){
    return Column(
      children: [
        NavigationBarView(
          titleText: AppLocalizations.of(context)?.barcode,
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, BarcodeState state){
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16,),
              BarcodeWidget(
                barcode:  Barcode.code93(),
                data: "HELLO WORLD",
              ),
              const SizedBox(height: 16,),
              AppButton(title: AppLocalizations.of(context)?.scan_qr_code,
                onPressed: (){
                  Navigator.of(context).push(ScanCodePage.route());
                },
              ).primary()

            ],
          ),
        ),
      ),
    );
  }
}
