-- Decompiled by Electron BETA [ Made By (Co) ]
-- Path: Players.L_ejten.PlayerGui.UI.Menus.Inventory.Tabs.Items.UI_Inventory
return (function(a1)
local v1 = script:FindFirstAncestor("Inventory").Assets
local u2 = v1.Lock
local u3 = require(game.ReplicatedStorage:WaitForChild("ReplicatedModules").ItemData)
local v4 = require(game.ReplicatedStorage.ReplicatedModules.PathShortcuts)
local u5 = require(v4.KnitPath.Promise)
local u6 = require(v4.KnitPath.Trove)
local u7 = require(v4.ReplicatedModules.Classes.Stack)
local u8 = a1.Knit.GetService("InventoryService")
local u9 = "SkinInventory"
local u10 = {}
local u11 = {}
local u12 = {}
u12.Quantity = (function(a1)
return u10[a1] or 0 * -1
end)
local u13 = "Rarity (Highest)"
local u14 = {}
local u15 = (function(a1) -- AddSlot
local v1 = a1._ItemId
local u2 = u3.GetItemInfo(v1)
if u9 == "AbilityInventory" then
local v3 = a1._UUID
if not v3 then
end
end
local v4 = u11[v1]
if not u2 then
return
end
local v5 = u10[v1]
if not v5 then
v5 = u10
v5[v1] = 1
end
local v6 = u10
v6[v1] = v6[v1] + 1
if not v4 then
v6 = u7.new
local u7 = v6()
local v8 = u6
local v9 = a1.CreateInventorySlot(u2)
local v10 = nil
if not v10 then
v10 = u13
end
local v11 = a1
local v12 = v11.GetInventorySort(v11)
if not v12 then
v11 = u12
v12 = v11[v10]or v12 
local v13 = a1._ItemId
v9.LayoutOrder = nil or 0
v9.Parent = script.Parent
v13(u7)
v13(v8)
v13(v8.Button.MouseButton1Down, (function()
a1:PlaySound("Click")
local v1 = a1
v1.ItemInfo = u2
v1.ItemObject = u7:Peek()
v1.AmountLeft = u7:GetAmount()
v1.Stack = u7
v1.InventorySignals.ItemSelected:Fire(v1)
end))
if v13 then
local v14 = v9()
v14.Visible = true
local v15 = v8.Button
v14.Parent = v15
end
v14(a1)
v15.Container = v8
v15.Trove = v8.new()
v15.Stack = u7
v15.ItemObject = a1
v15.RarityInfo = v10[v12]
if v13 then
end
v15.Locked = false
v14[v1] = v15
return
end
v8(v14)
v13.Text = v14
end)
local u16 = (function(a1) -- RemoveSlot
local v1 = a1._ItemId
if u9 == "AbilityInventory" then
local v2 = a1._UUID
if not v2 then
end
end
local v3 = u11[v1]
if not v3 then
return
end
v3.Stack:Pop()
if v3.Stack:GetAmount() <= 0 then
v3.Trove:Destroy()
u11[v1] = nil
u10[v1] = nil
return
end
v3.Container.Button.Amount.Text = v3.Stack:GetAmount()
u10[v1] = v3.Stack:GetAmount()
end)
a1.ShowInventoryItems = (function(a1) -- ShowInventoryItems
u9 = a1
else if not u8:GetItems(a1):expect() then
return
end
local v1, v2, v3 = pairs(u11)
for v4,v5 in v1 do
v5.Trove:Destroy()
end
v1(v2)
v1(v2)
local v6 = u8:GetItems(a1):expect()
local v7, v8, v9 = v1(v2)
for v10,v11 in v7 do
u5.try(u15, v11):catch(warn)
end
end)
a1.ShowAllInventoryItems = (function() -- ShowAllInventoryItems
local v1, v2, v3 = pairs(u11)
for v4,v5 in v1 do
v5.Trove:Destroy()
end
v1(v2)
v1(v2)
local v6 = {"AbilityInventory", "SkinInventory", "ItemInventory"}
local v7, v8, v9 = v1(v2)
for v10,v11 in v7 do
u9 = v11
local L_v11_1 = u8:GetItems(v11)
else if not L_v11_1 then
L_v11_1 = {}
end
local v12, v13, v14 = pairs(L_v11_1)
for v15,v16 in v12 do
u5.try(u15, v16):catch(warn):await()
end
end
end)
local u17 = (function(a1) -- Search
if a1 then
if a1 ~= "" then
local v1, v2, v3 = pairs(u11)
for v4,v5 in v1 do
local v6 = v5.ItemObject._ItemId
local v7 = u3.GetItemInfo(v6)
if v7 then
if v7.Name then
if string.find(v7.Name:lower(), a1:lower()) then
v5.Container.Visible = true
continue
end
v5.Container.Visible = false
end
end
end
return
end
end
local v8, v9, v10 = v1(v2)
for v11,v12 in v8 do
v12.Container.Visible = v6
end
end)
local L_Order_1 = script.Parent.Parent.Parent.Sorting:WaitForChild("Order")
local L_Search_2 = script.Parent.Parent.Parent.Sorting:WaitForChild("Search")
L_Order_1.MouseButton1Down:Connect((function()
a1:PlaySound("Click")
 =  + 1
if #u14 <  then
 = 1
end
u13 = u14[]
L_Order_1.Text = u13
local v1, v2, v3 = pairs(u11)
for v4,v5 in v1 do
local v6 = v5.Container
if v6 then
v6 = v5.ItemObject._ItemId
local v7 = u13
if not v7 then
v7 = u13
end
local v8 = a1
local v9 = v8.GetInventorySort(v8)
if not v9 then
v8 = u12
v9 = v8[v7]or v9 
v5.Container.LayoutOrder = nil
end
end
end))
L_Search_2.TextBox.FocusLost:Connect((function()
u17(L_Search_2.TextBox.Text)
end))
u8.ItemAdded:Connect((function(a1, a2)
if u9 ~= a2 then
return
end
u15(a1)
local v1 = u11[a1._UUID]
if a1._Locked then
if not v1.Locked then
local v2 = u2:Clone()
v2.Visible = true
v2.Parent = v1.Container.Button
v1.Locked = true
v1.ItemObject._Locked = v2
end
end
end))
u8.ItemRemoved:Connect((function(a1)
u16(a1)
end))
u8.ItemLocked:Connect((function(a1, a2)
local v1 = u11[a1._UUID]
if a2 then
if not v1.Locked then
local v2 = u2:Clone()
v2.Visible = true
v2.Parent = v1.Container.Button
v1.Locked = true
v1.ItemObject._Locked = v2
return
end
end
local v3 = v1.Container
else if not v2 then
end
v2()
v1.Locked = v3
v3._Locked = v2
end))
end)
