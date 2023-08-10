import 'package:flutter/material.dart';
import 'package:github_explorer/config/colors.dart';

class ButtonComponent extends StatefulWidget {
  const ButtonComponent({
    super.key,
    this.onPressed,
    this.content,
    this.text,
    this.disabled = false,
    this.type = ButtonComponentType.primary,
    this.size = ButtonComponentSize.medium,
    this.borderRadius = 8,
    this.disableLoading = false,
  });

  final Future<dynamic> Function()? onPressed;
  final Widget? content;
  final String? text;
  final bool disabled;
  final ButtonComponentType type;
  final ButtonComponentSize size;
  final double borderRadius;
  final bool disableLoading;

  @override
  State<ButtonComponent> createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize(),
      decoration: BoxDecoration(
        boxShadow: (widget.type == ButtonComponentType.secondary)
            ? [
                const BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 5,
                  color: Color.fromRGBO(0, 0, 0, 0.03),
                )
              ]
            : null,
      ),
      child: TextButton(
        style: (loading || widget.disabled)
            ? TextButton.styleFrom(
                backgroundColor: disabledBackgroundColor(),
                disabledMouseCursor: SystemMouseCursors.forbidden,
                enabledMouseCursor: SystemMouseCursors.click,
                padding: EdgeInsets.zero,
                foregroundColor: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius,
                  ),
                  side: const BorderSide(
                    color: ConfigColors.main,
                  ),
                ),
              )
            : TextButton.styleFrom(
                backgroundColor: backgroundColor(),
                padding: EdgeInsets.zero,
                foregroundColor: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius,
                  ),
                  side: BorderSide(
                    color: borderColor(),
                  ),
                ),
              ),
        onPressed: (loading || widget.disabled)
            ? null
            : () async {
                if (!mounted) return;
                if (!widget.disableLoading) {
                  setState(() {
                    loading = true;
                  });
                }
                if (widget.onPressed != null) {
                  await widget.onPressed!();
                }
                if (mounted) {
                  setState(() {
                    loading = false;
                  });
                }
              },
        child: (loading)
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: ConfigColors.paleSky,
                  strokeWidth: 2.0,
                ),
              )
            : Builder(
                builder: (context) {
                  return (widget.content != null)
                      ? widget.content!
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            (widget.text != null) ? widget.text! : '',
                            style: TextStyle(
                              color: textColor(),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                },
              ),
      ),
    );
  }

  Color disabledBackgroundColor() {
    if (widget.disabled) {
      return ConfigColors.main;
    }

    switch (widget.type) {
      case ButtonComponentType.primary:
        return ConfigColors.main;
      case ButtonComponentType.secondary:
        return ConfigColors.white;
    }
  }

  Color backgroundColor() {
    switch (widget.type) {
      case ButtonComponentType.primary:
        return ConfigColors.main;
      case ButtonComponentType.secondary:
        return ConfigColors.white;
    }
  }

  Color textColor() {
    switch (widget.type) {
      case ButtonComponentType.primary:
        return ConfigColors.white;
      case ButtonComponentType.secondary:
        return ConfigColors.main;
    }
  }

  Color borderColor() {
    switch (widget.type) {
      case ButtonComponentType.primary:
        return ConfigColors.main;
      case ButtonComponentType.secondary:
        return ConfigColors.mischka;
    }
  }

  double? heightSize() {
    switch (widget.size) {
      case ButtonComponentSize.small:
        return 41;
      case ButtonComponentSize.medium:
        return 48;
      case ButtonComponentSize.large:
        return 51;
      case ButtonComponentSize.flexible:
        return null;
    }
  }
}

enum ButtonComponentType {
  primary,
  secondary,
}

enum ButtonComponentSize {
  large,
  medium,
  small,
  flexible,
}
