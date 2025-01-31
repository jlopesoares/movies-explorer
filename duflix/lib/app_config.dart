class AppConfig {
  const AppConfig({
    required this.watchmodeBaseUrl,
    required this.watchmodeApiKey,
  });

  final Uri watchmodeBaseUrl;
  final String watchmodeApiKey;
}
