import 'package:auth_front_end/core/binding/bindings.dart';
import 'package:auth_front_end/core/localization/change_locale.dart';
import 'package:auth_front_end/core/localization/translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routes/routes_list.dart';
import 'core/services/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocalController());
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialBinding: MyBindings(),
        translations: MyTranslation(),
        locale: LocalController.language,
        theme: LocalController.myTheme,
        getPages: routesList);
  }
}
