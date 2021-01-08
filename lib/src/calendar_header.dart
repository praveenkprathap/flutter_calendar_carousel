import 'package:flutter/material.dart';
import 'default_styles.dart';
import 'default_styles.dart' show defaultHeaderTitleRight;
class CalendarHeader extends StatelessWidget {
  /// Passing in values for [leftButtonIcon] or [rightButtonIcon] will override [headerIconColor]
  CalendarHeader(
      {@required this.headerTitle,
      this.headerTitleRight,
      this.headerMargin,
      this.showHeader,
      this.headerWidth,
      this.headerTextStyle,
      this.showHeaderButtons,
      this.headerIconColor,
      this.leftButtonIcon,
      this.rightButtonIcon,
      @required this.onLeftButtonPressed,
      @required this.onRightButtonPressed,
      this.isTitleTouchable,
      @required this.onHeaderTitlePressed});

  final String headerTitle;
  final String headerTitleRight;
  final double headerWidth;
  final EdgeInsetsGeometry headerMargin;
  final bool showHeader;
  final TextStyle headerTextStyle;
  final bool showHeaderButtons;
  final Color headerIconColor;
  final Widget leftButtonIcon;
  final Widget rightButtonIcon;
  final VoidCallback onLeftButtonPressed;
  final VoidCallback onRightButtonPressed;
  final bool isTitleTouchable;
  final VoidCallback onHeaderTitlePressed;

  TextStyle get getTextStyle =>
      headerTextStyle != null ? headerTextStyle : defaultHeaderTextStyle;
  TextStyle get getTitleStyle =>
      headerTextStyle != null ? headerTextStyle : defaultHeaderTitleRight;
  TextStyle get getTextStyle1 =>
      headerTextStyle != null ? headerTextStyle : defaultHeaderText;



  Widget _leftButton() => IconButton(
        onPressed: onLeftButtonPressed,
        icon: leftButtonIcon ?? Icon(Icons.chevron_left, color: headerIconColor),
      );

  Widget _rightButton() => IconButton(
        onPressed: onRightButtonPressed,
        icon: rightButtonIcon ?? Icon(Icons.chevron_right, color: headerIconColor),
      );

  Widget _headerTouchable() => FlatButton(
        onPressed: onHeaderTitlePressed,
        child: Text(headerTitle, 
          semanticsLabel: headerTitle,
          style: getTextStyle,
        ),
      );

  @override
  Widget build(BuildContext context) => showHeader
      ? Container(
          margin: headerMargin,
          child: DefaultTextStyle(
              style: getTextStyle,
              child: isTitleTouchable
                        ? _headerTouchable()
                        : _headings(),
              //  Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: <Widget>[
              //      // showHeaderButtons ? _leftButton() : Container(),
              //       isTitleTouchable
              //           ? _headerTouchable()
              //           : _headings(),
              //      // showHeaderButtons ? _rightButton() : Container(),
              //     ])
                  ),
        )
      : Container();
      
      Widget _headings(){
        return Container(
          width: headerWidth,
          padding: EdgeInsets.only(left:10,right:10),
          child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: headerWidth*0.4,
                child:Row(children: [
                  Container(child:Text("Jan" ,style: getTextStyle)),
                  //Container(child:Text(headerTitle.substring(0,3) ,style: getTextStyle)),
                  Container(
                    padding: EdgeInsets.only(left:15,right:5),
                    child:DropdownButton<String>(
                    underline: Container(),
                    iconEnabledColor:Color(0xff34378b),
                    iconDisabledColor:Color(0xff34378b),
                    hint:Text("Feb" ,style: getTextStyle1),
                  items: <String>['Jan', 'Feb', 'Mar', 'April'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value ,style: getTextStyle1),
                    );
                  }).toList(),
                  onChanged: (_) {
                  },
                  )),
                  Container(child:Text("Mar" ,style: getTextStyle)),
              ],)),

          Container(
            child:Text(headerTitleRight,style: defaultHeaderTitleRight)),
        ],));
      }
}