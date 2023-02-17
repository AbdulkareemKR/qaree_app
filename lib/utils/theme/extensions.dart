import 'package:Qaree/constants/colors_const.dart';
import 'package:flutter/material.dart';

extension TextThemes on BuildContext {
  TextTheme get textThemes {
    return Theme.of(this).textTheme;
  }
}

extension StyleChange on TextStyle {
  /// Having this return type will allow us to use the chain calling,
  /// i.e
  /// ```
  /// Theme.of(context).textTheme.bodyLard.regular().copyWith()... or Theme.of(context).textTheme.bodyLard.copyWith().regular()
  /// ```
  TextStyle get regular {
    return copyWith(fontWeight: FontWeight.w400, color: ColorsConst.black);
  }

  /// The default is medium, make sure that you need this function.
  TextStyle get medium {
    return copyWith(fontWeight: FontWeight.w500, color: ColorsConst.black);
  }

  TextStyle get light {
    return copyWith(fontWeight: FontWeight.w300, color: ColorsConst.black);
  }
}
