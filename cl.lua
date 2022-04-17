ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_lipaspaketti:palkki')
AddEventHandler('esx_lipaspaketti:palkki', function()
	local playerPed = GetPlayerPed(-1)
	local ukko = PlayerPedId()
    	TaskStartScenarioInPlace(ukko, "PROP_HUMAN_BUM_BIN", 0, true)
	TriggerEvent("mythic_progbar:client:progress", {
        name = "lippaittenkerays",
        duration = 50000,
        label = "Avataan pakettia...",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
						
    }, function(canceled)
		if not canceled then
			ClearPedTasks(ukko)
			ESX.TriggerServerCallback('esx_lipaspaketti:onkopakettia', function(onkopakettia)
				if onkopakettia then
					TriggerServerEvent('esx_lipaspaketti:lippaattaskuun')
				else
					Citizen.Wait(100)
					ExecuteCommand('apua EXPLOITTASIN LIPASPAKETEILLA!!!')
				end
			end)
		else
			ClearPedTasks(ukko)
			exports['mythic_notify']:DoHudText('error', 'Keskeytit avaamisen.')
		end
	end)
end)
