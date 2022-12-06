---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 

----------- turn on the bar ------
function EnableResouresIMAP()            
    --[[ 
 
        RemoveImap(-1106517275) -- West Elizabeth -- Strawberry -- General Store -- Help Wanted Sign 

    if Config.Unknow == true then
        RequestImap(_________________) -- Something relating to BizTemplate
    end     
    --]] 
end

function EnableResouresINTERIORS(x, y, z)     
    --[[
	ActivateInteriorEntitySets(21506, "Strawberry general store", {
		"_p_apple01x_dressing",
		"_p_apple01x_group",
		"_p_carrots_01x_dressing",
		"_p_carrots_01x_group",
		"_p_cigar02x_dressing",
		"_p_cigar02x_group",
		"_p_cigarettebox01x_dressing",
		"_p_cigarettebox01x_group",
		"_p_int_fishing01_dressing",
		"_p_tin_pomade01x_dressing",
		"_p_tin_pomade01x_group",
		"_p_tin_soap01x_dressing",
		"_p_tin_soap01x_group",
		"_saltedmeats_dressing",
		"_s_biscuits01x_dressing",
		"_s_biscuits01x_group",
		"_s_canBeans01x_dressing",
		"_s_canBeans01x_group",
		"_s_canCorn01x_dressing",
		"_s_canCorn01x_group",
		"_s_canPeaches01x_dressing",
		"_s_canPeaches01x_group",
		"_s_canPeas01x_dressing",
		"_s_canPeas01x_group",
		"_s_coffeeTin01x_dressing",
		"_s_coffeeTin01x_group",
		"_s_crackers01x_dressing",
		"_s_crackers01x_group",
		"_s_cricketTin01x_dressing",
		"_s_cricketTin01x_group",
		"_s_inv_baitHerb01x_dressing",
		"_s_inv_baitherb01x_group",
		"_s_inv_baitMeat01x_dressing",
		"_s_inv_baitmeat01x_group",
		"_s_inv_gin01x_dressing",
		"_s_inv_gin01x_group",
		"_s_inv_horsePills01x_dressing",
		"_s_inv_horsePills01x_group",
		"_s_inv_pocketwatch04x_dressing",
		"_s_inv_pocketWatch04x_group",
		"_s_inv_tabacco01x_dressing",
		"_s_inv_tabacco01x_group",
		"_s_inv_whiskey01x_dressing",
		"_s_inv_whiskey01x_group",
		"_s_oatcakes01x_dressing",
		"_s_oatcakes01x_group",
		"_s_saltedbeef01x_group",
		"_s_saltedbeef02x_group",
		"_s_wormCan01x_dressing",
		"_s_wormcan01x_group"
	})



    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "_________________")       
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "_________________")         
    end   
    --]]
end

-- currently there are two hitching posts. 

----------- turn off the bar ------
function DisableResourcesIMAPS() 
    --[[
    RemoveImap(6666_________________17953) -- Something relating to BizTemplate  
    --]]  
end

function DisableResourcesINTERIORS(x, y, z)  
    --[[
    local interior = GetInteriorAtCoords(x, y, z)    
    DeactivateInteriorEntitySet(interior, "_________________")     
    DeactivateInteriorEntitySet(interior, "_________________")  
    --]]       
end    
 
 
-----------------------------------------------------
---remove all on resource stop---
-----------------------------------------------------
AddEventHandler('onResourceStop', function(resource) 
    if resource == GetCurrentResourceName() then     
        -- when resource stops disable them, admin is restarting the script
        DisableResourcesIMAPS() 
        DisableResourcesINTERIORS(Config.x, Config.y, Config.z)
    end
end)

-----------------------------------------------------
--- clear all on resource start ---
-----------------------------------------------------
AddEventHandler('onResourceStart', function(resource) 
    if resource == GetCurrentResourceName() then         
        Citizen.Wait(3000)
        -- interiors loads all of these, so we need to disable them 
        DisableResourcesIMAPS() 
        DisableResourcesINTERIORS(Config.x, Config.y, Config.z)
        Citizen.Wait(3000)        
        -- because the character is already logged in on resource "re"start
        character_selected = true
    end
end)
 

-----------------------------------------------------
-- Trigger when character is selected
-----------------------------------------------------
RegisterNetEvent("vorp:SelectedCharacter") -- NPC loads after selecting character
AddEventHandler("vorp:SelectedCharacter", function(charid) 
	character_selected = true
end)
  
-----------------------------------------------------
-- Main thread that controls the script
-----------------------------------------------------
Citizen.CreateThread(function()
    while character_selected == false do 
        Citizen.Wait(1000)
    end 
    if character_selected == true and interiorsActive == false then 
        --- cleanup any previous scripts loading content
        DisableResourcesIMAPS() 
        DisableResourcesINTERIORS(Config.x, Config.y, Config.z)

        -- basically run once after character has loadded in  
        EnableResouresIMAP() 
        EnableResouresINTERIORS(Config.x, Config.y, Config.z)
        interiorsActive = true
        unlockDoors()  
    end
end)

 