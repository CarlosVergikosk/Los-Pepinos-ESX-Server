ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'RussianMafia', 'RussianMafia', 'society_RussianMafia', 'society_RussianMafia', 'society_RussianMafia', {type = 'public'})

RegisterServerEvent('esx_Russianjob:getStockItem')
AddEventHandler('esx_Russianjob:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_RussianMafia', function(inventory)
		local item = inventory.getItem(itemName)
		local sourceItem = xPlayer.getInventoryItem(itemName)

		-- is there enough in the society?
		if count > 0 and item.count >= count then
		
			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('player_cannot_hold'))
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn', count, item.label))
			end
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

RegisterServerEvent('esx_Russianjob:confiscatePlayerItem')
AddEventHandler('esx_Russianjob:confiscatePlayerItem', function(target, itemType, itemName, amount)

  local sourceXPlayer = ESX.GetPlayerFromId(source)
  local targetXPlayer = ESX.GetPlayerFromId(target)

  if itemType == 'item_standard' then

    local label = sourceXPlayer.getInventoryItem(itemName).label

    targetXPlayer.removeInventoryItem(itemName, amount)
    sourceXPlayer.addInventoryItem(itemName, amount)

    TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confinv') .. amount .. ' ' .. label .. _U('from') .. targetXPlayer.name)
    TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confinv') .. amount .. ' ' .. label )

  end

  if itemType == 'item_account' then

    targetXPlayer.removeAccountMoney(itemName, amount)
    sourceXPlayer.addAccountMoney(itemName, amount)

    TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confdm') .. amount .. _U('from') .. targetXPlayer.name)
    TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confdm') .. amount)

  end

  if itemType == 'item_weapon' then

    targetXPlayer.removeWeapon(itemName)
    sourceXPlayer.addWeapon(itemName, amount)

    TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confweapon') .. ESX.GetWeaponLabel(itemName) .. _U('from') .. targetXPlayer.name)
    TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confweapon') .. ESX.GetWeaponLabel(itemName))

  end

end)

RegisterServerEvent('esx_Russianjob:handcuff')
AddEventHandler('esx_Russianjob:handcuff', function(target)
  TriggerClientEvent('esx_Russianjob:handcuff', target)
end)

RegisterServerEvent('esx_Russianjob:drag')
AddEventHandler('esx_Russianjob:drag', function(target)
  local _source = source
  TriggerClientEvent('esx_Russianjob:drag', target, _source)
end)

RegisterServerEvent('esx_Russianjob:putInVehicle')
AddEventHandler('esx_Russianjob:putInVehicle', function(target)
  TriggerClientEvent('esx_Russianjob:putInVehicle', target)
end)

RegisterServerEvent('esx_Russianjob:OutVehicle')
AddEventHandler('esx_Russianjob:OutVehicle', function(target)
    TriggerClientEvent('esx_Russianjob:OutVehicle', target)
end)

RegisterServerEvent('esx_Russianjob:getStockItem')
AddEventHandler('esx_Russianjob:getStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_RussianMafia', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn') .. count .. ' ' .. item.label)

  end)

end)

RegisterServerEvent('esx_Russianjob:putStockItems')
AddEventHandler('esx_Russianjob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_RussianMafia', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= 0 then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('added') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('esx_Russianjob:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_RussianMafia', function(inventory)
    cb(inventory.items)
  end)

end)

ESX.RegisterServerCallback('esx_Russianjob:getPlayerInventory', function(source, cb)

  local xPlayer = ESX.GetPlayerFromId(source)
  local items   = xPlayer.inventory

  cb({
    items = items
  })

end)
