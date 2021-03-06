import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:reviewia/constrains/constrains.dart';
import 'package:reviewia/services/network.dart';
import 'package:reviewia/services/optionServices.dart';
import 'package:reviewia/services/userState.dart';
import 'package:reviewia/structures/postView.dart';

class ProductViewCard extends StatefulWidget {
  late String userName ;
  late String createdBy;
  late String title;
  late String description;
  late double rating;
  late String photoUrl1;
  late PostsView todos;
  ProductViewCard(
      {required this.createdBy,
      required this.title,
      required this.description,
      required this.rating,
      required this.photoUrl1,
      required this.todos,
      });

  @override
  _ProductViewCardState createState() => _ProductViewCardState();
}

class _ProductViewCardState extends State<ProductViewCard> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvbmV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
    'https://cdn.vox-cdn.com/thumbor/0vkUlE9CGelZsRZlY1XZZGqsZVQ=/1400x0/filters:no_upscale()/cdn.vox-cdn.com/uploads/chorus_asset/file/22015272/cgartenberg_201105_4276_004.0.jpg',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://cdn.tmobile.com/content/dam/t-mobile/en-p/cell-phones/apple/Apple-iPhone-12/Blue/Apple-iPhone-12-Blue-backimage.png'
  ];


  Future getUserDate() async {
    var dd = await UserState().getUserName();
    print(dd.toString());
    setState(() {
      widget.userName = dd.toString();
    });
  }

  @override
  void initState() {
    // getUserDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      margin: EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        // color: Colors.cyan,
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFFEFE),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),

              // color:Colors.blueGrey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFFC494C4),
                      backgroundImage: AssetImage('images/User_Avatar.png'),
                      radius: MediaQuery.of(context).size.width * 22.58 / 360,
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.createdBy, style: KPostCard),
                            Text("Created Date: " +
                                widget.todos.createdAt.substring(0, 10)),
                            Text(int.parse(widget.todos.createdAt
                                        .substring(11, 13)) >
                                    12
                                ?
                                    widget.todos.createdAt.substring(11, 16) +
                                    "pm"
                                :
                                    widget.todos.createdAt.substring(11, 16)+"am")

                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: PopupMenuButton(
                        icon: Icon(Icons.more_vert,),
                        onSelected: (item) {
                          selectedOption(item.toString(),widget.todos.postId,context);
                          print(item);},
                        itemBuilder:
                        // widget.userName != widget.todos.email? (context) => [
                        //   PopupMenuItem(
                        //     value: 2,
                        //     child: Text(
                        //       "Add Favorite",
                        //       style: TextStyle(color: Colors.black),
                        //     ),
                        //   ),
                        //   PopupMenuItem(
                        //     value: 4,
                        //     child: Text(
                        //       "Create a group",
                        //       style: TextStyle(color: Colors.black),
                        //     ),
                        //   ),
                        //   PopupMenuItem(
                        //     value: 6,
                        //     child: Text(
                        //       "Report the post",
                        //       style: TextStyle(color: Colors.black),
                        //     ),
                        //   )
                        // ]:
                          (context) => [
                          PopupMenuItem(
                            value: 2,
                            child: Text(
                              "Add Favorite",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          PopupMenuItem(
                            value: 4,
                            child: Text(
                              "Create a group",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            //previous image viewer
            // child: Container(
            //   // color: Color(0xFFCCDCF3),
            //   // decoration: BoxDecoration(
            //   //     image: DecorationImage(
            //   //   image: AssetImage('images/product_one.jpg'),
            //   //   fit: BoxFit.fill,
            //   // )),
            //   child: DecoratedBox(
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     child: Image.network(
            //       widget.photoUrl1,
            //       fit: BoxFit.cover,
            //       loadingBuilder: (BuildContext context, Widget child,
            //           ImageChunkEvent? loadingProgress) {
            //         if (loadingProgress == null) {
            //           return child;
            //         }
            //         return Center(
            //           child: CircularProgressIndicator(
            //             value: loadingProgress.expectedTotalBytes != null
            //                 ? loadingProgress.cumulativeBytesLoaded /
            //                 loadingProgress.expectedTotalBytes!
            //                 : null,
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
            ////////////Here is the Image Slider ////////
            child: Container(
                child: CarouselSlider(
              options: CarouselOptions(),
              items: widget.todos.imgURL.isNotEmpty
                  ? widget.todos.imgURL
                      .map((item) => Container(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.network(
                                item.url,
                                fit: BoxFit.contain,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ))
                      .toList()
                  : imgList
                      .map((item) => Container(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.network(
                                item,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ))
                      .toList(),
            )),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding:
                  EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
              decoration: BoxDecoration(
                // color: Color(0xFFAAAAAA),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF1A6CD3),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Row(
                        children: [
                          Text(widget.rating.toString()),
                          SizedBox(
                            width: 10,
                          ),
                          RatingBar.builder(
                            initialRating: widget.rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Kcolor,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.centerLeft,
                padding:
                    EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description: " + widget.description,
                    ),
                    Text(
                      "Created By: " + widget.todos.createdBy,
                    ),
                    Text(
                      "Type: " +
                          (widget.todos.type == 'p' ? "Product" : "service"),
                    ),
                    Text(
                      "sub category: " + widget.todos.subCategory,
                    ),
                    Text(widget.todos.brand.name.isNotEmpty ?
                      "Brand: " + widget.todos.brand.name:" ",
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
