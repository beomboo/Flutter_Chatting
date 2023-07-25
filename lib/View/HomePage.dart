import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:intl/date_symbol_data_local.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }
  @override
  Widget build(BuildContext context) {
    double widgetWidth  = MediaQuery.of(context).size.width;
    return Container(
      width: widgetWidth,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: TableCalendar(
          locale: 'ko_KR', focusedDay: DateTime.now(), firstDay: DateTime.now(), lastDay: DateTime.utc(DateTime.now().year,DateTime.now().month+2),
        ),
      ),
    );
  }
}
