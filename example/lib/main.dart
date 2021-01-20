import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'dooboolab flutter calendar',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Calendar Carousel Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();
  double fontSize;

//  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
  static Widget _eventIcon = new Container(
    height: 4,
    width: 4,
    decoration: new BoxDecoration(
        color: Color(0xff5fd2d0),
        borderRadius: BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: Color(0xff5fd2d0), width: 2.0)),
  );

  static Widget _event2Icon = new Container(
    height: 4,
    width: 4,
    decoration: new BoxDecoration(
        color: Color(0xfffed330),
        borderRadius: BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: Color(0xfffed330), width: 2.0)),
  );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2021, 2, 10): [
        new Event(
            date: new DateTime(2021, 2, 10),
            title: 'Event 1',
            description: 'kagsdksagdjkg',
            color: Color(0xfffc5c65)),
        new Event(
            date: new DateTime(2021, 2, 10),
            title: 'Event 2',
            icon: _event2Icon,
            description: 'kagsdksagdjkg'),
      ],
    },
  );

  CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;

  @override
  void initState() {
    /// Add more events to _markedDateMap EventList
    _markedDateMap.add(new DateTime(2021, 2, 25),
        new Event(date: new DateTime(2021, 2, 25), title: 'Event 5'));

    _markedDateMap.add(
        new DateTime(2021, 2, 10),
        new Event(
          date: new DateTime(2021, 2, 10),
          title: 'Event 4',
          icon: _eventIcon,
        ));

    _markedDateMap.addAll(new DateTime(2021, 2, 11), [
      new Event(
        date: new DateTime(2021, 2, 11),
        title: 'Event 1',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2021, 2, 11),
        title: 'Event 2',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2021, 2, 11),
        title: 'Event 3',
        icon: _eventIcon,
      ),
    ]);
    super.initState();
  }

  init(BuildContext context) {
    var _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData.size.width;
    double _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    fontSize = (screenWidth - _safeAreaHorizontal) / 100;
  }

  @override
  Widget build(BuildContext context) {
    init(context);

    /// Example Calendar Carousel without header and custom prev & next button
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) {
          print(event.title);
          print(event.description);
        });
      },
      headerWidth: MediaQuery.of(context).size.width,
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekFormat: false,
      isWeekNeed: true,
      markedDatesMap: _markedDateMap,
      height: 450.0,
      fontSize: fontSize,
      //selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      showHeader: true,
      minSelectedDate: new DateTime(new DateTime.now().year - 1, 5, 1),
      maxSelectedDate: new DateTime(new DateTime.now().year, 4, 30),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Container(
              //   margin: EdgeInsets.only(
              //     top: 30.0,
              //     bottom: 16.0,
              //     left: 25.0,
              //     right: 25.0,
              //   ),
              //   child: new Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: <Widget>[
              //       Expanded(
              //           child: Text(
              //         _currentMonth,
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 24.0,
              //         ),
              //       )),
              //       // FlatButton(
              //       //   child:
              //          Text(_currentMonth.substring(0,3)),
              //         // onPressed: () {
              //         //   setState(() {
              //         //     _targetDateTime = DateTime(_targetDateTime.year, _targetDateTime.month -1);
              //         //     _currentMonth = DateFormat.yMMM().format(_targetDateTime);
              //         //   });
              //         // },
              //       //),

              //       //Text(_targetDateTime.year.toString()),
              //       FlatButton(
              //         child: Text(monthNames[_targetDateTime.month-1]),
              //         onPressed: () {
              //           // setState(() {
              //           //   _targetDateTime = DateTime(_targetDateTime.year, _targetDateTime.month +1);
              //           //   _currentMonth = DateFormat.yMMM().format(_targetDateTime);
              //           // });
              //         },
              //       ),
              //       Text(monthNames[(_targetDateTime.month-1)+1]),
              //      // Expanded(flex:1,child:Container()),
              //      // Text("Attendance Report",style: TextStyle(color: Colors.grey[400],decoration: TextDecoration.underline,),)
              //     ],
              //   ),
              // ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: _calendarCarouselNoHeader,
              ), //
            ],
          ),
        ));
  }
}
