
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
ESX.RegisterUsableItem('duakitabi', function(source)
    TriggerClientEvent('dr:ShowCard2', source)
end)
