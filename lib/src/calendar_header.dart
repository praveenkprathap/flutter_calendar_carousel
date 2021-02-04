import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'default_styles.dart';
import 'default_styles.dart' show defaultHeaderTitleRight;

class CalendarHeader extends StatefulWidget {
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
      this.index,
      this.linkCallback,
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
  final Function onLeftButtonPressed;
  final Function linkCallback;
  final Function onRightButtonPressed;
  final bool isTitleTouchable;
  final Function onHeaderTitlePressed;

  int index;

  @override
  _CalendarHeaderState createState() => _CalendarHeaderState();
}

class _CalendarHeaderState extends State<CalendarHeader> {
  List<String> months = [
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
    'Jan',
    'Feb',
    'Mar',
    'Apr',
  ];

  TextStyle get getTextStyle => widget.headerTextStyle != null
      ? widget.headerTextStyle
      : defaultHeaderTextStyle;

  TextStyle get getTitleStyle => widget.headerTextStyle != null
      ? widget.headerTextStyle
      : defaultHeaderTitleRight;

  TextStyle get getTextStyle1 => widget.headerTextStyle != null
      ? widget.headerTextStyle
      : defaultHeaderText;

  @override
  Widget build(BuildContext context) => widget.showHeader
      ? Container(
          margin: widget.headerMargin,
          child: DefaultTextStyle(
            style: getTextStyle,
            child: _headings(),
          ),
        )
      : Container();

  Widget _headings() {
    return Container(
        width: widget.headerWidth,
        padding: EdgeInsets.only(left: 0, right: 10, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                alignment: Alignment.centerLeft,
                width: widget.headerWidth * 0.4,
                child: Row(
                  children: [
                    SizedBox(width: 3),
                    widget.index > 0
                        ? InkWell(
                            child: Icon(
                              Icons.arrow_left,
                              color: Color(0xff34378b),
                            ),
                            onTap: () {
                              int i = widget.index - 1;
                              widget.onLeftButtonPressed(i);
                            })
                        : Container(),
                    SizedBox(width: 10),
                    Text(months[widget.index], style: getTextStyle),
                    SizedBox(width: 10),
                    widget.index >= 0
                        ? InkWell(
                            child: Icon(
                              Icons.arrow_right,
                              color: Color(0xff34378b),
                            ),
                            onTap: () {
                              int i = widget.index + 1;
                              widget.onLeftButtonPressed(i);
                            })
                        : Container(),
                  ],
                )
                // child: CarouselSlider(
                //   options: CarouselOptions(
                //       initialPage: widget.index,
                //       autoPlay: false,
                //       disableCenter: true,
                //       enlargeCenterPage: true,
                //       enableInfiniteScroll: false,
                //       height: 25.0,
                //       viewportFraction: 0.3,
                //       onPageChanged: (i, page) {
                //         widget.onLeftButtonPressed(i);
                //       }),
                //   items: months.map((i) {
                //     return Builder(
                //       builder: (BuildContext context) {
                //         return Container(
                //             width: 50,
                //             margin: EdgeInsets.symmetric(horizontal: 5.0),
                //             decoration: BoxDecoration(color: Colors.transparent),
                //             child: Text(i, style: getTextStyle));
                //       },
                //     );
                //   }).toList(),
                // ),
                ),
            // Container(
            //     width: widget.headerWidth * 0.4,
            //     child: Row(
            //       children: [
            //         InkWell(
            //           onTap: () {
            //             if (widget.index != 11) {
            //               widget.onLeftButtonPressed(widget.index - 1);
            //             }
            //           },
            //           child: Container(
            //               child: Text(
            //                   widget.index == 0 ? "" : months[widget.index - 1],
            //                   style: getTextStyle1)),
            //         ),
            //         //Container(child:Text(headerTitle.substring(0,3) ,style: getTextStyle)),
            //         Container(
            //             padding: EdgeInsets.only(left: 15, right: 5),
            //             child: DropdownButton<String>(
            //               underline: Container(),
            //               iconEnabledColor: Color(0xff34378b),
            //               iconDisabledColor: Color(0xff34378b),
            //               value: months[widget.index],
            //               items: months.map((String value) {
            //                 return new DropdownMenuItem<String>(
            //                   value: value,
            //                   child: new Text(value, style: getTextStyle),
            //                 );
            //               }).toList(),
            //               onChanged: (value) {
            //                 setState(() {
            //                   widget.index = months.indexOf(value);
            //                   widget.onHeaderTitlePressed(widget.index);
            //                 });
            //               },
            //             )),
            //         InkWell(
            //             onTap: () {
            //               if (widget.index != 11) {
            //                 widget.onRightButtonPressed(widget.index + 1);
            //               }
            //             },
            //             child: Container(
            //                 child: Text(
            //                     widget.index == 11
            //                         ? ""
            //                         : months[widget.index + 1],
            //                     style: getTextStyle1))),
            //       ],
            //     )),
            InkWell(
                onTap: () {
                  widget.linkCallback();
                },
                child: Container(
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                    decoration: new BoxDecoration(
                      color: Color(0xff34378b),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Row(
                      children: [
                        Container(
                            child: Image.asset("assets/images/cala.png"),
                            width: 15),
                        SizedBox(width: 3),
                        Text(widget.headerTitleRight,
                            style: defaultHeaderTitleRight)
                      ],
                    ))),
          ],
        ));
  }
}
