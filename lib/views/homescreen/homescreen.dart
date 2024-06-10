import 'package:flutter/material.dart';
import 'package:question_answer_app/constants/colorpallet.dart';
import 'package:question_answer_app/controller/homescreen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = HomeScreenController();

  var correctIcon = Container(
    margin: EdgeInsets.symmetric(horizontal: 4),
    child: Icon(
      Icons.check,
      color: correctanscolor,
    ),
  );

  var wrongIcon = Container(
    margin: EdgeInsets.symmetric(horizontal: 4),
    child: Icon(
      Icons.close,
      color: wronganscolor,
    ),
  );

  checkans(ans) {
    if (controller.index < controller.questions.length - 1) {
      if (ans == controller.questions[controller.index].ans) {
        answerTick.add(correctIcon);
      } else {
        answerTick.add(wrongIcon);
      }
      controller.index++;
      setState(() {});
    }
  }

  List<Widget> answerTick = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "GK Test",
            style: TextStyle(
              color: blackcolor,
              fontSize: 25,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(
            top: 50,
            left: 16,
            right: 16,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Q${controller.index + 1}.",
                    style: TextStyle(
                      color: whitecolor,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      controller.questions[controller.index].question!,
                      style: TextStyle(
                        color: whitecolor,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              customRoundedButton(
                  ontap: () =>
                      checkans(controller.questions[controller.index].opt1!),
                  optitle: "a.",
                  option: controller.questions[controller.index].opt1!),
              customRoundedButton(
                  ontap: () =>
                      checkans(controller.questions[controller.index].opt2!),
                  optitle: "b.",
                  option: controller.questions[controller.index].opt2!),
              customRoundedButton(
                  ontap: () =>
                      checkans(controller.questions[controller.index].opt3!),
                  optitle: "c.",
                  option: controller.questions[controller.index].opt3!),
              customRoundedButton(
                  ontap: () =>
                      checkans(controller.questions[controller.index].opt4!),
                  optitle: "d.",
                  option: controller.questions[controller.index].opt4!),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            height: 60,
            color: blackcolor,
            child: Row(children: answerTick),
          ),
        ),
      ),
    );
  }

  customRoundedButton({ontap, optitle, option, color}) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 8,
        ),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color ?? whitecolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              optitle ?? "a.",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                option ?? "Narendra modi",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
