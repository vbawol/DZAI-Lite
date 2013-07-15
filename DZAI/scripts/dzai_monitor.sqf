/*
	DZAI Server Monitor (DZAI Lite Version)
	
	Description: Periodically reports current numbers of active AI units and dynamic triggers.
	
	Last updated: 4:24 PM 6/7/2013
*/

diag_log "Starting DZAI Server Monitor in 60 seconds.";
sleep 60;

while {true} do {
	private ["_uptime"];
	_uptime = [] call DZAI_getUptime;
	diag_log format ["DZAI Monitor :: Server Uptime - %1 d %2 hr %3 min %4 sec. Active AI Units - %5.",_uptime select 0, _uptime select 1, _uptime select 2, _uptime select 3,DZAI_numAIUnits];
	diag_log format ["DZAI Monitor :: Dynamic Spawns - %1/%2 (active/total) dynamic triggers. %3/%4 (cur/max) active helicopter patrols.",DZAI_actDynTrigs,DZAI_curDynTrigs,DZAI_curHeliPatrols,DZAI_maxHeliPatrols];
	if (DZAI_debugMarkers > 0) then {
		{
			private["_marker"];
			_marker = format ["trigger_%1",_x];
			_marker setMarkerPos (getMarkerPos _marker);
			sleep 1;
		} forEach DZAI_dynTriggerArray;
	};
	sleep DZAI_monitorRate;
};
