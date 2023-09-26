import 'dart:math';

import 'package:flutter/material.dart';

class EmiCalculator extends StatefulWidget {
  const EmiCalculator({Key? key}) : super(key: key);

  @override
  State<EmiCalculator> createState() => _EmiCalculatorState();
}

class _EmiCalculatorState extends State<EmiCalculator> {
  double p = 15000; //15000 to 1 lakh
  double r = 8; // 8 to 16
  double n = 12; //12 to 24
  double R = 8 / 12 / 100;

  // EMI = (p*R*pow((1+R), n)/(pow((1+R), n)-1))

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color(0xff2A2B31),
            ),
            Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.only(left: 5, top: 40),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color(0xff222529),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Colors.white70,
                      shadows: [Shadow(color: Colors.white, blurRadius: 50)],
                    ))),
            Container(
              margin: EdgeInsets.only(top: 53, left: 20),
              alignment: Alignment.topCenter,
              child: Text(
                "EMI Calculator",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 140, left: 2),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Color(0xff252A31),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 4,
                        blurRadius: 3,
                        offset: Offset(-1, 1))
                  ]),
              child: Column(
                children: [
                  Slider(
                      activeColor: Color(0xffBB868F),
                      inactiveColor: Colors.white,
                      value: p,
                      max: 100000,
                      min: 15000,
                      onChanged: (value) {
                        p = value; //print(value);
                        setState(() {});
                      }),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 22),
                        child: Text(
                          "Loan Amount",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 130),
                          child: Text(
                            "₹ ${p.toStringAsFixed(1)}",
                            style: TextStyle(
                                color: Color(0xffBB868F),
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Slider(
                        activeColor: Color(0xffBB868F),
                        inactiveColor: Colors.white,
                        value: r,
                        max: 16,
                        min: 8,
                        onChanged: (value) {
                          r = value;
                          R = r / 12 / 100;
                          setState(() {});
                        }),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 22),
                        child: Text(
                          "Rate of Interest",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 150),
                          child: Text(
                            "${r.toStringAsFixed(1)} %",
                            style: TextStyle(
                                color: Color(0xffBB868F),
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Slider(
                        activeColor: Color(0xffBB868F),
                        inactiveColor: Colors.white,
                        value: n,
                        max: 24,
                        min: 12,
                        onChanged: (value) {
                          n = value;
                          setState(() {});
                        }),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 22),
                        child: Text(
                          "Loan tenure",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 130),
                          child: Text(
                            "${n.toStringAsFixed(1)} Months",
                            style: TextStyle(
                              color: Color(0xffBB868F),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Stack(alignment: Alignment.center, children: [
                        Container(
                          height: 180,
                          width: 180,
                          margin: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                        ),
                        Container(
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.only(top: 30),
                            decoration: BoxDecoration(
                                color: Color(0xff2A2B31),
                                shape: BoxShape.circle)),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(left: 70, top: 30),
                        child: Text(
                          "EMI\n₹ ${(p * R * pow((1 + R), n) / (pow((1 + R), n) - 1)).toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                        ),
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Color(0xffBB868F), shape: BoxShape.circle),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10),
                        child: Text(
                          "Principal Amount",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 62, top: 20),
                        child: Text(
                          "₹ ${p.toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                        ),
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10),
                        child: Text(
                          "Total interest",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 110, top: 20),
                        child: Text(
                          "₹ ${(((p * R * pow((1 + R), n) / (pow((1 + R), n) - 1)) * n) - p).toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 5),
                        child: Text(
                          "Total",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 195, top: 30),
                        child: Text(
                          "₹ ${((p * R * pow((1 + R), n) / (pow((1 + R), n) - 1)) * n).toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
