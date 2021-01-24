import 'package:flutter/widgets.dart';

class SizeConfig{
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double percentHorizontal;
  static double percentVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safePercentHorizontal;
  static double safePercentVertical;
  static double safePercentVerticalWithAppBar;

  void init(BuildContext context){

    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    percentHorizontal = screenWidth/100;
    percentVertical = screenHeight/100;

    _safeAreaHorizontal = _mediaQueryData.padding.left +
        _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top +
        _mediaQueryData.padding.bottom;

    //These guys are 1 % of the screen size
    safePercentHorizontal = (screenWidth - _safeAreaHorizontal)/100;
    safePercentVertical = (screenHeight - _safeAreaVertical)/100;
    safePercentVerticalWithAppBar = ((screenHeight-56) - _safeAreaVertical)/100;
  }

}