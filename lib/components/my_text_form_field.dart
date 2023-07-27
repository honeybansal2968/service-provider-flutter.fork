import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MyTextFormField extends StatelessWidget {
  final String? label;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? hintText;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
final void Function(String)? onChanged;
  const MyTextFormField({
    Key? key,
    this.label,
    this.inputFormatters,
    this.controller,
    this.validator,
    this.maxLength,
    this.maxLines = 1,
    this.keyboardType,
    this.hintText,
    this.focusNode,
    this.onFieldSubmitted,
    this.textInputAction,
    this.contentPadding, this.onChanged,
  }) : super(key: key);

  OutlineInputBorder border({Color color = Colors.black, double width = 1.0}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              "$label",
              style: TextStyle(color: Colors.black,fontSize: 15),
              ),
            ),

        Theme(
          data: ThemeData(
            useMaterial3: false,
          ),
          child: TextFormField(
            focusNode: focusNode,
            controller: controller,
            cursorColor: Colors.purple,
            validator: validator,
            maxLength: maxLength,
            maxLines: maxLines,
            keyboardType: keyboardType,
            onFieldSubmitted: onFieldSubmitted,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
            // style: MyTextStyle.regular.copyWith(
            //   fontSize: 18,
            //   color: appPrimary,
            // ),
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction,
            decoration: InputDecoration(
              fillColor: Colors.green.shade50,
              filled: true,
              counterText: "",
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
              hintText: hintText,
              hintMaxLines: 1,
              hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 15),

              border: border(
                width: 0.75,
              ),
              focusedBorder: border(
                color: Colors.blue,
                width: 2,
              ),
              disabledBorder: border(
                width: 0.75,
              ),
              enabledBorder: border(
                width: 0.75,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
