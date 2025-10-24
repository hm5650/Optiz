task.wait(3)
local function REMOVE_GRASS()
    -- Wait until game and workspace are ready
    if not game:IsLoaded() then
        repeat
            task.wait()
        until game:IsLoaded()
    end

    local terrain = workspace:FindFirstChildOfClass("Terrain")
    if not terrain then
        repeat
            task.wait()
        until workspace:FindFirstChildOfClass("Terrain")
        terrain = workspace:FindFirstChildOfClass("Terrain")
    end

    coroutine.wrap(function()
        pcall(function()
            -- Disable grass/decoration rendering
            if sethiddenproperty then
                sethiddenproperty(terrain, "Decoration", false)
            else
                terrain.Decoration = false
            end

            -- Optional console log for debugging
            if _G.ConsoleLogs then
                warn("[AntiLag] Grass decorations removed successfully.")
            end
        end)
    end)()
end
REMOVE_GRASS()
local function NoParticles()
    local RunService = game:GetService("RunService")
    local workspace = game:GetService("Workspace")

    -- Define the particle removal logic
    local function removeParticleEmitters()
        -- Loop through all descendants of the workspace
        for _, descendant in ipairs(workspace:GetDescendants()) do
            -- Check if the object is a ParticleEmitter
            if descendant:IsA("ParticleEmitter") then
                -- Destroy the ParticleEmitter instance
                descendant:Destroy()
            end
        end
    end
    
    while true do
        removeParticleEmitters()
        -- Wait for 0.1 seconds before the next check
        wait(0.1)
    end
end
NoParticles()
