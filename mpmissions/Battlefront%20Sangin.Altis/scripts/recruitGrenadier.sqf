params["_machine"];

[
	_machine,											// Object the action is attached to
	"Recruit Grenadier",										// Title of the action
	"\a3\ui_f_orange\Data\CfgOrange\Missions\action_escape_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f_orange\Data\CfgOrange\Missions\action_escape_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 5",						// Condition for the action to be shown
	"_caller distance _target < 5",						// Condition for the action to progress
	{},													// Code executed when action starts
	{},													// Code executed on every progress tick
	{
    private _unit = (group _caller) createUnit ["B_Soldier_GL_F", getPosATL _caller, [], 2, "NONE"];


    // [!] UNIT MUST BE LOCAL [!]


  // Remove existing items
  removeAllWeapons _unit;
  removeAllItems _unit;
  removeAllAssignedItems _unit;
  removeUniform _unit;
  removeVest _unit;
  removeBackpack _unit;
  removeHeadgear _unit;

  // Add weapons
  _unit addWeapon "hlc_rifle_m4m203";
  _unit addPrimaryWeaponItem "acc_flashlight";
  _unit addPrimaryWeaponItem "optic_Holosight";
  _unit addPrimaryWeaponItem "hlc_30rnd_556x45_M_PMAG";
  _unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
  _unit addWeapon "hgun_P07_F";
  _unit addHandgunItem "16Rnd_9x21_Mag";

  // Add containers
  _unit forceAddUniform "VSM_Multicam_Crye_SS_Camo";
  _unit addVest "VSM_FAPC_Operator_Multicam";

  // Add items to containers
  _unit addItemToUniform "ACE_adenosine";
  for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 7 do {_unit addItemToUniform "ACE_elasticBandage";};
  for "_i" from 1 to 4 do {_unit addItemToUniform "HandGrenade";};
  for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_M84";};
  _unit addItemToUniform "SmokeShell";
  for "_i" from 1 to 3 do {_unit addItemToVest "ACE_elasticBandage";};
  for "_i" from 1 to 15 do {_unit addItemToVest "ACE_quikclot";};
  _unit addItemToVest "ACE_epinephrine";
  _unit addItemToVest "ACE_EarPlugs";
  _unit addItemToVest "ACE_MapTools";
  _unit addItemToVest "ACE_morphine";
  _unit addItemToVest "ACE_tourniquet";
  _unit addItemToVest "ACE_salineIV";
  _unit addItemToVest "ACE_salineIV_500";
  for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
  _unit addItemToVest "SmokeShellYellow";
  _unit addItemToVest "SmokeShellRed";
  for "_i" from 1 to 9 do {_unit addItemToVest "hlc_30rnd_556x45_M_PMAG";};
  for "_i" from 1 to 7 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
  for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
  _unit addHeadgear "VSM_OPS_multicam";

  // Add items
  _unit linkItem "ItemMap";
  _unit linkItem "ItemCompass";
  _unit linkItem "ItemWatch";
  _unit linkItem "ItemRadio";

  // Set identity
  [_unit,"sf"] call BIS_fnc_setUnitInsignia;

  },				// Code executed on completion
	{},													// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	1.5,													// Action duration [s]
	0,													// Priority
	false,												// Remove on completion
	false,											// Show in unconscious state
  true
] remoteExec ["BIS_fnc_holdActionAdd", [0, -2] select isDedicated, _machine];	// MP compatible implementation