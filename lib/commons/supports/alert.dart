import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/commons/views/button.dart';

class AppAlert{
  static void showWarningToast(String msg, {Toast toastLength = Toast.LENGTH_SHORT}) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.BOTTOM,
        toastLength: toastLength,
        backgroundColor: Colors.amberAccent,
        textColor: Colors.black);
  }

  static void showSuccessToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.lightGreenAccent,
        textColor: Colors.black);
  }

  static void showPopupMenuBottom(BuildContext context,{required List<MenuBottom> items, ValueChanged<Map<String,dynamic>>? onPressed}){
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 16,),
                  Flexible(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: Container(
                        color: Colors.white,
                        child: ListView(
                          shrinkWrap: true,
                          children: items.map(
                                  (e) => Column(
                                children: [
                                  ListTile(
                                    leading: e.icon,
                                    title: Text(e.title ?? '', style: TextStyle(
                                        color: e.color
                                    ),),
                                    onTap: () {
                                      Navigator.pop(context);
                                      onPressed?.call({
                                        'index':items.indexOf(e),
                                        'data':e.data
                                      });
                                    },
                                  ),
                                  if(e != items.last)
                                    Container(height: 1, color: Colors.grey.shade200,),
                                ],
                              )
                          ).toList(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  AppButton(
                    height: 46,
                    borderRadius: 23,
                    width: double.infinity,
                    title: AppLocalizations.of(context)?.close ?? '',
                    onPressed: ()=> Navigator.pop(context),
                  ).secondary()
                ],
              ),
            ),
          );
        });
    }
}

class MenuBottom<K>{
  MenuBottom({this.icon, this.title, this.data, this.color = Colors.black});
  final Widget? icon;
  final String? title;
  final K? data;
  final Color? color;
}
