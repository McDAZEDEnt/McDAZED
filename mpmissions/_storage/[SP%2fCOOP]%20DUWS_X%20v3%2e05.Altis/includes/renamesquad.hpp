class squad_rename_dialog
{
    idd = -1;
    movingenable = true;
    //  onLoad = "_this call FRAME_01_Load";

    class controls
    {
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT START
        ////////////////////////////////////////////////////////
        class renameHCmainframe: RscFrame
        {
            idc = 1800;
            text = "$STR_DUWS_X_qmkng5xv"; //--- ToDo: Localize;
            x = 5 * GUI_GRID_W + GUI_GRID_X;
            y = 12 * GUI_GRID_H + GUI_GRID_Y;
            w = 30 * GUI_GRID_W;
            h = 5 * GUI_GRID_H;
            moving = 1;
            tooltip = "$STR_DUWS_X_z6lgn1sw"; //--- ToDo: Localize;
        };
        class editbox_rename: RscEdit
        {
            idc = 1400;
            x = 5.5 * GUI_GRID_W + GUI_GRID_X;
            y = 13 * GUI_GRID_H + GUI_GRID_Y;
            w = 29 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            tooltip = "$STR_DUWS_X_z6lgn1sw"; //--- ToDo: Localize;
        };
        class confirm_button: RscButton
        {
            idc = 1600;
            text = "$STR_DUWS_X_d7eqef75"; //--- ToDo: Localize;
            x = 10 * GUI_GRID_W + GUI_GRID_X;
            y = 15 * GUI_GRID_H + GUI_GRID_Y;
            w = 19 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            action = "[] spawn fnc_squad_rename";
        };
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT END
        ////////////////////////////////////////////////////////
    };
};