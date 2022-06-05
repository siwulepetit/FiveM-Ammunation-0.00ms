 ESX = nil

 TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
 
 RegisterNetEvent('achatweapon')
 AddEventHandler('achatweapon', function(name, price, item)
     local xPlayer = ESX.GetPlayerFromId(source)
     local xMoney = xPlayer.getAccount('bank').money
     if xMoney >= price then
         xPlayer.removeAccountMoney('bank', price)
         if item then
             xPlayer.addInventoryItem(name, 1)
         else
             xPlayer.addWeapon(name, 1)
         end
         TriggerClientEvent('esx:showNotification', source, "Vous avez payé ~r~"..price.."$")
     else
         TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent")
     end
 end)
 