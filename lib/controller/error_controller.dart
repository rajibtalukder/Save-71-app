

import '../constants/utils.dart';
import '../service/api/api_exception.dart';

class ErrorController {
  void handleApiError(error) {
    print(error);
    switch (error) {
      case BadRequestException:
        Utils.hidePopup();
        Utils.showSnackBar("Failed to load data $error");
        break;
      case ApiNotRespondingException:
        Utils.hidePopup();
        Utils.showSnackBar("Failed to load data $error");
        break;
    // show error dialog
      case ProcessDataException:
        Utils.hidePopup();
        Utils.showSnackBar("Failed to load data $error");
        break;
    // show error dialog
      default:
        Utils.hidePopup();
        Utils.showSnackBar("Failed to load data $error");
        break;
    // show error dialog
    }
  }
}
