// ignore_for_file: constant_identifier_names

mixin AppLocale {
  static const String title = 'title';
  static const String imgNeeded = 'imgNeeded';
  static const String settings = 'settings';
  static const String uiLanguage = 'uiLanguage';
  static const String cnLanguage = 'cnLanguage';
  static const String nameDisplay = 'nameDisplay';
  static const String commonName = 'commonName';
  static const String scientificName = 'scientificName';
  static const String nameBoth = 'nameBoth';
  static const String outOfRange = 'outOfRange';
  static const String locationSelection = 'selectLocation';
  static const String locationDisabled = 'locationDisabled';
  static const String locationPermissionDenied = 'locationPermissionDenied';
  static const String locationFilter = 'locationFilter';
  static const String locationFilterFix = 'locationFilterFix';
  static const String locationFilterAuto = 'locationFilterAuto';
  static const String locationFilterOff = 'locationFilterOff';
  static const String locationRetrieveFailed = 'locationRetrieveFailed';
  static const String locationFilterError = 'locationFilterError';
  static const String openSourceLicenses = 'openSourceLicenses';

  static const Map<String, dynamic> EN = {
    title: 'HORUS',
    imgNeeded: 'Upload a bird image to recognize it',
    settings: 'Settings',
    uiLanguage: 'UI Language',
    cnLanguage: 'Common name Language',
    nameDisplay: 'Species name display',
    commonName: 'Common name',
    scientificName: 'Scientific name',
    nameBoth: 'Both',
    outOfRange: 'No results found in the specified range. Showing result from global.',
    locationSelection: 'Location Selection',
    locationDisabled: "Location services are disabled. Please enable the services",
    locationPermissionDenied: "Location permissions are permanently denied, we cannot request permissions",
    locationFilter: 'Distribution Filter',
    locationFilterFix: 'Fixed location (select on map)',
    locationFilterAuto: 'Auto update (based on device location)',
    locationFilterOff: 'Turn off location filter',
    locationRetrieveFailed: 'Failed in retrieving device location, distribution filter not applied.',
    locationFilterError: 'Distribution filter not applied due to unknown error.',
    openSourceLicenses: 'Open source licenses',
  };

  static const Map<String, dynamic> KN = {
    title: 'ಹೋರಸ್',
    imgNeeded: 'ಪಕ್ಷಿಯ ಚಿತ್ರವನ್ನು ಅಪ್ಲೋಡ್ ಮಾಡಿ ಗುರುಕೊಳ್ಳಲು',
    settings: 'ಸೆಟ್ಟಿಂಗ್ಗಳು',
    uiLanguage: 'ಯೂಐ ಭಾಷೆ',
    cnLanguage: 'ಸಾಮಾನ್ಯ ಹೆಸರು ಭಾಷೆ',
    nameDisplay: 'ಜಾತಿ ಹೆಸರು ಪ್ರದರ್ಶನ',
    commonName: 'ಸಾಮಾನ್ಯ ಹೆಸರು',
    scientificName: 'ವಿಜ್ಞಾನಾತ್ಮಕ ಹೆಸರು',
    nameBoth: 'ಎರಡೂ',
    outOfRange: 'ನಿಗದಿತ ವ್ಯಾಪ್ತಿಯಲ್ಲಿ ಫಲಿತಾಂಶ ಸಿಕ್ಕಿಲ್ಲ. ಜಾಗತಿಕ ಫಲಿತಾಂಶ ತೋರಿಸಲಾಗುತ್ತಿದೆ.',
    locationSelection: 'ಸ್ಥಳ ಆಯ್ಕೆ',
    locationDisabled: 'ಸ್ಥಳ ಸೇವೆಗಳು ನಿಷ್ಕ್ರಿಯಗೊಂಡಿವೆ. ದಯವಿಟ್ಟು ಸೇವೆಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ',
    locationPermissionDenied: 'ಸ್ಥಳ ಅನುಮತಿಗಳನ್ನು ಶಾಶ್ವತವಾಗಿ ನಿರಾಕರಿಸಲಾಗಿದೆ, ನಾವು ಅನುಮತಿಗಳನ್ನು ವಿನಂತಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ',
    locationFilter: 'ವಿತರಣಾ ಫಿಲ್ಟರ್',
    locationFilterFix: 'ನಿಗದಿತ ಸ್ಥಳ (ನಕ್ಷೆಯಲ್ಲಿ ಆಯ್ಕೆಮಾಡಿ)',
    locationFilterAuto: 'ಸ್ವಯಂಚಾಲಿತ ನವೀಕರಣ (ಉಪಕರಣದ ಸ್ಥಳದ ಆಧಾರದ ಮೇಲೆ)',
    locationFilterOff: 'ವಿತರಣಾ ಫಿಲ್ಟರ್ ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ',
    locationRetrieveFailed: 'ಉಪಕರಣದ ಸ್ಥಳವನ್ನು ಪಡೆಯಲು ವಿಫಲವಾಗಿದೆ, ವಿತರಣಾ ಫಿಲ್ಟರ್ ಅನ್ವಯಿಸಲ್ಪಟ್ಟಿಲ್ಲ.',
    locationFilterError: 'ಅರ್ಜಿತ ತಪ್ಪುಗಳ ಕಾರಣ ವಿತರಣಾ ಫಿಲ್ಟರ್ ಅನ್ವಯಿಸಲ್ಪಟ್ಟಿಲ್ಲ.',
    openSourceLicenses: 'ಮುಕ್ತ ಮೂಲ ಪರವಾನಿಗೆಗಳು',
  };
}

const Map<String, String> languageMap = {
  'en': 'English',
  'kn': 'ಕನ್ನಡ',
};
