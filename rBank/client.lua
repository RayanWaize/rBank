ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

local PlayerMoney = 0

RegisterNetEvent("solde:argent")
AddEventHandler("solde:argent", function(money, cash)
    PlayerMoney = tonumber(money)
end)


Citizen.CreateThread(function()
    for i=1, #Config.position, 1 do
       local blip = AddBlipForCoord(Config.position[i].x, Config.position[i].y, Config.position[i].z)
       SetBlipSprite(blip, 207)
       SetBlipColour(blip, 69)
       SetBlipAsShortRange(blip, true)
       SetBlipScale(blip, 0.65)

       BeginTextCommandSetBlipName('STRING')
       AddTextComponentString("Banque")
       EndTextCommandSetBlipName(blip)
   end
end)



function MenuBanque()
	local Mbank = RageUI.CreateMenu("Banque", "Interagir avec votre banque")
    local MbankDepo = RageUI.CreateSubMenu(Mbank, "Banque", "Déposer de l'argent")
    local MbankReti = RageUI.CreateSubMenu(Mbank, "Banque", "Retirer de l'argent")
    Mbank:SetRectangleBanner(0, 0, 0, 0)
    MbankDepo:SetRectangleBanner(0, 255, 0, 255)
    MbankReti:SetRectangleBanner(255, 0, 0, 255)
        RageUI.Visible(Mbank, not RageUI.Visible(Mbank))
            while Mbank do
            Citizen.Wait(0)
            RageUI.IsVisible(Mbank, true, true, true, function()
                RageUI.Separator('~b~Bienvenue '..GetPlayerName(PlayerId()))
                RageUI.ButtonWithStyle("Déposer de l'argent", nil,  {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                end, MbankDepo)
                RageUI.ButtonWithStyle("Retirer de l'argent", nil,  {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                end, MbankReti)
                RageUI.Separator("~g~↓ Informations du Compte ↓")
                RageUI.ButtonWithStyle("Propriétaire du Compte : ", nil, {RightLabel = GetPlayerName(PlayerId())},true, function(Hovered, Active, Selected)
                    if (Selected) then   
                    end
                    end)
                RageUI.ButtonWithStyle("Solde du compte : ", nil, {RightLabel = PlayerMoney.." $"},true, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                    end)
                    
            end, function()
            end)
                RageUI.IsVisible(MbankDepo, true, true, true, function()
                    RageUI.ButtonWithStyle("Montant Personnalisé", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            saisiedepot()
                            Config.GetPlayerMoney()
                        end
                        end)

                    RageUI.Separator("↓ ~b~Montant Proposé ~w~↓")


                    RageUI.ButtonWithStyle("Déposer - 100", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:deposer', 100)
                            Config.GetPlayerMoney()
                        end
                    end)

                    RageUI.ButtonWithStyle("Déposer - 200", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:deposer', 200)
                            Config.GetPlayerMoney()
                        end
                    end)

                    RageUI.ButtonWithStyle("Déposer - 500", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:deposer', 500)
                            Config.GetPlayerMoney()
                        end
                        end)

                    end, function()
                 end)

                 RageUI.IsVisible(MbankReti, true, true, true, function()
                    RageUI.ButtonWithStyle("Montant Personnalisé", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            saisieretrait()
                            Config.GetPlayerMoney()
                        end
                        end)

                    RageUI.Separator("↓ ~b~Montant Proposé ~w~↓")


                    RageUI.ButtonWithStyle("Retirer - 100", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:retirer', 100)
                            Config.GetPlayerMoney()
                        end
                    end)

                    RageUI.ButtonWithStyle("Retirer - 200", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:retirer', 200)
                            Config.GetPlayerMoney()
                        end
                    end)

                    RageUI.ButtonWithStyle("Retirer - 500", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:retirer', 500)
                            Config.GetPlayerMoney()
                        end
                        end)

                end, function()
                end)
            if not RageUI.Visible(Mbank) and not RageUI.Visible(MbankDepo) and not RageUI.Visible(MbankReti) then
            Mbank = RMenu:DeleteType("Banque", true)
        end
    end
end


function MenuATM()
	local Mbank = RageUI.CreateMenu("ATM", "Interagir avec votre banque")
    local MbankDepo = RageUI.CreateSubMenu(Mbank, "ATM", "Déposer de l'argent")
    local MbankReti = RageUI.CreateSubMenu(Mbank, "ATM", "Retirer de l'argent")
    Mbank:SetRectangleBanner(0, 0, 0, 0)
    MbankDepo:SetRectangleBanner(0, 255, 0, 255)
    MbankReti:SetRectangleBanner(255, 0, 0, 255)
        RageUI.Visible(Mbank, not RageUI.Visible(Mbank))
            while Mbank do
            Citizen.Wait(0)
            RageUI.IsVisible(Mbank, true, true, true, function()
                RageUI.Separator('~b~Bienvenue '..GetPlayerName(PlayerId()))
                RageUI.ButtonWithStyle("Déposer de l'argent", nil,  {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                end, MbankDepo)
                RageUI.ButtonWithStyle("Retirer de l'argent", nil,  {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                end, MbankReti)
                RageUI.Separator("~g~↓ Informations du Compte ↓")
                RageUI.ButtonWithStyle("Propriétaire du Compte : ", nil, {RightLabel = GetPlayerName(PlayerId())},true, function(Hovered, Active, Selected)
                    if (Selected) then   
                    end
                    end)
                RageUI.ButtonWithStyle("Solde du compte : ", nil, {RightLabel = PlayerMoney.." $"},true, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                    end)
            end, function()
            end)
                RageUI.IsVisible(MbankDepo, true, true, true, function()
                    RageUI.ButtonWithStyle("Montant Personnalisé", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            saisiedepot()
                            Config.GetPlayerMoney()
                        end
                        end)

                    RageUI.Separator("↓ ~b~Montant Proposé ~w~↓")


                    RageUI.ButtonWithStyle("Déposer - 100", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:deposer', 100)
                            Config.GetPlayerMoney()
                        end
                    end)

                    RageUI.ButtonWithStyle("Déposer - 200", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:deposer', 200)
                            Config.GetPlayerMoney()
                        end
                    end)

                    RageUI.ButtonWithStyle("Déposer - 500", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:deposer', 500)
                            Config.GetPlayerMoney()
                        end
                        end)

                    end, function()
                 end)

                 RageUI.IsVisible(MbankReti, true, true, true, function()
                    RageUI.ButtonWithStyle("Montant Personnalisé", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            saisieretrait()
                            Config.GetPlayerMoney()
                        end
                        end)

                    RageUI.Separator("↓ ~b~Montant Proposé ~w~↓")


                    RageUI.ButtonWithStyle("Retirer - 100", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:retirer', 100)
                            Config.GetPlayerMoney()
                        end
                    end)

                    RageUI.ButtonWithStyle("Retirer - 200", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:retirer', 200)
                            Config.GetPlayerMoney()
                        end
                    end)

                    RageUI.ButtonWithStyle("Retirer - 500", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:retirer', 500)
                            Config.GetPlayerMoney()
                        end
                        end)

                end, function()
                end)
            if not RageUI.Visible(Mbank) and not RageUI.Visible(MbankDepo) and not RageUI.Visible(MbankReti) then
            Mbank = RMenu:DeleteType("ATM", true)
        end
    end
end


function saisieretrait()
    local amount = KeyboardInput("Retrait banque", "", 15)

    if amount ~= nil then
        amount = tonumber(amount)

        if type(amount) == 'number' then
            TriggerServerEvent('gBank:retirer', amount)
        else
            ESX.ShowNotification("Vous n'avez pas saisi un montant")
        end
    end
end

function saisiedepot()
    local amount = KeyboardInput("Dépot banque", "", 15)

    if amount ~= nil then
        amount = tonumber(amount)

        if type(amount) == 'number' then
            TriggerServerEvent('gBank:deposer', amount)
        else
            ESX.ShowNotification("Vous n'avez pas saisi un montant")
        end
    end
end


function playAnim(animDict, animName, duration)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
	TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
	RemoveAnimDict(animDict)
end

Citizen.CreateThread(function()
        while true do
            local Timer = 500
            for i=1, #Config.position, 1 do
            local plycrdjob = GetEntityCoords(GetPlayerPed(-1), false)
            local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, Config.position[i].x, Config.position[i].y, Config.position[i].z)
            if jobdist <= 10.0 and Config.jeveuxmarkerbanque then
                Timer = 0
                DrawMarker(Config.Type, Config.position[i].x, Config.position[i].y, Config.position[i].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
                end
                if jobdist <= 1.0 then
                    Timer = 0
                        RageUI.Text({ message = "Appuyez sur ~g~[E]~s~ pour parler avec le banquier", time_display = 1 })
                        if IsControlJustPressed(1,51) then
                            playAnim('mp_common', 'givetake1_a', 2500)
                            Citizen.Wait(2500)
                            Config.GetPlayerMoney()
                            MenuBanque()
        
                    end  
                end 
                end 
        Citizen.Wait(Timer)   
    end
end)


Citizen.CreateThread(function()
    while true do
        local Timer = 500
        for i=1, #Config.posatm, 1 do
        local plycrdjob = GetEntityCoords(GetPlayerPed(-1), false)
        local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, Config.posatm[i].x, Config.posatm[i].y, Config.posatm[i].z)
        if jobdist <= 10.0 and Config.jeveuxmarkeratm then
            Timer = 0
            DrawMarker(Config.Type, Config.posatm[i].x, Config.posatm[i].y, Config.posatm[i].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
            end
            if jobdist <= 1.0 then
                Timer = 0
                    RageUI.Text({ message = "Appuyez sur ~g~[E]~s~ pour accéder a l'ATM", time_display = 1 })
                    if IsControlJustPressed(1,51) then
                        playAnim('mp_common', 'givetake2_a', 2500)
                        Citizen.Wait(2500)
                        Config.GetPlayerMoney()
                        MenuATM()
                end  
            end 
            end 
    Citizen.Wait(Timer)   
end
end)

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)


    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Citizen.Wait(0)
    end
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult() 
        Citizen.Wait(500) 
        blockinput = false
        return result 
    else
        Citizen.Wait(500) 
        blockinput = false 
        return nil 
    end
end