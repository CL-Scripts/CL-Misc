CL = {}

-- Use Handsup --
CL.UseHandsUp = true -- true or false

-- Command --
CL.Command = "handsup"

-- Key Mapping Description --
CL.Description = "Handsup"

-- Key to do the Command -- 
CL.Key = "Z"

-- User PauseMenu Title --
CL.PauseMenu = true -- true or false

-- Pausemenu Title --
CL.PauseMenuTitle = '~r~CL ~w~Scripts | discord.gg/~r~cl-scripts~w~ | ~r~'.. GetPlayerName(PlayerId())..'~w~ | ~r~ID: '..GetPlayerServerId(NetworkGetEntityOwner(PlayerPedId()))..'~w~ | ~w~Hosted By ~r~Tube~w~-Hosting'

-- Use NoNPC -- WIP 
CL.NoNPC = false -- true or false

-- Use Timed Announce --
CL.UseTimedAnnounce = true -- true or false

-- Messages for Timed Announce --
CL.Announcements = {
    "CL SCRIPTS",
    "Welcome to CL SCRIPTS",
}

-- Announce Trigger --
CL.AnnounceTrigger = "CL_Announce"

-- Announce Title --
CL.AnnounceTitle = "Announce"

-- Timed Announce Interval --
CL.AnnounceInterval = 10 * 60000 -- 10 Minutes

CL.HudComponents = {
    [1] = false, -- WANTED_STARS
    [2] = true, -- WEAPON_ICON
    [3] = true, -- CASH
    [4] = true, -- MP_CASH
    [5] = false, -- MP_MESSAGE
    [6] = true, -- VEHICLE_NAME
    [7] = true, -- AREA_NAME
    [8] = true, -- VEHICLE_CLASS
    [9] = true,  -- STREET_NAME
    [10] = false, -- HELP_TEXT
    [11] = false, -- FLOATING_HELP_TEXT_1
    [12] = false, -- FLOATING_HELP_TEXT_2
    [13] = false, -- CASH_CHANGE
    [14] = false, -- RETICLE
    [15] = false, -- SUBTITLE_TEXT
    [16] = false, -- RADIO_STATIONS
    [17] = false, -- SAVING_GAME
    [18] = false, -- GAME_STREAM
    [19] = false, -- WEAPON_WHEEL
    [20] = false, -- WEAPON_WHEEL_STATS
    [21] = false, -- HUD_COMPONENTS
    [22] = false, -- HUD_WEAPONS
}

-- Use Custom Hud Colour --
CL.HudColour = true -- true or false

-- Hud Colour --
CL.Colour = 6 -- use the Index Numbers https://docs.fivem.net/docs/game-references/hud-colors/

-- Use Infinity Stamina --
CL.InfStamina = true -- true or false


-- Use Join Transition--
CL.JoinTransition = false -- true or false
