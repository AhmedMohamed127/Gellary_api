abstract class GalleryStates {}
class GalleryInitialState extends GalleryStates {}
class GalleryGetTeslaSuccessState extends GalleryStates {}

class GalleryGetTeslaErrorState extends GalleryStates
{
  final String error;

  GalleryGetTeslaErrorState(this.error);
}