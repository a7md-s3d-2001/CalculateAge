import 'package:calculate_age/modules/result_of_age/result_of_age.dart';
import 'package:calculate_age/shared/components/components.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var yearController = TextEditingController();
  var monthController = TextEditingController();
  var dayController = TextEditingController();
  DateTime date = new DateTime.now();
  var birthYear = 0;
  var birthMonth = 0;
  var birthDay = 0;
  var keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculate Age',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Welcome to you in this app, if you want to known how old are you, please write your date of birthday',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[500],
              ),
            ),
            Form(
              key: keyForm,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    defaultTextForm(
                      label: 'Day',
                      controller: dayController,
                      validate: (value){
                        if (value == null || value.isEmpty) {
                          return 'shoud\'t null';
                        }
                        return null;
                      },
                    ),
                    defaultTextForm(
                      label: 'Month',
                      controller: monthController,
                      validate: (value){
                        if (value == null || value.isEmpty) {
                          return 'shoud\'t null';
                        }
                        return null;
                      },
                    ),
                    defaultTextForm(
                      label: 'Year',
                      controller: yearController,
                      validate: (value){
                        if (value == null || value.isEmpty) {
                          return 'shoud\'t null';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            defaultButton(
              label: 'Calculate Age',
              onPressed: (){
                if (keyForm.currentState!.validate()){

                }
                setState(() {
                  calculateAgeMethod();
                });
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: ResultOfAge(
                      day: birthDay,
                      month: birthMonth,
                      year: birthYear,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void calculateAgeMethod () {
    birthYear = date.year - int.parse(yearController.text);
    birthMonth = date.month - int.parse(monthController.text);
    birthDay = date.day - int.parse(dayController.text);

    if (birthMonth < 0) {
      birthMonth += 12;
      birthYear--;
    }
    if (birthDay < 0) {
      birthDay += 30;
      birthMonth--;
    }
    print(birthYear);
    print(birthMonth);
    print(birthDay);
  }
}
