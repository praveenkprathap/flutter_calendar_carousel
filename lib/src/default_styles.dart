import 'package:flutter/material.dart';

double defaultfontSize;

TextStyle get defaultHeaderTextStyle => TextStyle(
      fontFamily: 'Axiforma',
      fontSize: defaultfontSize * 5,
      fontWeight: FontWeight.w500,
      color: Color(0xff34378b),
    );
TextStyle get defaultPrevDaysTextStyle => TextStyle(
      fontFamily: 'Axiforma',
      color: Colors.grey,
      fontWeight: FontWeight.w700,
      fontSize: defaultfontSize * 4,
    );
TextStyle get defaultHeaderTitleRight => TextStyle(
    fontFamily: 'Axiforma',
    color: Color(0xffffffff),
    fontWeight: FontWeight.w500,
    fontSize: defaultfontSize * 3.5);
TextStyle get defaultNextDaysTextStyle => TextStyle(
      fontFamily: 'Axiforma',
      color: Colors.grey,
      fontWeight: FontWeight.w700,
      fontSize: defaultfontSize * 4,
    );
TextStyle get defaultDaysTextStyle => TextStyle(
      fontFamily: 'Axiforma',
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: defaultfontSize * 4,
    );
TextStyle get defaultTodayTextStyle => TextStyle(
      fontFamily: 'Axiforma',
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: defaultfontSize * 4,
    );
TextStyle get defaultSelectedDayTextStyle => TextStyle(
      fontFamily: 'Axiforma',
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: defaultfontSize * 4,
    );
TextStyle get defaultWeekdayTextStyle => TextStyle(
      fontFamily: 'Axiforma',
      color: Color(0xff7073ad),
      fontSize: defaultfontSize * 4,
      fontWeight: FontWeight.w400,
    );
TextStyle get defaultHeaderText => TextStyle(
      fontFamily: 'Axiforma',
      color: Color(0xff7073ad),
      fontSize: defaultfontSize * 3.5,
      fontWeight: FontWeight.w400,
    );
TextStyle get defaultWeekendTextStyle => TextStyle(
      fontFamily: 'Axiforma',
      color: Color(0xfffc5c65),
      fontWeight: FontWeight.w700,
      fontSize: defaultfontSize * 4,
    );
TextStyle get defaultInactiveDaysTextStyle => TextStyle(
      fontFamily: 'Axiforma',
      color: Colors.black38,
      fontWeight: FontWeight.w700,
      fontSize: defaultfontSize * 4,
    );
TextStyle get defaultInactiveWeekendTextStyle => TextStyle(
      fontFamily: 'Axiforma',
      color: Color(0xfffc5c65).withOpacity(0.6),
      fontWeight: FontWeight.w700,
      fontSize: defaultfontSize * 4,
    );
Widget get defaultMarkedDateWidget => Container(
      margin: EdgeInsets.symmetric(horizontal: 1.0),
      color: Colors.blueAccent,
      height: 4.0,
      width: 4.0,
    );
