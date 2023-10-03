Convars:RegisterCommand("savepos", function(cmd, n)
    local player = Convars:GetCommandClient()
    if player ~= nil then
        if player.posTable == nil then
            player.posTable = {}
        end
        player.posTable[n] = {origin = player:GetAbsOrigin(), angles = player:EyeAngles()}
    end
end, "Saves player position to specified index", 1)

function teleportPlayer(player, position)
    player.lastPos = {origin = player:GetAbsOrigin(), angles = player:EyeAngles()}
    player:SetAbsOrigin(position.origin)
    player:SetAngles(position.angles.x, position.angles.y, position.angles.z)
    player:SetVelocity(Vector(0, 0, 0))
end

Convars:RegisterCommand("loadpos", function(cmd, n)
    local player = Convars:GetCommandClient()
    if player ~= nil then
        if player.posTable ~= nil then
            if player.posTable[n] ~= nil then
                teleportPlayer(player, player.posTable[n])
            end
        end
    end
end, "Teleports player to position at specified index", 1)

Convars:RegisterCommand("lastpos", function()
    local player = Convars:GetCommandClient()
    if player ~= nil then
        if player.lastPos ~= nil then
            teleportPlayer(player, player.lastPos)
        end
    end
end, "Teleports player to last position before teleporting", 0)