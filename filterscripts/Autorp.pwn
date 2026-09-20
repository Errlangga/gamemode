#include <a_samp>
#include <foreach>
#include <sscanf2>
#include <Pawn.CMD>

#define COLOR_PURPLE 0xC2A2DAFF
#define COLOR_GREY 0xAFAFAFFF
#define COLOR_GREEN 0x008000FF

public OnFilterScriptInit()
{
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    if (strcmp("/autorp", cmdtext, true, 11) == 11)
        {
        SendClientMessage(playerid, 0x00FF00FF, "/rpgun /rpems /rpmodif /rpfish /rpcrash");
        SendClientMessage(playerid, 0x00FF00FF, "/rpminer /rptebang /rpfarm /rpganja");
        SendClientMessage(playerid, 0x00FF00FF, "/rpmakan /rpminum /rpuang /rpcoli /rpsavegun");
        return 1;
		}
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

CMD:rpgun(playerid, params[])
{
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s Mengambil senjata dengan tangan kanan Dan bersiap untuk menembak", playername);
   	format(dorp, sizeof(dorp), "Menembak ((%s))", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:rpfish(playerid, params[])
{
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s Memegang alat pancing dan memancing menggunakan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "Dipancing ((%s))", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:rptebang(playerid, params[])
{
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s Menebang pohon di depan dengan gergaji di tangan", playername);
   	format(dorp, sizeof(dorp), "Ditebang ((%s))", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:rpminer(playerid, params[])
{
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s Menambang menggunakan linggis dengan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "Ditambang ((%s))", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:rpfarm(playerid, params[])
{
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s Menanam menggunakan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "Ditanam ((%s))", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:rpganja(playerid, params[])
{
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s Mengambil bibit ganja di saku dan menanamnya", playername);
   	format(dorp, sizeof(dorp), "Ditanam ((%s))", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}
CMD:rpmakan(playerid, params[])
{
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s Membeli makanan dan memakan maknan dengan tangan kanan", playername);
   	format(dorp, sizeof(dorp), "Dimakan ((%s))", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}
CMD:rpminum(playerid, params[])
{
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s Membeli minuman dan meminum minuman dengan tangan kanan", playername);
   	format(dorp, sizeof(dorp), "Diminum ((%s))", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}
CMD:rpcoli(playerid, params[])
{
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s Mengeluarkan titit dari celana dan mengocoknya dengan tangan kanan dan sekuat tenaga", playername);
   	format(dorp, sizeof(dorp), "Uh.. Ahh.. Croott... ((%s))", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}
CMD:rpcrash(playerid, params[])
{
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s Menabrak sesuatu didepan kendaraan dan mencoba untuk relax", playername);
   	format(dorp, sizeof(dorp), "Relax ((%s))", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}
CMD:rpsavegun(playerid, params[])
{
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s Menyimpan senjata ke pundak dengan bantuan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "Disimpan ((%s))", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}
CMD:rpems(playerid, params[])
{
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s Mengambil obat di saku kanan dengan tangan kanan dan diberi kepada pasien didepan", playername);
   	format(dorp, sizeof(dorp), "Diterima? ((%s))", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}
CMD:rpmodif(playerid, params[])
{
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s Memasang komponen mobil dengan bantuan peralatan dan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "Proses ((%s))", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}
CMD:ambilborgol(playerid, params[])
{
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s Mengambil borgol di saku kanan dengan tangan kanan", playername);
   	format(dorp, sizeof(dorp), "Dapat ((%s))", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}
CMD:rpborgol(playerid, params[])
{
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s Memborgol tersangka dengan bantuan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "Diborgol ((%s))", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}
CMD:periksa(playerid, params[])
{
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s Memeriksa orang didepan dengan bantuan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "Diterima? ((%s))", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}
CMD:rpkabur(playerid, params[])
{
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s Menghindari ancaman didepan dan berlari sekuat tenaga", playername);
   	format(dorp, sizeof(dorp), "Menjauh ((%s))", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}
CMD:rptilang(playerid, params[])
{
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s Menilang pelaku pelanggaran dengan memberikan catatan dan denda", playername);
   	format(dorp, sizeof(dorp), "Diterima? ((%s))", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}
CMD:rpuang(playerid, params[])
{
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s memberikan sejumlah uang kepada orang didepan dengan bantuan tangan kanan", playername);
   	format(dorp, sizeof(dorp), "Diterima? ((%s))", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}
CMD:ambiluang(playerid, params[])
{
	new merp[125], dorp[125], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s mengambil dompet di saku kanan dan mengambil sejumlah uang dengan bantuan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "Diterima? ((%s))", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}
CMD:autorphelp(playerid,params[])
{
	SendClientMessage(playerid, 0x00FF00FF, "/rpgun /rpems /rpmodif /rpfish /rpcrash /rptilang /rpborgol");
    SendClientMessage(playerid, 0x00FF00FF, "/rpminer /rptebang /rpfarm /rpganja /rpkabur /ambilborgol /rpmodif");
    SendClientMessage(playerid, 0x00FF00FF, "/ambiluang /rpmakan /rpminum /rpuang /rpcoli /rpsavegun /periksa /rpems");
    return 1;
}

stock ProxDetector(Float:radi, playerid, string[], color)
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x,y,z);
	foreach(Player, i)
	{
	    if(IsPlayerInRangeOfPoint(i,radi,x,y,z))
	    {
	        SendClientMessage(i,color,string);
	    }
	}
}
