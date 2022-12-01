RegisterCommand("sellcar", function(source, args, rawCommand)
    if args then
        if tonumber(args[1]) ~= nil then
            if IsPedInAnyVehicle(PlayerPedId(), true) then
                local vehicle = GetVehiclePedIsUsing(PlayerPedId(), false)
                local driver = GetPedInVehicleSeat(vehicle, -1)
                if driver == PlayerPedId() then
                    local pris = args[1]
                    local nummerplade = GetVehicleNumberPlateText(vehicle)

                    DeleteVehicle(vehicle)
                    TriggerServerEvent("bilbutik:sellcar", pris, nummerplade)
                end
            end
        end
    end
end, true)

RegisterNetEvent("carlist", function(result)
    print("NUMMERPLADE:              PRIS:")
    print("-------------------------------")
    print(result[1].nummerplade, "          ", result[1].pris)
end)

RegisterCommand("buycar", function(source, args, rawCommand)
    if args then
        local nummerplade = args[1]
        TriggerServerEvent("buyvehicle", nummerplade)
    end
end)
           