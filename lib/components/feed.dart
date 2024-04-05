import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      height: 400,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(
                    "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/U6PMNLLFATSSOZAODKKJN2RH4U.jpg&w=750&h=495",
                  ),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(width: 10),
                Text("Username"),
              ],
            ),
          ),
          Expanded(
            child: Image.network(
              'https://picsum.photos/seed/656/600',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 15),
          const Text("Description of the image"),
          const SizedBox(height: 5),
          Row(
            children: [
              LikeButton(
                size: 50,
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.thumb_up_alt_outlined,
                    color: isLiked
                        ? Colors.blue
                        : const Color.fromARGB(255, 0, 0, 0),
                    size: 30,
                  );
                },
                likeCount: 10,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.comment_rounded,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
