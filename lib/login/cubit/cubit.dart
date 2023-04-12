import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_updated/Shared/constants.dart';
import 'package:news_app_updated/login/cubit/states.dart';
import 'package:news_app_updated/network/remote/DioHelper.dart';


class GalleryLoginCubit extends Cubit<GalleryLoginStates> {
  GalleryLoginCubit() : super(GalleryLoginInitialState());

  static GalleryLoginCubit get(context) => BlocProvider.of(context);


  void userLogin({
    required String email,
    required String password,
  })
  {
    emit(GalleryLoginLoadingState());

    DioHelper.postData(
      url: 'auth/login',
      data:
      {
        'email': email,
        'password': password,
      },
    ).then((value)
    {
   //
      //  token =  value.data['token'];
      emit(GalleryLoginSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(GalleryLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(GalleryChangePasswordVisibilityState());
  }
}
