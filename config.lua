local Config = {}

local locale = GetConvar("holster:locale", "de")

Config.Locales = {
    de = {
        holsterMenuTitle = 'Holster auswählen',
        noHolster = 'Kein Holster',
        beltHolster = 'Gürtelholster',
        legHolster = 'Beinholster',
        shoulderHolster = 'Schulterholster',
        setHolster = 'Holster wurde gesetzt.'
    },
    en = {
        holsterMenuTitle = 'Select Holster',
        noHolster = 'No Holster',
        beltHolster = 'Belt Holster',
        legHolster = 'Leg Holster',
        shoulderHolster = 'Shoulder Holster',
        setHolster = 'Holster set successfully.'
    }
}

Config.Texts = Config.Locales[locale] or Config.Locales["de"]

Config.HolsterConfigs = {
    m = {
        [0] = { c = 8, d = 15,  t = 0 },
        [1] = { c = 8, d = 122, t = 0 },
        [2] = { c = 8, d = 123, t = 0 },
        [3] = { c = 8, d = 124, t = 0 }
    },
    f = {
        [0] = { c = 8, d = 15,  t = 0 },
        [1] = { c = 8, d = 125, t = 0 },
        [2] = { c = 8, d = 126, t = 0 },
        [3] = { c = 8, d = 127, t = 0 }
    }
}

return Config
