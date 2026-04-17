import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/media.dart';
import 'package:ticket_app/base/styles/app_styles.dart';
import 'package:ticket_app/base/widgets/app_column_text_layout.dart';
import 'package:ticket_app/base/widgets/heading_text.dart';
import 'package:ticket_app/base/widgets/text_style_third.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bjcolor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20,vertical: 20
          ),
        children: [
          Padding(padding: EdgeInsets.only(top: 40)),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //shows the logo
              Container(
                width: 86,
                height: 86,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                      AppMedia.logo,
                    ))
                ),
              ),
              const SizedBox(
                width: 10,),
              //shows the column text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadingText(
                    text: "Book Tickets", 
                    isColor: false
                    ),
                  
                  Text(
                    "New-York", 
                    style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500, 
                    color: Colors.grey.shade500
                  ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                    //decoration
                    decoration: BoxDecoration(
                      color: AppStyles.profileLocationColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    //child ->row->icon,text
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: AppStyles.profileTextColor,
                            shape: BoxShape.circle
                          ),
                          child: const Icon(
                            FluentSystemIcons.ic_fluent_shield_filled, 
                            color: Colors.white,
                            size: 15,
                            ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Premium status", 
                          style: TextStyle(
                            fontWeight: FontWeight.w500, 
                            color: AppStyles.profileTextColor,
                          ),
                        )
                      ],
                    ),
                  )

                ],
              ),
              Expanded(child: Container()),
              Text( 
                "Edit", 
                style: TextStyle(
                  fontWeight: FontWeight.w300, 
                  color: AppStyles.primaryColor,
                ),
              )
            ],
          ),
            const SizedBox(
              height: 8,
            ),
          //divider
          Divider(
            color: Colors.grey.shade300,
          ),
          //show the card
          Stack(
            children: [
              Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppStyles.primaryColor,
                  borderRadius: BorderRadius.circular(18)
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(
                        FluentSystemIcons.ic_fluent_lightbulb_filament_filled, 
                        color: AppStyles.primaryColor,
                        size:27,
                      ),
                    ),
                      const SizedBox(
                        width: 12,
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextStyleThird(
                          text:  "You'v got a new award",
                          isColor: null,),
                        
                        Text( 
                          "You have 95 flights in a year", 
                          style: TextStyle(
                            fontWeight: FontWeight.w500, 
                            color: Colors.white.withValues(alpha: 0.8)
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: -40,
                right: -45,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 18,
                      color: Color(0xFF264CD2)
                    )
                  ),

                ))
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Text("Accumulated miles", style: AppStyles.headLineStyle2,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: AppStyles.bjcolor
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "198282", 
                  style: TextStyle(
                    fontSize: 45,
                    color: AppStyles.textColor,
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //row -> text.
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Miles accrued", style: AppStyles.headLineStyle4.copyWith(fontSize: 16),),
                    Text("11 June 2022", style: AppStyles.headLineStyle4.copyWith(fontSize: 16),),
                  ],
                ),
                  const SizedBox(
                    height: 4,
                  ),
                Divider(
                  color: Colors.grey.shade300,
                ),
                const SizedBox(
                  height: 4,
                ),
                //row->column
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnTextLayout(
                      topText: "23 042", 
                      bottomText: "Miles", 
                      alignment: CrossAxisAlignment.start,
                      isColor: false,
                      ),
                    AppColumnTextLayout(
                      topText: "Airline CO", 
                      bottomText: "Received from", 
                      alignment: CrossAxisAlignment.end,
                      isColor: false,
                      ),
                  ],
                ),
                Divider(
                  color: Colors.grey.shade300,
                ),
                const SizedBox(
                  height: 4,
                ),
                //row->column
                const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                      topText: "24", 
                      bottomText: "Miles", 
                      alignment: CrossAxisAlignment.start,
                      isColor: false,
                      ),
                    AppColumnTextLayout(
                      topText: "McDonal's", 
                      bottomText: "Received from", 
                      alignment: CrossAxisAlignment.end,
                      isColor: false,
                      ),
                      ],
                    ),
                    Divider(
                  color: Colors.grey.shade300,
                ),
                const SizedBox(
                  height: 4,
                ),
                    //row->column
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                      topText: "52 340", 
                      bottomText: "Miles", 
                      alignment: CrossAxisAlignment.start,
                      isColor: false,
                      ),
                    AppColumnTextLayout(
                      topText: "Dbestech", 
                      bottomText: "Received from", 
                      alignment: CrossAxisAlignment.end,
                      isColor: false,
                      ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                //text
                InkWell(
                    onTap: (){
                      ("tapped");
                    },
                  child: Text(
                    "How to get more miles", 
                    style: AppStyles.textStyle.copyWith(
                      color: AppStyles.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}