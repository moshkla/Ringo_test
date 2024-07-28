import 'package:ringo_test/core/extensions/context_extension.dart';
import 'package:ringo_test/core/router/routing_utils.dart';
import 'package:flutter/material.dart';

Future<T?> showCustomModalSheet<T>(
  BuildContext context,
  Widget child, {
  bool? isScrollControlled,
  Color? backgroundColor,
  bool? canDismiss,
  bool replace = false,
  bool? enableDrag,
}) {
  if (replace) RoutingUtils.router.pop();
  return showModalBottomSheet<T>(
    context: context,
    builder: (BuildContext context) => Padding(padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16), child: child),
    useRootNavigator: true,
    isDismissible: canDismiss ?? true,
    isScrollControlled: isScrollControlled ?? false,
    showDragHandle: true,
    enableDrag: enableDrag ?? true,
    backgroundColor: backgroundColor ?? context.switchOnTheme(Colors.white, context.scaffoldBackgroundColor),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
  );
}
