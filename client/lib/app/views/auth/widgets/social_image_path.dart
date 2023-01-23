import 'package:client/gen/assets.gen.dart';

enum SocialPath { google, apple }

class SocialPathLabel {
  SocialPathLabel();
  paths(socialPath) {
    switch (socialPath) {
      case SocialPath.apple:
        return Assets.icons.apple.path;
      case SocialPath.google:
        return Assets.icons.google.path;
    }
  }
}
