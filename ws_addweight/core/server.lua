ESX = nil
ESX = exports['es_extended']:getSharedObject()
my_old_bag = {}


for k,v in pairs(Config["weightitem"]) do
	ESX.RegisterUsableItem(k, function(source) 
		local xPlayer = ESX.GetPlayerFromId(source)
		if my_old_bag[source] == nil then
			my_old_bag[source] = xPlayer.maxWeight
			newWeight = v.weight+my_old_bag[source]
			xPlayer.setMaxWeight(newWeight)
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = 'เพิ่มน้ำหนักกระเป๋าของคุณเป็น '..newWeight,
				type = "error",
				timeout = 5000,
				layout = "bottomCenter",
				queue = "global"
			})
		else
			newWeight = my_old_bag[source]
			my_old_bag[source] = nil
			xPlayer.setMaxWeight(newWeight)
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = 'ถอดกระเป๋า น้ำหนักกระเป๋าของคุณเป็น '..newWeight,
				type = "error",
				timeout = 5000,
				layout = "bottomCenter",
				queue = "global"
			})
		end		
	end)
end