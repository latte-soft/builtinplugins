local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Framework);
local l_AccessoryAndBodyToolShared_0 = require(l_Parent_0.Packages.AvatarToolsShared).Util.AccessoryAndBodyToolShared;
local l_PreviewConstants_0 = l_AccessoryAndBodyToolShared_0.PreviewConstants;
local l_PreviewConstantsInterface_0 = l_AccessoryAndBodyToolShared_0.PreviewConstantsInterface;
local v6 = require(l_Parent_0.Src.Actions.SetPreviewAssetsSelected);
local v7 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local l_deepCopy_0 = v2.Util.deepCopy;
local function v13(v9, v10, v11, v12)
    if not v10 then
        if not v12 then
            return nil;
        else
            return v1.List.removeValue(v12, v9);
        end;
    elseif not v11 then
        return {
            v9
        };
    else
        v12 = v12 or {};
        table.insert(v12, v9);
        return v12;
    end;
end;
local function _(v14)
    local v15 = v14[l_PreviewConstants_0.TABS_KEYS.Avatars];
    if v15 then
        if not next(v15) then
            return false;
        else
            return true;
        end;
    else
        return false;
    end;
end;
return function(v17, v18)
    return function(v19)
        local v20 = v19:getState();
        local l_selectedTab_0 = v20.previewStatus.selectedTab;
        local v22 = l_deepCopy_0(v20.previewStatus.selectedAssets);
        if v17 then
            v22[l_selectedTab_0] = v13(v17, v18, l_PreviewConstantsInterface_0.isTabMultiSelect(l_selectedTab_0), v22[l_selectedTab_0]);
            if v18 then
                if l_selectedTab_0 == l_PreviewConstants_0.TABS_KEYS.Avatars then
                    local l_v7_0 = v7;
                    l_v7_0.TotalAvatars = l_v7_0.TotalAvatars + 1;
                elseif l_selectedTab_0 == l_PreviewConstants_0.TABS_KEYS.Clothing then
                    local l_v7_1 = v7;
                    l_v7_1.TotalLayers = l_v7_1.TotalLayers + 1;
                end;
            end;
        end;
        local v25 = v22[l_PreviewConstants_0.TABS_KEYS.Avatars];
        if not if v25 then next(v25) and true or false else false then
            local l_Avatars_0 = l_PreviewConstants_0.TABS_KEYS.Avatars;
            v25 = l_PreviewConstantsInterface_0.getTabInfo(l_Avatars_0);
            if not v22[l_Avatars_0] then
                v22[l_Avatars_0] = {};
            end;
            local _, v28 = next(v25.BundleIds);
            v22[l_Avatars_0] = {
                v28
            };
        end;
        v19:dispatch(v6(v22));
    end;
end;
