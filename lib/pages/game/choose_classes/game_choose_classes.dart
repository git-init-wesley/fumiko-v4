import 'package:flutter/material.dart';
import 'package:fumiko/entities/user/classes/user_classes.dart';

class GameChooseClasses extends StatefulWidget {
  const GameChooseClasses({super.key, required this.setClasses});

  final void Function(UserClass) setClasses;

  @override
  State<GameChooseClasses> createState() => _GameChooseClassesState();
}

class _GameChooseClassesState extends State<GameChooseClasses> {
  final PageController pageController = PageController(keepPage: false);

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: pageController,
        children: UserClasses.classes.map((e) {
          return SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Colors.red, Colors.red.shade900], begin: Alignment.centerLeft, end: Alignment.centerRight), borderRadius: BorderRadius.circular(2)),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [
                            for (int i = 0; i < UserClasses.classes.length; i++)
                              Container(
                                  decoration: BoxDecoration(color: currentPage == i ? Colors.white.withOpacity(0.05) : null, borderRadius: BorderRadius.circular(2)),
                                  child: TextButton(
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 4, horizontal: 8)),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))),
                                          overlayColor: MaterialStateProperty.all<Color>(Colors.redAccent)),
                                      onPressed: () => setState(() {
                                            pageController.animateToPage(currentPage = i, duration: const Duration(microseconds: 1), curve: Curves.linear);
                                          }),
                                      child: Text(UserClasses.fromCode(UserClasses.classesCode.elementAt(i)).name(context),
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.titleLarge?.fontSize ?? 0))))
                          ])),
                      _buildClasses(context: context, classes: e),
                    ],
                  )));
        }).toList());
  }

  Widget _buildClasses({required BuildContext context, required UserClass classes}) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 512),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(margin: const EdgeInsets.only(bottom: 8), child: Text(classes.description)),
          Container(margin: const EdgeInsets.only(bottom: 8), child: classes.icon.toImage(width: 320)),
          Container(margin: const EdgeInsets.only(bottom: 8), child: classes.graphics.toImage(width: 320)),
          ElevatedButton(
              onPressed: () => widget.setClasses(classes),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))),
                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0))),
              child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.red, Colors.red.shade900], begin: Alignment.centerLeft, end: Alignment.centerRight), borderRadius: BorderRadius.circular(2)),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), boxShadow: [
                      BoxShadow(color: Colors.red.withOpacity(0.1), spreadRadius: 0.1, blurRadius: 4, offset: const Offset(3, 1.5)),
                      BoxShadow(color: Colors.red.withOpacity(0.1), spreadRadius: 0.1, blurRadius: 4, offset: const Offset(-3, -1.5))
                    ]),
                    constraints: const BoxConstraints(maxWidth: 192, minHeight: 48),
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                    alignment: Alignment.center,
                    child: Text('Choisir la classe ${classes.name(context)}',
                        textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.titleLarge!.fontSize!)),
                  )))
        ],
      ),
    );
  }
}
