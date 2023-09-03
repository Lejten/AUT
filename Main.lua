repeat wait() until game.Players.LocalPlayer
local HttpService = game:service('HttpService')
local scriptdata = nil
if isfile("AutSettings.lejten") then
    scriptdata = HttpService:JSONDecode(readfile("AutSettings.lejten"))
else
    scriptdata = {
        Enabled = false,
        Mode = "money",
        Repeat = false,
        UnboxCrates = true
    }
    JSON = HttpService:JSONEncode(scriptdata)
    writefile("AutSettings.lejten",JSON)
end    
local looping = scriptdata["Enabled"]
local mode = scriptdata["Mode"]
local RepeatSelf = scriptdata["Repeat"]
local unboxer = scriptdata["UnboxCrates"]

-----------------functions
function getcapacity()
local args = {
    [1] = "ItemInventory"
}
return game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedModules"):WaitForChild("KnitPackage"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("InventoryService"):WaitForChild("RF"):WaitForChild("GetCapacity"):InvokeServer(unpack(args))
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
            if char and getRoot(char) then
		        getRoot(char).CFrame = CFrame.new(-251, -14, 53)
            end
            end
		end)
	if char and getRoot(char) then
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
for i,v in pairs(invtable) do
    if v["_DisplayName"] == "1x Skin Crate" then
    print("this is a crate")
    local args2 = {
    [1] = {
        ["UUID"] = v["_UUID"],
        ["ItemId"] = v["_ItemId"]
    }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedModules"):WaitForChild("KnitPackage"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("InventoryService"):WaitForChild("RE"):WaitForChild("ItemInventory"):FireServer(unpack(args2))
    end
end
end



--------------------------------------------------------------


function CheckIfFull()
	     local capacity = getcapacity()
     if capacity["CurrentCapacity"] == capacity["MaxCapacity"] and PauseWhenFull == true then 
            if game.PlaceId ~= 6846458508 then
                local TeleportService = game:GetService("TeleportService")
                TeleportService:Teleport(6846458508,game.Players.LocalPlayer)
            else
        if unboxer == true then
            print("unboxing")
	    getcapacity()
	    wait()
            unbox()
        end    
            end
         return 
    else
        if unboxer == true then
        print("unboxing")
	    getcapacity()
	    wait()
        unbox()
        end    
    end
end



--------------------------------------Main
print("Enabled!")
antiafk()
game.Players.LocalPlayer.CharacterAdded:Connect(function(chr)
repeat wait() until chr:FindFirstChild("Torso")
CheckIfFull()
if game.PlaceId == 7425232362 then
    local position = nil
    if mode == "money" then
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
end)
