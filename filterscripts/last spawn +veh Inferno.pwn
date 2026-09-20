//support inferno ni boss

Float: pPos[4];        // pasang di pInfo
pSpawn,
pInterior,
pWorld,

cache_get_value_float(0, "pPos", PlayerInfo[playerid][pPos]);
cache_get_value_int(0, "pInterior", PlayerInfo[playerid][pInterior]);
cache_get_value_int(0, "pWorld", PlayerInfo[playerid][pWorld]);
//cari publics: OnPlayerLoadAccounts(playerid) pasang di bagian situ


public OnPlayerSpawn(playerid)
{
       SetTimerEx("GotoSpawn", 3000, 0, "i", playerid);
	   TogglePlayerControllable(playerid, 0);
       SendClientMessage(playerid, 0xC6E2FFFF, "SERVER : {ffffff}Mohon tunggu sebentar, sistem sedang mendeteksi posisi terakhir anda."):
       return 1;
}

forward GotoSpawn(playerid);
public GotoSpawn(playerid)
{
		SetPlayerPos(playerid, PlayerInfo[playerid][pPos][0], PlayerInfo[playerid][pPos][1], PlayerInfo[playerid][pPos][2]);
		SetPlayerFacingAngle(playerid, PlayerInfo[playerid][pPos][3]);
		SetPlayerInterior(playerid, PlayerInfo[playerid][pInterior]);
		SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][pWorld]);
	    pInfo[playerid][pSpawn] = 1;
	    TogglePlayerControllable(playerid, 1);
	    SendClientMessage(playerid, 0xC6E2FFFF, "SERVER : {ffff00}successfuly"):
	    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	   if(PlayerInfo[playerid][pSpawn] == 1)
	   {
		   new Float:x, Float:y, Float:z, Float:a;
		   GetPlayerPos(playerid, x, y, z);
		   GetPlayerFacingAngle(playerid, a);
		   PlayerInfo[playerid][pPos][0] = x;
		   PlayerInfo[playerid][pPos][1] = y;
		   PlayerInfo[playerid][pPos][2] = z;
		   PlayerInfo[playerid][pPos][3] = a;
		   PlayerInfo[playerid][pInterior] = GetPlayerInterior(playerid);
		   PlayerInfo[playerid][pWorld] = GetPlayerVirtualWorld(playerid);
		printf("Posisi pemain %s berhasil tersimpan", pName);
	   }
	  return 1;
}

// LAST EXIT VEH NI BOS
public OnPlayerDisconnect(playerid, reason)
{
    new use_car = GetPlayerUseHomeCar(playerid);  
   
    if(use_car == 1)
    {
        GetPlayerPos(playerid, player_car_park[playerid][use_car][0], player_car_park[playerid][use_car][1], player_car_park[playerid][use_car][2]);
        GetPlayerFacingAngle(playerid, player_car_park[playerid][use_car][3]);
        SavePlayerCarPark(playerid);
        printf("Posisi kendaraan %s berhasil tersimpan", pName);
    }
	return 1;
}