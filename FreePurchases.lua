local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local player = Players.LocalPlayer

local function fire(signalType, id)
    pcall(function()
        if signalType == "Product" then
            MarketplaceService:SignalPromptProductPurchaseFinished(player.UserId, id, true)
        elseif signalType == "Gamepass" then
            MarketplaceService:SignalPromptGamePassPurchaseFinished(player, id, true)
        elseif signalType == "Bulk" then
            MarketplaceService:SignalPromptBulkPurchaseFinished(player.UserId, id, true)
        elseif signalType == "Purchase" then
            MarketplaceService:SignalPromptPurchaseFinished(player.UserId, id, true)
        end
    end)
end

MarketplaceService.PromptProductPurchaseFinished:Connect(function(plr, id, bought)
    fire("Product", id)
end)

MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(plr, id, bought)
    fire("Gamepass", id)
end)

MarketplaceService.PromptBulkPurchaseFinished:Connect(function(userId, id, bought)
    fire("Bulk", id)
end)

MarketplaceService.PromptPurchaseFinished:Connect(function(userId, id, bought)
    fire("Purchase", id)
end)
