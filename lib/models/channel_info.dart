class ChannelInfo {
  final String channelId;
  final String categoryId;
  final String channelName;
  final String channelPicture;
  final DateTime createdAt;

  ChannelInfo({
    required this.channelId,
    required this.categoryId,
    required this.channelName,
    required this.channelPicture,
    required this.createdAt,
  });

  factory ChannelInfo.fromMap(Map<String, dynamic> map) {
    String channelId = map['channel_id'] as String;
    String categoryId = map['category_id'] as String;
    String channelName = map['channel_name'] as String;
    String channelPicture = map['channel_picture'] as String;
    DateTime createdAt = DateTime.parse(map['created_at']);

    return ChannelInfo(
      channelId: channelId,
      categoryId: categoryId,
      channelName: channelName,
      channelPicture: channelPicture,
      createdAt: createdAt,
    );
  }
}
