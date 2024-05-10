import 'package:pouchers/app/app.logger.dart';
import 'package:image_picker/image_picker.dart';

class ImageManager {
  final _logger = getLogger('ImageManager');
  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> pickImage(
      {ImageSource imageSource = ImageSource.gallery}) async {
    try {
      return await _imagePicker.pickImage(
          source: imageSource, maxHeight: 300, maxWidth: 300, imageQuality: 50);
    } catch (e) {
      _logger.e(e);
    }
    return null;
  }
}
