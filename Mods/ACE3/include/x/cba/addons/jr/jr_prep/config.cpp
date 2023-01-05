#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = ECSTRING(jr,component);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_common"};
        author = "$STR_CBA_Author";
        authors[] = {};
        url = "$STR_CBA_URL";
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
