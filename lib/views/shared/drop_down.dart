import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatefulWidget {
  final List<Map<String, String>> items;
  final TextEditingController? controller;
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
    if (widget.controller != null) widget.controller!.text = _value;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: DropdownButtonFormField(
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.sp,
        ),
        icon: Icon(
          Icons.arrow_drop_down,
          color: Theme.of(context).primaryColorDark,
          size: 28,
        ),
        value: _value,
        items: widget.items
            .map(
              (e) => DropdownMenuItem(
                value: e['value'],
                child: Text(e['key']!),
              ),
            )
            .toList(),
        onChanged: (String? value) {
          if (widget.controller != null) widget.controller!.text = value!;
          _value = value!;
          setState(() {});
        },
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(
            fontSize: 20.sp,
            color: Theme.of(context).buttonColor,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).backgroundColor),
          ),
        ),
      ),
    );
  }
}
