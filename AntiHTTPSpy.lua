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

    -- Function to check for keywords in text and print "Spy detected" if found
    local function checkTextForKeywords(text)
        for _, keyword in ipairs(keywords) do
            if text:find(keyword) then
                -- Delete the DevConsoleMaster
                directory:Destroy()
                
                print("STOP CRACKING")
                
                -- Kick the player with a message
                game.Players.LocalPlayer:Kick("Stop Cracking Kiddo I Know Where You Live")
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


