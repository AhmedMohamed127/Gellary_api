
abstract class GalleryLoginStates {}

class GalleryLoginInitialState extends GalleryLoginStates {}

class GalleryLoginLoadingState extends GalleryLoginStates {}

class GalleryLoginSuccessState extends GalleryLoginStates
{
}

class GalleryLoginErrorState extends GalleryLoginStates
{
  final String error;

  GalleryLoginErrorState(this.error);
}

class GalleryChangePasswordVisibilityState extends GalleryLoginStates {}
