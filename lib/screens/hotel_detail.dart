import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app/base/styles/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';
import 'package:ticket_app/controller/text_expansion_controller.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late int index=0;
@override
  void didChangeDependencies() {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    (args["index"]);
    index = args["index"];
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppStyles.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back, 
                    color: Colors.white,),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              //title:  Text(hotelList[index]["place"]),
              background: 
              Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                    "assets/images/${hotelList[index]["image"]}",
                    fit: BoxFit.cover,
                    )),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                      color: Colors.black.withValues(alpha: 0.5),
                      child: Text(
                        hotelList[index]["place"],
                        style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 10.0,
                            color: AppStyles.primaryColor,
                          ),
                        ],
                      ),
                      )),
                  )

                ],
              )
              
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(16.0),
                child: ExpandedTextWidget(
                  text:hotelList[index]["details"],
                  )
               /* Text(
                  "In this article, we will create a custom scroll view with a sliver app bar and a sliver list. The sliver app bar will have an expanded height of 300 pixels and will be pinned to the top of the screen when it is collapsed. The sliver list will contain a list of items that can be scrolled vertically. We will also add some styling to the app bar and the list items to make them look more attractive."
                  )*/,
                  ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                child: Text(
                  "More Images",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,),
                ),),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hotelList[index]["images"].length,
                    itemBuilder: (context, imagesIndex){
                      ("${hotelList[index]["images"][0]}");
                    return Container(
                      margin: EdgeInsets.all(8),
                      color: Colors.red,
                      child: Image.asset(
                        "assets/images/${hotelList[index]["images"][imagesIndex]}"
                      ),
                    );


                  }),
                )
            ]),)
                     
        ],
      ),
    );
  }
}

class ExpandedTextWidget extends StatelessWidget {
  ExpandedTextWidget({super.key, required this.text});
  final String text;

final TextExpansionController controller = Get.put(TextExpansionController());
  @override
  Widget build(BuildContext context) {
    
    
    return Obx(() {
      var textWidget = Text(
      text,
      maxLines: controller.isExpanded.value ? null : 6,
      overflow: controller.isExpanded.value ? TextOverflow.visible : TextOverflow.ellipsis,
    );
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget,
        GestureDetector(
          onTap: (){
            controller.toggleExpansion();
          },
          child: Text(
            controller.isExpanded.value?"Less":"More",
            style: AppStyles.textStyle.copyWith(
              color: AppStyles.primaryColor,
            ),
          ),
        )
      ],
    );
    });
  }
}