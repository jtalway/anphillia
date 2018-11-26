// Simple Script that makes colored texts possible
// Needs the following to work
#include "x3_inc_string"

const string COLOR_CODE_END          = "</c>";
const string COLOR_CODE_BLACK        = "<c   >";
const string COLOR_CODE_BLUE         = "<c\u201e\u2020�>";
const string COLOR_CODE_BLUE_DARK    = "<c74�>";
const string COLOR_CODE_BLUE_LIGHT   = "<c���>";    // Cyan
const string COLOR_CODE_BROWN        = "<c\u0153R0>";
const string COLOR_CODE_BROWN_LIGHT  = "<c�K>";
const string COLOR_CODE_DIVINE       = "<c���>";
const string COLOR_CODE_GOLD         = "<c�� >";
const string COLOR_CODE_GRAY         = "<c|||>";
const string COLOR_CODE_GRAY_DARK    = "<cZZZ>";
const string COLOR_CODE_GRAY_LIGHT   = "<c���>";
const string COLOR_CODE_GREEN        = "<c=�=>";
const string COLOR_CODE_GREEN_DARK   = "<c d >";
const string COLOR_CODE_GREEN_LIGHT  = "<c|� >";
const string COLOR_CODE_ORANGE       = "<c�� >";
const string COLOR_CODE_ORANGE_DARK  = "<c�| >";
const string COLOR_CODE_ORANGE_LIGHT = "<c�� >";
const string COLOR_CODE_RED          = "<c�(;>";
const string COLOR_CODE_RED_DARK     = "<c\u015399>";
const string COLOR_CODE_RED_LIGHT    = "<c�aU>";
const string COLOR_CODE_PINK         = "<c�k�>";
const string COLOR_CODE_PURPLE       = "<c\u20132�>";
const string COLOR_CODE_TURQUOISE    = "<cK��>";
const string COLOR_CODE_VIOLET       = "<c�\u201e�>";
const string COLOR_CODE_VIOLET_LIGHT = "<c�\u2014�>";
const string COLOR_CODE_VIOLET_DARK  = "<c�\�>";
const string COLOR_CODE_WHITE        = "<c���>";
const string COLOR_CODE_YELLOW       = "<c�� >";
const string COLOR_CODE_YELLOW_DARK  = "<c�� >";
const string COLOR_CODE_YELLOW_LIGHT = "<c���>";


const string COLOR_RED = "700";
const string COLOR_GREEN = "070";
const string COLOR_BLUE = "007";
const string COLOR_WHITE = "777";
const string COLOR_YELLOW = "770";
const string COLOR_CYAN = "077";
const string COLOR_PURPLE = "707";
const string COLOR_BLACK = "000";
const string COLOR_ORANGE = "730";
const string COLOR_BROWN = "420";
const string COLOR_GREY = "444";

const string COLOR_PREDEFINED_TEXT = "666";
const string COLOR_PREDEFINED_ITEM = "550";
const string COLOR_PREDEFINED_OBJECT = "050";
const string COLOR_PREDEFINED_HOSTILE = "500";
const string COLOR_PREDEFINED_FRIENDLY = "005";

const string COLOR_PREDEFINED_ITEM_COMMON = "777";
const string COLOR_PREDEFINED_ITEM_UNCOMMON = "060";
const string COLOR_PREDEFINED_ITEM_RARE = "127";
const string COLOR_PREDEFINED_ITEM_EPIC = "606";
const string COLOR_PREDEFINED_ITEM_LEGENDARY = "730";

// Wrapper for Bioware's own funtion 'StringToRGBString()'
// This function will make sString be the specified color
// as specified in sRGB.  RGB is the Red, Green, and Blue
// components of the color.  Each color can have a value from
// 0 to 7.
string color_ConvertString(string sString, string sRGB);

string color_GetColorFriendlyHostile(string sString, object oPC, object oPCInQuestion);

// Returns sString colored with the default Text Color
string color_Text(string sString);

// Returns sString colored with the default Item Text Color
string color_Item(string sString);

// Returns sString colored with the default Object Text Color
string color_Object(string sString);

// Returns sString colored with the default Hostile Text Color
string color_Hostile(string sString);

// Returns sString colored with the default Friendly Text Color
string color_Friendly(string sString);

// Sets color tokes on CUSTOM10RGB (octal), CUSTOM10999 is end color
void color_SetColorTokens();


string color_ConvertString(string sString, string sRGB)
{
    return StringToRGBString(sString, sRGB);
}

string color_GetColorFriendlyHostile(string sString, object oPC, object oPCInQuestion)
{
   object oMod = GetModule();
   if (GetIsFriend(oPCInQuestion, oPC) || GetIsNeutral(oPCInQuestion, oPC))
   {
      return color_ConvertString(sString, COLOR_PREDEFINED_FRIENDLY);
   }
   else
   {
      return color_ConvertString(sString, COLOR_PREDEFINED_HOSTILE);
   }
}

string color_Text(string sString)
{
    return color_ConvertString(sString, COLOR_PREDEFINED_TEXT);
}

string color_Item(string sString)
{
    return color_ConvertString(sString, COLOR_PREDEFINED_ITEM);
}

string color_Object(string sString)
{
    return color_ConvertString(sString, COLOR_PREDEFINED_OBJECT);
}

string color_Hostile(string sString)
{
    return color_ConvertString(sString, COLOR_PREDEFINED_HOSTILE);
}

string color_Friendly(string sString)
{
    return color_ConvertString(sString, COLOR_PREDEFINED_FRIENDLY);
}

void color_SetColorTokens()
{
  // TODO-SHERINCALL
}
