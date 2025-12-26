import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:mask/mask/mask.dart';

class PhoneFormField extends StatefulWidget {
  const PhoneFormField({Key? key, required this.onChange, this.phone, this.onlyRead = false}) : super(key: key);

  final void Function(String value) onChange;
  final String? phone;
  final bool onlyRead;

  @override
  PhoneFormFieldState createState() => PhoneFormFieldState();
}

class PhoneFormFieldState extends State<PhoneFormField> {
  late final TextEditingController _textController;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.phone);
    _focusNode = FocusNode();
    if (!kIsWeb) {
      _focusNode.requestFocus();
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 18),
      padding: const EdgeInsets.all(1.45),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: TextField(
        //autofocus: true,
        focusNode: _focusNode,
        readOnly: widget.onlyRead,
        controller: _textController,
        onChanged: widget.onChange,
        style: AppStyles.bold20s.copyWith(color: Color(0xFF2B373E)),
        decoration: InputDecoration(
          border: null,
          disabledBorder: InputBorder.none,
          filled: true,
          fillColor: Color(0xFFE3F1FF),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.white),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          hintText: 'Номер телефона',
          hintStyle: AppStyles.bold20s.copyWith(color: Color(0xFF9CA5AF)),
          prefixIcon: Container(
            padding: const EdgeInsets.only(top: 2.5),
            width: 54,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text('+7  ', style: AppStyles.bold20s.copyWith(color: Color(0xFF2B373E))),
            ),
          ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          Mask.generic(masks: ['(###) ###-##-##']),
        ],
      ),
    );
  }
}
