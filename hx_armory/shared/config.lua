Config = {}

Config.Armory = {
    Weapons = {
        { weapon = 'weapon_glock22', label = 'Glock 22', },
        { weapon = 'weapon_stungun', label = 'Taser' },
        { weapon = 'weapon_nightstick', label = 'Baton' }
    },
    Shop = {
        { item = 'dutyblip', label = 'Duty Blip', max = 1 },
        { item = 'ammo-40', label = '.40 S&W', max = 200 },
        { item = 'prison_mdt', label = 'Prison Tablet', max = 1 },
        { item = 'panicbutton', label = 'Panic Button', max = 1 },
        { item = 'handcuffs', label = 'Handcuffs', max = 2 },
        { item = 'spikestrips', label = 'Spikestrips', max = 2 },
        { item = 'megaphone', label = 'Megaphone', max = 1},
        { item = 'wheelclamp', label = 'Wheelclamp', max = 2 },
        { item = 'badge', label = 'Police Badge', max = 1 }
    },
    Armor = {
        { label = 'Stab Vest', amount = 50 }
    },
}


Config.SwatPassword = 'lingalonga'
Config.Swat = {
    Weapons = {
        { weapon = 'weapon_hk416', label = 'HK416 Rifle' },
        { weapon = 'weapon_scarh', label = 'PD Scar' },
        { weapon = 'weapon_dd16_b', label = 'DD16 Rifle' }
    },
    Shop = {
        { item = 'ammo-rifle', label = '5.56x45', max = 400 },
        { item = 'armour', label = 'Body Armour', max = 2 }
    },
    Armor = {
        { label = 'Heavy Armour', amount = 100 }
    }
}

Config.Webhook = 'https://discordapp.com/api/webhooks/1238036056608079894/WpgEhPR_RYDZL3il13902kSvyZi3OH4jgtgAfsPj6guxL_-izBw9QXBJkpjinVBvv68w'

Config.Locations = {
    { location = vec3(451.97, -997.19, 29.71), type = 'armory', icon = 'fa-solid fa-gun', label = 'Open Armory' },
    { location = vec3(458.25, -997.07, 29.71), type = 'swat', icon = 'fa-solid fa-person-rifle', label = 'Open Swat Armory' }
}