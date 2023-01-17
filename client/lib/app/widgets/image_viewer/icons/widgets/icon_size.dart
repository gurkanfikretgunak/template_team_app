enum IconSize { large, medium, payment }

class IconSizeLabel {
  IconSizeLabel();
  width(iconWidth) {
    switch (iconWidth) {
      case IconSize.large:
        return 24.0;
      case IconSize.medium:
        return 16.0;
      case IconSize.payment:
        return 32.0;
    }
  }

  height(iconHeight) {
    switch (iconHeight) {
      case IconSize.large:
        return 24.0;
      case IconSize.medium:
        return 16.0;
      case IconSize.payment:
        return 24.0;
    }
  }
}
