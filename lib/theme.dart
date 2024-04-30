import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff1c6b50),
      surfaceTint: Color(0xff1c6b50),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa7f2d1),
      onPrimaryContainer: Color(4278198550),
      secondary: Color(4283196248),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291815898),
      onSecondaryContainer: Color(4278788119),
      tertiary: Color(4282278772),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290963708),
      onTertiaryContainer: Color(4278198058),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294310901),
      onBackground: Color(4279704858),
      surface: Color(4294310901),
      onSurface: Color(4279704858),
      surfaceVariant: Color(4292601310),
      onSurfaceVariant: Color(4282403140),
      outline: Color(4285561204),
      outlineVariant: Color(4290759106),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086510),
      inverseOnSurface: Color(4293718765),
      inversePrimary: Color(4287354549),
      primaryFixed: Color(4289196753),
      onPrimaryFixed: Color(4278198550),
      primaryFixedDim: Color(4287354549),
      onPrimaryFixedVariant: Color(4278210875),
      secondaryFixed: Color(4291815898),
      onSecondaryFixed: Color(4278788119),
      secondaryFixedDim: Color(4289973439),
      onSecondaryFixedVariant: Color(4281682753),
      tertiaryFixed: Color(4290963708),
      onTertiaryFixed: Color(4278198058),
      tertiaryFixedDim: Color(4289121504),
      onTertiaryFixedVariant: Color(4280634204),
      surfaceDim: Color(4292271062),
      surfaceBright: Color(4294310901),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916144),
      surfaceContainer: Color(4293586922),
      surfaceContainerHigh: Color(4293192420),
      surfaceContainerHighest: Color(4292797663),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278209847),
      surfaceTint: Color(4280052560),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281827686),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281419837),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284643950),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280371032),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283792011),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294310901),
      onBackground: Color(4279704858),
      surface: Color(4294310901),
      onSurface: Color(4279704858),
      surfaceVariant: Color(4292601310),
      onSurfaceVariant: Color(4282139968),
      outline: Color(4283982172),
      outlineVariant: Color(4285758839),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086510),
      inverseOnSurface: Color(4293718765),
      inversePrimary: Color(4287354549),
      primaryFixed: Color(4281827686),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4279789646),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284643950),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283064662),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283792011),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282147186),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292271062),
      surfaceBright: Color(4294310901),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916144),
      surfaceContainer: Color(4293586922),
      surfaceContainerHigh: Color(4293192420),
      surfaceContainerHighest: Color(4292797663),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278200347),
      surfaceTint: Color(4280052560),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278209847),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279248413),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281419837),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278199859),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280371032),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294310901),
      onBackground: Color(4279704858),
      surface: Color(4294310901),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4292601310),
      onSurfaceVariant: Color(4280100385),
      outline: Color(4282139968),
      outlineVariant: Color(4282139968),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086510),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4289789146),
      primaryFixed: Color(4278209847),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278203428),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281419837),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4279972136),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4280371032),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278399296),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292271062),
      surfaceBright: Color(4294310901),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916144),
      surfaceContainer: Color(4293586922),
      surfaceContainerHigh: Color(4293192420),
      surfaceContainerHighest: Color(4292797663),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4287354549),
      surfaceTint: Color(4287354549),
      onPrimary: Color(4278204455),
      primaryContainer: Color(4278210875),
      onPrimaryContainer: Color(4289196753),
      secondary: Color(4289973439),
      onSecondary: Color(4280235307),
      secondaryContainer: Color(4281682753),
      onSecondaryContainer: Color(4291815898),
      tertiary: Color(4289121504),
      onTertiary: Color(4278793540),
      tertiaryContainer: Color(4280634204),
      onTertiaryContainer: Color(4290963708),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279178514),
      onBackground: Color(4292797663),
      surface: Color(4279178514),
      onSurface: Color(4292797663),
      surfaceVariant: Color(4282403140),
      onSurfaceVariant: Color(4290759106),
      outline: Color(4287206285),
      outlineVariant: Color(4282403140),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797663),
      inverseOnSurface: Color(4281086510),
      inversePrimary: Color(4280052560),
      primaryFixed: Color(4289196753),
      onPrimaryFixed: Color(4278198550),
      primaryFixedDim: Color(4287354549),
      onPrimaryFixedVariant: Color(4278210875),
      secondaryFixed: Color(4291815898),
      onSecondaryFixed: Color(4278788119),
      secondaryFixedDim: Color(4289973439),
      onSecondaryFixedVariant: Color(4281682753),
      tertiaryFixed: Color(4290963708),
      onTertiaryFixed: Color(4278198058),
      tertiaryFixedDim: Color(4289121504),
      onTertiaryFixedVariant: Color(4280634204),
      surfaceDim: Color(4279178514),
      surfaceBright: Color(4281613111),
      surfaceContainerLowest: Color(4278849293),
      surfaceContainerLow: Color(4279704858),
      surfaceContainer: Color(4279968030),
      surfaceContainerHigh: Color(4280625960),
      surfaceContainerHighest: Color(4281349683),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4287617721),
      surfaceTint: Color(4287354549),
      onPrimary: Color(4278197009),
      primaryContainer: Color(4283801217),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290236867),
      onSecondary: Color(4278458898),
      secondaryContainer: Color(4286486154),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4289384676),
      onTertiary: Color(4278196515),
      tertiaryContainer: Color(4285634216),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279178514),
      onBackground: Color(4292797663),
      surface: Color(4279178514),
      onSurface: Color(4294376695),
      surfaceVariant: Color(4282403140),
      onSurfaceVariant: Color(4291022278),
      outline: Color(4288456095),
      outlineVariant: Color(4286350719),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797663),
      inverseOnSurface: Color(4280625960),
      inversePrimary: Color(4278211388),
      primaryFixed: Color(4289196753),
      onPrimaryFixed: Color(4278195469),
      primaryFixedDim: Color(4287354549),
      onPrimaryFixedVariant: Color(4278206252),
      secondaryFixed: Color(4291815898),
      onSecondaryFixed: Color(4278261005),
      secondaryFixedDim: Color(4289973439),
      onSecondaryFixedVariant: Color(4280564529),
      tertiaryFixed: Color(4290963708),
      onTertiaryFixed: Color(4278194972),
      tertiaryFixedDim: Color(4289121504),
      onTertiaryFixedVariant: Color(4279384650),
      surfaceDim: Color(4279178514),
      surfaceBright: Color(4281613111),
      surfaceContainerLowest: Color(4278849293),
      surfaceContainerLow: Color(4279704858),
      surfaceContainer: Color(4279968030),
      surfaceContainerHigh: Color(4280625960),
      surfaceContainerHighest: Color(4281349683),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4293787636),
      surfaceTint: Color(4287354549),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4287617721),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293787636),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290236867),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294441983),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4289384676),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279178514),
      onBackground: Color(4292797663),
      surface: Color(4279178514),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282403140),
      onSurfaceVariant: Color(4294245878),
      outline: Color(4291022278),
      outlineVariant: Color(4291022278),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797663),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4278202658),
      primaryFixed: Color(4289460181),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4287617721),
      onPrimaryFixedVariant: Color(4278197009),
      secondaryFixed: Color(4292079071),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290236867),
      onSecondaryFixedVariant: Color(4278458898),
      tertiaryFixed: Color(4291423487),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4289384676),
      onTertiaryFixedVariant: Color(4278196515),
      surfaceDim: Color(4279178514),
      surfaceBright: Color(4281613111),
      surfaceContainerLowest: Color(4278849293),
      surfaceContainerLow: Color(4279704858),
      surfaceContainer: Color(4279968030),
      surfaceContainerHigh: Color(4280625960),
      surfaceContainerHighest: Color(4281349683),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
