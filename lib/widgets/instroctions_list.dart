import 'package:flutter/material.dart';
import 'package:recipe_app/theme/app_text_theme.dart';

class InstroctionsList extends StatefulWidget {
  const InstroctionsList({super.key, required this.instructions});

  final List<String> instructions;

  @override
  State<InstroctionsList> createState() => _InstroctionsListState();
}

class _InstroctionsListState extends State<InstroctionsList> {
  late List<bool> _checkedInstructions;

  @override
  void initState() {
    _checkedInstructions = List<bool>.filled(widget.instructions.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.instructions.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        // return Text(ingredients[index]);
        return CheckboxListTile(
          value: _checkedInstructions[index],
          onChanged: (value) {
            setState(() {
              _checkedInstructions[index] = value!;
            });
          },
          title: Text('${index+1}). ${widget.instructions[index]}', style: AppTextTheme.textTheme.headlineMedium!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.normal
          ),),
        );
      },
    );
  }
}
