RegisterServerEvent("bilbutik:sellcar", function(pris, nummerplade)
    local src = source
    
    --Sikkerhedskontrol :)
    exports['ghmattimysql']:execute('SELECT * FROM bilbutik WHERE nummerplade = @nummerplade', {["@nummerplade"] = nummerplade}, function(result)
        if not result[1] then
            exports['ghmattimysql']:execute('INSERT INTO bilbutik (`nummerplade`, `pris`) VALUES (@nummerplade, @pris)', {
                ['nummerplade'] = nummerplade,
                ['pris'] = pris
            })
        end
    end)
end)

RegisterCommand("carlist", function(source)
    local src = source
    exports['ghmattimysql']:execute('SELECT * FROM bilbutik', {}, function(result)
        TriggerClientEvent("carlist", src, result)
    end)
end)

RegisterServerEvent("buyvehicle", function(nummerplade)
    local src = source
    exports['ghmattimysql']:execute('SELECT * FROM bilbutik WHERE nummerplade = @nummerplade', {["@nummerplade"] = nummerplade}, function(result)
        if result[1] then
            local nummerplade = result[1].nummerplade
            local pris = result[1].pris

            exports['ghmattimysql']:execute('DELETE FROM bilbutik WHERE nummerplade = @nummerplade AND pris = @pris', {['@nummerplade'] = nummerplade, ["@pris"] = pris})
        end
    end)
end)