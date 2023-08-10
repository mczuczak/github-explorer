import 'package:flutter/material.dart';
import 'package:github_explorer/components/common/button.dart';

class TileButtonComponent extends StatefulWidget {
  const TileButtonComponent({
    Key? key,
    required this.child,
    this.onPressed,
    this.disabled = false,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final bool disabled;

  @override
  State<TileButtonComponent> createState() => _TileButtonComponentState();
}

class _TileButtonComponentState extends State<TileButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return ButtonComponent(
      type: ButtonComponentType.secondary,
      size: ButtonComponentSize.flexible,
      disableLoading: true,
      disabled: widget.disabled,
      onPressed:
          widget.onPressed != null ? () async => widget.onPressed!() : null,
      content: Padding(
        padding: const EdgeInsets.all(16),
        child: widget.child,
      ),
    );
  }
}
