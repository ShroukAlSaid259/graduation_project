
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class buildFloatingSearchBar extends StatelessWidget {

  FloatingSearchBarController controller = FloatingSearchBarController();

  buildFloatingSearchBar({super.key});
  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return
      FloatingSearchBar(
          controller: controller,
          elevation: 6,
          hintStyle: const TextStyle(
            fontSize: 18,
          ),
          queryStyle: const  TextStyle(fontSize: 18),
          hint: " Find a place doctor & clinic ... ",
          border: const BorderSide(style: BorderStyle.none),
          margins:const  EdgeInsets.fromLTRB(20, 70, 20, 0),
          padding:const EdgeInsets.fromLTRB(2, 0, 2, 0),
          height: 52,
          iconColor: Colors.blue,
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
          transitionDuration: const Duration(milliseconds: 600),
          transitionCurve: Curves.easeInOut,
          physics: const BouncingScrollPhysics(),
          axisAlignment: isPortrait ? 0.0 : -1.0,
          openAxisAlignment: 0.0,
          width: isPortrait ? 600 : 500,
          debounceDelay: const Duration(milliseconds: 500),
          onQueryChanged: (query) {},
          transition: CircularFloatingSearchBarTransition(), builder: (BuildContext context, Animation<double> transition) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text("hello"),
                ],
              ),
            );
      },

         );
  }
}

