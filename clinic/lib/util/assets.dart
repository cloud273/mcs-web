class Assets {
  Assets._();
  static const String _images = 'assets/images';

  static String imageUrl(String filename) => '$_images/$filename';
}
