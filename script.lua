-- Web Site : https://dekondrops.blogspot.com/
-- Instagram : https://instagram.com/Dekonpriv/
-- YouTube : https://youtube.com/c/Dekonpriv/
-- Discord : https://discord.gg/f8K67FcFpa

local marker = createMarker(1517.126, -1475.947, 7.5, "cylinder", 3, 155, 255, 255, 50) -- cria o marker

function MensagemDesmanche(player)
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)),aclGetGroup("DESMANCHE")) then
		outputChatBox ("#FFFFFFPara desmanchar o veículo, mentalize #FF0000/desmanchar", player, 255, 0, 0, true)
		else
		outputChatBox ("#FF0000Permissão Negada!", player, 255, 0, 0, true)
		end
end
addEventHandler("onMarkerHit", marker, MensagemDesmanche)


addCommandHandler("desmanchar", 
    function(player)
       local vehicle =  getPedOccupiedVehicle(player)
	   local id = getElementModel(vehicle)
	   if vehicle and isElementWithinMarker(vehicle, marker) then 
			if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)),aclGetGroup("DESMANCHE")) then
			removePedFromVehicle(player)
			setElementPosition(player, 1517.126, -1475.947, 10.5)
			setElementPosition(vehicle, 1399.045, -2230.269, 13.800)
			local price = math.random(10000, 20000)
			givePlayerMoney(player, price)
			outputChatBox("Veiculo desmanchado, você ganhou #00ff00R$"..price.."", player, 255, 255, 255, true)
			setTimer(function ()
			setVehicleDoorState(vehicle, 0, 4)
			setVehicleDoorState(vehicle , 1, 4)
			setVehicleDoorState(vehicle, 2, 4)
			setVehicleDoorState(vehicle, 3, 4)
			setVehicleDoorState(vehicle, 4, 4)
			setVehicleDoorState(vehicle, 5, 4)
			setVehicleWheelStates(vehicle, 2, 2, 2, 2)
			setVehiclePanelState ( vehicle, 4, 3 )
			setVehicleLightState(vehicle, 0, 1)
			setVehicleLightState(vehicle, 1, 1)
			setVehicleLightState(vehicle, 2, 1)
			setVehicleLightState(vehicle, 3, 1)
			setElementHealth(vehicle, 350)
			end, 500, 1)
		else if vehicle and isElementWithinMarker(vehicle, marker) then
		outputChatBox("#FF0000Impossivel desmanchar!", player, 255, 255, 255, true)
		end
	   end 
	end
    end 
 )