import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app_updated/Layouts/Gallery_app/cubit/states.dart';
import 'package:news_app_updated/network/remote/DioHelper.dart';

class GalleryCubit extends Cubit<GalleryStates>{
  GalleryCubit()   :super(GalleryInitialState());
  static GalleryCubit get(context) => BlocProvider.of(context);


  List<dynamic> gallary =[];

  void getGalleryData()
  {
    DioHelper.getData(
        url: "my-gallery",
    ).then((value)
    {
      gallary = value.data['data']['images'];
      emit(GalleryGetTeslaSuccessState());
    }
    ).catchError((error){
      print(error.toString());
      emit(GalleryGetTeslaErrorState(error.toString()));
    });
  }




// pick image:
  Future getImage() async {
    File _image;
    final picker = ImagePicker();

    var _pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50, // <- Reduce Image quality
        maxHeight: 500,  // <- reduce the image size
        maxWidth: 500);

    _image = File(_pickedFile!.path);
    _upload(_image);
  }


  Future getImage2() async {
    File _image;
    final picker = ImagePicker();

    var _pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50, // <- Reduce Image quality
        maxHeight: 500,  // <- reduce the image size
        maxWidth: 500);

    _image = File(_pickedFile!.path);
    _upload(_image);
  }

  void _upload(File file) async {
    String fileName = file.path.split('/').last;

    FormData data = FormData.fromMap({
      "img": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });

    Dio dio = new Dio();

    dio.post("https://technichal.prominaagency.com/api/upload", data: data)
        .then((response) => print(response))
        .catchError((error) => print(error));
  }

}