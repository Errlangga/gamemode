#include <a_samp>
#include "../include/gl_common.inc"

#define TOTAL_ACCESSORIES          21
#define SELECTION_ACCESSORIES  	21
#define ACCESSORIES_PER_LINE       7

#define MESSAGE_COLOR 0xFF444499

#define HEADER_TEXT "Accessories"
#define NEXT_TEXT   "Next"
#define PREV_TEXT   "Prev"

#define DIALOG_BASE_X   	75.0
#define DIALOG_BASE_Y   	130.0
#define DIALOG_WIDTH    	550.0
#define DIALOG_HEIGHT   	180.0
#define SPRITE_DIM_X    	60.0
#define SPRITE_DIM_Y    	70.0

new gTotalACCESSORIES = TOTAL_ACCESSORIES;
new PlayerText:gCurrentPageTextDrawId[MAX_PLAYERS];
new PlayerText:gHeaderTextDrawId[MAX_PLAYERS];
new PlayerText:gBackgroundTextDrawId[MAX_PLAYERS];
new PlayerText:gNextButtonTextDrawId[MAX_PLAYERS];
new PlayerText:gPrevButtonTextDrawId[MAX_PLAYERS];
new PlayerText:gSelectionItems[MAX_PLAYERS][SELECTION_ACCESSORIES];
new gSelectionItemsTag[MAX_PLAYERS][SELECTION_ACCESSORIES];
new gItemAt[MAX_PLAYERS];

new gItemList[TOTAL_ACCESSORIES] = {
19488,19352,19330,19331,19098,19006,19007,19008,19009,19010,
18640,18975,19077,19320,19136,19274,19039,19040,19041,19042,18729
};

GetNumberOfPages()
{
	if((gTotalACCESSORIES >= SELECTION_ACCESSORIES) && (gTotalACCESSORIES % SELECTION_ACCESSORIES) == 0)
	{
		return (gTotalACCESSORIES / SELECTION_ACCESSORIES);
	}
	else return (gTotalACCESSORIES / SELECTION_ACCESSORIES) + 1;
}

PlayerText:CreateCurrentPageTextDraw(playerid, Float:Xpos, Float:Ypos)
{
	new PlayerText:txtInit;
   	txtInit = CreatePlayerTextDraw(playerid, Xpos, Ypos, "0/0");
   	PlayerTextDrawUseBox(playerid, txtInit, 0);
	PlayerTextDrawLetterSize(playerid, txtInit, 0.4, 1.1);
	PlayerTextDrawFont(playerid, txtInit, 1);
	PlayerTextDrawSetShadow(playerid, txtInit, 0);
    PlayerTextDrawSetOutline(playerid, txtInit, 1);
    PlayerTextDrawColor(playerid, txtInit, 0xACCBF1FF);
    PlayerTextDrawShow(playerid, txtInit);
    return txtInit;
}

PlayerText:CreatePlayerDialogButton(playerid, Float:Xpos, Float:Ypos, Float:Width, Float:Height, button_text[])
{
 	new PlayerText:txtInit;
   	txtInit = CreatePlayerTextDraw(playerid, Xpos, Ypos, button_text);
   	PlayerTextDrawUseBox(playerid, txtInit, 1);
   	PlayerTextDrawBoxColor(playerid, txtInit, 0x000000FF);
   	PlayerTextDrawBackgroundColor(playerid, txtInit, 0x000000FF);
	PlayerTextDrawLetterSize(playerid, txtInit, 0.4, 1.1);
	PlayerTextDrawFont(playerid, txtInit, 1);
	PlayerTextDrawSetShadow(playerid, txtInit, 0); // no shadow
    PlayerTextDrawSetOutline(playerid, txtInit, 0);
    PlayerTextDrawColor(playerid, txtInit, 0x4A5A6BFF);
    PlayerTextDrawSetSelectable(playerid, txtInit, 1);
    PlayerTextDrawAlignment(playerid, txtInit, 2);
    PlayerTextDrawTextSize(playerid, txtInit, Height, Width); // The width and height are reversed for centering.. something the game does <g>
    PlayerTextDrawShow(playerid, txtInit);
    return txtInit;
}

PlayerText:CreatePlayerHeaderTextDraw(playerid, Float:Xpos, Float:Ypos, header_text[])
{
	new PlayerText:txtInit;
   	txtInit = CreatePlayerTextDraw(playerid, Xpos, Ypos, header_text);
   	PlayerTextDrawUseBox(playerid, txtInit, 0);
	PlayerTextDrawLetterSize(playerid, txtInit, 1.25, 3.0);
	PlayerTextDrawFont(playerid, txtInit, 0);
	PlayerTextDrawSetShadow(playerid, txtInit, 0);
    PlayerTextDrawSetOutline(playerid, txtInit, 1);
    PlayerTextDrawColor(playerid, txtInit, 0xACCBF1FF);
    PlayerTextDrawShow(playerid, txtInit);
    return txtInit;
}

PlayerText:CreatePlayerBackgroundTextDraw(playerid, Float:Xpos, Float:Ypos, Float:Width, Float:Height)
{
	new PlayerText:txtBackground = CreatePlayerTextDraw(playerid, Xpos, Ypos,"                                            ~n~"); // enough space for everyone
    PlayerTextDrawUseBox(playerid, txtBackground, 1);
    PlayerTextDrawBoxColor(playerid, txtBackground, 0x4A5A6BBB);
	PlayerTextDrawLetterSize(playerid, txtBackground, 5.0, 5.0);
	PlayerTextDrawFont(playerid, txtBackground, 0);
	PlayerTextDrawSetShadow(playerid, txtBackground, 0);
    PlayerTextDrawSetOutline(playerid, txtBackground, 0);
    PlayerTextDrawColor(playerid, txtBackground,0x000000FF);
    PlayerTextDrawTextSize(playerid, txtBackground, Width, Height);
   	PlayerTextDrawBackgroundColor(playerid, txtBackground, 0x4A5A6BBB);
    PlayerTextDrawShow(playerid, txtBackground);
    return txtBackground;
}

PlayerText:CreateModelPreviewTextDraw(playerid, modelindex, Float:Xpos, Float:Ypos, Float:width, Float:height)
{
    new PlayerText:txtPlayerSprite = CreatePlayerTextDraw(playerid, Xpos, Ypos, ""); // it has to be set with SetText later
    PlayerTextDrawFont(playerid, txtPlayerSprite, TEXT_DRAW_FONT_MODEL_PREVIEW);
    PlayerTextDrawColor(playerid, txtPlayerSprite, 0xFFFFFFFF);
    PlayerTextDrawBackgroundColor(playerid, txtPlayerSprite, 0x88888899);
    PlayerTextDrawTextSize(playerid, txtPlayerSprite, width, height); // Text size is the Width:Height
    PlayerTextDrawSetPreviewModel(playerid, txtPlayerSprite, modelindex);
    PlayerTextDrawSetSelectable(playerid, txtPlayerSprite, 1);
    PlayerTextDrawShow(playerid,txtPlayerSprite);
    return txtPlayerSprite;
}

DestroyPlayerModelPreviews(playerid)
{
	new x=0;
	while(x != SELECTION_ACCESSORIES) {
	    if(gSelectionItems[playerid][x] != PlayerText:INVALID_TEXT_DRAW) {
			PlayerTextDrawDestroy(playerid, gSelectionItems[playerid][x]);
			gSelectionItems[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
		}
		x++;
	}
}

ShowPlayerModelPreviews(playerid)
{
    new x=0;
	new Float:BaseX = DIALOG_BASE_X;
	new Float:BaseY = DIALOG_BASE_Y - (SPRITE_DIM_Y * 0.33); // down a bit
	new linetracker = 0;

	new itemat = GetPVarInt(playerid, "items_page") * SELECTION_ACCESSORIES;

	// Destroy any previous ones created
	DestroyPlayerModelPreviews(playerid);

	while(x != SELECTION_ACCESSORIES && itemat < gTotalACCESSORIES) {
	    if(linetracker == 0) {
	        BaseX = DIALOG_BASE_X + 25.0; // in a bit from the box
	        BaseY += SPRITE_DIM_Y + 1.0; // move on the Y for the next line
		}
  		gSelectionItems[playerid][x] = CreateModelPreviewTextDraw(playerid, gItemList[itemat], BaseX, BaseY, SPRITE_DIM_X, SPRITE_DIM_Y);
  		gSelectionItemsTag[playerid][x] = gItemList[itemat];
		BaseX += SPRITE_DIM_X + 1.0; // move on the X for the next sprite
		linetracker++;
		if(linetracker == ACCESSORIES_PER_LINE) linetracker = 0;
		itemat++;
		x++;
	}
}

UpdatePageTextDraw(playerid)
{
	new PageText[64+1];
	format(PageText, 64, "%d/%d", GetPVarInt(playerid,"items_page") + 1, GetNumberOfPages());
	PlayerTextDrawSetString(playerid, gCurrentPageTextDrawId[playerid], PageText);
}

CreateSelectionMenu(playerid)
{
    gBackgroundTextDrawId[playerid] = CreatePlayerBackgroundTextDraw(playerid, DIALOG_BASE_X, DIALOG_BASE_Y + 20.0, DIALOG_WIDTH, DIALOG_HEIGHT);
    gHeaderTextDrawId[playerid] = CreatePlayerHeaderTextDraw(playerid, DIALOG_BASE_X, DIALOG_BASE_Y, HEADER_TEXT);
    gCurrentPageTextDrawId[playerid] = CreateCurrentPageTextDraw(playerid, DIALOG_WIDTH - 30.0, DIALOG_BASE_Y + 15.0);
    gNextButtonTextDrawId[playerid] = CreatePlayerDialogButton(playerid, DIALOG_WIDTH - 30.0, DIALOG_BASE_Y+DIALOG_HEIGHT+100.0, 50.0, 16.0, NEXT_TEXT);
    gPrevButtonTextDrawId[playerid] = CreatePlayerDialogButton(playerid, DIALOG_WIDTH - 90.0, DIALOG_BASE_Y+DIALOG_HEIGHT+100.0, 50.0, 16.0, PREV_TEXT);

    ShowPlayerModelPreviews(playerid);
    UpdatePageTextDraw(playerid);
}

DestroySelectionMenu(playerid)
{
	DestroyPlayerModelPreviews(playerid);

	PlayerTextDrawDestroy(playerid, gHeaderTextDrawId[playerid]);
	PlayerTextDrawDestroy(playerid, gBackgroundTextDrawId[playerid]);
	PlayerTextDrawDestroy(playerid, gCurrentPageTextDrawId[playerid]);
	PlayerTextDrawDestroy(playerid, gNextButtonTextDrawId[playerid]);
	PlayerTextDrawDestroy(playerid, gPrevButtonTextDrawId[playerid]);

	gHeaderTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gBackgroundTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gCurrentPageTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gNextButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gPrevButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
}

HandlePlayerItemSelection(playerid, selecteditem)
{
  	if(gSelectionItemsTag[playerid][selecteditem] == 19488 || gSelectionItemsTag[playerid][selecteditem] == 19352 || gSelectionItemsTag[playerid][selecteditem] == 19330 || gSelectionItemsTag[playerid][selecteditem] == 19331 || gSelectionItemsTag[playerid][selecteditem] == 19098)
  	{
       SetPlayerAttachedObject(playerid, 0, gSelectionItemsTag[playerid][selecteditem], 2);
       SendClientMessage(playerid,MESSAGE_COLOR,"Use /edittoy to Edit Toy and /removetoy to Remove it.");
       return 1;
	}
	if(gSelectionItemsTag[playerid][selecteditem] >= 19006 && gSelectionItemsTag[playerid][selecteditem] <= 19010)
  	{
       SetPlayerAttachedObject(playerid, 1, gSelectionItemsTag[playerid][selecteditem], 18);
       SendClientMessage(playerid,MESSAGE_COLOR,"Use /edittoy to Edit Toy and /removetoy to Remove it.");
       return 1;
	}
	if(gSelectionItemsTag[playerid][selecteditem] == 18640 || gSelectionItemsTag[playerid][selecteditem] == 18975 || gSelectionItemsTag[playerid][selecteditem] == 19077 || gSelectionItemsTag[playerid][selecteditem] == 19136 || gSelectionItemsTag[playerid][selecteditem] == 19274)
  	{
       SetPlayerAttachedObject(playerid, 2, gSelectionItemsTag[playerid][selecteditem], 2);
       SendClientMessage(playerid,MESSAGE_COLOR,"Use /edittoy to Edit Toy and /removetoy to Remove it.");
       return 1;
	}
	if(gSelectionItemsTag[playerid][selecteditem] == 18729)
  	{
       SetPlayerAttachedObject(playerid, 3, gSelectionItemsTag[playerid][selecteditem], 5);
       SendClientMessage(playerid,MESSAGE_COLOR,"Use /edittoy to Edit Toy and /removetoy to Remove it.");
       return 1;
	}
	if(gSelectionItemsTag[playerid][selecteditem] == 19320)
  	{
       SetPlayerAttachedObject(playerid, 4, gSelectionItemsTag[playerid][selecteditem], 6);
       SendClientMessage(playerid,MESSAGE_COLOR,"Use /edittoy to Edit Toy and /removetoy to Remove it.");
       return 1;
	}
	return 0;
}

public OnPlayerConnect(playerid)
{
	// Init all of the textdraw related globals
    gHeaderTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gBackgroundTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gCurrentPageTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gNextButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gPrevButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;

    for(new x=0; x < SELECTION_ACCESSORIES; x++) {
        gSelectionItems[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
	}

	gItemAt[playerid] = 0;

	return 1; // Allow other scripts to keep processing OnPlayerConnect
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
   	if(GetPVarInt(playerid, "items_active") == 0) return 0;

	// Handle: They cancelled (with ESC)
	if(clickedid == Text:INVALID_TEXT_DRAW) {
        DestroySelectionMenu(playerid);
        SetPVarInt(playerid, "items_active", 0);
        PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
        return 1;
	}

	return 0;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(GetPVarInt(playerid, "items_active") == 0) return 0;

	new curpage = GetPVarInt(playerid, "items_page");

	// Handle: next button
	if(playertextid == gNextButtonTextDrawId[playerid]) {
	    if(curpage < (GetNumberOfPages() - 1)) {
	        SetPVarInt(playerid, "items_page", curpage + 1);
	        ShowPlayerModelPreviews(playerid);
         	UpdatePageTextDraw(playerid);
         	PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		} else {
		    PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
		}
		return 1;
	}

	// Handle: previous button
	if(playertextid == gPrevButtonTextDrawId[playerid]) {
	    if(curpage > 0) {
	    	SetPVarInt(playerid, "items_page", curpage - 1);
	    	ShowPlayerModelPreviews(playerid);
	    	UpdatePageTextDraw(playerid);
	    	PlayerPlaySound(playerid, 1084, 0.0, 0.0, 0.0);
		} else {
		    PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
		}
		return 1;
	}

	// Search in the array of textdraws used for the items
	new x=0;
	while(x != SELECTION_ACCESSORIES) {
	    if(playertextid == gSelectionItems[playerid][x]) {
	        HandlePlayerItemSelection(playerid, x);
	        PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
	        DestroySelectionMenu(playerid);
	        CancelSelectTextDraw(playerid);
        	SetPVarInt(playerid, "items_active", 0);
        	return 1;
		}
		x++;
	}

	return 0;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[256+1];
	new	idx;

	cmd = strtok(cmdtext, idx);

	if(strcmp("/atoys", cmd, true) == 0)
	{
		DestroySelectionMenu(playerid);
	    SetPVarInt(playerid, "items_active", 1);
	    CreateSelectionMenu(playerid);
	    SelectTextDraw(playerid, 0xACCBF1FF);
        return 1;
	}
    if(strcmp("/rtoys", cmd, true) == 0)
	{
		for(new i=0; i<MAX_PLAYER_ATTACHED_OBJECTS; i++)
        {
            if(IsPlayerAttachedObjectSlotUsed(playerid, i)) RemovePlayerAttachedObject(playerid, i);
        }
        SendClientMessage(playerid,MESSAGE_COLOR,"Accessory Removed.");
        return 1;
	}
	if(strcmp("/etoys", cmd, true) == 0)
	{
		for(new i=0; i<MAX_PLAYER_ATTACHED_OBJECTS; i++)
        {
            if(IsPlayerAttachedObjectSlotUsed(playerid, i)) EditAttachedObject(playerid, i);
        }
        SendClientMessage(playerid,MESSAGE_COLOR,"Use Right Shift to Look Around.");
        return 1;
	}
	return 0;
}
