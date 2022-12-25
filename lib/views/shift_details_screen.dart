import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shifts/models/shift_model.dart';

class ShiftDetailsScreen extends StatelessWidget {
  const ShiftDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Shift;
    final size = MediaQuery.of(context).size;
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFf2f2f2),
        body: WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.075, right: size.width * 0.075),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    //height: size.height * 0.1,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.01,
                        bottom: size.height * 0.01,
                      ),
                      child: SvgPicture.asset(
                        "assets/images/back-icon.svg",
                        height: size.height * 0.05,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Center(
                  child: Text(
                    args.company.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'PTSerif-Regular',
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: size.width * 0.05),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  "${DateTime.parse(args.startAt.toString()).day} ${months[DateTime.parse(args.startAt.toString()).month - 1]} ${DateTime.parse(args.startAt.toString()).year}",
                  style: TextStyle(
                      fontFamily: 'Roboto-Medium',
                      color: const Color(0XFFf13939),
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
                            color: const Color.fromRGBO(239, 239, 239, 1),
                          ),
                          color: const Color.fromRGBO(239, 239, 239, 1),
                          borderRadius: BorderRadius.all(
                              Radius.circular(size.width * 0.05))),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.0075,
                            bottom: size.height * 0.0075,
                            left: size.width * 0.03,
                            right: size.width * 0.03),
                        child: Text(
                          args.postName.toString().length < 10
                              ? args.postName.toString()
                              : "${args.postName.toString().substring(0, 9)}\n${args.postName.toString().substring(9, args.postName.toString().length)}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Roboto-Medium',
                              fontWeight: FontWeight.normal,
                              color: const Color.fromRGBO(154, 154, 154, 1),
                              fontSize: size.width * 0.03),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text(
                      "${args.buyPrice.toString()}\$ / H",
                      style: TextStyle(
                          fontFamily: 'Roboto-Medium',
                          fontWeight: FontWeight.normal,
                          color: const Color.fromRGBO(154, 154, 154, 1),
                          fontSize: size.width * 0.03),
                    ),
                    const Spacer(),
                    Text(
                      "${DateTime.parse(args.startAt.toString()).hour > 9 ? DateTime.parse(args.startAt.toString()).hour : "0${DateTime.parse(args.startAt.toString()).hour}"}:${DateTime.parse(args.startAt.toString()).minute > 9 ? DateTime.parse(args.startAt.toString()).minute : "0${DateTime.parse(args.startAt.toString()).minute}"}"
                      "-${DateTime.parse(args.endAt.toString()).hour > 9 ? DateTime.parse(args.endAt.toString()).hour : "0${DateTime.parse(args.endAt.toString()).hour}"}:${DateTime.parse(args.endAt.toString()).minute > 9 ? DateTime.parse(args.endAt.toString()).minute : "0${DateTime.parse(args.endAt.toString()).minute}"}",
                      style: TextStyle(
                        fontSize: size.width * 0.03,
                        color: const Color(0XFFF13939),
                        fontFamily: 'Roboto-Medium',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.035,
                ),
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/images/geo-icon.svg",
                      width: size.width * 0.07,
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text(
                      "Latitude : ${args.latitude} ,\nLongitude : ${args.longitude}",
                      style: TextStyle(
                          fontFamily: 'Robot-Medium',
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: size.width * 0.035),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/images/dollar-icon.svg",
                      width: size.width * 0.07,
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text(
                      "Bonus au travailleur: +${args.bonus}\$/H",
                      style: TextStyle(
                          fontFamily: 'Robot-Medium',
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: size.width * 0.035),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/images/pause-icon.svg",
                      width: size.width * 0.07,
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text(
                      "Pause de 30 minutes",
                      style: TextStyle(
                          fontFamily: 'Robot-Medium',
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: size.width * 0.035),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/images/parking-icon.svg",
                      width: size.width * 0.07,
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text(
                      "Stationnement gratuit",
                      style: TextStyle(
                          fontFamily: 'Robot-Medium',
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: size.width * 0.035),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/images/parking-icon.svg",
                      width: size.width * 0.07,
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text(
                      "Pantalon noir, chemise noir",
                      style: TextStyle(
                          fontFamily: 'Robot-Medium',
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: size.width * 0.035),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Text(
                  "RESPONSABLE",
                  style: TextStyle(
                      fontFamily: 'Roboto-Medium',
                      fontWeight: FontWeight.w500,
                      color: Color(0XFF6d7278).withOpacity(0.5)),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  "Hichri Louay",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Roboto-Medium',
                  ),
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
                SizedBox(
                  width: size.width * 0.85,
                  height: size.height * 0.06,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF53c5cd)),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * 0.1)))),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.01, bottom: size.height * 0.01),
                      child: Text(
                        "Postuler",
                        style: TextStyle(
                          fontFamily: 'Roboto-Medium',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
