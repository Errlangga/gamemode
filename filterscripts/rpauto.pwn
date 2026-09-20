#include <a_samp>
#include <foreach>
#include <sscanf2>
#include <Pawn.CMD>

#define COLOR_PURPLE 0xDD90FFFF
#define COLOR_GREY 0xAFAFAFFF

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
	if (strcmp("/mycommand", cmdtext, true, 10) == 0)
	{
		// Do something here
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
CMD:petikapel(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s  Memetik apel dengan bantuan kedua tangan dan memasukkannya kedalam keranjang", playername);
   	format(dorp, sizeof(dorp), "Terpetik (%s) ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}
CMD:pakaiperban(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s  menggunakankan perban ke orang didepan dengan bantuan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "Terpakai (%s) ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}
CMD:ambilperban(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s  Mengambil Perban dilemari dengan bantuan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "Dapat (%s) ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}
CMD:ambilobat(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s  Mengambil obat dilemari dengan bantuan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "Dapat (%s) ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:borgol(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s  memborgol orang di depan dengan bantuan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "terbogol (%s) ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:ambilborgol(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s  mengambil borgol dari saku kanan dengan bantuan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "terambil (%s) ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:rpgerbang(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s  membuka gerbang dengan remote control dengan bantuan tangan kanan", playername);
   	format(dorp, sizeof(dorp), "terbuka (%s) ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:topeng(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s  menggunakan topeng dengan bantuan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "terpakai (%s) ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:simpansenjata(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s  menyimpan senjata ke punggung dengan bantuan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "tersimpan (%s) ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:ambilsenjata(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s  mengambil senjata dari punggung dengan bantuan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "terambil (%s) ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:kerjacombiner(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s  membajak ladang hingga selesai dengan bantuan traktor", playername);
   	format(dorp, sizeof(dorp), "proses (%s) ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:kerjapenebang(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s  menebang pohon menggunakan gergaji mesin dan menaruhnya di gudang dengan bantuan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "proses (%s) ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:kerjaminer(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s menambang dengan linggis dan meletakkannya di gudang dengan bantuan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "proses (%s) ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:kerjaloader(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s  mengambil barang di depan dan menaruhnya di gudang dengan bantuan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "proses (%s) ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:oprasi(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s melakukan operasi menggunakan alat medis dengan bantuan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "proses (%s) ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:lepasikatan(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s  melepas ikatan orang di depan dengan bantuan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "terlepas (%s) ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:ikat(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s  mengikat orang di depan menggunakan tali tambang dengan bantuan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "terikat (%s) ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:periksauang(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s  memeriksa keuangan orang di depan dengan bantuan kedua tangan", playername);
   	format(dorp, sizeof(dorp), "proses (%s) ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:ambildompet(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s  mengambil dompet dari saku pakaian dengan bantuan tangan kanan", playername);
   	format(dorp, sizeof(dorp), "terambil (%s) ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:shock(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s merasa kaget saat mengalami kecelakaan", playername);
   	format(dorp, sizeof(dorp), "Relax (%s) ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
 	return 1;
}

CMD:relax(playerid, params[])
{
	new merp[140], dorp[140], playername[MAX_PLAYER_NAME +1];
	GetPlayerName(playerid, playername, sizeof(playername));
    format(merp, sizeof(merp), " %s menenangkan diri setelah mengalami kecelakaan", playername);
   	format(dorp, sizeof(dorp), "proces (%s)  ", playername);
   	ProxDetector(30.0, playerid, merp, COLOR_PURPLE);
 	ProxDetector(30.0, playerid, dorp, COLOR_PURPLE);
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


