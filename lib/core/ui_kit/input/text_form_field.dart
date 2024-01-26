import 'package:flicker_api_app/core/base/domain/entities/text_input_entity.dart';
import 'package:flicker_api_app/core/config/theme/app_theme.dart';
import 'package:flicker_api_app/core/ui_kit/spacing.dart';
import 'package:flicker_api_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TextFormFieldType {
  normal,
  password,
  email,
  phone,
  search,
  searchLocation,
  module,
  multiLine,
  calender,
  backCard,
  country
}

class ApTextFormField extends StatefulWidget {
  const ApTextFormField.email({
    Key? key,
    this.label,
    this.hint,
    this.leading = Icons.email,
    this.trailing,
    this.hasMonth = false,
    this.hasPound = false,
    this.type = TextFormFieldType.email,
    this.forgetPassword,
    this.showModuleDialog,
    this.width,
    this.height,
    this.validator,
    this.keyboardType = TextInputType.emailAddress,
    this.enableFocusNode = false,
    this.readOnly = false,
    this.inputFormatter,
    this.labelHasHeader,
    this.showCalenderDialog,
    this.onchange,
    this.textInputAction = TextInputAction.done,
    this.onSubmit,
    this.errorHeight,
    this.maxLength,
    required this.textInput,
  }) : super(key: key);

  const ApTextFormField.moduleDialog({
    Key? key,
    this.label,
    this.hint,
    this.leading,
    this.trailing,
    this.hasMonth = false,
    this.hasPound = false,
    this.type = TextFormFieldType.module,
    this.forgetPassword,
    this.showModuleDialog,
    this.width,
    this.height,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.enableFocusNode = false,
    this.readOnly = true,
    this.inputFormatter,
    this.labelHasHeader,
    this.showCalenderDialog,
    this.onchange,
    this.textInputAction = TextInputAction.done,
    this.onSubmit,
    this.errorHeight,
    this.maxLength,
    required this.textInput,
  }) : super(key: key);

  const ApTextFormField.calenderDialog({
    Key? key,
    this.label,
    this.hint,
    this.leading,
    this.trailing,
    this.hasMonth = false,
    this.hasPound = false,
    this.type = TextFormFieldType.calender,
    this.forgetPassword,
    this.showModuleDialog,
    this.width,
    this.height,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.enableFocusNode = false,
    this.readOnly = true,
    this.inputFormatter,
    this.labelHasHeader,
    this.showCalenderDialog,
    this.onchange,
    this.textInputAction = TextInputAction.done,
    this.onSubmit,
    this.errorHeight,
    this.maxLength,
    required this.textInput,
  }) : super(key: key);

  const ApTextFormField.search({
    Key? key,
    this.label,
    this.hint,
    this.leading = Icons.search,
    this.trailing,
    this.hasMonth = false,
    this.hasPound = false,
    this.type = TextFormFieldType.search,
    this.forgetPassword,
    this.showModuleDialog,
    this.width,
    this.height,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.enableFocusNode = false,
    this.readOnly = false,
    this.inputFormatter,
    this.labelHasHeader,
    this.showCalenderDialog,
    this.onchange,
    this.textInputAction = TextInputAction.search,
    this.onSubmit,
    this.errorHeight,
    this.maxLength,
    required this.textInput,
  }) : super(key: key);

  const ApTextFormField.searchLocation({
    Key? key,
    this.label,
    this.hint,
    this.leading = Icons.search,
    this.trailing,
    this.hasMonth = false,
    this.hasPound = false,
    this.type = TextFormFieldType.searchLocation,
    this.forgetPassword,
    this.showModuleDialog,
    this.width,
    this.height,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.enableFocusNode = false,
    this.readOnly = false,
    this.inputFormatter,
    this.labelHasHeader,
    this.showCalenderDialog,
    this.onchange,
    this.textInputAction = TextInputAction.search,
    this.onSubmit,
    this.errorHeight,
    this.maxLength,
    required this.textInput,
  }) : super(key: key);

  const ApTextFormField.password({
    Key? key,
    this.label,
    this.hint,
    this.leading = Icons.lock,
    this.trailing = Icons.remove_red_eye,
    this.hasMonth = false,
    this.hasPound = false,
    this.type = TextFormFieldType.password,
    this.forgetPassword,
    this.showModuleDialog,
    this.width,
    this.height,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.enableFocusNode = false,
    this.readOnly = false,
    this.inputFormatter,
    this.labelHasHeader,
    this.showCalenderDialog,
    this.onchange,
    this.textInputAction = TextInputAction.done,
    this.onSubmit,
    this.errorHeight,
    this.maxLength,
    required this.textInput,
  }) : super(key: key);

  const ApTextFormField.multiLine({
    Key? key,
    this.label,
    this.hint,
    this.leading,
    this.trailing,
    this.hasMonth = false,
    this.hasPound = false,
    this.type = TextFormFieldType.multiLine,
    this.forgetPassword,
    this.showModuleDialog,
    this.width,
    this.height,
    this.validator,
    this.keyboardType = TextInputType.multiline,
    this.enableFocusNode = false,
    this.readOnly = false,
    this.inputFormatter,
    this.labelHasHeader,
    this.showCalenderDialog,
    this.onchange,
    this.textInputAction = TextInputAction.newline,
    this.onSubmit,
    this.errorHeight,
    this.maxLength,
    required this.textInput,
  }) : super(key: key);

  const ApTextFormField.bankCard({
    Key? key,
    this.label,
    this.hint,
    this.leading,
    this.trailing,
    this.hasMonth = false,
    this.hasPound = false,
    this.type = TextFormFieldType.backCard,
    this.forgetPassword,
    this.showModuleDialog,
    this.width,
    this.height,
    this.validator,
    this.keyboardType = TextInputType.number,
    this.enableFocusNode = false,
    this.readOnly = false,
    this.inputFormatter,
    this.labelHasHeader,
    this.showCalenderDialog,
    this.onchange,
    this.textInputAction = TextInputAction.done,
    this.onSubmit,
    this.errorHeight,
    this.maxLength,
    required this.textInput,
  }) : super(key: key);

  const ApTextFormField(
      {Key? key,
      this.label,
      this.hint,
      this.leading,
      this.trailing,
      this.hasMonth = false,
      this.hasPound = false,
      this.type = TextFormFieldType.normal,
      this.forgetPassword,
      this.showModuleDialog,
      this.width,
      this.height,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.labelHasHeader,
      this.enableFocusNode = false,
      this.inputFormatter,
      this.readOnly = false,
      this.showCalenderDialog,
      this.onchange,
      this.textInputAction = TextInputAction.done,
      this.onSubmit,
      this.errorHeight,
      this.maxLength,
      required this.textInput})
      : super(key: key);

  final String? label;
  final String? hint;
  final IconData? leading;
  final IconData? trailing;
  final bool hasMonth;
  final bool hasPound;

  final TextFormFieldType? type;
  final VoidCallback? forgetPassword;
  final TextInEntity textInput;

  final VoidCallback? showModuleDialog;
  final VoidCallback? showCalenderDialog;

  final double? width;
  final double? height;
  final TextInputType? keyboardType;

  final String? Function(String?)? validator;
  final ValueChanged<String>? onchange;
  final ValueChanged<String>? onSubmit;

  final bool? enableFocusNode;

  final bool? readOnly;

  final bool? labelHasHeader;

  final List<TextInputFormatter>? inputFormatter;
  final TextInputAction? textInputAction;

  final double? errorHeight;
  final int? maxLength;

  @override
  State<ApTextFormField> createState() => _ApTextFormFieldState();
}

class _ApTextFormFieldState extends State<ApTextFormField> {
  FocusNode? focusNode;

  bool _obscureText = false;

  @override
  initState() {
    focusNode = FocusNode();

    // focusNode?.addListener(() {
    //   _shadowKey.currentState?.setState(() {});
    // });
    _obscureText = widget.textInput.type == TextFormFieldType.password;

    if (widget.type == TextFormFieldType.country) {
      widget.textInput.textController.addListener(
        () {
          // getCountryEmoji();
        },
      );
    }

    lastText = widget.textInput.textController.text;

    widget.textInput.textController.addListener(_stateManager);

    super.initState();
  }

  @override
  void dispose() {
    focusNode?.dispose();
    if (widget.textInput.type == TextFormFieldType.backCard) {
      widget.textInput.textController.dispose();
    }
    widget.textInput.textController.removeListener(_stateManager);
    super.dispose();
  }

  late String lastText;

  _stateManager() {
    var newText = widget.textInput.textController.text;

    var setStateRequired = false;
    if (widget.textInput.error.isNotEmpty) {
      widget.textInput.error = "";
      setStateRequired = true;
    }

    if (lastText.isEmpty || newText.isEmpty) {
      setStateRequired = true;
    }
    if (setStateRequired) {
      setState(() {});
    }
    lastText = newText;
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          if (widget.labelHasHeader ?? false)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                  color: Theme.of(context).blue10,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  )),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.label ?? '-',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600, color: Theme.of(context).black),
                ),
              ),
            )
          else
            Text(
              widget.label ?? '-',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontWeight: FontWeight.w500, color: Theme.of(context).black),
            ),
        if (!(widget.labelHasHeader ?? false)) Space.h8,
        Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(
            maxWidth: widget.width ?? double.maxFinite,
            minWidth: widget.width ?? double.maxFinite,
            minHeight: widget.type == TextFormFieldType.multiLine ? 150 : widget.height ?? 48,
            maxHeight: widget.type == TextFormFieldType.multiLine ? 200 : widget.height ?? 48,
          ),
          child: TextFormField(
            maxLength: widget.maxLength,
            autocorrect: false,
            keyboardType: widget.keyboardType,
            textAlignVertical: widget.type == TextFormFieldType.multiLine ? TextAlignVertical.top : null,
            expands: widget.type == TextFormFieldType.multiLine,
            minLines: widget.type == TextFormFieldType.multiLine ? null : 1,
            maxLines: widget.type == TextFormFieldType.multiLine ? null : 1,
            // allow user to enter 5 line in textfield
            onTap: widget.type == TextFormFieldType.module
                ? widget.showModuleDialog?.call
                : widget.type == TextFormFieldType.calender
                    ? widget.showCalenderDialog?.call
                    : null,
            readOnly: widget.readOnly ?? false,
            focusNode: focusNode,
            autofocus: widget.enableFocusNode ?? false,
            onChanged: (value) {
              widget.onchange?.call(value);
            },
            controller: widget.textInput.textController,
            obscureText: widget.type == TextFormFieldType.password ? _obscureText : false,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: widget.type == TextFormFieldType.multiLine ? 12 : 0, horizontal: 12),
              filled: true,
              fillColor: Theme.of(context).white,
              hintText: widget.hint,
              errorStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w300, color: Theme.of(context).error),
              hintStyle: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontWeight: FontWeight.w400, color: Theme.of(context).gray3),
              prefixIconConstraints: null,
              prefixIcon: widget.leading != null
                  ? Padding(
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        widget.leading!,
                        size: 20,
                        color: Theme.of(context).gray3,
                      ))
                  : null,
              suffixIconConstraints: widget.trailing != null
                  ? widget.hasMonth && widget.textInput.textController.text.isNotEmpty
                      ? const BoxConstraints(maxWidth: 100)
                      : null
                  : null,
              suffixIcon: widget.textInput.type != null && widget.textInput.textController.text.isNotEmpty
                  ? widget.hasMonth
                      ? Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 12, right: 8, left: 8),
                          child: Text("/month",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).black,
                                  )),
                        )
                      : _buildSuffixIcon()
                  : _buildSuffixIcon(),
              enabledBorder: OutlineInputBorder(
                borderRadius: widget.labelHasHeader ?? false
                    ? const BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                    : const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: (widget.textInput.error != ""
                      ? Theme.of(context).colorScheme.error.withOpacity(0.5)
                      : Theme.of(context).gray5.withOpacity(0.5)),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: widget.labelHasHeader ?? false
                    ? const BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                    : const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: (widget.textInput.error != ""
                      ? Theme.of(context).colorScheme.error.withOpacity(0.5)
                      : Theme.of(context).primary.withOpacity(0.5)),
                  width: 2.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: widget.labelHasHeader ?? false
                    ? const BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                    : const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error.withOpacity(0.5),
                  width: 2.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: widget.labelHasHeader ?? false
                    ? const BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                    : const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error.withOpacity(0.5),
                  width: 2.0,
                ),
              ),
              errorMaxLines: 0,
            ),
            inputFormatters: widget.inputFormatter,
            textInputAction: widget.textInputAction,
            onFieldSubmitted: widget.onSubmit,
          ),
        ),
        errorContainer(),
        if (widget.forgetPassword != null) Space.h8,
        if (widget.forgetPassword != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: widget.forgetPassword?.call,
                child: Text(
                  S.of(context).forget_password,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontWeight: FontWeight.w400, color: Theme.of(context).black),
                ),
              ),
            ],
          ),
        if (widget.forgetPassword != null) Space.h8,
        Space.h4,
      ],
    );
  }

  Widget _buildSuffixIcon() {
    if (widget.textInput.type == TextFormFieldType.search) {
      return GestureDetector(
        onTap: (widget.textInput.textController.text.isEmpty)
            ? null
            : () {
                widget.textInput.textController.clear();
                if (widget.onchange != null) {
                  widget.onchange!(widget.textInput.textController.text);
                }
                setState(() {});
              },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: widget.textInput.textController.text.isNotEmpty
              ? Icon(
                  Icons.close,
                  size: 16,
                  color: Theme.of(context).primary,
                )
              : const SizedBox(),
        ),
      );
    }

    if (widget.textInput.type == TextFormFieldType.searchLocation && !(widget.readOnly ?? false)) {
      return GestureDetector(
        onTap: (widget.textInput.textController.text.isEmpty)
            ? null
            : () {
                widget.textInput.textController.clear();
                if (widget.onchange != null) {
                  widget.onchange!(widget.textInput.textController.text);
                }
                setState(() {});
              },
        child: widget.trailing != null
            ? Padding(
                padding: const EdgeInsets.all(12),
                child: widget.textInput.textController.text.isNotEmpty
                    ? Icon(
                        Icons.close,
                        size: 16,
                        color: Theme.of(context).primary,
                      )
                    : Icon(widget.trailing!, color: Theme.of(context).gray3),
              )
            : const SizedBox(),
      );
    }

    if (widget.textInput.type == TextFormFieldType.module) {
      return GestureDetector(
        onTap: widget.showModuleDialog?.call,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.arrow_downward,
            color: Theme.of(context).gray3,
            size: 20,
          ),
        ),
      );
    }

    if (widget.textInput.type == TextFormFieldType.calender) {
      return GestureDetector(
        onTap: widget.showCalenderDialog?.call,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(
            widget.trailing ?? Icons.arrow_downward,
            color: Theme.of(context).gray3,
            size: 20,
          ),
        ),
      );
    }

    if ((widget.textInput.type == TextFormFieldType.normal || widget.textInput.type == TextFormFieldType.email) &&
        !(widget.readOnly ?? false)) {
      if (widget.textInput.textController.text.isNotEmpty) {
        return GestureDetector(
            onTap: () {
              widget.textInput.textController.clear();
              if (widget.onchange != null) {
                widget.onchange!(widget.textInput.textController.text);
              }
              setState(() {});
            },
            child: Icon(
              Icons.close,
              size: 16,
              color: Theme.of(context).primary,
            ));
      }
    }
    if (widget.textInput.type == TextFormFieldType.password) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              _toggle();
            },
            child: widget.trailing != null
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: Icon(
                      widget.trailing!,
                      color: !_obscureText ? Theme.of(context).primary : Theme.of(context).gray3,
                    ),
                  )
                : const SizedBox(),
          ),
        ],
      );
    }

    return const SizedBox();
  }

  Widget errorContainer() {
    return SizedBox(
      height: widget.textInput.error != "" ? 24 : widget.errorHeight ?? 24,
      child: widget.textInput.error != ""
          ? Padding(
              padding: const EdgeInsetsDirectional.only(top: 6),
              child: Text(
                widget.textInput.error,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w300, color: Theme.of(context).colorScheme.error),
              ),
            )
          : Container(),
    );
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(text: string, selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(text: string, selection: TextSelection.collapsed(offset: string.length));
  }
}
