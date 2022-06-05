 Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5000)
    end
end)

local mainMenu = RageUI.CreateMenu("", "Ammunation", "300", "50")
local open = false

mainMenu.Closed = function() open = false end 

function menuamunation()
    if not open then open = true RageUI.Visible(mainMenu, true)
        Citizen.CreateThread(function()
            while open do 
                RageUI.IsVisible(mainMenu, function()
                    for k,v in pairs(Config.Market.List) do
                        RageUI.Button(v.label, "Payment par banque", {RightLabel = "~g~"..v.price.."$"}, true, {
                            onSelected = function()
                                name = v.name
                                price = v.price
                                item = v.item
                                TriggerServerEvent('achatweapon', name, price, item)
                            end
                        })
                    end
                end)
            Wait(0)
            end
        end)
    end
end

Citizen.CreateThread(function()
    while true do
        local wait = 900
        for k,v in pairs(Config.Market.Ped.Pos) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.x, v.y, v.z)
            if dist <= 2.1 then
                wait = 1
                ESX.ShowHelpNotification("Appuyer sur ~INPUT_CONTEXT~ pour ouvrir l' ~p~ Ammunation")
                if IsControlJustPressed(1,51) then menuamunation() end
            end 
        end
    Citizen.Wait(wait)
    end
end)

Citizen.CreateThread(function()
    for k,v in pairs(Config.Market.Ped.Pos) do
        local hash = GetHashKey(Config.Market.Ped.Type)
        while not HasModelLoaded(hash) do RequestModel(hash) Wait(20) end
        local ped = CreatePed("PED_TYPE_CIVFEMALE", Config.Market.Ped.Type, v.x, v.y, v.z, v.h, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
    end
end)



Citizen.CreateThread(function()
    for k, v in pairs(Config.Market.Ped.Pos) do
        local blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(blip, 110)
        SetBlipScale (blip, 1.0)
        SetBlipColour(blip, 1)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName('Ammunation')
        EndTextCommandSetBlipName(blip)
    end
end)  

------------------------------------ammu chargeur







function menuamunationchargeur()
    if not open then open = true RageUI.Visible(mainMenu, true)
        Citizen.CreateThread(function()
            while open do 
                RageUI.IsVisible(mainMenu, function()
                    for k,v in pairs(Config.Market1.List1) do
                        RageUI.Button(v.label, "Payment par banque", {RightLabel = "~g~"..v.price.."$"}, true, {
                            onSelected = function()
                                name = v.name
                                price = v.price
                                item = v.item
                                TriggerServerEvent('achatweapon', name, price, item)
                            end
                        })
                    end
                end)
            Wait(0)
            end
        end)
    end
end


Citizen.CreateThread(function()
    while true do
        local wait = 900
        for k,v in pairs(Config.Market1.Ped1.Pos1) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.x, v.y, v.z)
            if dist <= 2.1 then
                wait = 1
                ESX.ShowHelpNotification("Appuyer sur ~INPUT_CONTEXT~ pour ouvrir l' ~p~Ammunation")
                if IsControlJustPressed(1,51) then menuamunationchargeur() end
            end 
        end
    Citizen.Wait(wait)
    end
end)


Citizen.CreateThread(function()
    for k,v in pairs(Config.Market1.Ped1.Pos1) do
        local hash = GetHashKey(Config.Market1.Ped1.Type1)
        while not HasModelLoaded(hash) do RequestModel(hash) Wait(20) end
        local ped = CreatePed("PED_TYPE_CIVFEMALE", Config.Market.Ped.Type, v.x, v.y, v.z, v.h, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
    end
end)


