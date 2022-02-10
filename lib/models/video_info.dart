class VideoInfo {
  final String id;
  final String judul;
  final String deskripsi;
  final String thumbnail;
  DateTime? uploadTime = DateTime.now();
  // mungkin nambah lagi

  VideoInfo({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.thumbnail,
    this.uploadTime,
  });
}
