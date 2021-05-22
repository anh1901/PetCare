import 'package:flutter/material.dart';
import 'package:petcare/widgets/app_size.dart';
import 'package:petcare/widgets/commons.dart';
import 'package:petcare/widgets/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: <Widget>[
            PostList(),
          ],
        ),
      ),
    );
  }

  Widget PostList() {
    return SliverPadding(
      padding: EdgeInsets.only(top: 10),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return GestureDetector(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(top: 10, left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              child: SizedBox(
                                child: Image.asset('assets/images/avatar.png'),
                                width: 45,
                                height: 45,
                              ),
                              onTap: () {
                                //
                              },
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CustomText(
                                    text: 'Nickname',
                                    size: 15,
                                    color: ColorStyles.color_333333),
                                CustomText(
                                    text: '21-5-2020 19:56',
                                    size: 11,
                                    color: ColorStyles.color_999999),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'This is a text',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14, color: ColorStyles.color_333333),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 8),
                          child: SizedBox(
                            child: Image.asset('assets/images/dog-bone.png'),
                            width: 140,
                            height: 180,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 8),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.location_on,
                                  size: 16, color: ColorStyles.color_666666),
                              SizedBox(width: 4),
                              Text('City',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: ColorStyles.color_6f6f6f))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          width: SizeFit.screenWidth * 0.9,
                          decoration: BoxDecoration(
                              color: ColorStyles.color_f7f7f7,
                              borderRadius: BorderRadius.circular(4)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(children: <InlineSpan>[
                                  WidgetSpan(
                                    child: Text('nickname' + ': ',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: ColorStyles.color_526e94)),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  WidgetSpan(
                                      child: Text('Alo',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: ColorStyles.color_666666)),
                                      alignment: PlaceholderAlignment.middle)
                                ]),
                                softWrap: true,
                              ),
                              SizedBox(height: 3),
                              Text.rich(
                                TextSpan(children: <InlineSpan>[
                                  WidgetSpan(
                                    child: Text(
                                      'View more comment',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: ColorStyles.color_526e94,
                                      ),
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.keyboard_arrow_right,
                                      size: 20,
                                      color: ColorStyles.main_color,
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  )
                                ]),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Divider(color: ColorStyles.color_e8e8e8, height: 0.5),
                        Container(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: Container(
                                  width: 70,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.favorite,
                                        size: 20,
                                        color: ColorStyles.color_666666,
                                      ),
                                      SizedBox(width: 3),
                                      Text(
                                        '123',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: ColorStyles.color_666666,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  //
                                },
                              ),
                              Container(
                                width: 70,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.message,
                                      size: 20,
                                      color: ColorStyles.color_666666,
                                    ),
                                    SizedBox(width: 3),
                                    Text(
                                      '456',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: ColorStyles.color_666666,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 70,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.share,
                                      size: 20,
                                      color: ColorStyles.color_666666,
                                    ),
                                    SizedBox(width: 3),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: ColorStyles.color_666666,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(height: 10, color: ColorStyles.color_f7f7f7),
                ],
              ),
              onTap: () {
                //
              },
            );
          },
          childCount: 5,
        ),
      ),
    );
  }
}
