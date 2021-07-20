import 'package:calculate_age/shared/components/components.dart';
import 'package:flutter/material.dart';

class ResultOfAge extends StatelessWidget {
  var day;
  var month;
  var year;
  ResultOfAge({Key? key,this.day, this.month, this.year}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Result',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        '$year  Years,',
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        '$month  Months,',
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text('$day  Days.'),
                    ],
                  ),
                ],
              ),
              defaultButton(
                label: 'Calculate Again',
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
