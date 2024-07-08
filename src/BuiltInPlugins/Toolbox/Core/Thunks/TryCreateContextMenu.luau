local l_Parent_0 = script.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.ContextMenuHelper);
local v3 = require(l_Util_0.CreatorInfoHelper);
local v4 = require(l_Parent_0.Core.Components.AssetConfiguration.Permissions.PermissionsConstants);
local v5 = require(l_Parent_0.Core.Types.Category);
local v6 = require(l_Parent_0.Core.Util.PageInfoHelper);
local _ = function(v7, v8)
    for _, v10 in ipairs((v7:GetEnumItems())) do
        if v10.Value == v8 then
            return v10.Name;
        end;
    end;
end;
return function(v12, v13, v14, v15, v16)
    return function(v17)
        local l_Asset_0 = v12.Asset;
        local l_Id_0 = l_Asset_0.Id;
        local l_TypeId_0 = l_Asset_0.TypeId;
        local v21 = v17:getState();
        local v22 = v21.assets or {};
        local v23 = v21.pageInfo or {};
        local v24 = v22.manageableAssets[tostring(l_Id_0)];
        local v25 = v23.categoryName or v5.DEFAULT.name;
        local v26 = v21.packages.permissionsTable or {};
        local v27 = v5.categoryIsPackage(v25);
        if v27 then
            local v28 = true;
            if v26[l_Id_0] ~= v4.EditKey then
                v28 = v26[l_Id_0] == v4.OwnKey;
            end;
            v24 = v28;
        end;
        local l_v16_0 = v16;
        local l_position_0 = v12.Context.position;
        local v31 = nil;
        v31 = if l_v16_0.toolboxTab == v5.CREATIONS_KEY then v12.Creator.Type else v3.backendToClient(v12.Creator.Type);
        local v32 = {};
        local v33;
        for _, v35 in ipairs((Enum.AssetType:GetEnumItems())) do
            if v35.Value == l_TypeId_0 then
                v33 = v35.Name;
                goto label0 --[[  true, false  ]];
            end;
        end;
        v33 = nil;
        ::label0::;
        v32.Category = v33;
        v32.SortType = l_v16_0.sort;
        v32.CreatorId = v12.Creator.Id;
        local l_CreatorType_0 = Enum.CreatorType;
        local l_v31_0 = v31;
        for _, v39 in ipairs((l_CreatorType_0:GetEnumItems())) do
            if v39.Value == l_v31_0 then
                v33 = v39.Name;
                goto label1 --[[  true, false  ]];
            end;
        end;
        v33 = nil;
        ::label1::;
        v32.CreatorType = v33;
        v32.SearchKeyword = l_v16_0.searchKeyword;
        v32.Position = l_position_0;
        v32.SearchId = l_v16_0.searchId;
        v32.ViewInBrowser = true;
        v2.tryCreateContextMenu(v14, l_Id_0, l_TypeId_0, v24, v13, v15, v27, v6.getCategoryForPageInfo(v23), v32, not not v12.Creator and v12.Creator.Id or nil);
    end;
end;
