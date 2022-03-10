library constants;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'color.dart';
part 'messages.dart';
part 'text.dart';
part 'theme.dart';

///
/// Padding (constant)
///
const double kDefaultExThinPadding = 8.0; // Extra-fine padding
const double kDefaultThinPadding = 12.0; // Narrow padding
const double kDefaultPadding = 16.0; // Basic padding
const double kDefaultWidePadding = 24.0; // Wide basic padding
const double kDefaultFatPadding = 40.0; // Extra wide padding

/// Maximum number of strings
const int kStringMaxLength = 255;

///
/// Other (constant)
///
const double kImageSize = 56.0;
const double kLargeImageSize = 72.0;

const String kNothing = '0'; // Nil character

///
/// Environment(Dart Define)
///
const String kEnv = 'ENV';
const String kBaseUrlEnv = 'BASE_URL';

///
/// ENV Config
///
const String kApiKeyEnv = 'API_KEY';
const String kDebugBannerTitleEnv = 'DEBUG_BANNER_TITLE';
const String kDebugBannerColorEnv = 'DEBUG_BANNER_COLOR';
