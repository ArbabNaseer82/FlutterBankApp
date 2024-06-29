import 'package:bankapp/Constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomImageTextBox extends StatelessWidget {
  final String imageURl;
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  const CustomImageTextBox({
    super.key,
    required this.imageURl,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
            border: Border.all(
          width: 1,
          color: Colors.grey,
        )),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Image.network(
                imageURl,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        title,
                        style:
                            TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                      ElevatedButton(
                        onPressed: onTap,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.primaryColor),
                        ),
                        child: Title(
                          color: Colors.white,
                          child: Text(
                            'APPLY NOW',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
