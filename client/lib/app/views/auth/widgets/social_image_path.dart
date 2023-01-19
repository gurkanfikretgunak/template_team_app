import 'package:client/gen/assets.gen.dart';

enum SocialPath { twitter, google, facebook }

class SocialPathLabel {
  SocialPathLabel();
  paths(socialPath) {
    switch (socialPath) {
      case SocialPath.twitter:
        return Assets.icons.twitter.path;
      case SocialPath.google:
        return Assets.icons.google.path;
      case SocialPath.facebook:
        return Assets.icons.facebook.path;
    }
  }
}
