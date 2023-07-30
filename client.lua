CreateThread(function()
    while true do
        local sleep = 200
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for k, v in pairs(Config.Teleporters) do
            local enter, exit, marker, neededJob = v.enter, v.exit, v.marker, v.jobs
            local distEnter = #(playerCoords - enter.coords)

            if distEnter <= marker.distance then
                sleep = 0

                if not neededJob.enable or (neededJob.enable and Table_Contains(neededJob.jobs, ESX.PlayerData.job.name)) then
                    DrawM(marker, enter.information, enter.coords)

                    if distEnter <= 1.2 then
                        if IsControlJustPressed(0, 38) then
                            teleport(v, 'enter')
                        end
                    end
                end
            end

            local distExit = #(playerCoords - exit.coords)

            if distExit <= marker.distance then
                sleep = 0

                if not neededJob.enable or (neededJob.enable and Table_Contains(neededJob.jobs, ESX.PlayerData.job.name)) then
                    DrawM(marker, exit.information, exit.coords)

                    if distExit <= 1.2 then
                        if IsControlJustPressed(0, 38) then
                            teleport(v, 'exit')
                        end
                    end
                end
            end
        end

        Wait(sleep)
    end
end)

teleport = function(location, action)
    local canTeleport, isInVehicle = false, false
    local playerPed = PlayerPedId()

    if IsPedInAnyVehicle(playerPed, 0) then
        local vehicle = GetVehiclePedIsIn(playerPed, 0)

        if GetPedInVehicleSeat(vehicle, -1) == playerPed then 
            isInVehicle = vehicle
            canTeleport = true 
        end
    else
        canTeleport = true
    end

    if not canTeleport then return end

    DoScreenFadeOut(100)
    Wait(750)

    local loc = nil
    if action == 'enter' then
        loc = location.exit
    elseif action == 'exit' then
        loc = location.enter
    end

    if isInVehicle then 
        ESX.Game.Teleport(isInVehicle, {x = loc.coords.x, y = loc.coords.y, z = loc.coords.z, heading = loc.heading})
    else
        ESX.Game.Teleport(playerPed, {x = loc.coords.x, y = loc.coords.y, z = loc.coords.z, heading = loc.heading})
    end

    DoScreenFadeIn(100)
end

DrawM = function(marker, text, coords)
    if text.enable then ESX.Game.Utils.DrawText3D(coords, text.text, text.size) end
	if marker.enable then DrawMarker(marker.type, coords.x, coords.y, coords.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, marker.size.a, marker.size.b, marker.size.c, marker.color.a, marker.color.b, marker.color.c, 100, false, true, 0, false) end
end

Table_Contains = function(table, value)
    for k, v in pairs(table) do
        if v == value then
            return true
        end
    end
    return false
end