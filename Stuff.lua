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
        -- Wait for 0.50 seconds before the next check
        wait(0.50)
    end
end
NoParticles()
