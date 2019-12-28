import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/models/cart.dart';
import 'screen/catalog.dart';
import 'screen/cart.dart';
import 'common/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [

        Provider(create: (context) => CatalogModel()),

        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel.empty(),
          update: (context, catalog, previousCart) =>
              CartModel(catalog, previousCart),
        ),
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => MyCatalog(),
          '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}
