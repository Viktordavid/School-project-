import 'package:flutter/material.dart';
import 'package:school_project/views/shared/spacer.dart';

class CustomDropDown extends StatefulWidget {
  final List<Map<String, String>> items;
  final TextEditingController controller;
  final String label;

  const CustomDropDown({
    Key? key,
    required this.items,
    required this.controller,
    required this.label,
  }) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  late String _value;

  @override
  void initState() {
    super.initState();
    _value = widget.items.first['value']!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.label,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Theme.of(context).buttonColor),
        ),
        CustomSpacer(flex: 3),
        DropdownButtonFormField(
            value: _value,
            items: widget.items
                .map(
                  (e) => DropdownMenuItem(
                    child: Text(e['key']!),
                    onTap: () {
                      widget.controller.text = e['value']!;
                      _value = e['value']!;
                      setState(() {});
                    },
                  ),
                )
                .toList()),
      ],
    );
  }
}
