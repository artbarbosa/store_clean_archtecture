import 'package:flutter/material.dart';
import 'package:store_clean_archtecture/src/modules/detail/presenter/router/detail_arguments.dart';
import 'package:store_clean_archtecture/src/modules/detail/presenter/ui/detail_page.dart';

class DetailRouter extends StatelessWidget {
  const DetailRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/detail',
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          return MaterialPageRoute(
            builder: (context) {
              return DetailPage(
                detailArguments: settings.arguments as DetailArguments,
              );
            },
          );
        }
        return null;
      },
    );
  }
}
