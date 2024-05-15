import 'package:flutter/material.dart';

void showTopCenterMessage(BuildContext context, String message, Color color, bool isSuccess) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 50.0,
      left: MediaQuery.of(context).size.width * 0.1,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          decoration: BoxDecoration(
            color: isSuccess ? color : Colors.red, // Use red color for error message
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isSuccess ? Icons.check : Icons.error, // Use check icon for success, error icon for failure
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  overlay?.insert(overlayEntry);

  // Remove the overlay after 1 second
  Future.delayed(Duration(seconds: 1), () {
    overlayEntry.remove();
  });
}
