class PortfolioItem {
  const PortfolioItem({
    required this.title,
    required this.category,
    required this.year,
    required this.description,
    this.imageUrl,
    this.imageAsset,
    this.projectUrl,
    this.projectId,
  });

  final String title;
  final String category;
  final String year;
  final String? imageUrl;
  final String? imageAsset;
  final String description;
  final String? projectUrl;
  final String? projectId;
}
