import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:mask/mask/mask.dart';

class PhoneFormField extends StatefulWidget {
  const PhoneFormField({
    Key? key,
    required this.onChange,
    this.phone,
    this.onlyRead = false,
  }) : super(key: key);

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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFFFE2BA),
            Color(0xFF9690FF),
          ],
        ),
        color: AppColors.white,
      ),
      child: TextField(
        //autofocus: true,
        focusNode: _focusNode,
        readOnly: widget.onlyRead,
        controller: _textController,
        onChanged: widget.onChange,
        style: const TextStyle(
          color: AppColors.netural70p,
          fontWeight: FontWeight.w500,
          fontSize: 18,
          height: 1,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.white),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.white),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintText: 'Ваш номер',
          hintStyle: AppStyles.subBig.copyWith(
            color: AppColors.inactive,
            height: 1,
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.only(top: 2.5),
            width: 54,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '+7  ',
                style: AppStyles.titleMain.copyWith(
                  color: AppColors.mainSolid,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
