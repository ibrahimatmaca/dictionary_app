import 'package:easy_localization/easy_localization.dart';

extension StringLocalization on String {
  String get locale => this.tr();
  String localeArgs([args]) => this.tr(args: args);
}
