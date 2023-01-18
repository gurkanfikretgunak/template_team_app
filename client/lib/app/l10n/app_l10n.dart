import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_l10n_en.dart';
import 'app_l10n_tr.dart';

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n? of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get getStarted;

  /// No description provided for @onboardingTextOne.
  ///
  /// In en, this message translates to:
  /// **'Schedule your Appointment with the best Hair Stylist in your Town.'**
  String get onboardingTextOne;

  /// No description provided for @onboardingTextTwo.
  ///
  /// In en, this message translates to:
  /// **'Schedule the Appointmentin the best Salon for yourKids.'**
  String get onboardingTextTwo;

  /// No description provided for @onboardingTextThree.
  ///
  /// In en, this message translates to:
  /// **'Book yourself a massage therapist to release all your stress.'**
  String get onboardingTextThree;

  /// No description provided for @onboardingTextFour.
  ///
  /// In en, this message translates to:
  /// **'Search for the best parlournear you to fulfil all your beauty needs'**
  String get onboardingTextFour;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signup;

  /// No description provided for @haveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an Account?'**
  String get haveAnAccount;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'name'**
  String get name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'password'**
  String get password;

  /// No description provided for @orSignupUsing.
  ///
  /// In en, this message translates to:
  /// **'Or SignUp using'**
  String get orSignupUsing;

  /// No description provided for @twitter.
  ///
  /// In en, this message translates to:
  /// **'Twitter'**
  String get twitter;

  /// No description provided for @google.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get google;

  /// No description provided for @facebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get facebook;

  /// No description provided for @enterMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter Mobile Number'**
  String get enterMobileNumber;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @sendOtb.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOtb;

  /// No description provided for @verifyOtp.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verifyOtp;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @didntReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn’t Receive the Code?'**
  String get didntReceiveCode;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeBack;

  /// No description provided for @haventAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?'**
  String get haventAnAccount;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot your Password?'**
  String get forgotPassword;

  /// No description provided for @orLoginUsing.
  ///
  /// In en, this message translates to:
  /// **'Or Login using'**
  String get orLoginUsing;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return L10nEn();
    case 'tr': return L10nTr();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
