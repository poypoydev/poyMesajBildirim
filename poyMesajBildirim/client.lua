local QBCore = exports['qb-core']:GetCoreObject()
local wantstosee = true
local opened = false
RegisterCommand('mesajkapat', function()
    if wantstosee == true then
        wantstosee = false
        SendNUIMessage({
            type = 'close',
        })
    end

end)

RegisterNUICallback('open', function(cb)
    local amount = exports['qb-phone']:getAmount();
    cb(amount)

end)

RegisterCommand('mesajac', function()
    wantstosee = true
    opened = true
    SendNUIMessage({
        type = 'open',
    })

end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if wantstosee then
            local tutar = exports['qb-phone']:getAmount();
            if tutar > 0 then
                if not opened then
                    SendNUIMessage({
                        type = 'open',
                    })
                    opened = true
                end
                SendNUIMessage({
                    type = 'update',
                    amount = 'amount'
                })
            end
        end
    end
            

end)