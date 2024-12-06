import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/local/local.dart';
import 'package:my_app/pages/deep_linking/deep_linking_page.dart';
import 'package:my_app/pages/home/home_page.dart';

void main() async {
  runApp(MaterialApp.router(
    title: AppName,
    routerConfig: router,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
  ));
}

/// This handles deepLink.
final router = GoRouter(
  errorBuilder: (_, __) => const HomePage(),
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomePage(),
      routes: [
        GoRoute(
          path: 'details/:data',
          builder: (context, state) {
            // demo: https://example.com/details/123
            var data = state.pathParameters['data'];
            return DeepLinkingPage(data: data,);
          },
        ),
      ],
    ),
  ],
);
