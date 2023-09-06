import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Config {
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  static const primaryColor = Colors.white;
  static const iconColor = Color.fromRGBO(70, 70, 70, 1);
  static const buttonColor = Colors.blueAccent;
  static const secondaryColor = Color.fromARGB(213, 153, 153, 153);
  static const colorBlack = Color.fromRGBO(41, 41, 41, 1);

  static ThemeData themeData() {
    return ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        focusColor: primaryColor,
        border: outlineBorder,
        focusedBorder: focusBorder,
        errorBorder: errorBorder,
        enabledBorder: outlineBorder,
        floatingLabelStyle: TextStyle(color: colorBlack),
        prefixIconColor: Colors.black38,
      ),
      textTheme: GoogleFonts.montserratTextTheme(),
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed),
    );
  }

  static BoxDecoration gradientBG() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.center,
        colors: [Colors.white, Color.fromARGB(255, 202, 238, 255)],
      ),
    );
  }

  void init(context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData!.size.width;
    screenHeight = mediaQueryData!.size.height;
  }

  static get widthSize {
    return screenWidth;
  }

  static get heightSize {
    return screenHeight;
  }

  static containerHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static containerWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  //Spacing
  static const spaceSmall = SizedBox(
    height: 20,
  );
  static const spaceMedium = SizedBox(
    height: 40,
  );
  static final spaceLarge = SizedBox(
    height: screenHeight! * .08,
  );
  static const widthSmall = SizedBox(
    width: 20,
  );

  //Textform border
  static const outlineBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );

  static const focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(color: Colors.transparent),
  );

  static const errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(color: Colors.red),
  );

  static TextStyle formTextStyle() {
    return const TextStyle(
      color: colorBlack,
    );
  }

  static TextStyle infoTextStyle() {
    return const TextStyle(color: Colors.white70, fontSize: 16);
  }

  static TextStyle titleTextStyle() {
    return const TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
  }

  static TextStyle otpTextStyle() {
    return const TextStyle(
        color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold);
  }

  static TextStyle termsPoliciesStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle popUpTitleTextStyle() {
    return const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  static TextStyle submitButtonTextStyle() {
    return const TextStyle(fontSize: 18, color: Colors.white);
  }

  static EdgeInsetsGeometry paddingAll20() {
    return const EdgeInsets.all(20);
  }

  static EdgeInsetsGeometry paddingSymetric() {
    return const EdgeInsets.symmetric(horizontal: 1, vertical: 10);
  }

  static Decoration decorationPopUp() {
    return const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.center,
        colors: [
          Color.fromARGB(255, 116, 193, 230),
          Color.fromARGB(255, 57, 106, 129)
        ],
      ),
    );
  }

  static ButtonStyle outlinedButtonStyle(Color backgroundColor) {
    return OutlinedButton.styleFrom(
      fixedSize: const Size(150, 45),
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }

  static TextFormField textFormField(
      TextEditingController controller,
      TextInputType textInputType,
      String hintText,
      Widget icon,
      bool autofocus,
      bool enabled,
      void Function()? onTap,
      void Function(String)? onChanged) {
    return TextFormField(
      onChanged: onChanged,
      enabled: enabled,
      onTap: onTap,
      autofocus: autofocus,
      style: formTextStyle(),
      controller: controller,
      keyboardType: textInputType,
      cursorColor: colorBlack,
      decoration: InputDecoration(
        filled: true,
        fillColor: secondaryColor,
        hintText: hintText,
        alignLabelWithHint: true,
        prefixIcon: icon,
        prefixIconColor: iconColor,
      ),
    );
  }

  static SizedBox otpTextFormField(
    BuildContext context,
    TextEditingController controller,
  ) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .1,
      width: MediaQuery.of(context).size.width * .1,
      child: TextFormField(
        textAlign: TextAlign.center,
        onChanged: (value) {
          var node = FocusScope.of(context);
          if (value.isNotEmpty) {
            node.nextFocus();
          }
        },
        autofocus: true,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        style: otpTextStyle(),
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: "0",
          alignLabelWithHint: true,
          filled: true,
          fillColor: secondaryColor,
        ),
      ),
    );
  }

  static Column infoTextFormField(TextInputType textInputType, String text,
      String initialValue, bool enabled) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: titleTextStyle(),
        ),
        spaceSmall,
        TextFormField(
          enabled: enabled,
          initialValue: initialValue,
          style: formTextStyle(),
          cursorColor: colorBlack,
          decoration:
              const InputDecoration(fillColor: secondaryColor, filled: true),
        ),
      ],
    );
  }

  static dynamic bottomSheet(
      BuildContext context, double height, Widget widget) {
    return showBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      context: context,
      builder: (context) => SizedBox(
        height: height,
        child: Flex(
          direction: Axis.horizontal,
          children: [widget],
        ),
      ),
    );
  }
}
