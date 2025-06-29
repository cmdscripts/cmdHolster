local Config = require 'config'
local currentHolster = 0
local previewCam = nil

local function sex()
    return (GetEntityModel(PlayerPedId()) == `mp_f_freemode_01`) and 'f' or 'm'
end

local function applyHolster(id)
    local cfg = Config.HolsterConfigs[sex()][id]
    if cfg then
        SetPedComponentVariation(PlayerPedId(), cfg.c, cfg.d, cfg.t, 0)
    end
end

local function focusCam(state)
    if state and not previewCam then
        local ped = PlayerPedId()
        local o = GetOffsetFromEntityInWorldCoords(ped, 1.0, 1.5, 0.7)
        previewCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        SetCamCoord(previewCam, o.x, o.y, o.z)
        PointCamAtEntity(previewCam, ped, 0.0, 0.0, 0.65, true)
        SetCamFov(previewCam, 50.0)
        RenderScriptCams(true, true, 500, true, true)
    elseif not state and previewCam then
        RenderScriptCams(false, true, 500, true, true)
        DestroyCam(previewCam, false)
        previewCam = nil
    end
end

RegisterCommand(Config.Commands.holster, function()
    focusCam(true)

    local options = {
        { label = Config.Texts.noHolster,       value = 0 },
        { label = Config.Texts.beltHolster,     value = 1 },
        { label = Config.Texts.legHolster,      value = 2 },
        { label = Config.Texts.shoulderHolster, value = 3 }
    }

    local dialog = lib.inputDialog(Config.Texts.holsterMenuTitle, {
        { type = 'select', label = 'Holster', options = options, format = 'label' }
    })

    if dialog and dialog[1] then
        currentHolster = dialog[1]
        TriggerServerEvent('holster:setHolster', currentHolster)
        applyHolster(currentHolster)
        Config.Notify(Config.Texts.setHolster)
    end

    focusCam(false)
end, false)

RegisterCommand(Config.Commands.debug, function()
    local ped = PlayerPedId()
    print('----------------------------------')

    local components = {
        [0] = 'Face',
        [1] = 'Mask',
        [2] = 'Hair',
        [3] = 'Torso',
        [4] = 'Legs',
        [5] = 'Bag',
        [6] = 'Shoes',
        [7] = 'Accessories',
        [8] = 'Undershirt',
        [9] = 'Vest / Armor',
        [10] = 'Decals',
        [11] = 'T-Shirt',
        [12] = 'Body Skin'
    }

    for i = 0, 12 do
        local drawable = GetPedDrawableVariation(ped, i)
        local texture  = GetPedTextureVariation(ped, i)
        local compName = components[i] or ('Component ' .. i)
        print(('Slot %02d (%s): Drawable %d, Texture %d'):format(i, compName, drawable, texture))
    end

    print('----------------------------------')
end, false)

CreateThread(function()
    while not LocalPlayer.state.spawned do Wait(100) end
    local holsterId = lib.callback.await('holster:getHolster', false)
    applyHolster(holsterId)
end)
