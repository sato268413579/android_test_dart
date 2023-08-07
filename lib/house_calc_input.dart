import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import "package:intl/intl.dart";
import "custom/dotted_divider.dart";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          // padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Select a date:'),
              SizedBox(height: 20.0),
              HouseCalcInput(),
            ],
          ),
        ),
      ),
    );
  }
}

class HouseCalcInput extends StatefulWidget {
  const HouseCalcInput({super.key});

  @override
  State<HouseCalcInput> createState() => _HouseCalcInputState();
}

class _HouseCalcInputState extends State<HouseCalcInput> {
  DateFormat _dateFormatter = DateFormat("yyyy/MM/dd");
  var selectedValue = '0';
  var onChangeRadioValue = 0;

  var dividerColor = Colors.black;
  var dividerHeight = 1.0;
  var dividerStrokeWidth = 1.0;
  var dividerDashWidth = 10.0;
  var dividerDashSpace = 1.0;

  DateTime _selectedDate = DateTime.now().subtract(Duration(days: 365 * 20));
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 365 * 20));
  bool _showDatePicker = false;
  String _selectedDateStr = '';
  bool _showCalc = false;

  void Function()? _showDatePickerOnClick() {
    setState(() {
      _showDatePicker = !_showDatePicker;
      _showCalc = false;
    });
  }
  void Function()? _showCalcOnClick() {
    setState(() {
      _showCalc = !_showCalc;
      _showDatePicker = false;
    });
  }
  void _handleDateChange(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _selectedDateStr = _dateFormatter.format(_selectedDate);
    return Scaffold(
      // AppBar の背景を透明にする
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('入力'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/backgorund-image.jpeg'),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          children: [
            // 余白分を埋めるために定義
            Expanded(
              child: Row(
                children: [],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 0,
                  groupValue: onChangeRadioValue,
                  onChanged: (value) {
                    setState(() {
                      onChangeRadioValue = 0;
                    });
                  },
                ),
                Text('支出'),
                Radio(
                  value: 1,
                  groupValue: onChangeRadioValue,
                  onChanged: (value) {
                    setState(() {
                      onChangeRadioValue = 1;
                    });
                  },
                ),
                Text('収入'),
              ],
            ),
            DottedDivider(
              color: dividerColor,
              height: dividerHeight,
              strokeWidth: dividerStrokeWidth,
              dashWidth: dividerDashWidth,
              dashSpace: dividerDashSpace,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('日付'),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _showDatePickerOnClick,
                    child: Text(
                      _selectedDateStr,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            DottedDivider(
              color: dividerColor,
              height: dividerHeight,
              strokeWidth: dividerStrokeWidth,
              dashWidth: dividerDashWidth,
              dashSpace: dividerDashSpace,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('金額'),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _showCalcOnClick,
                    child: Text(
                      '\\0',
                      style: TextStyle(
                        color: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            DottedDivider(
              color: dividerColor,
              height: dividerHeight,
              strokeWidth: dividerStrokeWidth,
              dashWidth: dividerDashWidth,
              dashSpace: dividerDashSpace,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('カテゴリ'),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _showDatePickerOnClick,
                    child: Text(
                      '未選択>',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            DottedDivider(
              color: dividerColor,
              height: dividerHeight,
              strokeWidth: dividerStrokeWidth,
              dashWidth: dividerDashWidth,
              dashSpace: dividerDashSpace,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('メモ'),
                ),
              ],
            ),
            Container(
              height: 150,
              color:  Colors.white,
              margin: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: TextStyle(
                  backgroundColor: Colors.white,
                ),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_showDatePicker)
                    Container(
                      height: 200,
                      width: 350,
                      child: CupertinoDatePicker(
                        initialDateTime: _selectedDate,
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: _handleDateChange,
                      ),
                    ),
                ],
              ),
            ),
            if (_showCalc)
              Container(
                height: 50,
                width: 350,
                child: Text('電卓が出るよ！'),
              ),
          ],
        ),
      ),
    );
  }
}