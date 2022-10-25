local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Tower Of Hell (Rage)", HidePremium = true, SaveConfig = false, ConfigFolder = "TOH"})
local Main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local mainSection = Main:AddSection({
	Name = "Main"
})

Main:AddButton({
Name = "AntiCheat Bypass (working) (ONLY 1 TIME)",
Callback = function()
local function DisableSignal(signal, name)
    local successes = true
    for i, connection in next, getconnections(signal) do
        local success, err = pcall(connection.Disable)
        if success then
            print('successfully disconnected ' .. name .. '\'s #' .. tostring(i) .. ' connection')
        else
            if err then
                print('failed to disconnect ' .. name .. '\'s # ' .. tostring(i) .. 'connection due to ' .. err)
            end
            successes = false
        end
    end
    return successes
end

local localscript = game:GetService'Players'.LocalPlayer.PlayerScripts.LocalScript
local localscript2 = game:GetService'Players'.LocalPlayer.PlayerScripts.LocalScript2

local localscriptSignal = localscript.Changed
local localscript2Signal = localscript2.Changed

if DisableSignal(localscriptSignal, 'localscript') then
    localscript:Destroy()
end
if DisableSignal(localscript2Signal, 'localscript2') then
    localscript2:Destroy()
end
end})

Main:AddButton({
Name = "Teleport To Top",
Callback = function()
for _, v in pairs(game:GetService("Workspace").tower.sections.finish:GetDescendants()) do
if v.Name == "FinishGlow" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.position)
end
end
end})

Main:AddButton({
Name = "(CLIENT SIDE) Get Tools",
Callback = function()
    for _,e in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
        if e:IsA("Tool") then
        e:Destroy()
        end
        end
        wait() 
        for _,v in pairs(game.ReplicatedStorage.Gear:GetDescendants()) do
        if v:IsA("Tool") then
        local CloneThings = v:Clone()
        wait()
        CloneThings.Parent = game.Players.LocalPlayer.Backpack
        end
    end
end})

Main:AddSlider({
	Name = "(BYPASS FIRST) WalkSpeed",
	Min = 16,
	Max = 150,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "",
	Callback = function(stuff)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = stuff
	end    
})

Main:AddSlider({
	Name = "(BYPASS FIRST) JumpPower",
	Min = 50,
	Max = 350,
	Default = 50,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "",
	Callback = function(stuff1)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = stuff1
	end    
})

Main:AddButton({
Name = "(BYPASS FIRST) Inf Jump (1 time use)",
Callback = function()
local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';

_G.JumpHeight = 50;

function Action(Object, Function) if Object ~= nil then Function(Object); end end

UIS.InputBegan:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(Player.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                end)
            end
        end)
    end
end)
end})
