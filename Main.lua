local mode = nil
local PauseWhenFull = true
local unboxer = true

-----------------functions
function getcapacity()
local args = {
    [1] = "ItemInventory"
}
return game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedModules"):WaitForChild("KnitPackage"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("InventoryService"):WaitForChild("RF"):WaitForChild("GetCapacity"):InvokeServer(unpack(args))
end


----------------------------------------------------------------------------------------------------------------------





function grinder()
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
		        getRoot(char).CFrame = CFrame.new(-251, 12, 53)
            end
            end
		end)
	if char and getRoot(char) then
		getRoot(char).CFrame = CFrame.new(-251, 12, 53)
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
print("hi")
game.Players.LocalPlayer.CharacterAdded:Connect(function(chr)
repeat wait() until chr:FindFirstChild("Torso")
CheckIfFull()
if game.PlaceId == 7425232362 then
     noclip()
  wait(2)
  grinder()
end
end)
