import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controller/newsController.dart';
import 'package:news_app/Controller/url_controller.dart';
import 'package:news_app/Utils/golbal.dart';
import 'package:readmore/readmore.dart';
NewsController controller=Get.put(NewsController());
UrlController urlController=Get.put(UrlController());
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(onTap:() {
          Navigator.pop(context);
        },child: Icon(Icons.arrow_back,color: Colors.white,)),

      ),
      body: FutureBuilder(future: detailHelper, builder: (context, snapshot) {
        if(snapshot.hasData)
          {
            return Container(
              height:800,
              width: 400,
              decoration: BoxDecoration(
                // color: Colors.red,
              ),
              child: Column(
                children: [
                  Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(  
                          image:NetworkImage((detailList!
                              .articles[selectedIndex].urlToImage ==
                              ''
                              ? 'https://images.tv9hindi.com/wp-content/uploads/2024/08/chief-election-commissioner-rajiv-kumar-addresses-press-conference-in-jammu.jpg?w=670&ar=16:9'
                              : detailList!.articles[selectedIndex].urlToImage),))  
                        
                    ),
                  ),
                  Container(
                    height: 350,
                    width: 400,
                    child: Column(
                      children: [
                        Text('${detailList!.articles[selectedIndex].source.name}',style: TextStyle(color: Colors.white,fontSize: 30),),
                        SizedBox(height: 10,),
                        Text('${detailList!.articles[selectedIndex].title}',style: TextStyle(color: Colors.white),),
                        SizedBox(height: 10,),
                      ReadMoreText(
                      '${detailList!.articles[selectedIndex].description}',style: TextStyle(color: Colors.white),
                      trimMode: TrimMode.Line,
                      trimLines: 8,
                      colorClickableText: Colors.pink,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        else
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
      },),

    );
  }
}
