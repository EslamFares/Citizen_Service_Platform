bool isAppVersionUptodated({
  required String? appVersion,
  required String? minimumVersion,
  int? appBuildNumber,
  int? minBuildNumber,
}) {
  try {
    if (appVersion == null ||
        minimumVersion == null ||
        appVersion.isEmpty ||
        minimumVersion.isEmpty) {
      return false;
    }

    List<int> appVersionParts = appVersion.split('.').map(int.parse).toList();
    List<int> minVersionParts =
        minimumVersion.split('.').map(int.parse).toList();

    for (int i = 0; i < minVersionParts.length; i++) {
      if (appVersionParts[i] > minVersionParts[i]) {
        return true; // App version is greater than minimum version
      } else if (appVersionParts[i] < minVersionParts[i]) {
        return false; // App version is less
      }
    }

    // If versions are equal, compare build numbers if provided
    if (appBuildNumber != null && minBuildNumber != null) {
      return appBuildNumber >= minBuildNumber;
    }
    return true; // Versions and build numbers are equal or build numbers are not provided
  } catch (e) {
    return false; // Invalid version format
  }
}

bool isAppVersionUpToDateWithBuildNumberInVersion({
  required String? appVersion,
  required String? minimumVersion,
}) {
  try {
    if (appVersion == null ||
        minimumVersion == null ||
        appVersion.isEmpty ||
        minimumVersion.isEmpty) {
      return false;
    }
    // Split and parse the app version (e.g., "1.2.3+2")
    List<String> appVersionSplit = appVersion.split('+');
    List<int> appVersionParts =
        appVersionSplit[0].split('.').map(int.parse).toList();
    int appBuildNumber =
        appVersionSplit.length > 1 ? int.parse(appVersionSplit[1]) : 0;

    // Split and parse the minimum version (e.g., "1.2.3+1")
    List<String> minVersionSplit = minimumVersion.split('+');
    List<int> minVersionParts =
        minVersionSplit[0].split('.').map(int.parse).toList();
    int minBuildNumber =
        minVersionSplit.length > 1 ? int.parse(minVersionSplit[1]) : 0;

    // Compare version parts
    for (int i = 0; i < minVersionParts.length; i++) {
      if (appVersionParts[i] > minVersionParts[i]) {
        return true; // App version is greater than minimum version
      } else if (appVersionParts[i] < minVersionParts[i]) {
        return false; // App version is less
      }
    }

    // If versions are equal, compare build numbers
    return appBuildNumber >= minBuildNumber;
  } catch (e) {
    return false; // Invalid version format
  }
}
