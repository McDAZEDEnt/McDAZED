// Super simple auto-save script.
// this enables manual save
//enableSaving false;
if (!savingEnabled) then 
{
	enableSaving [false, false];
};
//DMP & HAL on hold
dmpWaitForGo=TRUE;publicVariable"dmpWaitForGo";
//saved variable
missionNamespace setVariable ["isSaved",true];publicVariable"isSaved";
//Save to profile
saveProfileNamespace;
[true, 5] call grad_persistence_fnc_saveMission;
//endMission
"saved" call BIS_fnc_endMissionServer;