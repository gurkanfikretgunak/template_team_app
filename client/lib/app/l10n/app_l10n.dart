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

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

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

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @beautyServices.
  ///
  /// In en, this message translates to:
  /// **'Beauty services'**
  String get beautyServices;

  /// No description provided for @popularNearYou.
  ///
  /// In en, this message translates to:
  /// **'Popular near you'**
  String get popularNearYou;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @offer.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get offer;

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See all >'**
  String get seeAll;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @booking.
  ///
  /// In en, this message translates to:
  /// **'Booking'**
  String get booking;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @yourFavorites.
  ///
  /// In en, this message translates to:
  /// **'Your Favorites'**
  String get yourFavorites;

  /// No description provided for @yourFavoritesDesc.
  ///
  /// In en, this message translates to:
  /// **'Reorder your favorite service in a click'**
  String get yourFavoritesDesc;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get payment;

  /// No description provided for @paymentDesc.
  ///
  /// In en, this message translates to:
  /// **'Payment methods, Transaction History '**
  String get paymentDesc;

  /// No description provided for @manageAddress.
  ///
  /// In en, this message translates to:
  /// **'Manage Address'**
  String get manageAddress;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @notificationsDesc.
  ///
  /// In en, this message translates to:
  /// **'View your past notifications'**
  String get notificationsDesc;

  /// No description provided for @registerAsPartner.
  ///
  /// In en, this message translates to:
  /// **'Register as partner'**
  String get registerAsPartner;

  /// No description provided for @registerAsPartnerDesc.
  ///
  /// In en, this message translates to:
  /// **'Want to list your service? Register with us'**
  String get registerAsPartnerDesc;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @aboutDesc.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy, Terms of Services, Licenses'**
  String get aboutDesc;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @isDeleteAddress.
  ///
  /// In en, this message translates to:
  /// **'Delete “Home” Address?'**
  String get isDeleteAddress;

  /// No description provided for @isDeleteAddressDesc.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to delete this address?'**
  String get isDeleteAddressDesc;

  /// No description provided for @isLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout?'**
  String get isLogout;

  /// No description provided for @logoutDesc.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to logout from the app?'**
  String get logoutDesc;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @yourSavedAddress.
  ///
  /// In en, this message translates to:
  /// **'Your saved address'**
  String get yourSavedAddress;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Services'**
  String get termsOfService;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @licenses.
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get licenses;

  /// No description provided for @paymentMethods.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get paymentMethods;

  /// No description provided for @applePay.
  ///
  /// In en, this message translates to:
  /// **'Apple Pay'**
  String get applePay;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @addPaymentMehod.
  ///
  /// In en, this message translates to:
  /// **'Add payment method'**
  String get addPaymentMehod;

  /// No description provided for @forward.
  ///
  /// In en, this message translates to:
  /// **'Forward'**
  String get forward;

  /// No description provided for @continueWithApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get continueWithApple;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @haircutForMen.
  ///
  /// In en, this message translates to:
  /// **'Haircut for men'**
  String get haircutForMen;

  /// No description provided for @shops.
  ///
  /// In en, this message translates to:
  /// **'Shops'**
  String get shops;

  /// No description provided for @sortFilters.
  ///
  /// In en, this message translates to:
  /// **'Sort/Filters'**
  String get sortFilters;

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get clearAll;

  /// No description provided for @timing.
  ///
  /// In en, this message translates to:
  /// **'Timing'**
  String get timing;

  /// No description provided for @sort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// No description provided for @past.
  ///
  /// In en, this message translates to:
  /// **'Past'**
  String get past;

  /// No description provided for @upcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get upcoming;

  /// No description provided for @reorderBooking.
  ///
  /// In en, this message translates to:
  /// **'Reorder Booking'**
  String get reorderBooking;

  /// No description provided for @bookingDetail.
  ///
  /// In en, this message translates to:
  /// **'Booking Detail'**
  String get bookingDetail;

  /// No description provided for @haircut.
  ///
  /// In en, this message translates to:
  /// **'Haircut'**
  String get haircut;

  /// No description provided for @itemTotal.
  ///
  /// In en, this message translates to:
  /// **'ItemTotal'**
  String get itemTotal;

  /// No description provided for @couponDiscount.
  ///
  /// In en, this message translates to:
  /// **'CouponDiscount'**
  String get couponDiscount;

  /// No description provided for @grandTotal.
  ///
  /// In en, this message translates to:
  /// **'Grand Total'**
  String get grandTotal;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @yourBookings.
  ///
  /// In en, this message translates to:
  /// **'Your Bookings'**
  String get yourBookings;

  /// No description provided for @recommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get recommended;

  /// No description provided for @packages.
  ///
  /// In en, this message translates to:
  /// **'Packages'**
  String get packages;

  /// No description provided for @faceCare.
  ///
  /// In en, this message translates to:
  /// **'Face Care'**
  String get faceCare;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @directions.
  ///
  /// In en, this message translates to:
  /// **'Directions'**
  String get directions;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @ratings.
  ///
  /// In en, this message translates to:
  /// **'Ratings'**
  String get ratings;

  /// No description provided for @popularity.
  ///
  /// In en, this message translates to:
  /// **'Popularity'**
  String get popularity;

  /// No description provided for @ratingHighToLow.
  ///
  /// In en, this message translates to:
  /// **'Rating : High to Low'**
  String get ratingHighToLow;

  /// No description provided for @costHighToLow.
  ///
  /// In en, this message translates to:
  /// **'Cost : High to Low'**
  String get costHighToLow;

  /// No description provided for @costLowToHigh.
  ///
  /// In en, this message translates to:
  /// **'Cost : Low to High'**
  String get costLowToHigh;

  /// No description provided for @emptyFavoritedList.
  ///
  /// In en, this message translates to:
  /// **'Nothing has been favorited yet. Favorites will appear here.'**
  String get emptyFavoritedList;

  /// No description provided for @creditCard.
  ///
  /// In en, this message translates to:
  /// **'Credit card'**
  String get creditCard;

  /// No description provided for @giftCard.
  ///
  /// In en, this message translates to:
  /// **'Gift card'**
  String get giftCard;

  /// No description provided for @addCard.
  ///
  /// In en, this message translates to:
  /// **'Add a card'**
  String get addCard;

  /// No description provided for @nameOnCard.
  ///
  /// In en, this message translates to:
  /// **'Name on card'**
  String get nameOnCard;

  /// No description provided for @cardNumber.
  ///
  /// In en, this message translates to:
  /// **'Card number'**
  String get cardNumber;

  /// No description provided for @expDate.
  ///
  /// In en, this message translates to:
  /// **'Exp. Date'**
  String get expDate;

  /// No description provided for @cvv.
  ///
  /// In en, this message translates to:
  /// **'CVV'**
  String get cvv;

  /// No description provided for @women.
  ///
  /// In en, this message translates to:
  /// **'Women'**
  String get women;

  /// No description provided for @man.
  ///
  /// In en, this message translates to:
  /// **'Man'**
  String get man;

  /// No description provided for @lowestPrice.
  ///
  /// In en, this message translates to:
  /// **'Lowest price'**
  String get lowestPrice;

  /// No description provided for @highestPrice.
  ///
  /// In en, this message translates to:
  /// **'Highest Price'**
  String get highestPrice;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @beautyCentre.
  ///
  /// In en, this message translates to:
  /// **'Beauty Centre'**
  String get beautyCentre;

  /// No description provided for @beautySalon.
  ///
  /// In en, this message translates to:
  /// **'Beauty Salon'**
  String get beautySalon;

  /// No description provided for @forMenWomen.
  ///
  /// In en, this message translates to:
  /// **'FOR MEN & WOMEN'**
  String get forMenWomen;

  /// No description provided for @newAddress.
  ///
  /// In en, this message translates to:
  /// **'New Address'**
  String get newAddress;

  /// No description provided for @editAddress.
  ///
  /// In en, this message translates to:
  /// **'Edit Address'**
  String get editAddress;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @addressName.
  ///
  /// In en, this message translates to:
  /// **'Address name'**
  String get addressName;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @morning.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get morning;

  /// No description provided for @midDay.
  ///
  /// In en, this message translates to:
  /// **'Mid Day'**
  String get midDay;

  /// No description provided for @night.
  ///
  /// In en, this message translates to:
  /// **'Night'**
  String get night;

  /// No description provided for @bleachForWomen.
  ///
  /// In en, this message translates to:
  /// **'Bleach for Women'**
  String get bleachForWomen;

  /// No description provided for @waxingForWomen.
  ///
  /// In en, this message translates to:
  /// **'Waxing for Women'**
  String get waxingForWomen;

  /// No description provided for @facialForWomen.
  ///
  /// In en, this message translates to:
  /// **'Facial for Women'**
  String get facialForWomen;

  /// No description provided for @shaveForMen.
  ///
  /// In en, this message translates to:
  /// **'Shave for Men'**
  String get shaveForMen;

  /// No description provided for @resultSearch.
  ///
  /// In en, this message translates to:
  /// **'102 results found'**
  String get resultSearch;

  /// No description provided for @timingValues.
  ///
  /// In en, this message translates to:
  /// **'6.00 PM-10.00 PM'**
  String get timingValues;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get enterPassword;

  /// No description provided for @setPassword.
  ///
  /// In en, this message translates to:
  /// **'Set a password'**
  String get setPassword;

  /// No description provided for @shave.
  ///
  /// In en, this message translates to:
  /// **'Shave'**
  String get shave;

  /// No description provided for @recentlySearched.
  ///
  /// In en, this message translates to:
  /// **'Recently searched'**
  String get recentlySearched;

  /// No description provided for @trendingNearYou.
  ///
  /// In en, this message translates to:
  /// **'Trending near you'**
  String get trendingNearYou;

  /// No description provided for @tryTheseService.
  ///
  /// In en, this message translates to:
  /// **'Try these service'**
  String get tryTheseService;

  /// No description provided for @charcoalDetoxMask.
  ///
  /// In en, this message translates to:
  /// **'Charcoal Detox Mask'**
  String get charcoalDetoxMask;

  /// No description provided for @clayMask.
  ///
  /// In en, this message translates to:
  /// **'Clay Mask.'**
  String get clayMask;

  /// No description provided for @skinCare.
  ///
  /// In en, this message translates to:
  /// **'Skin Care'**
  String get skinCare;

  /// No description provided for @shopService.
  ///
  /// In en, this message translates to:
  /// **'Shop Service'**
  String get shopService;

  /// No description provided for @march.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get march;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// No description provided for @mins.
  ///
  /// In en, this message translates to:
  /// **'Mins'**
  String get mins;

  /// No description provided for @plusTaxes.
  ///
  /// In en, this message translates to:
  /// **'Plus Taxes'**
  String get plusTaxes;

  /// No description provided for @continueShop.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueShop;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @selectDateTime.
  ///
  /// In en, this message translates to:
  /// **'Select Date & Time'**
  String get selectDateTime;

  /// No description provided for @offersPromoCode.
  ///
  /// In en, this message translates to:
  /// **'Offers & Promo Code'**
  String get offersPromoCode;

  /// No description provided for @viewOffers.
  ///
  /// In en, this message translates to:
  /// **'View offers'**
  String get viewOffers;

  /// No description provided for @frequentlyAdded.
  ///
  /// In en, this message translates to:
  /// **'Frequently added together'**
  String get frequentlyAdded;

  /// No description provided for @amountPayable.
  ///
  /// In en, this message translates to:
  /// **'Amount Payable'**
  String get amountPayable;

  /// No description provided for @forTheAppointment.
  ///
  /// In en, this message translates to:
  /// **'For The Appointment'**
  String get forTheAppointment;

  /// No description provided for @whenWouldLike.
  ///
  /// In en, this message translates to:
  /// **'When would you like your service?'**
  String get whenWouldLike;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// No description provided for @am.
  ///
  /// In en, this message translates to:
  /// **'AM'**
  String get am;

  /// No description provided for @couponCode.
  ///
  /// In en, this message translates to:
  /// **'Coupon Code'**
  String get couponCode;

  /// No description provided for @getcashbackUpto.
  ///
  /// In en, this message translates to:
  /// **'Get cashback upto'**
  String get getcashbackUpto;

  /// No description provided for @enterCouponCode.
  ///
  /// In en, this message translates to:
  /// **'Enter Coupon Code'**
  String get enterCouponCode;

  /// No description provided for @getVisaCredits.
  ///
  /// In en, this message translates to:
  /// **'on VISA Debit or Credit cards'**
  String get getVisaCredits;

  /// No description provided for @onBookingOf.
  ///
  /// In en, this message translates to:
  /// **'On booking of'**
  String get onBookingOf;

  /// No description provided for @orMore.
  ///
  /// In en, this message translates to:
  /// **'or more'**
  String get orMore;

  /// No description provided for @getUsingPaypal.
  ///
  /// In en, this message translates to:
  /// **'using PayPal'**
  String get getUsingPaypal;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @office.
  ///
  /// In en, this message translates to:
  /// **'Office'**
  String get office;

  /// No description provided for @addressTitle.
  ///
  /// In en, this message translates to:
  /// **'Address Title'**
  String get addressTitle;

  /// No description provided for @deleteAddress.
  ///
  /// In en, this message translates to:
  /// **'Address deleted!'**
  String get deleteAddress;

  /// No description provided for @registeredAddress.
  ///
  /// In en, this message translates to:
  /// **'This address is already registered'**
  String get registeredAddress;

  /// No description provided for @massage.
  ///
  /// In en, this message translates to:
  /// **'Massage'**
  String get massage;

  /// No description provided for @isCancelBooking.
  ///
  /// In en, this message translates to:
  /// **'Cancel the booking?'**
  String get isCancelBooking;

  /// No description provided for @isCancelBookingDesc.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to cancel this booking?'**
  String get isCancelBookingDesc;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @deletePayment.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to delete this payment?'**
  String get deletePayment;

  /// No description provided for @isDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete the payment'**
  String get isDelete;

  /// No description provided for @locationPermission.
  ///
  /// In en, this message translates to:
  /// **'Location Permission'**
  String get locationPermission;

  /// No description provided for @cameraPermission.
  ///
  /// In en, this message translates to:
  /// **'Camera Permission'**
  String get cameraPermission;

  /// No description provided for @notificationPermission.
  ///
  /// In en, this message translates to:
  /// **'Notification Permission'**
  String get notificationPermission;

  /// No description provided for @locationText.
  ///
  /// In en, this message translates to:
  /// **'Knowing your location is essential for us to serve you better. We can offer you exclusive content based on your location.'**
  String get locationText;

  /// No description provided for @cameraText.
  ///
  /// In en, this message translates to:
  /// **'It is required to use your camera from within the application. We can make your work easier when reading your data such as credit card, Qr.'**
  String get cameraText;

  /// No description provided for @notificationText.
  ///
  /// In en, this message translates to:
  /// **'It is necessary so that we can notify you of the latest news. We can make your work easier by reminding you of your appointment or by notifying you of a possible change.'**
  String get notificationText;

  /// No description provided for @later.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get later;

  /// No description provided for @allowNotification.
  ///
  /// In en, this message translates to:
  /// **'Allow Notification'**
  String get allowNotification;

  /// No description provided for @goSettings.
  ///
  /// In en, this message translates to:
  /// **'Go Settings'**
  String get goSettings;
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
