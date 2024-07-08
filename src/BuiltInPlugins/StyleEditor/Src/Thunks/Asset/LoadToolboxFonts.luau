local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_collectArray_0 = require(l_Parent_0.Packages.Dash).collectArray;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v4 = require(l_Parent_0.Src.Util.DebugFlags);
local v5 = require(l_Parent_0.Src.Thunks.Asset.LoadFontFamilyInfo);
local v6 = require(l_Parent_0.Src.API.Toolbox.getInventoryAssets);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function()
    return function(v9, v10)
        local l_Networking_0 = v10.Networking;
        local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
        local function v13(v14)
            v6(l_Networking_0, l_l_StudioService_0_UserId_0, Enum.AssetType.FontFamily):andThen(function(v15)
                local v18 = l_collectArray_0(v15.responseBody.data, function(_, v17)
                    return "rbxassetid://" .. v17.id;
                end);
                if #v18 == 0 then
                    return ;
                else
                    v9:dispatch(v5(v18));
                    if v15.responseBody.nextPageCursor then
                        v13(v14);
                    end;
                    return ;
                end;
            end):catch(function(v19)
                if not v4.LogNetworkErrors() then
                    warn("Failed to load inventory fonts");
                    return ;
                else
                    warn("Failed to load inventory fonts, network error:", v19);
                    return ;
                end;
            end);
        end;
        v13(nil);
    end;
end;
