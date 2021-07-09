import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:reviewia/constrains/constrains.dart';
class ReviewCards extends StatelessWidget {
  const ReviewCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.275,
      margin:
      EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
      // padding:EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
      decoration: KBoxDeco,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    backgroundColor: Color(0xFFC494C4),
                    backgroundImage: AssetImage('images/pep.jpg'),
                    radius: MediaQuery.of(context).size.width *
                        22.58 /
                        360,
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Text("Chamari Wikrmawardna",
                        style: KPostCard)),
                Expanded(flex: 1, child: Icon(Icons.settings))
              ],
            ),
          ),
          Container(
            child: Expanded(
                flex: 2,
                child: Container(

                  padding: EdgeInsets.all(MediaQuery.of(context).size.width*10/360),
                  child: Text("This is a very good product. It is very usefull",style: KPostReviewCard),
                  // color: Colors.red,
                )),
          ),
          Container(
            child: Expanded(
                flex: 1,
                child:Container(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width*10/360),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Container(child: Text("3.6",style:TextStyle(fontSize: 16,fontWeight:FontWeight.w600),)),
                      SizedBox(
                        width: 15,
                      ),
                      RatingBar.builder(
                        initialRating:3.6,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemPadding:
                        EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Kcolor,
                        ),
                        onRatingUpdate: (rating) {

                        },
                      ),
                      Container(
                        width: 100,
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*20/360),
                        child: Row(
                          children: [
                            Expanded(
                              flex:2,
                              child: GestureDetector(
                                onTap: (){
                                  print('like');
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.thumb_up,
                                    color: Kcolor,
                                  ),
// color: Colors.red,
                                ),
                              ),
                            ),
                            Expanded(
                              flex:2,
                              child: GestureDetector(
                                onTap: (){
                                  print('Dis like');
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.thumb_down,
                                  ),
// color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                )),
          ),


        ],
      ),
    );
  }
}
