import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shifts/services/data_service.dart';
import 'package:shifts/views/shift_details_screen.dart';

import '../models/shift_model.dart';

class ShiftsOffertsScreen extends StatefulWidget {
  const ShiftsOffertsScreen({Key? key}) : super(key: key);

  @override
  _ShiftsOffertsScreenState createState() => _ShiftsOffertsScreenState();
}

class _ShiftsOffertsScreenState extends State<ShiftsOffertsScreen> {
  DataService _dataService = DataService();
  List<Shift> _shifts = [];
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  fetchData() async {
    return await _dataService.readJsonFile();
  }

  @override
  void initState() {
    super.initState();
    fetchData().then((value) => setState(() {
          _shifts = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFf2f2f2),
        body: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.075,
              right: size.width * 0.075,
              top: size.height * 0.035),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Shifts offerts",
                style: TextStyle(
                  fontFamily: 'PTSerif-Regular',
                  fontWeight: FontWeight.normal,
                  fontSize: size.width * 0.05,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: size.height * 0.7,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _shifts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(top: size.height * 0.03, bottom: size.height * 0.01),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/details', arguments: _shifts[index]);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * 0.02,
                                    bottom: size.height * 0.02,
                                    left: size.width * 0.05),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _shifts[index].company.toString(),
                                      style: TextStyle(
                                          fontFamily: 'PTSerif-Regular',
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                          fontSize: size.width * 0.035),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Text(
                                      "${DateTime.parse(_shifts[index].startAt.toString()).day} ${months[DateTime.parse(_shifts[index].startAt.toString()).month - 1]} ${DateTime.parse(_shifts[index].startAt.toString()).year}",
                                      style: TextStyle(
                                          fontFamily: 'Roboto-Medium',
                                          color: const Color(0XFF6D7278),
                                          fontWeight: FontWeight.w500,
                                          fontSize: size.width * 0.035),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.white,
                                              ),
                                              color: const Color.fromRGBO(
                                                  239, 239, 239, 1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      size.width * 0.05))),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height * 0.0075,
                                                bottom: size.height * 0.0075,
                                                left: size.width * 0.03,
                                                right: size.width * 0.03),
                                            child: Text(
                                              _shifts[index]
                                                          .postName
                                                          .toString()
                                                          .length <
                                                      10
                                                  ? _shifts[index]
                                                      .postName
                                                      .toString()
                                                  : "${_shifts[index].postName.toString().substring(0, 9)}\n${_shifts[index].postName.toString().substring(9, _shifts[index].postName.toString().length)}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: 'Roboto-Medium',
                                                  fontWeight: FontWeight.normal,
                                                  color: const Color.fromRGBO(
                                                      154, 154, 154, 1),
                                                  fontSize: size.width * 0.025),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.03,
                                        ),
                                        Text(
                                          "${_shifts[index].buyPrice.toString()}\$ / H",
                                          style: TextStyle(
                                              fontFamily: 'Roboto-Medium',
                                              fontWeight: FontWeight.normal,
                                              color: const Color.fromRGBO(
                                                  154, 154, 154, 1),
                                              fontSize: size.width * 0.025),
                                        ),
                                        Text(
                                          " + ${_shifts[index].bonus.toString()}\$ / H",
                                          style: TextStyle(
                                              fontFamily: 'Roboto-Medium',
                                              fontWeight: FontWeight.normal,
                                              color: const Color.fromRGBO(
                                                  94, 211, 105, 1),
                                              fontSize: size.width * 0.025),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "${DateTime.parse(_shifts[index].startAt.toString()).hour > 9 ? DateTime.parse(_shifts[index].startAt.toString()).hour : "0${DateTime.parse(_shifts[index].startAt.toString()).hour}"}:${DateTime.parse(_shifts[index].startAt.toString()).minute > 9 ? DateTime.parse(_shifts[index].startAt.toString()).minute : "0${DateTime.parse(_shifts[index].startAt.toString()).minute}"}"
                                          "-${DateTime.parse(_shifts[index].endAt.toString()).hour > 9 ? DateTime.parse(_shifts[index].endAt.toString()).hour : "0${DateTime.parse(_shifts[index].endAt.toString()).hour}"}:${DateTime.parse(_shifts[index].endAt.toString()).minute > 9 ? DateTime.parse(_shifts[index].endAt.toString()).minute : "0${DateTime.parse(_shifts[index].endAt.toString()).minute}"}",
                                          style: TextStyle(
                                            fontSize: size.width * 0.025,
                                            color: const Color(0XFFF13939),
                                            fontFamily: 'Roboto-Medium',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.03,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: size.height * 0.035,
              ),
              Container(
                height: size.height * 0.07,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(size.width * 0.1))),
                child: Row(
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            color: const Color(0XFF53c5cd),
                            borderRadius: BorderRadius.all(
                                Radius.circular(size.width * 0.1))),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.05,
                            right: size.width * 0.05
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.white,
                                size: size.height * 0.06,
                              ),
                              Text(
                                "Shift Offerts",
                                style: TextStyle(
                                    fontFamily: 'Roboto-Medium',
                                    color: Colors.white,
                                    fontSize: size.height * 0.018),
                              ),
                            ],
                          ),
                        )),
                    const Spacer(),
                    Container(
                      decoration: const BoxDecoration(
                          color: Color(0XFFefefef), shape: BoxShape.circle),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.02,
                          bottom: size.height * 0.02
                        ),
                        child: SvgPicture.asset(
                          "assets/images/upload-icon.svg",
                          height: size.height * 0.07,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: const BoxDecoration(
                          color: Color(0XFFefefef), shape: BoxShape.circle),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.02,
                            bottom: size.height * 0.02
                        ),
                        child: SvgPicture.asset(
                          "assets/images/person-icon.svg",
                          height: size.height * 0.07,
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.01,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
