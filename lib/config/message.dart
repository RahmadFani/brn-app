import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';

get showError => AlertController.show(
    "Oops!", 'An error occurred, please try again.', TypeAlert.error);
showWarning({String msg = "Please try again"}) =>
    AlertController.show("Warning", '$msg', TypeAlert.warning);
showSuccess({String msg = "All good"}) =>
    AlertController.show("Success", '$msg', TypeAlert.success);
