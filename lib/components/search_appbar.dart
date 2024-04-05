import 'package:flutter/material.dart';

// ignore: camel_case_types
class Search_Bar extends StatefulWidget {
  const Search_Bar({super.key});

  @override
  State<Search_Bar> createState() => _SearchBarState();
}

class _SearchBarState extends State<Search_Bar>
    with SingleTickerProviderStateMixin {
  bool _isActive = false;
  bool _isAvatarClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 231, 231, 231).withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          if (!_isActive)
            Text("SnapNBin",
                style: Theme.of(context).appBarTheme.titleTextStyle),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: AnimatedSize(
                duration: const Duration(milliseconds: 250),
                child: _isActive
                    ? Container(
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(4.0)),
                        child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'Search for something',
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isActive = false;
                                  });
                                },
                                icon: const Icon(Icons.close)),
                          ),
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            _isActive = true;
                          });
                        },
                        icon: const Icon(Icons.search)),
              ),
            ),
          ),
          _isActive
              ? Container()
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      _isAvatarClicked = !_isAvatarClicked;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 0),
                    width: 40.0, // Set the width
                    height: 40.0, // Set the height
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 66, 66, 66),
                      shape: BoxShape.circle,
                      boxShadow: _isAvatarClicked
                          ? [
                              const BoxShadow(
                                color: Color.fromARGB(255, 69, 69, 69),
                                spreadRadius: 0.1,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ]
                          : [],
                    ),
                    child: const CircleAvatar(
                      radius: 20, // Adjust the size of the avatar
                      backgroundImage: NetworkImage(
                          "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/U6PMNLLFATSSOZAODKKJN2RH4U.jpg&w=750&h=495"), // Use the image URL
                      backgroundColor:
                          Colors.transparent, // Transparent background
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
