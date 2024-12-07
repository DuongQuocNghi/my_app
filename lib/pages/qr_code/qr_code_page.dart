import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/assets/icons.dart';
import 'package:my_app/commons/views/button.dart';
import 'package:my_app/commons/views/navigation_bar_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/local/local.dart';
import 'package:my_app/pages/qr_code/bloc/qr_code_bloc.dart';
import 'package:my_app/pages/qr_code/bloc/qr_code_event.dart';
import 'package:my_app/pages/qr_code/bloc/qr_code_state.dart';
import 'package:my_app/pages/scan_qr_code/scan_qr_code_page.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute(builder: (context) => const QRCodePage());
  }

  const QRCodePage({super.key,});

  @override
  State<StatefulWidget> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {

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
        create: (_) => QRCodeBloc()..add(QRCodeInitial()),
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: BlocBuilder<QRCodeBloc, QRCodeState>(
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

  Widget _buildHeader(BuildContext context, QRCodeState state){
    return Column(
      children: [
        NavigationBarView(
          titleText: AppLocalizations.of(context)?.qr_code,
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, QRCodeState state){
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16,),
              QrImageView(
                data: 'This QR code has an embedded image as well',
                backgroundColor: AppColors.onPrimaryLight,
                version: QrVersions.auto,
                gapless: true,
                embeddedImage: AppIcons.logo_aiai_dark.iconAssetImage(),
                embeddedImageStyle: const QrEmbeddedImageStyle(
                  size: Size(72, 72),
                ),
              ),
              const SizedBox(height: 16,),
              AppButton(title: AppLocalizations.of(context)?.scan_qr_code,
                onPressed: (){
                  Navigator.of(context).push(ScanQRCodePage.route());
                },
              ).primary()

            ],
          ),
        ),
      ),
    );
  }
}
