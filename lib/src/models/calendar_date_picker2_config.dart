import 'package:flutter/material.dart';

enum CalendarDatePicker2Type { single, multi, range, fixedRange }

typedef CalendarDayTextStylePredicate = TextStyle? Function({
  required DateTime date,
});

typedef CalendarDayBuilder = Widget? Function({
  required DateTime date,
  TextStyle? textStyle,
  BoxDecoration? decoration,
  bool? isSelected,
  bool? isDisabled,
  bool? isToday,
});

typedef CalendarYearBuilder = Widget? Function({
  required int year,
  TextStyle? textStyle,
  BoxDecoration? decoration,
  bool? isSelected,
  bool? isDisabled,
  bool? isCurrentYear,
});

typedef CalendarModePickerTextHandler = String? Function({
  required DateTime monthDate,
});

class CalendarDatePicker2Config {
  CalendarDatePicker2Config({
    CalendarDatePicker2Type? calendarType,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? currentDate,
    DatePickerMode? calendarViewMode,
    this.dateRangeBack,
    this.dateRangeForward,
    this.weekdayLabels,
    this.weekdayLabelTextStyle,
    this.firstDayOfWeek,
    this.controlsHeight,
    this.lastMonthIcon,
    this.nextMonthIcon,
    this.controlsTextStyle,
    this.dayTextStyle,
    this.selectedDayTextStyle,
    this.selectedDayHighlightColor,
    this.datePickerRangeColor,
    this.disabledDayTextStyle,
    this.todayTextStyle,
    this.yearTextStyle,
    this.selectedYearTextStyle,
    this.selectedDayBorderRadius,
    this.dayBorderRadius,
    this.yearBorderRadius,
    this.selectableDayPredicate,
    this.dayTextStylePredicate,
    this.dayBuilder,
    this.yearBuilder,
    this.disableModePicker,
    this.centerAlignModePicker,
    this.customModePickerIcon,
    this.modePickerTextHandler,
  })  : calendarType = calendarType ?? CalendarDatePicker2Type.single,
        firstDate = DateUtils.dateOnly(firstDate ?? DateTime(1970)),
        lastDate =
            DateUtils.dateOnly(lastDate ?? DateTime(DateTime.now().year + 50)),
        currentDate = currentDate ?? DateUtils.dateOnly(DateTime.now()),
        calendarViewMode = calendarViewMode ?? DatePickerMode.day;

  /// The enabled date picker mode
  final CalendarDatePicker2Type calendarType;

  /// The earliest allowable [DateTime] that the user can select.
  final DateTime firstDate;

  /// The latest allowable [DateTime] that the user can select.
  final DateTime lastDate;

  /// The [DateTime] representing today. It will be highlighted in the day grid.
  final DateTime currentDate;

  /// The initially displayed view of the calendar picker.
  final DatePickerMode calendarViewMode;

  /// The data range back from selected day.
  final int? dateRangeBack;

  /// The data range forward from selected day.
  final int? dateRangeForward;

  /// Custom weekday labels for the current locale, MUST starts from Sunday
  /// Examples:
  ///
  /// - US English: S, M, T, W, T, F, S
  /// - Russian: вс, пн, вт, ср, чт, пт, сб - notice that the list begins with
  ///   вс (Sunday) even though the first day of week for Russian is Monday.
  final List<String>? weekdayLabels;

  /// Custom text style for weekday labels
  final TextStyle? weekdayLabelTextStyle;

  /// Index of the first day of week, where 0 points to Sunday, and 6 points to Saturday.
  final int? firstDayOfWeek;

  /// Custom height for calendar control toggle's height
  final double? controlsHeight;

  /// Custom icon for last month button control
  final Widget? lastMonthIcon;

  /// Custom icon for next month button control
  final Widget? nextMonthIcon;

  /// Custom text style for calendar mode toggle control
  final TextStyle? controlsTextStyle;

  /// Custom text style for all calendar days
  final TextStyle? dayTextStyle;

  /// Custom text style for selected calendar day(s)
  final TextStyle? selectedDayTextStyle;

  /// The highlight color for selected day(s)
  final Color? selectedDayHighlightColor;

  /// The highlight color of date range
  final Color? datePickerRangeColor;

  /// Custom text style for disabled calendar day(s)
  final TextStyle? disabledDayTextStyle;

  /// Custom text style for today
  final TextStyle? todayTextStyle;

  // Custom text style for years list
  final TextStyle? yearTextStyle;

  // Custom text style for selected year(s)
  final TextStyle? selectedYearTextStyle;

  /// Custom border radius for day indicator
  final BorderRadius? dayBorderRadius;

  /// Custom border radius for selected day indicator
  final BorderRadius? selectedDayBorderRadius;

  /// Custom border radius for year indicator
  final BorderRadius? yearBorderRadius;

  /// Function to provide full control over which dates in the calendar can be selected.
  final SelectableDayPredicate? selectableDayPredicate;

  /// Function to provide full control over calendar days text style
  final CalendarDayTextStylePredicate? dayTextStylePredicate;

  /// Function to provide full control over day widget UI
  final CalendarDayBuilder? dayBuilder;

  /// Function to provide full control over year widget UI
  final CalendarYearBuilder? yearBuilder;

  /// Flag to disable mode picker and hide the mode toggle button icon
  final bool? disableModePicker;

  /// Flag to centralize year and month text label in controls
  final bool? centerAlignModePicker;

  /// Custom icon for the mode picker button icon
  final Widget? customModePickerIcon;

  /// Function to control mode picker displayed text
  final CalendarModePickerTextHandler? modePickerTextHandler;

  CalendarDatePicker2Config copyWith({
    CalendarDatePicker2Type? calendarType,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? currentDate,
    int? dateRangeBack,
    int? dateRangeForward,
    DatePickerMode? calendarViewMode,
    List<String>? weekdayLabels,
    TextStyle? weekdayLabelTextStyle,
    int? firstDayOfWeek,
    double? controlsHeight,
    Widget? lastMonthIcon,
    Widget? nextMonthIcon,
    TextStyle? controlsTextStyle,
    TextStyle? dayTextStyle,
    TextStyle? selectedDayTextStyle,
    Color? selectedDayHighlightColor,
    Color? datePickerRangeColor,
    TextStyle? disabledDayTextStyle,
    TextStyle? todayTextStyle,
    TextStyle? yearTextStyle,
    TextStyle? selectedYearTextStyle,
    BorderRadius? dayBorderRadius,
    BorderRadius? selectedDayBorderRadius,
    BorderRadius? yearBorderRadius,
    SelectableDayPredicate? selectableDayPredicate,
    CalendarDayTextStylePredicate? dayTextStylePredicate,
    CalendarDayBuilder? dayBuilder,
    CalendarYearBuilder? yearBuilder,
    bool? disableModePicker,
    bool? centerAlignModePicker,
    Widget? customModePickerIcon,
    CalendarModePickerTextHandler? modePickerTextHandler,
  }) {
    return CalendarDatePicker2Config(
      calendarType: calendarType ?? this.calendarType,
      firstDate: DateUtils.dateOnly(firstDate ?? this.firstDate),
      lastDate: DateUtils.dateOnly(lastDate ?? this.lastDate),
      currentDate: currentDate ?? this.currentDate,
      dateRangeBack: dateRangeBack ?? this.dateRangeBack,
      dateRangeForward: dateRangeForward ?? this.dateRangeForward,
      calendarViewMode: calendarViewMode ?? this.calendarViewMode,
      weekdayLabels: weekdayLabels ?? this.weekdayLabels,
      weekdayLabelTextStyle:
          weekdayLabelTextStyle ?? this.weekdayLabelTextStyle,
      firstDayOfWeek: firstDayOfWeek ?? this.firstDayOfWeek,
      controlsHeight: controlsHeight ?? this.controlsHeight,
      lastMonthIcon: lastMonthIcon ?? this.lastMonthIcon,
      nextMonthIcon: nextMonthIcon ?? this.nextMonthIcon,
      controlsTextStyle: controlsTextStyle ?? this.controlsTextStyle,
      dayTextStyle: dayTextStyle ?? this.dayTextStyle,
      selectedDayTextStyle: selectedDayTextStyle ?? this.selectedDayTextStyle,
      datePickerRangeColor: datePickerRangeColor ?? this.datePickerRangeColor,
      selectedDayHighlightColor:
          selectedDayHighlightColor ?? this.selectedDayHighlightColor,
      disabledDayTextStyle: disabledDayTextStyle ?? this.disabledDayTextStyle,
      todayTextStyle: todayTextStyle ?? this.todayTextStyle,
      yearTextStyle: yearTextStyle ?? this.yearTextStyle,
      selectedYearTextStyle:
          selectedYearTextStyle ?? this.selectedYearTextStyle,
      dayBorderRadius: dayBorderRadius ?? this.dayBorderRadius,
      selectedDayBorderRadius:
          selectedDayBorderRadius ?? this.selectedDayBorderRadius,
      yearBorderRadius: yearBorderRadius ?? this.yearBorderRadius,
      selectableDayPredicate:
          selectableDayPredicate ?? this.selectableDayPredicate,
      dayTextStylePredicate:
          dayTextStylePredicate ?? this.dayTextStylePredicate,
      dayBuilder: dayBuilder ?? this.dayBuilder,
      yearBuilder: yearBuilder ?? this.yearBuilder,
      disableModePicker: disableModePicker ?? this.disableModePicker,
      centerAlignModePicker:
          centerAlignModePicker ?? this.centerAlignModePicker,
      customModePickerIcon: customModePickerIcon ?? this.customModePickerIcon,
      modePickerTextHandler:
          modePickerTextHandler ?? this.modePickerTextHandler,
    );
  }
}

class CalendarDatePicker2WithActionButtonsConfig
    extends CalendarDatePicker2Config {
  CalendarDatePicker2WithActionButtonsConfig({
    CalendarDatePicker2Type? calendarType,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? currentDate,
    int? dateRangeBack,
    int? dateRangeForward,
    DatePickerMode? calendarViewMode,
    List<String>? weekdayLabels,
    TextStyle? weekdayLabelTextStyle,
    int? firstDayOfWeek,
    double? controlsHeight,
    Widget? lastMonthIcon,
    Widget? nextMonthIcon,
    TextStyle? controlsTextStyle,
    TextStyle? dayTextStyle,
    TextStyle? selectedDayTextStyle,
    Color? selectedDayHighlightColor,
    Color? datePickerRangeColor,
    TextStyle? disabledDayTextStyle,
    TextStyle? todayTextStyle,
    TextStyle? yearTextStyle,
    TextStyle? selectedYearTextStyle,
    BorderRadius? dayBorderRadius,
    BorderRadius? selectedDayBorderRadius,
    BorderRadius? yearBorderRadius,
    SelectableDayPredicate? selectableDayPredicate,
    CalendarDayTextStylePredicate? dayTextStylePredicate,
    CalendarDayBuilder? dayBuilder,
    CalendarYearBuilder? yearBuilder,
    bool? disableModePicker,
    bool? centerAlignModePicker,
    Widget? customModePickerIcon,
    CalendarModePickerTextHandler? modePickerTextHandler,
    this.gapBetweenCalendarAndButtons,
    this.cancelButtonTextStyle,
    this.cancelButton,
    this.okButtonTextStyle,
    this.okButton,
    this.openedFromDialog,
    this.closeDialogOnCancelTapped,
    this.closeDialogOnOkTapped,
    this.buttonPadding,
  }) : super(
          calendarType: calendarType,
          firstDate: firstDate,
          lastDate: lastDate,
          currentDate: currentDate,
          dateRangeForward: dateRangeForward,
          dateRangeBack: dateRangeBack,
          calendarViewMode: calendarViewMode,
          weekdayLabels: weekdayLabels,
          weekdayLabelTextStyle: weekdayLabelTextStyle,
          firstDayOfWeek: firstDayOfWeek,
          controlsHeight: controlsHeight,
          lastMonthIcon: lastMonthIcon,
          nextMonthIcon: nextMonthIcon,
          controlsTextStyle: controlsTextStyle,
          dayTextStyle: dayTextStyle,
          selectedDayTextStyle: selectedDayTextStyle,
          datePickerRangeColor: datePickerRangeColor,
          selectedDayHighlightColor: selectedDayHighlightColor,
          disabledDayTextStyle: disabledDayTextStyle,
          todayTextStyle: todayTextStyle,
          yearTextStyle: yearTextStyle,
          selectedYearTextStyle: selectedYearTextStyle,
          dayBorderRadius: dayBorderRadius,
          selectedDayBorderRadius: selectedDayBorderRadius,
          yearBorderRadius: yearBorderRadius,
          selectableDayPredicate: selectableDayPredicate,
          dayTextStylePredicate: dayTextStylePredicate,
          dayBuilder: dayBuilder,
          yearBuilder: yearBuilder,
          disableModePicker: disableModePicker,
          centerAlignModePicker: centerAlignModePicker,
          customModePickerIcon: customModePickerIcon,
          modePickerTextHandler: modePickerTextHandler,
        );

  /// The gap between calendar and action buttons
  final double? gapBetweenCalendarAndButtons;

  /// Text style for cancel button
  final TextStyle? cancelButtonTextStyle;

  /// Custom cancel button
  final Widget? cancelButton;

  /// Text style for ok button
  final TextStyle? okButtonTextStyle;

  /// Custom ok button
  final Widget? okButton;

  /// Is the calendar opened from dialog
  final bool? openedFromDialog;

  /// If the dialog should be closed when user taps the CANCEL button
  final bool? closeDialogOnCancelTapped;

  /// If the dialog should be closed when user taps the OK button
  final bool? closeDialogOnOkTapped;

  /// Custom wrapping padding for Ok & Cancel buttons
  final EdgeInsets? buttonPadding;

  @override
  CalendarDatePicker2WithActionButtonsConfig copyWith({
    CalendarDatePicker2Type? calendarType,
    DateTime? firstDate,
    DateTime? lastDate,
    int? dateRangeBack,
    int? dateRangeForward,
    DateTime? currentDate,
    DatePickerMode? calendarViewMode,
    List<String>? weekdayLabels,
    TextStyle? weekdayLabelTextStyle,
    int? firstDayOfWeek,
    double? controlsHeight,
    Widget? lastMonthIcon,
    Widget? nextMonthIcon,
    TextStyle? controlsTextStyle,
    TextStyle? dayTextStyle,
    TextStyle? selectedDayTextStyle,
    Color? selectedDayHighlightColor,
    Color? datePickerRangeColor,
    TextStyle? disabledDayTextStyle,
    TextStyle? todayTextStyle,
    TextStyle? yearTextStyle,
    TextStyle? selectedYearTextStyle,
    BorderRadius? dayBorderRadius,
    BorderRadius? selectedDayBorderRadius,
    BorderRadius? yearBorderRadius,
    SelectableDayPredicate? selectableDayPredicate,
    CalendarDayTextStylePredicate? dayTextStylePredicate,
    CalendarDayBuilder? dayBuilder,
    CalendarYearBuilder? yearBuilder,
    bool? disableModePicker,
    bool? centerAlignModePicker,
    Widget? customModePickerIcon,
    CalendarModePickerTextHandler? modePickerTextHandler,
    double? gapBetweenCalendarAndButtons,
    TextStyle? cancelButtonTextStyle,
    Widget? cancelButton,
    TextStyle? okButtonTextStyle,
    Widget? okButton,
    bool? openedFromDialog,
    bool? closeDialogOnCancelTapped,
    bool? closeDialogOnOkTapped,
    EdgeInsets? buttonPadding,
  }) {
    return CalendarDatePicker2WithActionButtonsConfig(
      calendarType: calendarType ?? this.calendarType,
      firstDate: DateUtils.dateOnly(firstDate ?? this.firstDate),
      lastDate: DateUtils.dateOnly(lastDate ?? this.lastDate),
      currentDate: currentDate ?? this.currentDate,
      dateRangeBack: dateRangeBack ?? this.dateRangeBack,
      dateRangeForward: dateRangeForward ?? this.dateRangeForward,
      calendarViewMode: calendarViewMode ?? this.calendarViewMode,
      weekdayLabels: weekdayLabels ?? this.weekdayLabels,
      weekdayLabelTextStyle:
          weekdayLabelTextStyle ?? this.weekdayLabelTextStyle,
      firstDayOfWeek: firstDayOfWeek ?? this.firstDayOfWeek,
      controlsHeight: controlsHeight ?? this.controlsHeight,
      lastMonthIcon: lastMonthIcon ?? this.lastMonthIcon,
      nextMonthIcon: nextMonthIcon ?? this.nextMonthIcon,
      controlsTextStyle: controlsTextStyle ?? this.controlsTextStyle,
      dayTextStyle: dayTextStyle ?? this.dayTextStyle,
      selectedDayTextStyle: selectedDayTextStyle ?? this.selectedDayTextStyle,
      datePickerRangeColor: datePickerRangeColor ?? this.datePickerRangeColor,
      selectedDayHighlightColor:
          selectedDayHighlightColor ?? this.selectedDayHighlightColor,
      disabledDayTextStyle: disabledDayTextStyle ?? this.disabledDayTextStyle,
      todayTextStyle: todayTextStyle ?? this.todayTextStyle,
      yearTextStyle: yearTextStyle ?? this.yearTextStyle,
      selectedYearTextStyle:
          selectedYearTextStyle ?? this.selectedYearTextStyle,
      dayBorderRadius: dayBorderRadius ?? this.dayBorderRadius,
      selectedDayBorderRadius:
          selectedDayBorderRadius ?? this.selectedDayBorderRadius,
      yearBorderRadius: yearBorderRadius ?? this.yearBorderRadius,
      selectableDayPredicate:
          selectableDayPredicate ?? this.selectableDayPredicate,
      dayTextStylePredicate:
          dayTextStylePredicate ?? this.dayTextStylePredicate,
      dayBuilder: dayBuilder ?? this.dayBuilder,
      yearBuilder: yearBuilder ?? this.yearBuilder,
      disableModePicker: disableModePicker ?? this.disableModePicker,
      centerAlignModePicker:
          centerAlignModePicker ?? this.centerAlignModePicker,
      customModePickerIcon: customModePickerIcon ?? this.customModePickerIcon,
      modePickerTextHandler:
          modePickerTextHandler ?? this.modePickerTextHandler,
      gapBetweenCalendarAndButtons:
          gapBetweenCalendarAndButtons ?? this.gapBetweenCalendarAndButtons,
      cancelButtonTextStyle:
          cancelButtonTextStyle ?? this.cancelButtonTextStyle,
      cancelButton: cancelButton ?? this.cancelButton,
      okButtonTextStyle: okButtonTextStyle ?? this.okButtonTextStyle,
      okButton: okButton ?? this.okButton,
      openedFromDialog: openedFromDialog ?? this.openedFromDialog,
      closeDialogOnCancelTapped:
          closeDialogOnCancelTapped ?? this.closeDialogOnCancelTapped,
      closeDialogOnOkTapped:
          closeDialogOnOkTapped ?? this.closeDialogOnOkTapped,
      buttonPadding: buttonPadding ?? this.buttonPadding,
    );
  }
}
