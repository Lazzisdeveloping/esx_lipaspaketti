ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('lipaspaketti', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_lipaspaketti:palkki', source)
end)

RegisterServerEvent('esx_lipaspaketti:lippaattaskuun')
AddEventHandler('esx_lipaspaketti:lippaattaskuun', function()
	local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem('lipaspaketti', 1)
		xPlayer.addInventoryItem('clip', 25)
end)

ESX.RegisterServerCallback('esx_lipaspaketti:onkopakettia', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
  
    if xPlayer.getInventoryItem('lipaspaketti').count >= 1 then
        cb(true)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'PELLE LOPPU SE EXPLOITTIEN KÄYTTÖ!'})
        cb(false)
    end
  
end)