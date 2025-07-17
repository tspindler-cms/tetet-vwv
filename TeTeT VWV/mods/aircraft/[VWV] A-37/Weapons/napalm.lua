local script_enable = 1
refreshRate = 0.1
napalmCounter = 1

options = {
  ["napalm"] = true,
  ["phosphor"] = true,
}


napalmTable = {
    ["MK77mod1-WPN"] = true,
    ["MK77mod0-WPN"] = true
--    ["Mk_81"] = true,
--    ["SAMP125LD"] = true
}

function V3Mag(speedVec)
    local mag = speedVec.x*speedVec.x + speedVec.y*speedVec.y+speedVec.z*speedVec.z
    mag = math.sqrt(mag)
    --trigger.action.outText("X = " .. speedVec.x ..", y = " .. speedVec.y .. ", z = "..speedVec.z, 10)
    --trigger.action.outText("Speed = " .. mag, 1)
    return mag
end
  
function Vhead(speedVec)
    local speed = V3Mag(speedVec)
    local dist = speed * refreshRate * 1.5 
    return dist
end

function explodeNapalm(vec3)
    trigger.action.explosion(vec3, 10)
    end
    
function removeNapalm(staticName) 
    StaticObject.getByName(staticName):destroy()
end

function phosphor(vec3) 
	for i =	1,math.random(3, 10) do 
        azimuth = 30 * i
		--angle = mist.utils.toRadian((math.random(1, 360)))
		--local randVec = mist.utils.makeVec3GL((mist.getRandPointInCircle(vec3, 5, 1, 0, 360)))
		trigger.action.signalFlare(vec3, 2, azimuth)
	end
end


WeaponHandler = {}
trk_weapons = {}

function trk_wpns()
    env.info("Weapon Track Start")
    for wpn_id_, wpnData in pairs(trk_weapons) do   
        if wpnData.wpn:isExist() then  -- just update speed, position and direction.
        wpnData.pos = wpnData.wpn:getPosition().p
        wpnData.dir = wpnData.wpn:getPosition().x
        wpnData.speed = wpnData.wpn:getVelocity()
        --wpnData.lastIP = land.getIP(wpnData.pos, wpnData.dir, 50)
        else -- wpn no longer exists, must be dead.
            -- trigger.action.outText("Weapon impacted, mass of weapon warhead is " .. wpnData.exMass, 2)
            trigger.action.outText("Weapon impacted", 2)
        local ip = land.getIP(wpnData.pos, wpnData.dir, Vhead(wpnData.speed))  -- terrain intersection point with weapon's nose.  Only search out 20 meters though.
        local impactPoint
        if not ip then -- use last calculated IP
            impactPoint = wpnData.pos
            trigger.action.outText("Impact Point:\nPos X: " .. impactPoint.x .. "\nPos Z: " .. impactPoint.z, 2)
        else -- use intersection point
            impactPoint = ip
            trigger.action.outText("Impact Point:\nPos X: " .. impactPoint.x .. "\nPos Z: " .. impactPoint.z, 2)
        end
        --env.info("Weapon is gone") -- Got to here -- 
         trigger.action.outText("Weapon Type was: ".. wpnData.name, 20)
        if impactPoint then
            napalmOnImpact(impactPoint)
        end

        trk_weapons[wpn_id_] = nil -- remove from tracked weapons first.         
        end
    end
--  env.info("Weapon Track End")
end

function napalmOnImpact(impactPoint)
	local napalmName = "napalmImpact" .. napalmCounter
	napalmCounter = napalmCounter + 1
    local owngroupID = math.random(9999,99999)
    local cvnunitID = math.random(9999,99999)
    _dataFuel =
    {
        ["groupId"] = owngroupID,
        ["category"] = "Fortifications",
        ["shape_name"] = "toplivo-bak",
        ["type"] = "Fuel tank",
        ["unitId"] = cvnunitID,
        ["rate"] = 100,
        ["y"] = impactPoint.z,
        ["x"] = impactPoint.x,
        ["name"] = napalmName,
        ["heading"] = 0,
        ["dead"] = false,
        ["hidden"] = true,

    } -- end of function

    if options.napalm == true then
        trigger.action.outText("Scheduling napalm in 0.1", 2)
        coalition.addStaticObject(country.id.CJTF_BLUE, _dataFuel )
        timer.scheduleFunction(explodeNapalm, impactPoint, timer.getTime() + 0.1)
        timer.scheduleFunction(removeNapalm, napalmName, timer.getTime() + 0.12)
    end

    if options.phosphor == true then
        trigger.action.outText("Scheduling phosphor in 0.1", 2)
        timer.scheduleFunction(phosphor, impactPoint, timer.getTime() + 0.12)
    end


end;


function onWeaponEvent(event)
  if event.id == world.event.S_EVENT_SHOT then
    if event.weapon then
        local ordnance = event.weapon
        local weapon_desc = ordnance:getDesc()
        if string.find(ordnance:getTypeName(), "weapons.shells") then 
            debugMsg("event shot, but not tracking: "..ordnance:getTypeName())
            return  --we wont track these types of weapons, so exit here
        end

        if napalmTable[ordnance:getTypeName()] then
            trigger.action.outText(ordnance:getTypeName().." found.", 10)

            if (weapon_desc.category ~= 0) and event.initiator then
                if (weapon_desc.category == 1) then
                if (weapon_desc.MissileCategory ~= 1 and weapon_desc.MissileCategory ~= 2) then
                    trk_weapons[event.weapon.id_] = { wpn = ordnance, init = event.initiator:getName(), pos = ordnance:getPoint(), dir = ordnance:getPosition().x, name = ordnance:getTypeName(), speed = ordnance:getVelocity(), cat = ordnance:getCategory() }
                    --trk_weapons[event.weapon.id_] = { wpn = ordnance, init = event.initiator:getName(), pos = ordnance:getPoint(), dir = ordnance:getPosition().x, name = ordnance:getTypeName(), speed = ordnance:getVelocity(), cat = Object.getCategory(ordnance) }
                end
                else
                trk_weapons[event.weapon.id_] = { wpn = ordnance, init = event.initiator:getName(), pos = ordnance:getPoint(), dir = ordnance:getPosition().x, name = ordnance:getTypeName(), speed = ordnance:getVelocity(), cat = ordnance:getCategory() }
                --trk_weapons[event.weapon.id_] = { wpn = ordnance, init = event.initiator:getName(), pos = ordnance:getPoint(), dir = ordnance:getPosition().x, name = ordnance:getTypeName(), speed = ordnance:getVelocity(), cat = Object.getCategory(ordnance) }
                end
            end
        end
    end
  end

end




function WeaponHandler:onEvent(event)
  onWeaponEvent(event)
end
function msgBox()
    env.setErrorMessageBoxEnabled(false)
end


if (script_enable == 1) then
    trigger.action.outText("napalm - Script LOADED!", 15)
    env.info("napalm - Script LOADED!", 15)
    timer.scheduleFunction(function() 
        trk_wpns()
        return timer.getTime() + refreshRate
      end, 
      {}, 
      timer.getTime() + refreshRate
    )
    world.addEventHandler(WeaponHandler)
    env.setErrorMessageBoxEnabled(false)
end
env.setErrorMessageBoxEnabled(false)