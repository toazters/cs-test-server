#include <sdkhooks>
#include <sdktools>
#include <sourcemod>
#pragma newdecls required
#pragma semicolon 1


public Plugin myinfo =
{
	name = "test",
	author = "willwashere_",
	description = "",
	version = "1.0.0",
	url = "https://github.com/toazters/cs-test-server"
};

// Runs on server startup
public void OnPluginStart()
{
    HookEvent("player_death", Event_PlayerDeath);
}

/**
 * On the PlayerDeath Event, kicks victim if the kill was a headshot.
 * 
 * @param event             Initializes event
 * @param name              Name of event
 * @param dontBroadcast     Broadcast the event
 * @return                  void
 */
public void Event_PlayerDeath(Event event, const char[] name, bool dontBroadcast)
{
    char weapon[64];
    int victimId = event.GetInt("userid");
    int attackerId = event.GetInt("attacker");
    bool headshot = event.GetBool("headshot");

    char name[64];
    int victim = GetClientOfUserId(victimId);
    int attacker = GetClientOfUserId(attackerId);
    GetClientName(attacker, name, sizeof(name));

	if(headshot == true)
	{
		KickClient(victim, "You got FUCKED like a BITCH frrrrrr :100: lol");
	}
}
