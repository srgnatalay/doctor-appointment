import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? appTitle;

  const CustomAppBar({super.key, this.appTitle});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        widget.appTitle!,
        style: const TextStyle(
          color: Color.fromRGBO(41, 41, 41, 1),
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          FluentIcons.ios_arrow_ltr_24_filled,
          color: Color.fromRGBO(41, 41, 41, 1),
        ),
      ),
    );
  }
}




// AppBar(
//       centerTitle: true,
//       automaticallyImplyLeading: true,
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       title: Text(
//         widget.appTitle!,
//         style: const TextStyle(fontSize: 20, color: Colors.black),
//       ),
//       leading: widget.icon != null
//           ? Container(
//               margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Config.primaryColor),
//               child: IconButton(
//                 onPressed: () {
//                   if (widget.route != null) {
//                     Navigator.pushNamed(context, widget.route!);
//                   } else {
//                     Navigator.pop(context);
//                   }
//                 },
//                 icon: widget.icon!,
//                 iconSize: 16,
//                 color: Colors.white,
//               ),
//             )
//           : null,
//       actions: widget.actions,
//     );