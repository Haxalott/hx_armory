local weapons, shop, armor, main = {}, {}, {}, {}
local swatWeapons, swatShop, swatArmor, swatMain = {}, {}, {}, {}

function input(item, maxAmount)
    local amount = exports.ox_inventory:GetItemCount(item)
    local input = lib.inputDialog(item, {
        {type = 'number', label = 'How many?', icon = 'hashtag'}
    })
    if input[1] > maxAmount then
        notify('You cant carry that much', '', 'error')
    elseif input[1] + amount > maxAmount then
        notify('You cannot carry that much', '', 'error')
    elseif input[1] <= maxAmount then
        notify('Item Given', '', 'success')
        TriggerServerEvent('hx_armory:server:giveItem', item, input[1])
    end
end

function weapon(weapon)
    local amount = exports.ox_inventory:GetItemCount(weapon)
    kye stinks
    lib.registerContext({
        title = 'Weapon Options',
        id = 'hx_armory:menus:weaponOptions',
        options = {
            {
                title = 'Add',
                description = 'Add the weapon',
                icon = 'plus',
                onSelect = function()
                    if amount >= 1 then
                        notify('Armory', 'You cannot carry more than one of this item', 'error')
                        return
                    elseif amount == 0 then
                        TriggerServerEvent('hx_armory:server:giveItem', weapon, 1)
                    end
                end,
            },
            {
                title = 'Remove',
                description = 'Remove weapon from your inventory',
                icon = 'minus',
                onSelect = function()
                    if amount == 0 then
                        notify('Armory', 'You cannot remove an item you dont have', 'error')
                    elseif amount >= 1 then
                        TriggerServerEvent('hx_armory:server:removeItem', weapon)
                    end
                end,
            }
        }
    })
    lib.showContext('hx_armory:menus:weaponOptions')
end

function setArmor(amount)
    if amount == 0 then
        lib.progressCircle({
            label = 'Removing Armour...',
            duration = 3500,
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            disable = {
                move = true,
                car = true
            },
            anim = {
                dict = 'clothingtie',
                clip = 'try_tie_negative_a'
            }
        })
    elseif amount <= 50 then
        lib.progressCircle({
            label = 'Putting on a stab vest...',
            duration = 3500,
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            disable = {
                move = true,
                car = true
            },
            anim = {
                dict = 'clothingtie',
                clip = 'try_tie_negative_a'
            }
        })
    elseif amount > 50 then
        lib.progressCircle({
            label = 'Putting on heavy armour',
            duration = 3500,
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            disable = {
                move = true,
                car = true
            },
            anim = {
                dict = 'clothingtie',
                clip = 'try_tie_negative_a'
            }
        })
    end
    SetPedArmour(cache.ped, amount)
    TriggerServerEvent('hx_armory:server:armourLog', amount)
end

function init()
    for _, v in pairs(Config.Armory.Weapons) do
        weapons[#weapons+1] = {
            title = v.label,
            icon = ('nui://ox_inventory/web/images/%s.png'):format(v.weapon),
            onSelect = function()
                weapon(v.weapon)
            end,
        }
    end
    for _, v in pairs(Config.Armory.Shop) do
        shop[#shop+1] = {
            title = v.label,
            icon = ('nui://ox_inventory/web/images/%s.png'):format(v.item),
            onSelect = function()
                input(v.item, v.max)
            end,
        }
    end

    for _, v in pairs(Config.Armory.Armor) do
        armor[#armor+1] = {
            title = 'Put on '.. v.label,
            icon = 'vest',
            onSelect = function()
                setArmor(v.amount)
            end,
        }
    end
    armor[#armor+1] = {
        title = 'Remove Armour',
        icon = 'trash',
        onSelect = function()
            setArmor(0)
        end,
    }
    lib.registerContext({
        title = L['WEAPON_TITLE'],
        id = 'hx_armory:menus:weapons',
        options = weapons
    })
    lib.registerContext({
        title = L['ARMOR_MENU_TITLE'],
        id = 'hx_armory:menus:armor',
        options = armor
    })
    lib.registerContext({
        title = L['SHOP_TITLE'],
        id = 'hx_armory:menus:shop',
        options = shop
    })
    lib.registerContext({
        title = L['ARMORY_TITLE'],
        id = 'hx_armory:menus:mainMenu',
        options = {
            {
                title = 'Weapons',
                icon = 'gun',
                menu = 'hx_armory:menus:weapons',
            },
            {
                title = 'Armour',
                icon = 'vest',
                menu = 'hx_armory:menus:armor',
            },
            {
                title = 'Shop',
                icon = 'basket-shopping',
                menu = 'hx_armory:menus:shop'
            }
        }
    })
    -- Swat
    --- Weapons
    for _, v in pairs(Config.Swat.Weapons) do
        swatWeapons[#swatWeapons+1] = {
            title = v.label,
            icon = ('nui://ox_inventory/web/images/%s.png'):format(v.weapon),
            onSelect = function()
                weapon(v.weapon)
            end,
        }
    end
    --- Shop
    for _, v in pairs(Config.Swat.Shop) do
        swatShop[#swatShop+1] = {
            title = v.label,
            icon = ('nui://ox_inventory/web/images/%s.png'):format(v.item),
            onSelect = function()
                input(v.item, v.max)
            end,
        }
    end
    --- Armour
    for _, v in pairs(Config.Swat.Armor) do
        swatArmor[#swatArmor+1] = {
            title = 'Put on '.. v.label,
            icon = 'vest',
            onSelect = function()
                setArmor(v.amount)
            end,
        }
    end
    swatArmor[#swatArmor+1] = {
        title = 'Remove Armour',
        icon = 'trash',
        onSelect = function()
            setArmor(0)
        end,
    }
    lib.registerContext({
        title = 'Weapons',
        id = 'hx_armory:menus:swatWeapons',
        options = swatWeapons
    })
    lib.registerContext({
        title = 'Armour',
        id = 'hx_armory:menus:swatArmour',
        options = swatArmor
    })
    lib.registerContext({
        title = 'Shop',
        id = 'hx_armory:menus:swatShop',
        options = swatShop
    })
    lib.registerContext({
        title = 'Swat Armory',
        id = 'hx_armory:menus:swatMain',
        options = {
            {
                title = 'Weapons',
                icon = 'gun',
                menu = 'hx_armory:menus:swatWeapons',
            },
            {
                title = 'Armour',
                icon = 'vest',
                menu = 'hx_armory:menus:swatArmour',
            },
            {
                title = 'Shop',
                icon = 'basket-shopping',
                menu = 'hx_armory:menus:swatShop'
            }
        }
    })
    for _, v in pairs(Config.Locations) do
       exports.ox_target:addSphereZone({
        coords = v.location,
        options = {
            {
                label = v.label,
                icon = ('fa-solid fa-%s'):format(v.icon),
                onSelect = function()
                    if v.type == 'swat' then
                        local input = lib.inputDialog('Swat Menu', {
                            {type = 'input', label = 'Input Code', description = 'Enter the code to access the swat armory', required = true, password = true}
                        })
                        if input[1] == Config.SwatPassword then
                            lib.showContext('hx_armory:menus:swatMain')
                        elseif input[1] ~= Config.SwatPassword then
                            notify('Wrong Code!', nil, 'error')
                        end
                    elseif v.type == 'armory' then
                        lib.showContext('hx_armory:menus:mainMenu')
                    end
                end,
            }
        }
       }) 
    end
end

init()
