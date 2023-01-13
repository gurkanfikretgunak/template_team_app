import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

class ShadowEffectConstants {
  static final ShadowEffectConstants _instance = ShadowEffectConstants._init();
  static ShadowEffectConstants get instance => _instance;
  ShadowEffectConstants._init();

  static final _colors = ColorConstant.instance;

  List<BoxShadow> elevationBase = <BoxShadow>[
    BoxShadow(
      color: _colors.transparent,
      offset: const Offset(0.0, 0.0),
      blurRadius: 0.0,
    )
  ];

  List<BoxShadow> elevationInset = <BoxShadow>[
    BoxShadow(
      color: _colors.shadowBack,
      offset: const Offset(0.0, 0.5),
      blurRadius: 4.0,
    )
  ];

  List<BoxShadow> elevation1 = <BoxShadow>[
    BoxShadow(
      color: _colors.shadowFront,
      offset: const Offset(0.0, 0.0),
      blurRadius: 1.0,
    ),
    BoxShadow(
      color: _colors.shadowBack,
      offset: const Offset(0.0, 0.5),
      blurRadius: 2.0,
    )
  ];

  List<BoxShadow> elevation2 = <BoxShadow>[
    BoxShadow(
      color: _colors.shadowFront,
      offset: const Offset(0.0, 0.0),
      blurRadius: 1.0,
    ),
    BoxShadow(
      color: _colors.shadowBack,
      offset: const Offset(0.0, 2.0),
      blurRadius: 4.0,
    )
  ];

  List<BoxShadow> elevation3 = <BoxShadow>[
    BoxShadow(
      color: _colors.shadowFront,
      offset: const Offset(0.0, 0.0),
      blurRadius: 2.0,
    ),
    BoxShadow(
      color: _colors.shadowBack,
      offset: const Offset(0.0, 4.0),
      blurRadius: 8.0,
    )
  ];

  List<BoxShadow> elevation4 = <BoxShadow>[
    BoxShadow(
      color: _colors.shadowFront,
      offset: const Offset(0.0, 2.0),
      blurRadius: 4.0,
    ),
    BoxShadow(
      color: _colors.shadowBack,
      offset: const Offset(0.0, 8.0),
      blurRadius: 16.0,
    )
  ];

  List<BoxShadow> elevation5 = <BoxShadow>[
    BoxShadow(
      color: _colors.shadowFront,
      offset: const Offset(0.0, 2.0),
      blurRadius: 8.0,
    ),
    BoxShadow(
      color: _colors.shadowBack,
      offset: const Offset(0.0, 16.0),
      blurRadius: 24.0,
    )
  ];

  List<BoxShadow> elevation6 = <BoxShadow>[
    BoxShadow(
      color: _colors.shadowFront,
      offset: const Offset(0.0, 2.0),
      blurRadius: 8.0,
    ),
    BoxShadow(
      color: _colors.shadowBack,
      offset: const Offset(0.0, 20.0),
      blurRadius: 32.0,
    )
  ];
}
