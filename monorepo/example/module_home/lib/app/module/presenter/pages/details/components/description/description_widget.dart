import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String enterpriseName;
  final String description;

  const DescriptionWidget(
      {Key? key, required this.enterpriseName, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight:
                  Radius.circular(MediaQuery.of(context).size.width * 0.1),
              topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.1),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 65),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Text(
                        enterpriseName,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(height: 10),
                      Text(
                        description,
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
