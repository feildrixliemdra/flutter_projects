part of 'shared.dart';

const double defaultMargin = 24;
const Color mainColor = Color(0xFF503E9D);
const Color accentColor1 = Color(0xFFFBD460);
const Color accentColor2 = Color(0xFFE4E4E4);
const Color accentColor3 = Color(0xFF2C1F63);
const Color accentColor4 = Color(0xFF3E9D9D);
const Color accentColor5 = Color(0xFFFF5C83);

TextStyle blackTextStyle = GoogleFonts.raleway()
    .copyWith(color: Color(0xFF000000), fontWeight: FontWeight.w500);

TextStyle whiteTextStyle = GoogleFonts.raleway()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle whiteTextNumberStyle = GoogleFonts.openSans()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);

TextStyle yellowTextStyle = GoogleFonts.openSans()
    .copyWith(color: accentColor1, fontWeight: FontWeight.normal);

TextStyle greyTextStyle = GoogleFonts.raleway()
    .copyWith(color: Color(0xFFADADAD), fontWeight: FontWeight.w300);

TextStyle greyNumberTextStyle = GoogleFonts.openSans()
    .copyWith(color: Color(0xFFADADAD), fontWeight: FontWeight.w300);

TextStyle purpleTextStyle = GoogleFonts.raleway()
    .copyWith(color: mainColor, fontWeight: FontWeight.w300);
TextStyle promoSubtitleTextStyle = GoogleFonts.raleway()
    .copyWith(color: Color(0xFFA99BE3), fontWeight: FontWeight.w300);
