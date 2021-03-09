import 'package:easy_ecommerce/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/app_routes.dart';
import '../themes/dark.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../generated/l10n.dart';
import 'package:provider/provider.dart';

import 'app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:overlay_support/overlay_support.dart';
import '../services/services.dart';
import '../external/fake_store_client.dart';
import '../themes/light.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppWidgetState();
}

class AppWidgetState extends State<App> {
  final navigatorKey = GlobalKey<NavigatorState>();
  AppProvider appProvider;

  @override
  void initState() {
    super.initState();
    appProvider = AppProvider(navigatorKey, () => setState(() {}));

    var storeClient = new FakeStoreClient();
    storeClient.onHttpResponse().listen((response) {
      if (navigatorKey.currentState == null) return;
      var context = navigatorKey.currentState.overlay.context;
      if (response?.statusCode == 401) {
        context.read<AppProvider>().appRoutes.goToLoginPage(context);
      } else if (response == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Unknown Error Has Occurred'),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Network Error'),
        ));
      }
    });
    ServcieBase.setClient(storeClient);

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (context.read<AuthBloc>().user != null)
    //     UserService.instance.isAuthinticated().then((isAuthinticated) {
    //       if (navigatorKey.currentState == null) return;
    //       var context = navigatorKey.currentState.overlay.context;
    //       if (isAuthinticated) {
    //         context.read<AppProvider>().appRoutes.goToHomePage(context);
    //       } else {
    //         context.read<AppProvider>().appRoutes.goToLoginPage(context);
    //       }
    //     });
    // });
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => this.appProvider),
        Provider(create: (_) => new AuthBloc()),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          context.read<AppProvider>().appRoutes.goToHomePage(context);
        },
        child: MaterialApp(
          title: 'ecommerce',
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          initialRoute: AppRoutes.LOADING,
          routes: this.appProvider.appRoutes.routes,
          localizationsDelegates: [
            I18n.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: I18n.delegate.supportedLocales,
          locale: this.appProvider.locale,
          theme: lightTheme(context),
          darkTheme: darkTheme(context),
          themeMode: this.appProvider.themeMode,
        ),
      ),
    );
  }
}
