import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  //Values
  double get zeroPointValue => 0;
  double get veryLowValue => 0.005;
  double get lowValue => 0.01;
  double get normalValue => 0.02;
  double get mediumValue => 0.04;
  double get highValue => 0.1;
  double get highValueTwentyPercent => 0.2;
  double get highValueTwentyFivePercent => 0.25;
  double get highValueThirtyPercent => 0.3;
  double get highValueThirtyThreePercent => 0.32;
  double get highValueThirtyFivePercent => 0.35;
  double get highValueFourtyPercent => 0.4;
  double get highValueFiftyPercent => 0.5;
  double get highValueFiftyFivePercent => 0.55;
  double get highValueSixtyPercent => 0.6;
  double get highValueSixtyThreePercent => 0.63;
  double get highValueSixtyFivePercent => 0.65;
  double get highValueEightyPercent => 0.8;

  //Height
  double get height => mediaQuery.size.height;
  double get lowHeightValue => height * lowValue;
  double get normalHeightValue => height * normalValue;
  double get mediumHeightValue => height * mediumValue;
  double get highHeightValue => height * highValue;
  double dynamicHeight(double value) => height * value;

  //Width
  double get width => mediaQuery.size.width;
  double get lowWidthValue => width * lowValue;
  double get normalWidthValue => width * normalValue;
  double get mediumWidthValue => width * mediumValue;
  double get highWidthValue => width * highValue;
  double dynamicWidth(double value) => width * value;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
  InputDecorationTheme get inputDecoration => theme.inputDecorationTheme;
  ColorScheme? get buttonColorScheme => theme.buttonTheme.colorScheme;
  TextTheme get primaryTextTheme => theme.primaryTextTheme;
  DialogTheme get dialogTheme => theme.dialogTheme;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowHeightValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalHeightValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumHeightValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highHeightValue);
}

extension PaddingExtension on BuildContext {
  //Symetric Paddings Vertical
  EdgeInsets get paddingSymmetricLowVertical =>
      EdgeInsets.symmetric(vertical: lowHeightValue);
  EdgeInsets get paddingSymmetricNormalVertical =>
      EdgeInsets.symmetric(vertical: normalHeightValue);
  EdgeInsets get paddingSymmetricMediumVertical =>
      EdgeInsets.symmetric(vertical: mediumHeightValue);
  EdgeInsets get paddingSymmetricHeightVertical =>
      EdgeInsets.symmetric(vertical: highHeightValue);

  // Symetric Padding Horizontal
  EdgeInsets get paddingSymmetricLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowHeightValue);
  EdgeInsets get paddingSymmetricNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: normalHeightValue);
  EdgeInsets get paddingSymmetricMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumHeightValue);
  EdgeInsets get paddingSymmetricHeightHorizontal =>
      EdgeInsets.symmetric(horizontal: highHeightValue);

  // Padding only left
  EdgeInsets get paddingLeftLowHorizontal =>
      EdgeInsets.only(left: lowHeightValue);
  EdgeInsets get paddingLeftNormalHorizontal =>
      EdgeInsets.only(left: normalHeightValue);
  EdgeInsets get paddingLeftMediumHorizontal =>
      EdgeInsets.only(left: mediumHeightValue);

  //Padding only bottom
  EdgeInsets get paddingBottomLowHorizontal =>
      const EdgeInsets.only(bottom: 50);
}

extension BorderRadiusExtension on BuildContext {
  BorderRadius get borderLowRadius => BorderRadius.circular(lowRadius);
  BorderRadius get borderMediumRadius => BorderRadius.circular(mediumRadius);
  BorderRadius get borderRegularRadius => BorderRadius.circular(regularRadius);
  BorderRadius get borderHeighRadius => BorderRadius.circular(heighRadius);

  Radius get radiusLow => Radius.circular(lowRadius);
}

extension DecorationBoxExcention on BuildContext {
  BoxDecoration sheetBaseDecorationTopLeftAndTopRight(BuildContext context) =>
      BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(context.lowRadius),
            topRight: Radius.circular(context.lowRadius)),
      );
}

extension ShapeDecorationExtension on BuildContext {
  ShapeBorder shapeDecorationAll(BuildContext context) =>
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.lowRadius),
      );
  ShapeBorder shapeDecorationTopLeftAndTopRight(BuildContext context) =>
      RoundedRectangleBorder(
        borderRadius:
            BorderRadius.only(topLeft: radiusLow, topRight: radiusLow),
      );
}

extension PageExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension RadiusExtension on BuildContext {
  double get veryLowRadius => 15;
  double get lowRadius => 30;
  double get mediumRadius => 45;
  double get regularRadius => 60;
  double get heighRadius => 80;
  double get ultraRadius => 90;

  double dynamicRadius(double value) => value;
}

extension DurationExtension on BuildContext {
  Duration get lowDuration => const Duration(milliseconds: 500);
  Duration get normalDuration => const Duration(seconds: 1);
  Duration get mediumDuration => const Duration(seconds: 3);
}

extension ExpandedExtension on BuildContext {
  Expanded dynamicExpanded(int flex, Widget child) =>
      Expanded(flex: flex, child: child);
  Spacer get spacer => const Spacer();
  Spacer get lowSpacer => const Spacer(flex: 2);
  Spacer get mediumSpacer => const Spacer(flex: 3);
  Spacer get highSpacer => const Spacer(flex: 4);
  Spacer dynamicSpacer(int flex) => Spacer(flex: flex);
}

extension FontSizeExtension on BuildContext {
  double get veryLowFontSize => 12;
  double get lowveryLowFontSize => 16;
  double get mediumveryLowFontSize => 18;
  double get regularveryLowFontSize => 20;
  double get heighveryLowFontSize => 24;
  double get ultraveryLowFontSize => 28;
  double get ultraBigveryLowFontSize => 40;
}
