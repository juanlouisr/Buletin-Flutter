class ChannelInfo {
  final int channelId;
  final int ownerId;
  final String channelName;
  final String channelPicture;
  final DateTime createdAt;

  ChannelInfo({
    required this.channelId,
    required this.ownerId,
    required this.channelName,
    required this.channelPicture,
    required this.createdAt,
  });

  factory ChannelInfo.fromMap(Map<String, dynamic> map) {
    int channelId = map['channel_id'] as int;
    int ownerId = map['owner_id'] as int;
    String channelName = map['channel_name'] as String;
    String channelPicture = map['channel_picture'] as String;
    DateTime createdAt = DateTime.parse(map['created_at']);

    return ChannelInfo(
      channelId: channelId,
      ownerId: ownerId,
      channelName: channelName,
      channelPicture: channelPicture,
      createdAt: createdAt,
    );
  }
}
