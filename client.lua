

local displayx = false

function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end


RegisterNetEvent('dr:ShowCard2')
AddEventHandler('dr:ShowCard2', function()
  Citizen.CreateThread(function()
    local display = true
    local startTime = GetGameTimer()
    local delay = 120000

    TriggerEvent('vcard2:display', true)
    Anim()

    while display do
      Citizen.Wait(1)
      ShowInfo('Kapatmak için ~INPUT_CONTEXT~ tuşuna bas.', 0)
      if (GetTimeDifference(GetGameTimer(), startTime) > delay) then
        display = false
        TriggerEvent('vcard2:display', false)
      end
      if (IsControlJustPressed(1, 51)) then
        display = false
        TriggerEvent('vcard2:display', false)
        StopAnimTask(PlayerPedId(), 'amb@code_human_wander_clipboard@male@base', 'static', 1.0)
      end
    end
  end)
end)

--Citizen.CreateThread(function()
--
--  while true do
--    if displayx then
--        local startTime = GetGameTimer()
--        local delay = 120000
--    
--        TriggerEvent('vcard:display', true)
--        Anim()
--    
--        while displayx do
--          Citizen.Wait(1)
--          ShowInfo('Press ~INPUT_CONTEXT~ to put card away.', 0)
--          if (GetTimeDifference(GetGameTimer(), startTime) > delay) then
--            displayx = false
--            TriggerEvent('vcard:display', false)
--          end
--          if (IsControlJustPressed(1, 51)) then
--            displayx = false
--            TriggerEvent('vcard:display', false)
--            StopAnimTask(PlayerPedId(), 'amb@code_human_wander_clipboard@male@base', 'static', 1.0)
--          end
--        end
--    end
--    Citizen.Wait(200)
--  end
--end)

RegisterNetEvent('vcard2:display')
AddEventHandler('vcard2:display', function(value)
  SendNUIMessage({
    type = "vcard",
    display = value
  })
end)

function Anim()
  RequestAnimDict("amb@code_human_wander_clipboard@male@base")
  while not RequestAnimDict("amb@code_human_wander_clipboard@male@base") do
    Citizen.Wait(200)
  end
  TaskPlayAnim(PlayerPedId(),"amb@code_human_wander_clipboard@male@base", "static", 1.0,-1.0, 120000, 1, 1, true, true, true)
end


function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end