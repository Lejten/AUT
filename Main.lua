repeat wait() until game.Players.LocalPlayer
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local HttpService = game:service('HttpService')
local scriptdata = nil
local lockedin = false
if isfile("AutSettings.lejten") then
    scriptdata = HttpService:JSONDecode(readfile("AutSettings.lejten"))
else
    scriptdata = {
        Enabled = false,
        Mode = "money",
        Repeat = false,
        UnboxCrates = true,
        LastPlace = nil
    }
    JSON = HttpService:JSONEncode(scriptdata)
    writefile("AutSettings.lejten",JSON)
end    
local taglines = {"Kur fucking sucks",
"BetterBuffUmbra",
"I_Love_Timestop_Stands",
"Puddest is gone! WE CELEBRATE",
"Hadopelagenix eats rats",
"sini pee lover",
"obese antone",
"time to make gazillions 🤑",
"ascensions are fair",
"99.99% safe, not including trojans",
"made in poland"
}




-----------------functions
function getcapacity()
local args = {
    [1] = "ItemInventory"
}
return game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedModules"):WaitForChild("KnitPackage"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("InventoryService"):WaitForChild("RF"):WaitForChild("GetCapacity"):InvokeServer(unpack(args))
end


function makelobby()
    if game.PlaceId == 8008202756 then
        if game.Players.LocalPlayer.PlayerGui.MainMenu.Menus.Code.Text == "NULL" then
        game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedModules"):WaitForChild("KnitPackage"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("MatchmakeService"):WaitForChild("RF"):WaitForChild("RequestPrivateLobby"):InvokeServer()
        end
    end
end
function startwave()
    local u3 = game.ReplicatedStorage.Remotes.TeamEvent
    u3:FireServer("CreateTeam", {GameMode = "Wavemode", GameType = "Casual"})
    wait(1)
    game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedModules"):WaitForChild("KnitPackage"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("MatchmakeService"):WaitForChild("RF"):WaitForChild("StartQueue"):InvokeServer()
end
function teleport(v)
    local TeleportService = game:GetService("TeleportService")
    if v == "maingame" then
        TeleportService:Teleport(6846458508,game.Players.LocalPlayer)
    elseif v == "wave" then
        TeleportService:Teleport(8008202756,game.Players.LocalPlayer)
    end
end




-------------------------------
local autoclicking = false
function autoclicker()
task.spawn(function()
while autoclicking == true do
task.wait(.1)
local args = {
    [1] = "MouseButton1"
}
game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedModules"):WaitForChild("KnitPackage"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("MoveInputService"):WaitForChild("RF"):WaitForChild("FireInput"):InvokeServer(unpack(args))
end
end)
end

----------------------------------anti afk
function antiafk()
	local GC = getconnections or get_signal_cons
	if GC then
		for i,v in pairs(GC(game.Players.LocalPlayer.Idled)) do
			if v["Disable"] then
				v["Disable"](v)
			elseif v["Disconnect"] then
				v["Disconnect"](v)
			end
		end
	else
		game.Players.LocalPlayer.Idled:Connect(function()
			local VirtualUser = game:GetService("VirtualUser")
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	end
end



----------------------------------------------------------------------------------------------------------------------





function grinder(a,b)
    movement = true
    task.spawn(function()
    local wavetext = game.Players.LocalPlayer.PlayerGui.WaveModeUI.WaveStatus.Defeated.Label.Text
        while wait(8) do
            if wavetext == game.Players.LocalPlayer.PlayerGui.WaveModeUI.WaveStatus.Defeated.Label.Text then
                task.spawn(function()
                    local char = game.Players.LocalPlayer.Character
                    movement = false
                    char.HumanoidRootPart.CFrame = CFrame.new(-251, -14, 53)
                    wait(1)
                    movement = true
                end)
            end
            wavetext = game.Players.LocalPlayer.PlayerGui.WaveModeUI.WaveStatus.Defeated.Label.Text    
        end
    end)
 task.spawn(function()
	local speaker = game.Players.LocalPlayer
	function getRoot(char)
		local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
		return rootPart
	end
	local char = game.Players.LocalPlayer.Character
	local T = getRoot(speaker.Character)
	local BG = Instance.new('BodyGyro')
	local BV = Instance.new('BodyVelocity')
	BG.P = 9e4
	BG.Parent = T
	BV.Parent = T
	BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
	BG.cframe = T.CFrame
	BV.Velocity = Vector3.new(0, 0, 0)
	BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
    task.spawn(function()
    		while true do
			BV.Velocity = Vector3.new(0,0,-52)
			wait(1)
			BV.Velocity = Vector3.new(0,0,52)
            wait(1)
            if char and getRoot(char) and movement == true then
		        getRoot(char).CFrame = CFrame.new(-251, -14, 53)
            end
            end
		end)
	if char and getRoot(char) and movement == true then
		getRoot(char).CFrame = CFrame.new(-251, -14, 53)
	end
end)
end

--------------------------------------------------------------------------------------------------------------------

function noclip()
	for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if child:IsA("BasePart") and child.Name ~= floatName then
            print(child.Name)
            task.spawn(function()
            while child do
                child.CanCollide = false
                wait()
            end
            end)
		end
	end
end


--------------------------------------------------------------------------------------------------------------------


function unbox()
 local args = {
    [1] = "ItemInventory"
}
local invtable = game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedModules"):WaitForChild("KnitPackage"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("InventoryService"):WaitForChild("RF"):WaitForChild("GetItems"):InvokeServer(unpack(args))
wait(1)
cratesfound = 0
for i,v in pairs(invtable) do
    if v["_DisplayName"] == "1x Skin Crate" then
    print("this is a crate")
    cratesfound = cratesfound + 1
    local args2 = {
    [1] = {
        ["UUID"] = v["_UUID"],
        ["ItemId"] = v["_ItemId"]
    }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedModules"):WaitForChild("KnitPackage"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("InventoryService"):WaitForChild("RE"):WaitForChild("ItemInventory"):FireServer(unpack(args2))
    end
end
    if scriptdata["Repeat"] == true and scriptdata["Enabled"] == true then
        teleport("wave")
    end
end



--------------------------------------------------------------


function CheckIfFull()
	     local capacity = getcapacity()
     if capacity["CurrentCapacity"] == capacity["MaxCapacity"] then 
            if game.PlaceId ~= 6846458508 then
                teleport("maingame")
            else
        if scriptdata["UnboxCrates"] == true then
            print("unboxing")
	    getcapacity()
	    wait()
            unbox()
        end    
            end
         return 
    else
        if scriptdata["UnboxCrates"] == true and game.PlaceId == 6846458508 then
        print("unboxing")
	    getcapacity()
	    wait()
        unbox()
        end    
    end
end



function onspawn(chr)
            if scriptdata["UnboxCrates"] == true then
                CheckIfFull()
            end
            repeat wait() until chr:FindFirstChild("Torso")
            if lockedin == false then lockedin = true end
                if game.PlaceId == 7425232362 then
                    local position = nil
                    if scriptdata["Mode"] == "money" then
                        if autoclicking == false then
                            autoclicking = true
                            autoclicker()
                        end
                        position = CFrame.new(-251, -14, 53)
                    else
                        position = CFrame.new(-251, 12, 53)
                    end
                    noclip()
                    grinder()
                end    
end
----------------------------------------
function loop()
        print("Enabled!")
        if game.PlaceId == 8008202756 then
        if scriptdata["LastPlace"] ~= 7425232362 or scriptdata["Repeat"] == true then
            if game.Players.LocalPlayer.PlayerGui:WaitForChild("MainMenu"):WaitForChild("Menus"):WaitForChild("Code").Text == "NULL" then
                    print("making a fresh lobby")
                    makelobby()
                else
                    print("starting wave")
                    startwave()
            end
        end
        elseif game.PlaceId == 7425232362 then
            task.spawn(function()
                while lockedin == false do
                    game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedModules"):WaitForChild("KnitPackage"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("WaveModeService"):WaitForChild("RF"):WaitForChild("LockAbility"):InvokeServer(8888)
                    wait(.3)
                end
            end)
        elseif game.PlaceId ~= 6846458508 then
            if scriptdata["LastPlace"] ~= 7425232362 or scriptdata["Repeat"] == true then
                teleport("wave")
            end    
        end 
        if game.Players.LocalPlayer.Character then
            onspawn(game.Players.LocalPlayer.Character)
        end
        game.Players.LocalPlayer.CharacterAdded:Connect(function(chr)
        onspawn(chr)
        end)
end



--------------------------------------Main
local currenttask = nil
local title = "Lejten AUT GUI: "..taglines[math.random(1,#taglines)]
local Window = Library.CreateLib(title, "Synapse")
local tab = Window:NewTab("Farm")
local stab = Window:NewTab("Settings")
local Section = tab:NewSection("WaveMode farm")
local setsection = stab:NewSection("WaveMode Settings")
local button
button = Section:NewButton("Toggle Script", "ButtonInfo", function()
    if scriptdata["Enabled"] == true then
        if currenttask ~= nil then
            task.cancel(currenttask)
        end
        scriptdata["Enabled"] = false
        button:UpdateButton("Enable Script")
    else
        currenttask = task.spawn(function()
        loop()
    end)
        scriptdata["Enabled"] = true
        button:UpdateButton("Disable script")
    end
    JSON = HttpService:JSONEncode(scriptdata)
    writefile("AutSettings.lejten",JSON)
end)
  if scriptdata["Enabled"] == true then
    button:UpdateButton("Disable Script")
    else
     button:UpdateButton("Enable Script")
  end

toggle = setsection:NewToggle("Toggle Repeat", "Toggles Script Repeating itself", function(val)
    if val == false then
        scriptdata["Repeat"] = false
    else
        scriptdata["Repeat"] = true
    end
    JSON = HttpService:JSONEncode(scriptdata)
    writefile("AutSettings.lejten",JSON)
end)
if scriptdata["Repeat"] == true then
toggle:UpdateToggle("Toggle Repeat",true)
end

toggle2 = setsection:NewDropdown("Farm Mode", "Changes between money and safe mode. May not display as saved even though it is", {"money","safe"}, function(val)
    if val == "money" then
        scriptdata["Mode"] = "money"
    else
        scriptdata["Mode"] = "safe"
    end
    JSON = HttpService:JSONEncode(scriptdata)
    writefile("AutSettings.lejten",JSON)
end)
toggle3 = setsection:NewToggle("Unbox Crates", "Leaves the game to unbox your crates", function(val)
    if val == false then
        scriptdata["UnboxCrates"] = false
    else
        scriptdata["UnboxCrates"] = true
    end
    JSON = HttpService:JSONEncode(scriptdata)
    writefile("AutSettings.lejten",JSON)
end)
if scriptdata["UnboxCrates"] == true then
toggle3:UpdateToggle("Unbox Crates",true)
end
--------------------------
antiafk()
scriptdata["LastPlace"] = game.PlaceId
JSON = HttpService:JSONEncode(scriptdata)
writefile("AutSettings.lejten",JSON)
if scriptdata["Enabled"] == true then
    currenttask = task.spawn(function()
        loop()
    end)
else
    print("Random Enable Me gui bullshit pls")
end
