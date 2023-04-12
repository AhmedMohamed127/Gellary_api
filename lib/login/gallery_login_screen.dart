import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_updated/Shared/components/components2.dart';
import 'package:news_app_updated/login/cubit/cubit.dart';
import 'package:news_app_updated/login/cubit/states.dart';
import 'package:news_app_updated/modules/Gallery_App/Gallery/GallaryScreen.dart';


class GallaryLoginScreen extends StatelessWidget
{
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => GalleryLoginCubit(),
      child: BlocConsumer<GalleryLoginCubit, GalleryLoginStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              alignment: Alignment.center,
              width: double.infinity,
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    children: [
                      const Text(
                        '    My \nGellary\n',
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff6e6e6e)
                        ),
                      ),
                      Opacity(
                        opacity: 0.6,
                        child: BlurryContainer(
                          blur: 5,
                          color: Colors.transparent,
                          elevation: 0.1,
                          padding: const EdgeInsets.all(8),
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          child: Form(
                            key: formKey,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'LOG IN',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black
                                    )
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  defaultFormField(
                                    controller: emailController,
                                    type: TextInputType.emailAddress,
                                    validate: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'please enter your email address';
                                      }
                                    },
                                    label: 'User Name',
                                    prefix: Icons.email_outlined,
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  defaultFormField(
                                    controller: passwordController,
                                    type: TextInputType.visiblePassword,
                                    suffix: GalleryLoginCubit.get(context).suffix,
                                    onSubmit: (value) {
                                      if (formKey.currentState!.validate()) {
                                        GalleryLoginCubit.get(context).userLogin(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                      }
                                    },
                                    isPassword: GalleryLoginCubit.get(context).isPassword,
                                    suffixPressed: () {
                                      GalleryLoginCubit.get(context)
                                          .changePasswordVisibility();
                                    },
                                    validate: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'password is too short';
                                      }
                                    },
                                    label: 'Password',
                                    prefix: Icons.lock_outline,
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                   defaultButton(
                                      function: () {
                                        if (formKey.currentState!.validate()) {
                                          GalleryLoginCubit.get(context).userLogin(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          );
                                        }
                                        navigateAndFinish(context, GallaryScreen());
                                      },
                                      text: 'Submit',
                                      isUpperCase: true,
                                    ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}