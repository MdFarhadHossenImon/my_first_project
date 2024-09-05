import 'package:flutter/material.dart';




class MyCustomSearchBar extends StatelessWidget {
  const MyCustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 2.0,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.grey,
            size: 28,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 18,
                ),
                border: InputBorder.none,
              ),
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
          IconButton(
            onPressed: () {
              // Implement microphone functionality or any other action
            },
            icon: const Icon(
              Icons.mic,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}


class MySearchBAR extends StatelessWidget {
  const MySearchBAR({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.black54,
            size: 30,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search...",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // Implement search functionality here
            },
            icon: const Icon(
              Icons.mic,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

