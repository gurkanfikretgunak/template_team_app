enum SocialPath { twitter, google, facebook }

class SocialPathLabel {
  SocialPathLabel();
  paths(socialPath) {
    switch (socialPath) {
      case SocialPath.twitter:
        return "assets/icons/twitter.png";
      case SocialPath.google:
        return "assets/icons/google.png";
      case SocialPath.facebook:
        return "assets/icons/facebook.png";
    }
  }
}
