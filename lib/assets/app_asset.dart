/// Asset manager that uses AssetConfig for configurable asset paths
///
/// This class provides a clean way to access assets without needing to
/// extend classes. Simply pass an AssetConfig instance to get asset paths.
abstract class AppAsset {
  /// Get image asset path
  String image() => 'assets/images/';

  /// Get icon asset path
  String icon() => 'assets/icon/';

  /// Get animation asset path
  String animation() => 'assets/animations/';

  /// Get SVG asset path
  String svg() => 'assets/svg/';
}
