---------- Manual definitions ---  
local interiorsActive = false
local character_selected = false 

----------- turn on the bar ------
function EnableResouresYMAPS()            
    --[[ 
        RemoveImap(-134556459) -- West Elizabeth -- Strawberry -- Doctors House -- Locked Door (No Interior) -1799 -428 158
        RemoveImap(270920361) -- West Elizabeth -- Strawberry -- Doctors House -- Crates on Porch 
        RemoveImap(131323483) -- West Elizabeth -- Strawberry -- Doctors House -- Interior and Unlocked Front Door
 
    if Config.Unknow == true then
        RequestImap(_________________) -- Something relating to BizTemplate
    end     
    --]] 
end

function EnableResouresINTERIORS(x, y, z)     
    --[[
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "_________________")       ")
    if Config.Unknow == true then  
        ActivateInteriorEntitySet(interior, "_________________")         
    end   
    --]]    
    local interior = GetInteriorAtCoords(x, y, z) 
    ActivateInteriorEntitySet(interior, "str_whr_taxidermys_02")
    ActivateInteriorEntitySet(interior, "str_whr_lightbox005")
    ActivateInteriorEntitySet(interior, "str_whr_lightbox004")
    ActivateInteriorEntitySet(interior, "str_whr_lightbox003")
    ActivateInteriorEntitySet(interior, "str_whr_lightbox002")
    ActivateInteriorEntitySet(interior, "str_whr_lightbox001")
    ActivateInteriorEntitySet(interior, "str_whr_int_shadow_proxy")
    ActivateInteriorEntitySet(interior, "str_whr_int_ref_proxy_a")
    ActivateInteriorEntitySet(interior, "str_whr_int_decals5")
    ActivateInteriorEntitySet(interior, "str_whr_int_decals4")
    ActivateInteriorEntitySet(interior, "str_whr_int_decals3")
    ActivateInteriorEntitySet(interior, "str_whr_int_decals2") 
    ActivateInteriorEntitySet(interior, "str_whr_int_decals1") 
    ActivateInteriorEntitySet(interior, "str_whr_bedroom2_trim") 
    ActivateInteriorEntitySet(interior, "str_whr_bedroom2_mirror")
    ActivateInteriorEntitySet(interior, "str_whr_bedroom1_trim")
    ActivateInteriorEntitySet(interior, "str_whr_bath_wins")  
    ActivateInteriorEntitySet(interior, "str_whore_int_ref_proxy_e")
    ActivateInteriorEntitySet(interior, "str_whore_int_ref_proxy_d")
    ActivateInteriorEntitySet(interior, "str_whore_int_ref_proxy_b") 
    ActivateInteriorEntitySet(interior, "str_whore_bdrm1_bits") 
    ActivateInteriorEntitySet(interior, "str_bedroom_mirror")
    ActivateInteriorEntitySet(interior, "str_04_whr_shell")
    ActivateInteriorEntitySet(interior, "str_04_main_detail")
    ActivateInteriorEntitySet(interior, "str_04_mainroom")  
    ActivateInteriorEntitySet(interior, "strw_whr_bath_details")
    ActivateInteriorEntitySet(interior, "strw_whr_bannister")  

end

-- currently there are two hitching posts. 

----------- turn off the bar ------
function DisableResourcesYMAPS() 
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

    DeactivateInteriorEntitySet(interior, "str_whr_taxidermys_02")
    DeactivateInteriorEntitySet(interior, "str_whr_lightbox005")
    DeactivateInteriorEntitySet(interior, "str_whr_lightbox004")
    DeactivateInteriorEntitySet(interior, "str_whr_lightbox003")
    DeactivateInteriorEntitySet(interior, "str_whr_lightbox002")
    DeactivateInteriorEntitySet(interior, "str_whr_lightbox001")
    DeactivateInteriorEntitySet(interior, "str_whr_int_shadow_proxy")
    DeactivateInteriorEntitySet(interior, "str_whr_int_ref_proxy_a")
    DeactivateInteriorEntitySet(interior, "str_whr_int_decals5")
    DeactivateInteriorEntitySet(interior, "str_whr_int_decals4")
    DeactivateInteriorEntitySet(interior, "str_whr_int_decals3")
    DeactivateInteriorEntitySet(interior, "str_whr_int_decals2") 
    DeactivateInteriorEntitySet(interior, "str_whr_int_decals1") 
    DeactivateInteriorEntitySet(interior, "str_whr_bedroom2_trim") 
    DeactivateInteriorEntitySet(interior, "str_whr_bedroom2_mirror")
    DeactivateInteriorEntitySet(interior, "str_whr_bedroom1_trim")
    DeactivateInteriorEntitySet(interior, "str_whr_bath_wins")  
    DeactivateInteriorEntitySet(interior, "str_whore_int_ref_proxy_e")
    DeactivateInteriorEntitySet(interior, "str_whore_int_ref_proxy_d")
    DeactivateInteriorEntitySet(interior, "str_whore_int_ref_proxy_b") 
    DeactivateInteriorEntitySet(interior, "str_whore_bdrm1_bits") 
    DeactivateInteriorEntitySet(interior, "str_bedroom_mirror")
    DeactivateInteriorEntitySet(interior, "str_04_whr_shell")
    DeactivateInteriorEntitySet(interior, "str_04_main_detail")
    DeactivateInteriorEntitySet(interior, "str_04_mainroom")  
    DeactivateInteriorEntitySet(interior, "strw_whr_bath_details")
    DeactivateInteriorEntitySet(interior, "strw_whr_bannister")  

end    
 
 
-----------------------------------------------------
---remove all on resource stop---
-----------------------------------------------------
AddEventHandler('onResourceStop', function(resource) 
    if resource == GetCurrentResourceName() then     
        -- when resource stops disable them, admin is restarting the script
        DisableResourcesYMAPS() 
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
        DisableResourcesYMAPS() 
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
        DisableResourcesYMAPS() 
        DisableResourcesINTERIORS(Config.x, Config.y, Config.z)

        -- basically run once after character has loadded in  
        EnableResouresYMAPS() 
        EnableResouresINTERIORS(Config.x, Config.y, Config.z)
        interiorsActive = true
        unlockDoors()  
    end
end)

 