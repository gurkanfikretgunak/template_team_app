enum IconSize { large, medium, payment }

class IconSizeLabel {
  IconSizeLabel();
  width(iconWidth) {
    switch (iconWidth) {
      case IconSize.large:
        return 24;
      case IconSize.medium:
        return 16;
      case IconSize.payment:
        return 32;

      default:
        return 24;
    }
  }

  height(iconHeight) {
    switch (iconHeight) {
      case IconSize.large:
        return 24;
      case IconSize.medium:
        return 16;
      case IconSize.payment:
        return 24;

      default:
        return 24;
    }
  }
}
