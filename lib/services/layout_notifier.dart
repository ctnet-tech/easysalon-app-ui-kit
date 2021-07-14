import 'package:flutter/material.dart';

enum LayoutSize { none, tiny, small, medium, large, big, bigest }

class LayoutNotifier with ChangeNotifier {
  static getLowerSize(LayoutSize layoutSize) {
    if (layoutSize == LayoutSize.small) {
      return LayoutSize.tiny;
    }
    if (layoutSize == LayoutSize.medium) {
      return LayoutSize.small;
    }
    if (layoutSize == LayoutSize.large) {
      return LayoutSize.medium;
    }
    if (layoutSize == LayoutSize.big) {
      return LayoutSize.large;
    }
    if (layoutSize == LayoutSize.bigest) {
      return LayoutSize.big;
    }
    return LayoutSize.none;
  }

  LayoutNotifier();

  double sizeToPadding(LayoutSize layoutSize) {
    switch (layoutSize) {
      case LayoutSize.none:
        return 0.0;
      case LayoutSize.tiny:
        return 8.0;
      case LayoutSize.small:
        return 12.0;
      case LayoutSize.medium:
        return 16.0;
      case LayoutSize.large:
        return 22.0;
      case LayoutSize.big:
        return 30.0;
      case LayoutSize.bigest:
      default:
        return 50.0;
    }
  }

  sizeToShapeSize(LayoutSize layoutSize) {
    switch (layoutSize) {
      case LayoutSize.none:
        return 0.0;
      case LayoutSize.tiny:
        return 20.0;
      case LayoutSize.small:
        return 30.0;
      case LayoutSize.medium:
        return 40.0;
      case LayoutSize.large:
        return 50.0;
      case LayoutSize.big:
        return 60.0;
      case LayoutSize.bigest:
      default:
        return 70.0;
    }
  }

  sizeToFontSize(LayoutSize layoutSize) {
    switch (layoutSize) {
      case LayoutSize.none:
        return 0;
      case LayoutSize.tiny:
        return 10.0;
      case LayoutSize.small:
        return 12.0;
      case LayoutSize.medium:
        return 15.0;
      case LayoutSize.large:
        return 18.0;
      case LayoutSize.big:
        return 22.0;
      default:
        return 30.0;
    }
  }

 double sizeToIconSize(LayoutSize layoutSize) {
    switch (layoutSize) {
      case LayoutSize.none:
        return 0;
      case LayoutSize.tiny:
        return 14.0;
      case LayoutSize.small:
        return 18.0;
      case LayoutSize.medium:
        return 23.0;
      case LayoutSize.large:
        return 30.0;
      case LayoutSize.big:
        return 40.0;
      case LayoutSize.bigest:
      default:
        return 50.0;
    }
  }

  sizeToBorderRadiusSize(LayoutSize layoutSize) {
    switch (layoutSize) {
      case LayoutSize.none:
        return 0.0;
      case LayoutSize.tiny:
        return 6.0;
      case LayoutSize.small:
        return 8.0;
      case LayoutSize.medium:
        return 14.0;
      case LayoutSize.large:
        return 20.0;
      case LayoutSize.big:
      default:
        return 30.0;
    }
  }

  sizeToBorderRadius(LayoutSize layoutSize) {
    var borderRadiusSize = sizeToBorderRadiusSize(layoutSize);
    return BorderRadius.all(Radius.circular(borderRadiusSize));
  }
}
