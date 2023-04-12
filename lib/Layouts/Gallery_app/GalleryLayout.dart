
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_updated/Layouts/Gallery_app/cubit/cubit.dart';
import 'package:news_app_updated/Layouts/Gallery_app/cubit/states.dart';

import 'package:news_app_updated/network/remote/DioHelper.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)  => GalleryCubit(),
      child: BlocConsumer<GalleryCubit,GalleryStates>(
        listener: (context, state) =>{},
        builder: (context,state)  {
          return Scaffold(
            appBar: AppBar(
              title: Text('tesat'),
            ),
            body: Center(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                GalleryCubit.get(context).getImage();
              },
              child: const Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        }

      ),
    );
  }
}
