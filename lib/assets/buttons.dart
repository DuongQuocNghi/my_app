import 'package:flutter/material.dart';
import 'package:my_app/assets/colors.dart';

abstract class AppButtons{
  Widget primary({AppColor? apColor});
  Widget secondary({AppColor? apColor});
  Widget subtle({AppColor? apColor});
  Widget outline({AppColor? apColor});
}