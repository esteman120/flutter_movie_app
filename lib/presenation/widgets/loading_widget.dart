import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/presenation/theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Theme.of(Get.context!).colorScheme.black45,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              SizedBox(
                height: 10,
              ),
              // Container(
              //     child: Text(
              //   message == '' ? '' : message,
              //   style: TextStyle(
              //       decoration: TextDecoration.none,
              //       color: Colors.white,
              //       fontSize: 8,
              //       fontFamily: 'N27Bold'),
              // ))
            ],
          ),
        ),
      ),
    );
  }
}
