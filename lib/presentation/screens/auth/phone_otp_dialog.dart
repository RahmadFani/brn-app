import 'package:brn/model/data_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneOtpDialog extends StatefulWidget {
  String verificationId;
  Function(DataState) callback;

  PhoneOtpDialog({Key key, this.verificationId, this.callback})
      : super(key: key);

  @override
  _PhoneOtpDialogState createState() => _PhoneOtpDialogState();
}

class _PhoneOtpDialogState extends State<PhoneOtpDialog> {
  DataState dataState = DataStateIdle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IndexedStack(
              index: dataState is DataStateLoading ? 1 : 0,
              alignment: Alignment.center,
              children: [
                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  minLines: 1,
                  maxLines: 1,
                  onChanged: textChangedListener,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    // labelText: "masukka",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  style: TextStyle(fontSize: 22),
                ),
                CircularProgressIndicator()
              ]),
          Text(
            dataState is DataStateError
                ? (dataState as DataStateError).errorMessage
                : '',
            style: TextStyle(color: Colors.red[800]),
          )
        ],
      ),
    );
  }

  void textChangedListener(String text) {
    if (text.length == 6 && !(dataState is DataStateLoading)) {
      setState(() {
        dataState = DataStateLoading();
      });
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId, smsCode: text);
      FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((UserCredential credential) {
        setState(() {
          dataState = DataStateSuccess(data: credential);
          widget.callback.call(dataState);
        });
      }).onError((error, stackTrace) {
        setState(() {
          dataState = DataStateError(errorMessage: "${error?.toString()}");
          widget.callback.call(dataState);
        });
      });
    }
  }
}
