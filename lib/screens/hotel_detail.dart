import 'package:flutter/material.dart';
import 'package:ticket_app/base/styles/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';

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
    print(args["index"]);
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
                      print("${hotelList[index]["images"][0]}");
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

class ExpandedTextWidget extends StatefulWidget {
  const ExpandedTextWidget({super.key, required this.text});
  final String text;

  @override
  State<ExpandedTextWidget> createState() => _ExpandedTextWidgetState();
}

class _ExpandedTextWidgetState extends State<ExpandedTextWidget> {
  bool isExpanded=false;
    _toggleExpansion(){
      setState(() {
        isExpanded = !isExpanded;
      });
      print("The value is $isExpanded");
    }
  @override
  Widget build(BuildContext context) {
    
    var textWidget = Text(
      widget.text,
      maxLines: isExpanded?null:6,
      overflow: isExpanded?TextOverflow.visible:TextOverflow.ellipsis,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget,
        GestureDetector(
          onTap: (){
            _toggleExpansion();
          },
          child: Text(
            isExpanded?"Less":"More",
            style: TextStyle(
              color: AppStyles.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}