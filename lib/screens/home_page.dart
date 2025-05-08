import 'package:doctor_appointment_app/constants/app_colors.dart';
import 'package:doctor_appointment_app/constants/app_lists.dart';
import 'package:doctor_appointment_app/provider/bottom_navigation_bar_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: _customBottomBar(),
      backgroundColor: HexColor(AppColors.backgroundColor),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.070),
          Container(
            height: height * 0.150,
            width: double.infinity,
            child: Row(
              children: [
                SizedBox(width: width * 0.060),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildHelloHeading(text: "Hello"),
                    _buildJamesHeading(text: "Hi James"),
                  ],
                ),
                SizedBox(width: width * 0.220),
                _buildHeaderImage(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.065),
            height: height * 0.175,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: HexColor(AppColors.darkBlueColor),
            ),
            child: Column(
              children: [
                SizedBox(height: height * 0.020),
                _buildContainerFirstRow(),
                SizedBox(height: height * 0.020),
                Container(
                  height: height * 0.0005,
                  width: width * 0.800,
                  decoration: BoxDecoration(
                    color: HexColor(AppColors.backgroundColor),
                  ),
                ),
                SizedBox(height: height * 0.020),
                _buildContainerSecondRow(),
              ],
            ),
          ),

          _buildTextField(),
          Container(
            margin: EdgeInsets.only(left: width * 0.040),
            height: height * 0.160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(5),
              itemCount: 4,
              itemBuilder: (context, index) {
                return _buildListViewItems(index: index);
              },
            ),
          ),

          _buildNearDoctorHeading(),

          _buildDoctorContainer(),
        ],
      ),
    );
  }

  Widget _customBottomBar() {
    return Container(
      height: height * 0.100,
      width: double.infinity,

      decoration: BoxDecoration(
        color: HexColor(AppColors.backgroundColor),
        boxShadow: [BoxShadow(color: Colors.grey.shade500)],
      ),
      child: Consumer<BottomNavigationBarController>(
        builder: (context, value, child) {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: AppLists.unselectedIconList.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(15),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    value.changeIndex(index: index);
                  },
                  child:
                      value.selectedIndex == index
                          ? Container(
                            padding: EdgeInsets.all(5),
                            height: height * 0.030,
                            width: width * 0.300,
                            decoration: BoxDecoration(
                              color: HexColor("#4063B4FF"),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AppLists.selectedIconList[index]),
                                SizedBox(width: width * 0.020),
                                Text(
                                  AppLists.bottomBarNameList[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: HexColor(AppColors.blueColor),
                                  ),
                                ),
                              ],
                            ),
                          )
                          : Container(
                            height: height * 0.030,
                            width: width * 0.150,
                            decoration: BoxDecoration(
                              // color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              AppLists.unselectedIconList[index],
                            ),
                          ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildHelloHeading({required String text}) {
    return Container(
      height: height * 0.030,
      width: width * 0.500,
      // color: Colors.red,
      child: Text(
        text,
        style: TextStyle(color: HexColor(AppColors.greyColor), fontSize: 17),
      ),
    );
  }

  Widget _buildJamesHeading({required String text}) {
    return Container(
      height: height * 0.050,
      width: width * 0.500,
      // color: Colors.black,
      child: Text(
        "Hi James",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildHeaderImage() {
    return Image.asset("assets/images/Frame.png");
  }

  Widget _buildContainerFirstRow() {
    return Row(
      children: [
        SizedBox(width: width * 0.030),
        Container(
          height: height * 0.060,
          width: width * 0.130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Image.asset(
            "assets/images/doctor_blue_container.png",
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: width * 0.020),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              height: height * 0.025,
              width: width * 0.400,
              // color: Colors.red,
              child: Text(
                "Dr. Imran Syahir",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),

            Container(
              alignment: Alignment.bottomLeft,
              height: height * 0.030,
              width: width * 0.400,
              child: Text(
                "General Doctor",
                style: TextStyle(color: HexColor("#CBE1FF"), fontSize: 14),
              ),
            ),
          ],
        ),
        SizedBox(width: width * 0.150),
        Icon(Icons.arrow_forward_ios, color: Colors.white, size: 30),
      ],
    );
  }

  Widget _buildContainerSecondRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: width * 0.040),
        Icon(CupertinoIcons.calendar, color: Colors.white, size: 22),
        Container(
          padding: EdgeInsets.only(left: width * 0.020),
          height: height * 0.025,
          width: width * 0.360,
          // color: Colors.red,
          child: Text(
            "Sunday, 12 June",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),

        Icon(CupertinoIcons.clock, color: Colors.white, size: 22),
        Container(
          padding: EdgeInsets.only(left: width * 0.020),
          height: height * 0.025,
          width: width * 0.350,
          // color: Colors.red,
          child: Text(
            "11:00 - 12:00 AM",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.060,
        vertical: height * 0.020,
      ),
      height: height * 0.065,
      width: double.infinity,
      decoration: BoxDecoration(
        color: HexColor("#F5FAFA"),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          SizedBox(width: width * 0.020),
          Icon(Icons.search, color: HexColor(AppColors.greyColor), size: 35),
          SizedBox(width: width * 0.010),
          Text(
            "search doctor or health issue",
            style: TextStyle(
              color: HexColor(AppColors.greyColor),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListViewItems({required int index}) {
    return Padding(
      padding: EdgeInsets.only(right: width * 0.030),
      child: Column(
        children: [
          Container(
            // margin: EdgeInsets.nly(),
            height: height * 0.085,
            width: width * 0.190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: HexColor("#F5F5F5"),
            ),
            child: Image.asset(AppLists.optionImageList[index]),
          ),
          SizedBox(height: height * 0.010),
          Container(
            alignment: Alignment.center,
            // margin: EdgeInsets.nly(),
            height: height * 0.030,
            width: width * 0.2,
            // decoration: BoxDecoration(color: HexColor("#F5F5F5")),
            child: Text(
              AppLists.optionNameList[index],
              style: TextStyle(
                fontSize: 15,
                color: HexColor(AppColors.greyColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNearDoctorHeading() {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.060),
      child: Text(
        "Near Doctor",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDoctorContainer() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.045,
        vertical: height * 0.010,
      ),
      height: height * 0.180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: HexColor("#FFFFFF"),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: HexColor("338696BB"),
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: height * 0.020),
          Row(
            children: [
              SizedBox(width: width * 0.030),
              Container(
                height: height * 0.060,
                width: width * 0.130,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.asset(
                  "assets/images/doctor.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: width * 0.020),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    height: height * 0.025,
                    width: width * 0.400,
                    // color: Colors.red,
                    child: Text(
                      "Dr. Joseph Brostito",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.bottomLeft,
                    height: height * 0.035,
                    width: width * 0.400,
                    child: Text(
                      "Dental Specialist",
                      style: TextStyle(
                        color: HexColor(AppColors.greyColor),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(width: width * 0.100),
              Container(
                height: height * 0.065,
                width: width * 0.200,
                // color: Colors.red,
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: HexColor(AppColors.greyColor),
                    ),
                    Text(
                      "1.2 KM",
                      style: TextStyle(
                        fontSize: 15,
                        color: HexColor(AppColors.greyColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.020),
          Container(
            height: height * 0.0005,
            width: width * 0.800,
            color: HexColor(AppColors.greyColor),
          ),
          SizedBox(height: height * 0.020),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Icon(
                Icons.alarm,
                color: HexColor(AppColors.orangeColor),
                size: 20,
              ),
              Text(
                " 4.8 (120 Reviews)",
                style: TextStyle(
                  color: HexColor(AppColors.orangeColor),
                  fontSize: 14,
                ),
              ),
              SizedBox(width: width * 0.050),
              Icon(
                Icons.alarm,
                color: HexColor(AppColors.darkBlueColor),
                size: 20,
              ),
              Text(
                " Open at 17.00",
                style: TextStyle(
                  color: HexColor(AppColors.darkBlueColor),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
