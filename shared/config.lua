Config = {}

Config.Armory = {
    Weapons = {
        { weapon = 'weapon_pistol', label = 'PD Pistol', },
        { weapon = 'weapon_stungun', label = 'Taser' },
        { weapon = 'weapon_nightstick', label = 'Baton' }
    },
    Shop = {
        { item = 'dutyblip', label = 'Duty Blip', max = 1 },
        { item = 'ammo-40', label = '.40 S&W', max = 200 },
        { item = 'handcuffs', label = 'Handcuffs', max = 2 },
        { item = 'megaphone', label = 'Megaphone', max = 1}, -- max is the amount you can get out at once and have on you at once
        { item = 'badge', label = 'Police Badge', max = 1 }
    },
    Armor = {
        { label = 'Stab Vest', amount = 50 }
    },
}


Config.SwatPassword = 'CHANGE_ME'
Config.Swat = {
    Weapons = {
        { weapon = 'weapon_carbinerifle', label = 'Carbine Rifle' },
    },
    Shop = {
        { item = 'ammo-rifle', label = '5.56x45', max = 400 },
        { item = 'armour', label = 'Body Armour', max = 2 }
    },
    Armor = {
        { label = 'Heavy Armour', amount = 100 }
    }
}

Config.Webhook = 'CHANGE_ME'

Config.Locations = {
    { location = vec3(451.97, -997.19, 29.71), type = 'armory', icon = 'fa-solid fa-gun', label = 'Open Armory' },
    { location = vec3(458.25, -997.07, 29.71), type = 'swat', icon = 'fa-solid fa-person-rifle', label = 'Open Swat Armory' }
}
