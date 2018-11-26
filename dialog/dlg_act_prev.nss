///////////////////////////////////////////////////////////////////////////////
// dlg_act_prev
// written by: eyesolated
// written at: Jan. 30, 2004
//
// Notes: This script fires when the player hits the "Previous" option


///////////
// Includes
//
#include "dlg_inc"

void main()
{
   // Get our PC object
   object oPC = GetPCSpeaker();
   // What dialog are we using?
   int iDialogID = GetLocalInt(oPC, CS_DLG_PC_DIALOGID);
   // Get the dialog script
   string sScript = GetLocalString(oPC, CS_DLG_PC_SCRIPT);
   // What node are we at?
   string sNode = GetLocalString(oPC, CS_DLG_PC_NODE);
   // What's the current page?
   int iPage = GetLocalInt(oPC, CS_DLG_PC_PAGE);
   // What's this option?
   int iOption = GetLocalInt(oPC, CS_DLG_PC_OPTIONX + "8_");
   // Reset the counter for the evaluation script
   SetLocalInt(oPC, CS_DLG_PC_TOKEN, 0);

   // Execute the Action Script
   struct STRUCT_DLG_NODEINFO strInfo;
   int iPCOptions = dlg_GetNumberOfPCOptions(iDialogID, sNode);
   if (iPCOptions > 8)
      strInfo = dlg_GetNodeInfo(iDialogID, sNode + CS_DLG_PREFIX_PREVIOUS, 1);
   else
      strInfo = dlg_GetNodeInfo(iDialogID, sNode + "P", iOption);
   SetLocalInt(oPC, CS_DLG_PC_CONDITIONAL_ID, -1);
   SetLocalInt(oPC, CS_DLG_PC_ACTION_ID, strInfo.Action);
   SetLocalString(oPC, CS_DLG_PC_NODETEXT, strInfo.Text);
   ExecuteScript(sScript, oPC);

   if (iPCOptions > 8)
   {
       // Decrease Page Count
       SetLocalInt(oPC, CS_DLG_PC_PAGE, iPage - 1);

       // Reset the Node
       SetLocalString(oPC, CS_DLG_PC_NODE, GetLocalString(oPC, CS_DLG_PC_PARENTNODE));
   }
   else
   {
      // What node did the player click?
       if (strInfo.Target != "0")
       {
          if (strInfo.Target != sNode)
          {
             sNode = strInfo.Target;
             SetLocalInt(oPC, CS_DLG_PC_PAGE, 0);
          }

          if (strInfo.RememberPage)
          {
             // Remember the current Page
             SetLocalString(oPC, CS_DLG_PC_NODE_BACKUP, sNode);
             SetLocalInt(oPC, CS_DLG_PC_PAGE_BACKUP, iPage);
          }
       }
       else
       {
          sNode = sNode + CS_DLG_PREFIX_PC + IntToString (iOption);
          // Remember to reset page number
          SetLocalInt(oPC, CS_DLG_PC_PAGE, 0);
       }

      // Set the new Node we're at
      SetLocalString(oPC, CS_DLG_PC_NODE, sNode);

      // Reset Options
      SetLocalInt(oPC, CS_DLG_PC_FIRSTOPTIONFORPAGE + "0", 1);
   }
}
