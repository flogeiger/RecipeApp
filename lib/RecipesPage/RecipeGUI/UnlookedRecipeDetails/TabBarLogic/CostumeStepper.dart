import 'package:flutter/material.dart';
import 'package:sample/models/Recipe.dart';
import 'package:sample/services/SavePoints.dart';

import '../../../../utils/Preference.dart';

class CostumeStepper extends StatefulWidget {
  Recipe recipe;
  CostumeStepper(this.recipe);
  @override
  _CostumeStepperState createState() => _CostumeStepperState();
}

class _CostumeStepperState extends State<CostumeStepper> {
  List<Step>? _steps;
  int _current = 0;

  @override
  // ignore: must_call_super
  void initState() {
    _current = 0;
    stepList();
  }

  List<Step>? stepList() {
    _steps = <Step>[];
    for (var i = 0; i < widget.recipe.preparationsteps!.length; i++) {
      Step? step;
      if (widget.recipe.preparationsteps!.length - 1 == i) {
        step = new Step(
            title: Text('Der Letzte Schritt'),
            content: Column(
              children: [
                Text(
                  widget.recipe.preparationsteps![i],
                ),
                InkWell(
                  onTap: () {
                    SavePoints.savePoints(30, 'Gericht wurde zubereitet');

                    setState(() {
                      Preference.shared.setInt(Preference.cookingcount, 1);
                      Preference.shared
                          .setBool(Preference.checkTodayscooking, true);
                    });
                  },
                  child: Container(
                    color: Colors.black,
                    height: 40,
                    width: 100,
                    child: Center(
                      child: Text(
                        "finish",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
            isActive: i <= _current ? true : false,
            state: StepState.complete);
      } else {
        step = new Step(
            title: Text('Zubereitungsschritt: ' + (i + 1).toString()),
            content: Text(widget.recipe.preparationsteps![i]),
            isActive: i <= _current ? true : false,
            state: StepState.complete);
      }

      _steps!.add(step);
    }
  }

  void _stepContinue() {
    setState(() {
      _current++;
      if (_current >= _steps!.length) _current = _steps!.length - 1;

      stepList();
    });
  }

  void _stepCancel() {
    setState(() {
      _current--;
      if (_current < 0) _current = 0;
      stepList();
    });
  }

  void _stepTap(int index) {
    setState(() {
      _current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stepper(
        physics: ClampingScrollPhysics(),
        steps: _steps!,
        type: StepperType.vertical,
        currentStep: this._current,
        onStepCancel: _stepCancel,
        onStepContinue: _stepContinue,
        onStepTapped: _stepTap,
      ),
    );
  }
}
