ESX = nil

ESX = exports["es_extended"]:getSharedObject()


-- Erstelle eine allgemeine Funktion für das Hinzufügen von Munition zu einem bestimmten Munitionstyp
local function addAmmo(source, itemToRemove, itemToAdd, amountToAdd, notificationText)
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemCount = xPlayer.getInventoryItem(itemToRemove).count

    if itemCount >= 1 then
        xPlayer.removeInventoryItem(itemToRemove, 1)
        xPlayer.addInventoryItem(itemToAdd, amountToAdd)
        TriggerClientEvent('esx:showNotification', source, notificationText)
    else
        TriggerClientEvent('esx:showNotification', source, 'Du hast nicht genügend ' .. itemToRemove .. '.')
    end
end

-- Items 
ESX.RegisterUsableItem('ammo-9boxs', function(source)
    addAmmo(source, 'ammo-9boxs', 'ammo-9', 30, 'Du hast 30x 9mm Patronen erhalten.')
end)

ESX.RegisterUsableItem('ammo-9boxl', function(source)
    addAmmo(source, 'ammo-9boxl', 'ammo-9', 90, 'Du hast 90x 9mm Patronen erhalten.')
end)

ESX.RegisterUsableItem('ammo-45boxs', function(source)
    addAmmo(source, 'ammo-45boxs', 'ammo-45', 20, 'Du hast 20x .45 ACP Patronen erhalten.')
end)

ESX.RegisterUsableItem('ammo-45boxl', function(source)
    addAmmo(source, 'ammo-45boxl', 'ammo-45', 60, 'Du hast 60x .45 ACP Patronen erhalten.')
end)

ESX.RegisterUsableItem('ammo-riflebox', function(source)
    addAmmo(source, 'ammo-riflebox', 'ammo-rifle', 90, 'Du hast 90x 5.56x45 Patronen erhalten.')
end)

ESX.RegisterUsableItem('ammo-sniperbox', function(source)
    addAmmo(source, 'ammo-sniperbox', 'ammo-sniper', 12, 'Du hast 12x 7.62x51 Patronen erhalten.')
end)

-- Example 

-- ESX.RegisterUsableItem('example-item1', function(source)
--     addAmmo(source, 'example-item1', 'example-item', 1, 'Du hast 1x example-item erhalten.')
-- end)