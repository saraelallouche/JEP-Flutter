import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'es', 'en'];

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
    String? frText = '',
    String? esText = '',
    String? enText = '',
  }) =>
      [frText, esText, enText][languageIndex] ?? '';

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
  // HomePage
  {
    'almr1hfy': {
      'fr': 'Une nouvelle manière de visiter',
      'en': 'A new way to visit',
      'es': 'Una nueva forma de visitar',
    },
    'kr40b92c': {
      'fr':
          'Découvrez notre liste de visites parcourant la ville emblématique qu\'est Paris, mais aussi dans de nombreuses autres villes ou pays.',
      'en':
          'Discover our list of visits through the emblematic city of Paris, but also in many other cities or countries.',
      'es':
          'Descubra nuestra lista de visitas por la emblemática ciudad de París, pero también en muchas otras ciudades o países.',
    },
    '258xey39': {
      'fr': 'Qui suis-je ?',
      'en': 'Who am I ?',
      'es': 'Quién soy ?',
    },
    '9xopnat4': {
      'fr':
          'Salut, moi c\'est Jorge, ancien guide touristique de Paris. J\'ai décidé de faire cette application pour faciliter l\'accès aux visites sans trop dépenser.',
      'en':
          'Hello, I\'m Jorge, a former tourist guide in Paris. I decided to make this application to facilitate access to visits without spending too much.',
      'es':
          'Hola, soy Jorge, ex-guía de turismo en París. Decidí hacer esta aplicación para facilitar el acceso a las visitas sin gastar demasiado.',
    },
    '8zh6vun1': {
      'fr': 'Venez vous essayer à nos visites !',
      'en': 'Come and try our tours!',
      'es': '¡Ven y prueba nuestros tours!',
    },
    '7tbq4nwt': {
      'fr':
          'Ces visites font partie des plus prises de notre site, nous vous laissons découvrir pourquoi...\n',
      'en':
          'These visits are among the most popular on our site, we let you discover why...',
      'es':
          'Estas visitas se encuentran entre las más populares en nuestro sitio, te dejamos descubrir por qué...',
    },
    'bddumk0f': {
      'fr': 'Voir plus',
      'en': 'See more',
      'es': 'Ver más',
    },
    '3rovy1a4': {
      'fr': 'Vous y découvrirez notamments ces célèbres oeuvres ! ',
      'en': 'You will discover in particular these famous works!',
      'es': '¡Descubrirá en particular estas obras famosas!',
    },
    'nshlybzy': {
      'fr': 'Voir plus',
      'en': 'See more',
      'es': 'Ver más',
    },
    '68ec4db0': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // VisitList
  {
    'vbt4g7qs': {
      'fr': 'Liste des visites',
      'en': 'List of visits',
      'es': 'Lista de visitas',
    },
    'vqizcc6b': {
      'fr': 'Choisissez la visite qui vous plaît',
      'en': 'Choose the tour you like',
      'es': 'Elige el tour que más te guste',
    },
    'pba0agur': {
      'fr': 'Consulter',
      'en': 'To consult',
      'es': 'Consultar',
    },
    'lcmvn0kn': {
      'fr': 'Liste des visites',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // PointList
  {
    '2u4s1ymg': {
      'fr': 'Points d’intérêts',
      'en': 'Points of interest',
      'es': 'Puntos de interés',
    },
    'w91v7ue3': {
      'fr': 'Choisissez celui qui vous plait.',
      'en': 'Choose the one you like.',
      'es': 'Elige el que más te guste.',
    },
    'yq6em7r3': {
      'fr': 'Point d\'intérêts',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // PointDetail
  {
    'uymence5': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // PointDetailVisit
  {
    'bdddyyb2': {
      'fr': '© ',
      'en': '',
      'es': '',
    },
    'xjv3l7eu': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Step
  {
    'lay6utk2': {
      'fr': 'Vers :  ',
      'en': 'Towards :',
      'es': 'Hacia :',
    },
    'anojrms0': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // settings
  {
    'mphqisfc': {
      'fr': 'Paramètre',
      'en': 'Setting',
      'es': 'Configuración',
    },
    'jztagzk3': {
      'fr': 'Langue ',
      'en': 'Language',
      'es': 'Lengua',
    },
    '59lydndm': {
      'fr': 'FR',
      'en': 'EN',
      'es': 'ES',
    },
    '1x1cob3z': {
      'fr': 'FR',
      'en': 'FR',
      'es': 'FR',
    },
    'gxykre91': {
      'fr': 'ES',
      'en': 'ES',
      'es': 'ES',
    },
    'g8rt7w6u': {
      'fr': 'EN',
      'en': 'EN',
      'es': 'EN',
    },
    '2jbp4ddk': {
      'fr': 'Search for an item...',
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'ktcigxgr': {
      'fr': 'Paramètre',
      'en': '',
      'es': '',
    },
  },
  // VisitDetail
  {
    '2j1bw7ea': {
      'fr': 'Liste des points intéressant',
      'en': 'List of interesting points',
      'es': 'Lista de puntos interesantes',
    },
    '4zavi7st': {
      'fr': 'Commencer l\'itinéraire',
      'en': 'Start route',
      'es': 'Iniciar ruta',
    },
    'gm8iax3j': {
      'fr': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // HomeCard
  {
    'iz0a3wos': {
      'fr': 'Home Name',
      'en': '',
      'es': '',
    },
    'aen4rajz': {
      'fr': 'Price',
      'en': '',
      'es': '',
    },
  },
  // navbarList
  {
    'vim5bils': {
      'fr': 'Liste des visites',
      'en': 'List of visits',
      'es': 'Lista de visitas',
    },
    'kxjj51wx': {
      'fr': 'Points d\'intérêts',
      'en': 'Points of interest',
      'es': 'Puntos de interés',
    },
  },
  // navbarBottom
  {
    'txiqn5oo': {
      'fr': 'Liste des visites',
      'en': 'List of visits',
      'es': 'Lista de visitas',
    },
    '5mhkv23q': {
      'fr': 'Points d\'intérêts',
      'en': 'Points of interest',
      'es': 'Puntos de interés',
    },
  },
  // DrawerContent
  {
    '1d7po10s': {
      'fr': 'Liste des visites',
      'en': 'List of visits',
      'es': 'Lista de visitas',
    },
    '01xqunef': {
      'fr': 'Points d’intérêts',
      'en': 'Points of interest',
      'es': 'Puntos de interés',
    },
    'x0agi8fw': {
      'fr': 'FR',
      'en': 'EN',
      'es': 'ES',
    },
    '6eqbwld6': {
      'fr': 'FR',
      'en': 'FR',
      'es': 'FR',
    },
    'reapeaii': {
      'fr': 'ES',
      'en': 'ES',
      'es': 'ES',
    },
    'cwhqbehj': {
      'fr': 'EN',
      'en': 'EN',
      'es': 'EN',
    },
    'z0cxrsc4': {
      'fr': 'Search for an item...',
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
  },
  // Miscellaneous
  {
    'qs0v1bqs': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '379u9btm': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'xyqz7tf8': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'glgfykiw': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '24vsjwe7': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '1png1uka': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'zom9rnfc': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'sov5mntc': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'e5jl2ovq': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'hc89inq2': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'w84ulake': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'ewep3n6n': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '1yayi5sc': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '5z59gy4i': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'ty82homk': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'ggft2g69': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'jyrjraxo': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '2gpis0d6': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '3rpapf59': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'ggyb6dkh': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'jm2ew5rf': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'r57f1vin': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'wivjhjgh': {
      'fr': '',
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
