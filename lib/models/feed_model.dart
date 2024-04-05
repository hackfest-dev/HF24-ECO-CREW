class FeedModel {
  String username;
  String userImage;
  String imageUrl;
  String description;
  int likes;

  FeedModel({
    required this.username,
    required this.userImage,
    required this.imageUrl,
    required this.description,
    required this.likes,
  });

  static List<FeedModel> getFeed() {
    List<FeedModel> feed = [];
    feed.add(FeedModel(
      username: "Username",
      userImage:
          "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/U6PMNLLFATSSOZAODKKJN2RH4U.jpg&w=750&h=495",
      imageUrl: "https://picsum.photos/seed/656/600",
      description: "Description of the image",
      likes: 10,
    ));
    feed.add(FeedModel(
      username: "Username",
      userImage:
          "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/U6PMNLLFATSSOZAODKKJN2RH4U.jpg&w=750&h=495",
      imageUrl: "https://picsum.photos/seed/656/600",
      description: "Description of the image",
      likes: 20,
    ));
    feed.add(FeedModel(
      username: "Username",
      userImage:
          "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/U6PMNLLFATSSOZAODKKJN2RH4U.jpg&w=750&h=495",
      imageUrl: "https://picsum.photos/seed/656/600",
      description: "Description of the image",
      likes: 30,
    ));
    return feed;
  }
}
