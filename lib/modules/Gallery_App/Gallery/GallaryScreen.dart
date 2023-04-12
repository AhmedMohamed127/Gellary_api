import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_updated/Layouts/Gallery_app/cubit/cubit.dart';
import 'package:news_app_updated/Layouts/Gallery_app/cubit/states.dart';
import 'package:news_app_updated/Shared/components/components.dart';
import 'package:news_app_updated/Shared/components/components2.dart';
import 'package:news_app_updated/Shared/components/customPainterUI.dart';

class GallaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GalleryCubit()..getGalleryData(),
      child: BlocConsumer<GalleryCubit, GalleryStates>(
          listener: (context, state) => {},
          builder: (context, state) {
            var list = GalleryCubit.get(context).gallary;
            return SafeArea(
              child: Scaffold(
                body: Container(
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: [
                        Colors.white,
                        Color(0xffece1ff),
                        Color(0xfff2d2f1),
                        Color(0xffebe1ff),
                      ])),
                  child: Padding(
                    padding: const EdgeInsets.all(14.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomPaint(
                          size: Size(10.0, 5.0),
                          //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: RPSCustomPainter(),
                        ),
                        Text(
                          'Welcome',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Ahmed',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 120,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                color: Colors.white,
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  final alert = Opacity(
                                    opacity: 0.75,
                                    child: AlertDialog(
                                      backgroundColor: Colors.white,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32.0))),
                                      contentPadding:
                                          const EdgeInsets.only(top: 10.0),
                                      content: Container(
                                          width: 300.0,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                mainAxisSize: MainAxisSize.min,
                                              ),
                                            ],
                                          )),
                                      actions: [
                                        Divider(
                                          color: Colors.black87,
                                          height: 0,
                                        ),
                                        SizedBox(height: 9),
                                        defaultButton(
                                          function: () {
                                            GalleryCubit.get(context)
                                                .getImage2();
                                          },
                                          text: 'Gellary',
                                        ),
                                        SizedBox(height: 8),
                                        defaultButton(
                                          function: () {
                                            GalleryCubit.get(context)
                                                .getImage();
                                          },
                                          text: 'Camera',
                                        ),
                                        SizedBox(height: 8),
                                        /*  signUpAs(
              PHARMACY_SIGN_UP,
              "PHARMACY",
              "Routing to PHARMACY_SIGN_UP",
              "assets/images/pharmacylogo.png",
            ),
            SizedBox(height: 8),*/
                                      ],
                                    ),
                                  );
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext ctx) {
                                        return alert;
                                      });
                                  //GalleryCubit.get(context).getImage();
                                },
                                child: Text(
                                  'Upload',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 120,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                color: Colors.white,
                              ),
                              child: MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  'Log out',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Expanded(
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemBuilder: (context, index) {
                              return ArticleItem(list[index], context);
                            },
                            itemCount: list.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
//
