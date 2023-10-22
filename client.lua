if CL.UseHandsUp then
RegisterCommand(CL.Command, function()
    local Player = PlayerPedId()
    local animDict = "random@mugging3"
    local animName = "handsup_standing_base"
    if not IsEntityPlayingAnim(Player, animDict, animName, 3) then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do Wait(100) end
        TaskPlayAnim(Player, animDict, animName, 8.0, -8.0, -1, 49, 0, 0, 0, 0)
        SetEnableHandcuffs(Player, true)
        SetCurrentPedWeapon(PlayerPedId(),GetHashKey("WEAPON_UNARMED"),true)
        RemoveAnimDict(animDict)
    else
        SetEnableHandcuffs(Player, false)
        ClearPedSecondaryTask(Player)
    end
end, false)
end

RegisterKeyMapping(CL.Command, CL.Description, "keyboard", CL.Key)

if CL.PauseMenu then
    AddTextEntry('FE_THDR_GTAO', CL.PauseMenuTitle)
end

if CL.NoNPC then
    SetRandomEventFlag(false)
    SetParkedVehicleDensityMultiplierThisFrame(0.0)
    SetVehicleDensityMultiplierThisFrame(0.0)
    SetRandomVehicleDensityMultiplierThisFrame(0.0)
    SetPedDensityMultiplierThisFrame(0.0)
    SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
    SetPlayerWantedLevel(PlayerId(), 0, false)
    SetPlayerWantedLevelNow(PlayerId(), false)
    StartAudioScene('CHARACTER_CHANGE_IN_SKY_SCENE')
    
    for i = 1, 15 do
        EnableDispatchService(i, false)
    end

    local scenarios = {
        'WORLD_HUMAN_AA_COFFEE',
        'WORLD_HUMAN_AA_SMOKE',
        'WORLD_HUMAN_BINOCULARS',
        'WORLD_HUMAN_BUM_FREEWAY',
        'WORLD_HUMAN_BUM_SLUMPED',
        'WORLD_HUMAN_BUM_STANDING',
        'WORLD_HUMAN_BUM_WASH',
        'WORLD_HUMAN_VALET',
        'WORLD_HUMAN_CAR_PARK_ATTENDANT',
        'WORLD_HUMAN_CHEERING',
        'WORLD_HUMAN_CLIPBOARD',
        'WORLD_HUMAN_CLIPBOARD_FACILITY',
        'WORLD_HUMAN_CONST_DRILL',
        'WORLD_HUMAN_COP_IDLES',
        'WORLD_HUMAN_DRINKING',
        'WORLD_HUMAN_DRINKING_FACILITY',
        'WORLD_HUMAN_DRINKING_CASINO_TERRACE',
        'WORLD_HUMAN_DRUG_DEALER',
        'WORLD_HUMAN_DRUG_DEALER_HARD',
        'WORLD_HUMAN_MOBILE_FILM_SHOCKING',
        'WORLD_HUMAN_GARDENER_LEAF_BLOWER',
        'WORLD_HUMAN_GARDENER_PLANT',
        'WORLD_HUMAN_GOLF_PLAYER',
        'WORLD_HUMAN_GUARD_PATROL',
        'WORLD_HUMAN_GUARD_STAND',
        'WORLD_HUMAN_GUARD_STAND_CASINO',
        'WORLD_HUMAN_GUARD_STAND_CLUBHOUSE',
        'WORLD_HUMAN_GUARD_STAND_FACILITY',
        'WORLD_HUMAN_GUARD_STAND_ARMY',
        'WORLD_HUMAN_HAMMERING',
        'WORLD_HUMAN_HANG_OUT_STREET',
        'WORLD_HUMAN_HANG_OUT_STREET_CLUBHOUSE',
        'WORLD_HUMAN_HIKER',
        'WORLD_HUMAN_HIKER_STANDING',
        'WORLD_HUMAN_HUMAN_STATUE',
        'WORLD_HUMAN_JANITOR',
        'WORLD_HUMAN_JOG',
        'WORLD_HUMAN_JOG_STANDING',
        'WORLD_HUMAN_LEANING',
        'WORLD_HUMAN_LEANING_CASINO_TERRACE',
        'WORLD_HUMAN_MAID_CLEAN',
        'WORLD_HUMAN_MUSCLE_FLEX',
        'WORLD_HUMAN_MUSCLE_FREE_WEIGHTS',
        'WORLD_HUMAN_MUSICIAN',
        'WORLD_HUMAN_PAPARAZZI',
        'WORLD_HUMAN_PARTYING',
        'WORLD_HUMAN_PICNIC',
        'WORLD_HUMAN_POWER_WALKER',
        'WORLD_HUMAN_PROSTITUTE_HIGH_CLASS',
        'WORLD_HUMAN_PROSTITUTE_LOW_CLASS',
        'WORLD_HUMAN_PUSH_UPS',
        'WORLD_HUMAN_SEAT_LEDGE',
        'WORLD_HUMAN_SEAT_LEDGE_EATING',
        'WORLD_HUMAN_SEAT_STEPS',
        'WORLD_HUMAN_SEAT_WALL',
        'WORLD_HUMAN_SEAT_WALL_EATING',
        'WORLD_HUMAN_SEAT_WALL_TABLET',
        'WORLD_HUMAN_SECURITY_SHINE_TORCH',
        'WORLD_HUMAN_SIT_UPS',
        'WORLD_HUMAN_SMOKING',
        'WORLD_HUMAN_SMOKING_CLUBHOUSE',
        'WORLD_HUMAN_SMOKING_POT',
        'WORLD_HUMAN_SMOKING_POT_CLUBHOUSE',
        'WORLD_HUMAN_STAND_FIRE',
        'WORLD_HUMAN_STAND_FISHING',
        'WORLD_HUMAN_STAND_IMPATIENT',
        'WORLD_HUMAN_STAND_IMPATIENT_CLUBHOUSE',
        'WORLD_HUMAN_STAND_IMPATIENT_FACILITY',
        'WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT',
        'WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT_FACILITY',
        'WORLD_HUMAN_STAND_MOBILE',
        'WORLD_HUMAN_STAND_MOBILE_CLUBHOUSE',
        'WORLD_HUMAN_STAND_MOBILE_FACILITY',
        'WORLD_HUMAN_STAND_MOBILE_UPRIGHT',
        'WORLD_HUMAN_STAND_MOBILE_UPRIGHT_CLUBHOUSE',
        'WORLD_HUMAN_STRIP_WATCH_STAND',
        'WORLD_HUMAN_STUPOR',
        'WORLD_HUMAN_STUPOR_CLUBHOUSE',
        'WORLD_HUMAN_SUNBATHE',
        'WORLD_HUMAN_SUNBATHE_BACK',
        'WORLD_HUMAN_SUPERHERO',
        'WORLD_HUMAN_SWIMMING',
        'WORLD_HUMAN_TENNIS_PLAYER',
        'WORLD_HUMAN_TOURIST_MAP',
        'WORLD_HUMAN_TOURIST_MOBILE',
        'WORLD_HUMAN_VEHICLE_MECHANIC',
        'WORLD_HUMAN_WELDING',
        'WORLD_HUMAN_WINDOW_SHOP_BROWSE',
        'WORLD_HUMAN_YOGA',
        'Walk',
        'Walk_Facility',
        'WORLD_BOAR_GRAZING',
        'WORLD_CAT_SLEEPING_GROUND',
        'WORLD_CAT_SLEEPING_LEDGE',
        'WORLD_COW_GRAZING',
        'WORLD_COYOTE_HOWL',
        'WORLD_COYOTE_REST',
        'WORLD_COYOTE_WANDER',
        'WORLD_COYOTE_WALK',
        'WORLD_CHICKENHAWK_FEEDING',
        'WORLD_CHICKENHAWK_STANDING',
        'WORLD_CORMORANT_STANDING',
        'WORLD_CROW_FEEDING',
        'WORLD_CROW_STANDING',
        'WORLD_DEER_GRAZING',
        'WORLD_DOG_BARKING_ROTTWEILER',
        'WORLD_DOG_BARKING_RETRIEVER',
        'WORLD_DOG_BARKING_SHEPHERD',
        'WORLD_DOG_SITTING_ROTTWEILER',
        'WORLD_DOG_SITTING_RETRIEVER',
        'WORLD_DOG_SITTING_SHEPHERD',
        'WORLD_DOG_BARKING_SMALL',
        'WORLD_DOG_SITTING_SMALL',
        'WORLD_DOLPHIN_SWIM',
        'WORLD_FISH_FLEE',
        'WORLD_FISH_IDLE',
        'WORLD_GULL_FEEDING',
        'WORLD_GULL_STANDING',
        'WORLD_HEN_FLEE',
        'WORLD_HEN_PECKING',
        'WORLD_HEN_STANDING',
        'WORLD_MOUNTAIN_LION_REST',
        'WORLD_MOUNTAIN_LION_WANDER',
        'WORLD_ORCA_SWIM',
        'WORLD_PIG_GRAZING',
        'WORLD_PIGEON_FEEDING',
        'WORLD_PIGEON_STANDING',
        'WORLD_RABBIT_EATING',
        'WORLD_RABBIT_FLEE',
        'WORLD_RATS_EATING',
        'WORLD_RATS_FLEEING',
        'WORLD_SHARK_SWIM',
        'WORLD_SHARK_HAMMERHEAD_SWIM',
        'WORLD_STINGRAY_SWIM',
        'WORLD_WHALE_SWIM',
        'DRIVE',
        'WORLD_VEHICLE_ATTRACTOR',
        'PARK_VEHICLE',
        'WORLD_VEHICLE_AMBULANCE',
        'WORLD_VEHICLE_BICYCLE_BMX',
        'WORLD_VEHICLE_BICYCLE_BMX_BALLAS',
        'WORLD_VEHICLE_BICYCLE_BMX_FAMILY',
        'WORLD_VEHICLE_BICYCLE_BMX_HARMONY',
        'WORLD_VEHICLE_BICYCLE_BMX_VAGOS',
        'WORLD_VEHICLE_BICYCLE_MOUNTAIN',
        'WORLD_VEHICLE_BICYCLE_ROAD',
        'WORLD_VEHICLE_BIKE_OFF_ROAD_RACE',
        'WORLD_VEHICLE_BIKER',
        'WORLD_VEHICLE_BOAT_IDLE',
        'WORLD_VEHICLE_BOAT_IDLE_ALAMO',
        'WORLD_VEHICLE_BOAT_IDLE_MARQUIS',
        'WORLD_VEHICLE_BROKEN_DOWN',
        'WORLD_VEHICLE_BUSINESSMEN',
        'WORLD_VEHICLE_HELI_LIFEGUARD',
        'WORLD_VEHICLE_CLUCKIN_BELL_TRAILER',
        'WORLD_VEHICLE_CONSTRUCTION_SOLO',
        'WORLD_VEHICLE_CONSTRUCTION_PASSENGERS',
        'WORLD_VEHICLE_DRIVE_PASSENGERS',
        'WORLD_VEHICLE_DRIVE_PASSENGERS_LIMITED',
        'WORLD_VEHICLE_DRIVE_SOLO',
        'WORLD_VEHICLE_FARM_WORKER',
        'WORLD_VEHICLE_FIRE_TRUCK',
        'WORLD_VEHICLE_EMPTY',
        'WORLD_VEHICLE_MARIACHI',
        'WORLD_VEHICLE_MECHANIC',
        'WORLD_VEHICLE_MILITARY_PLANES_BIG',
        'WORLD_VEHICLE_MILITARY_PLANES_SMALL',
        'WORLD_VEHICLE_PARK_PARALLEL',
        'WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN',
        'WORLD_VEHICLE_PASSENGER_EXIT',
        'WORLD_VEHICLE_POLICE_BIKE',
        'WORLD_VEHICLE_POLICE_CAR',
        'WORLD_VEHICLE_POLICE_NEXT_TO_CAR',
        'WORLD_VEHICLE_QUARRY',
        'WORLD_VEHICLE_SALTON',
        'WORLD_VEHICLE_SALTON_DIRT_BIKE',
        'WORLD_VEHICLE_SECURITY_CAR',
        'WORLD_VEHICLE_STREETRACE',
        'WORLD_VEHICLE_TOURBUS',
        'WORLD_VEHICLE_TOURIST',
        'WORLD_VEHICLE_TANDL',
        'WORLD_VEHICLE_TRACTOR',
        'WORLD_VEHICLE_TRACTOR_BEACH',
        'WORLD_VEHICLE_TRUCK_LOGS',
        'WORLD_VEHICLE_TRUCKS_TRAILERS',
        'PROP_BIRD_IN_TREE',
        'WORLD_VEHICLE_DISTANT_EMPTY_GROUND',
        'PROP_BIRD_TELEGRAPH_POLE',
        'PROP_HUMAN_ATM',
        'PROP_HUMAN_BBQ',
        'PROP_HUMAN_BUM_BIN',
        'PROP_HUMAN_BUM_SHOPPING_CART',
        'PROP_HUMAN_MUSCLE_CHIN_UPS',
        'PROP_HUMAN_MUSCLE_CHIN_UPS_ARMY',
        'PROP_HUMAN_MUSCLE_CHIN_UPS_PRISON',
        'PROP_HUMAN_PARKING_METER',
        'PROP_HUMAN_SEAT_ARMCHAIR',
        'PROP_HUMAN_SEAT_BAR',
        'PROP_HUMAN_SEAT_BENCH',
        'PROP_HUMAN_SEAT_BENCH_FACILITY',
        'PROP_HUMAN_SEAT_BENCH_DRINK',
        'PROP_HUMAN_SEAT_BENCH_DRINK_FACILITY',
        'PROP_HUMAN_SEAT_BENCH_DRINK_BEER',
        'PROP_HUMAN_SEAT_BENCH_FOOD',
        'PROP_HUMAN_SEAT_BENCH_FOOD_FACILITY',
        'PROP_HUMAN_SEAT_BUS_STOP_WAIT',
        'PROP_HUMAN_SEAT_CHAIR',
        'PROP_HUMAN_SEAT_CHAIR_DRINK',
        'PROP_HUMAN_SEAT_CHAIR_DRINK_BEER',
        'PROP_HUMAN_SEAT_CHAIR_FOOD',
        'PROP_HUMAN_SEAT_CHAIR_UPRIGHT',
        'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER',
        'PROP_HUMAN_SEAT_COMPUTER',
        'PROP_HUMAN_SEAT_COMPUTER_LOW',
        'PROP_HUMAN_SEAT_DECKCHAIR',
        'PROP_HUMAN_SEAT_DECKCHAIR_DRINK',
        'PROP_HUMAN_SEAT_MUSCLE_BENCH_PRESS',
        'PROP_HUMAN_SEAT_MUSCLE_BENCH_PRESS_PRISON',
        'PROP_HUMAN_SEAT_SEWING',
        'PROP_HUMAN_SEAT_STRIP_WATCH',
        'PROP_HUMAN_SEAT_SUNLOUNGER',
        'PROP_HUMAN_STAND_IMPATIENT',
        'CODE_HUMAN_COWER',
        'CODE_HUMAN_CROSS_ROAD_WAIT',
        'CODE_HUMAN_PARK_CAR',
        'PROP_HUMAN_MOVIE_BULB',
        'PROP_HUMAN_MOVIE_STUDIO_LIGHT',
        'CODE_HUMAN_MEDIC_KNEEL',
        'CODE_HUMAN_MEDIC_TEND_TO_DEAD',
        'CODE_HUMAN_MEDIC_TIME_OF_DEATH',
        'CODE_HUMAN_POLICE_CROWD_CONTROL',
        'CODE_HUMAN_POLICE_INVESTIGATE',
        'CHAINING_ENTRY',
        'CHAINING_EXIT',
        'CODE_HUMAN_STAND_COWER',
        'EAR_TO_TEXT',
        'EAR_TO_TEXT_FAT',
        'WORLD_LOOKAT_POINT'
    }
    for i, v in pairs(scenarios) do
        SetScenarioTypeEnabled(v, false)
    end
end

function TimedAnnounce()
    for _, message in pairs(CL.Announcements) do
        TriggerEvent(CL.AnnounceTrigger, CL.AnnounceTitle, message)
        Wait(CL.AnnounceInterval)
    end
end

if CL.UseTimedAnnounce then
    CreateThread(function()
        while true do
            TimedAnnounce()
        end
    end)
end

CreateThread(function()
    for i, enabled in pairs(CL.HudComponents) do
        if enabled then
            SetHudComponentPosition(i, 999999.0, 999999.0) end
    end
end)

if CL.HudColour then
    CreateThread(function()
        ReplaceHudColour(116, CL.Colour)
    end)
end
if CL.InfStamina then
    SetPlayerMaxStamina(PlayerId(), 10000000)
end

function InitialSetup()
    SetManualShutdownLoadingScreenNui(true)
    StartAudioScene("MP_LEADERBOARD_SCENE")
    SwitchOutPlayer(PlayerPedId(), 0, 1)
end

if CL.JoinTransition then
CreateThread(function()
    InitialSetup()
    
    while GetPlayerSwitchState() ~= 5 do
        Wait(0)
        SetCloudHatOpacity(0.01)
        HideHudAndRadarThisFrame()
    end
    
    ShutdownLoadingScreen()
    ShutdownLoadingScreenNui()
    
    Wait(0)
    DoScreenFadeIn(500)
    
    local timer = GetGameTimer()
    StartAudioScene("MP_LEADERBOARD_SCENE")
    
    while true do
        Wait(0)
        if GetGameTimer() - timer > 5000 then
            SwitchInPlayer(PlayerPedId())
            
            while GetPlayerSwitchState() ~= 12 do
                Wait(0)
            end
            break
        end
    end
end)
end