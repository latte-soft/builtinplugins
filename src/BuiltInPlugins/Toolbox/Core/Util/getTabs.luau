local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Types.Category);
local v2 = require(l_Parent_0.Core.Util.DebugFlags);
local v3 = require(l_Parent_0.Core.Util.getAllowedAssetTypeEnums);
local v4 = require(l_Parent_0.Core.Util.Images);
local l_disableMarketplaceAndRecents_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).disableMarketplaceAndRecents;
local l_showRobloxCreatedAssets_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).showRobloxCreatedAssets;
local v7 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxContentManagementCombineTabs);
local v8 = require(l_Parent_0.Core.Util.SharedFlags.getIsIXPEnabledForListView);
return function(v9, v10, v11)
    if not (not v7() or not v2.shouldDebugWarnings()) and v11 == nil then
        warn("IXP variable was not found for getCategoryIndex");
    end;
    if not v7() or not v8(v11) then
        if not l_disableMarketplaceAndRecents_0() then
            if not l_showRobloxCreatedAssets_0() then
                return {
                    {
                        Key = v1.MARKETPLACE_KEY, 
                        Text = v9:getText("General", "TabCreatorStore"), 
                        Image = v4.MARKETPLACE_TAB
                    }, 
                    {
                        Key = v1.INVENTORY_KEY, 
                        Text = v9:getText("General", "TabInventory"), 
                        Image = v4.INVENTORY_TAB
                    }, 
                    {
                        Key = v1.RECENT_KEY, 
                        Text = v9:getText("General", "TabRecent"), 
                        Image = v4.RECENT_TAB
                    }, 
                    {
                        Key = v1.CREATIONS_KEY, 
                        Text = v9:getText("General", "TabCreations"), 
                        Image = v4.CREATIONS_TAB
                    }
                };
            else
                return {
                    {
                        Key = v1.MARKETPLACE_KEY, 
                        Text = v9:getText("General", "TabCreatorStore"), 
                        Image = v4.MARKETPLACE_TAB
                    }, 
                    {
                        Key = v1.INVENTORY_KEY, 
                        Text = v9:getText("General", "TabInventory"), 
                        Image = v4.INVENTORY_TAB
                    }, 
                    {
                        Key = v1.CREATIONS_KEY, 
                        Text = v9:getText("General", "TabCreations"), 
                        Image = v4.CREATIONS_TAB
                    }
                };
            end;
        else
            return {
                {
                    Key = v1.INVENTORY_KEY, 
                    Text = v9:getText("General", "TabInventory"), 
                    Image = v4.INVENTORY_TAB
                }, 
                {
                    Key = v1.CREATIONS_KEY, 
                    Text = v9:getText("General", "TabCreations"), 
                    Image = v4.CREATIONS_TAB
                }
            };
        end;
    else
        local v12 = {
            {
                Key = v1.MARKETPLACE_KEY, 
                Text = v9:getText("General", "TabCreatorStore"), 
                Image = v4.MARKETPLACE_TAB
            }, 
            {
                Key = v1.INVENTORY_KEY, 
                Text = v9:getText("General", "TabInventory"), 
                Image = v4.INVENTORY_TAB
            }, 
            {
                Key = v1.RECENT_KEY, 
                Text = v9:getText("General", "TabRecent"), 
                Image = v4.RECENT_TAB
            }
        };
        if #if not v10 then nil else v3(v10.allowedAssetTypesForRelease) > 0 then
            table.insert(v12, {
                Key = v1.CREATIONS_KEY, 
                Text = v9:getText("General", "TabCreations"), 
                Image = v4.CREATIONS_TAB
            });
        end;
        return v12;
    end;
end;
