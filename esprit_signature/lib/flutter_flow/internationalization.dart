import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // signIn
  {
    'd82xmeje': {
      'en': 'Email Address',
      'fr': 'Adresse e-mail',
    },
    'nu4lzrpx': {
      'en': 'Enter your email here...',
      'fr': 'Entrez votre email ici...',
    },
    'vfbuck40': {
      'en': 'Matricule',
      'fr': 'Matricule',
    },
    '44m6g4vq': {
      'en': 'Enter your matricule  here...',
      'fr': 'Entrez votre matricule ici...',
    },
    'v16mw0xl': {
      'en': 'Sign In',
      'fr': 'Se connecter',
    },
    'mkq9eeu7': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    '08w2zmsc': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '8f9khifq': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    '34q7tvme': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    't2v5t2y0': {
      'en': 'Home',
      'fr': 'Home',
    },
  },
  // HomePage
  {
    's8yfz1hs': {
      'en': 'Dashboard',
      'fr': 'Tableau de bord',
    },
    '5s66pgnq': {
      'en': 'Your project status is appearing here.',
      'fr': 'Le statut de votre projet apparaît ici.',
    },
    'lhdf6rut': {
      'en': 'Course Summary',
      'fr': 'Résumé du cours',
    },
    'tyng6vtb': {
      'en': 'An overview of your Teachers.',
      'fr': 'Un aperçu de vos professeurs.',
    },
    'zfthhkc0': {
      'en': 'Signed Teachers',
      'fr': 'Enseignants signés',
    },
    '6wbsu3lq': {
      'en': 'Connected Teachers',
      'fr': 'Enseignants connectés',
    },
    'bxhywmo7': {
      'en': 'Signed Teachers',
      'fr': 'Enseignants signés',
    },
    'z0qeszqa': {
      'en': 'A small summary of your signed teachers ',
      'fr': 'Un petit résumé de vos professeurs signés',
    },
    '951dqmj0': {
      'en': 'Total User Count',
      'fr': 'Nombre total d\'utilisateurs',
    },
    '47n8ijgg': {
      'en': 'An overview of all your Teachers on your platform.',
      'fr': 'Un aperçu de tous vos professeurs sur votre plateforme.',
    },
    'aysb50zb': {
      'en': 'Active Users',
      'fr': 'Utilisateurs actifs',
    },
    '1yhi0xkk': {
      'en': 'A small summary of your signed teachers',
      'fr': 'Un petit résumé de vos professeurs signés',
    },
    'nvox203i': {
      'en': 'Total Signed Count',
      'fr': 'Nombre total de signatures',
    },
    '3x3ykqio': {
      'en': 'An overview of all your Signed Teachers',
      'fr': 'Un aperçu de tous vos enseignants signés',
    },
    'c7yp9uyz': {
      'en': 'Last Updated Teachers',
      'fr': 'Derniers enseignants mis à jour',
    },
    'laf9rp13': {
      'en': 'signature',
      'fr': 'signature',
    },
    'ye5kypo7': {
      'en': ' Nom Et Prenom',
      'fr': 'Nom Et Prénom',
    },
    'rxfqxn5x': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    '2e7xw6aj': {
      'en': 'Derniere connection',
      'fr': 'Dernière connexion',
    },
    'q308v4dr': {
      'en': 'Status signature',
      'fr': 'Signature de statut',
    },
    '8ixxj22v': {
      'en': '•',
      'fr': '•',
    },
  },
  // SettingsPage
  {
    'avgeupew': {
      'en': 'Application',
      'fr': 'Application',
    },
    '5a0pldyn': {
      'en': 'Switch to Dark Mode',
      'fr': 'Passer en mode sombre',
    },
    '0uwx080z': {
      'en': 'Switch to Light Mode',
      'fr': 'Passer en mode lumière',
    },
    'md7opmmg': {
      'en': '•',
      'fr': '•',
    },
  },
  // TeachersListPage
  {
    'efrijqun': {
      'en': 'Option 1',
      'fr': 'Option 1',
    },
    'zhsj3mro': {
      'en': 'Filter Teachers by signature Status',
      'fr': 'Filtrer les enseignants par statut de signature',
    },
    'zebu9d75': {
      'en': 'Search for an item...',
      'fr': 'Rechercher un article...',
    },
    'c9l9a8o4': {
      'en': 'Search per email',
      'fr': 'Recherche par email',
    },
    'yuv0w31x': {
      'en': 'extract to excel',
      'fr': 'extraire pour exceller',
    },
    '742obpx5': {
      'en': 'ALL',
      'fr': 'TOUS',
    },
    'qcsuj5kr': {
      'en': 'ALL',
      'fr': 'TOUS',
    },
    'vtt40ouv': {
      'en': 'LOGIN',
      'fr': 'SE CONNECTER',
    },
    'n2sp951c': {
      'en': 'DONE',
      'fr': 'FAIT',
    },
    'isa74g2h': {
      'en': 'NOLOG',
      'fr': 'NOLOG',
    },
    'ow6s3uf0': {
      'en': 'Search per email',
      'fr': 'Recherche par email',
    },
    '7foln1de': {
      'en': '',
      'fr': '',
    },
    '6d4yhspc': {
      'en': 'Extract to Excel',
      'fr': 'Extraire vers Excel',
    },
    'xo76el1t': {
      'en': 'matricule',
      'fr': 'matricule',
    },
    'kvzva7m1': {
      'en': 'full Name',
      'fr': 'nom et prénom',
    },
    'dwyhvxdu': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    'syqf8yc2': {
      'en': 'signature status',
      'fr': 'statut de la signature',
    },
    'bxn7blyx': {
      'en': 'signature Image',
      'fr': 'image de signature',
    },
    'uh8zsek7': {
      'en': 'matricule',
      'fr': 'matricule',
    },
    'wcwn0kpx': {
      'en': 'full Name',
      'fr': 'nom et prénom',
    },
    '3y9mw5lh': {
      'en': 'image Signature',
      'fr': 'E-mail',
    },
    'rbbiz4uh': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // validateSignature
  {
    '2ia2c6wo': {
      'en': 'Menu',
      'fr': 'Menu',
    },
    'jx3g2jc3': {
      'en': 'Signature',
      'fr': 'Signature',
    },
    '1rgg4x7c': {
      'en': 'logout',
      'fr': 'Se déconnecter',
    },
    'ze4qmi5q': {
      'en': 'you signed !',
      'fr': 'tu as signé !',
    },
    '2z0jy5vi': {
      'en': 'you can exit the application  ',
      'fr': 'vous pouvez quitter l\'application',
    },
    '4zus1btz': {
      'en': 'logout',
      'fr': 'Se déconnecter',
    },
    'z44qdkuf': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // SignaturePage
  {
    'u3ezkfd0': {
      'en': 'Sign on the box ',
      'fr': 'Signer sur la boîte',
    },
    'gvl8pv8b': {
      'en': 'Validate',
      'fr': 'Valider',
    },
    'bbls3skz': {
      'en': 'Cancel',
      'fr': 'Annuler',
    },
    'zg8ff4c0': {
      'en': 'Menu',
      'fr': 'Menu',
    },
    'k0cbo6kr': {
      'en': 'Signature',
      'fr': 'Signature',
    },
    'f87q952y': {
      'en': 'logout',
      'fr': 'Se déconnecter',
    },
    'w4wejonl': {
      'en': '•',
      'fr': '•',
    },
  },
  // sideBarNavAdmin
  {
    'zwkqmt8t': {
      'en': 'Menu',
      'fr': 'Menu',
    },
    'j868sisi': {
      'en': 'Dashboard',
      'fr': 'Tableau de bord',
    },
    'pm1jrpy2': {
      'en': 'Teachers',
      'fr': 'Enseignants',
    },
    'a3hxiz82': {
      'en': 'Settings',
      'fr': 'Paramètres',
    },
    'd8dc5yrn': {
      'en': 'logout',
      'fr': 'Se déconnecter',
    },
  },
  // sideBarNavTeacher
  {
    'iyi59hle': {
      'en': 'Menu',
      'fr': 'Menu',
    },
    'wigac0bw': {
      'en': 'Signature',
      'fr': 'Signature',
    },
    'kyaqcoxe': {
      'en': 'logout',
      'fr': 'Se déconnecter',
    },
  },
  // Miscellaneous
  {
    '4s3r8zkn': {
      'en': '',
      'fr': '',
    },
    'tkzrhsxh': {
      'en': '',
      'fr': '',
    },
    'ns008si1': {
      'en': '',
      'fr': '',
    },
    'pa0d0oge': {
      'en': '',
      'fr': '',
    },
    'ltt6hrl0': {
      'en': '',
      'fr': '',
    },
    'hjqj8oqc': {
      'en': '',
      'fr': '',
    },
    'g0wxoa8d': {
      'en': '',
      'fr': '',
    },
    'eyqiqhm0': {
      'en': '',
      'fr': '',
    },
    'kvqar85q': {
      'en': '',
      'fr': '',
    },
    '3tczb4tj': {
      'en': '',
      'fr': '',
    },
    'pajz6fc4': {
      'en': '',
      'fr': '',
    },
    'ln30wpyu': {
      'en': '',
      'fr': '',
    },
    'qcaq9zru': {
      'en': '',
      'fr': '',
    },
    'ey9w9aai': {
      'en': '',
      'fr': '',
    },
    'bgb5ql8n': {
      'en': '',
      'fr': '',
    },
    '026jrp8a': {
      'en': '',
      'fr': '',
    },
    'l5biy1nf': {
      'en': '',
      'fr': '',
    },
    '1itht44a': {
      'en': '',
      'fr': '',
    },
    'g59ouc7j': {
      'en': '',
      'fr': '',
    },
    '66um83lz': {
      'en': '',
      'fr': '',
    },
    's67khin4': {
      'en': '',
      'fr': '',
    },
    'objphczd': {
      'en': '',
      'fr': '',
    },
    'r336dqzj': {
      'en': '',
      'fr': '',
    },
    'o5deox8u': {
      'en': '',
      'fr': '',
    },
    'kk0p98nj': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
