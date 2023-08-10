import 'package:flutter/widgets.dart';

class WidgetListBuilder extends StatelessWidget {
  const WidgetListBuilder({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
  }) : super(key: key);
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(itemCount, (index) => itemBuilder(context, index))
          .toList(),
    );
  }
}
