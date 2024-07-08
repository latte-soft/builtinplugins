local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local _ = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioView);
local v5 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v6 = require(l_script_FirstAncestor_0.Core.Hooks.useCategorySections);
local _ = require(l_script_FirstAncestor_0.Core.Types.HomeTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.AudioTypes);
local v9 = {
    InitialPageSize = 10
};
return function(v10)
    local v11 = v1.Dictionary.join(v9, v10);
    local v12 = v6(v5.FREE_AUDIO, v11.InitialPageSize);
    local v15 = v3.useCallback(function(v13)
        local l_subcategory_0 = v13.Section.subcategory;
        if not l_subcategory_0 then
            v11.OnClickSeeAllAssets(v13.Section.name, v11.CategoryName, v11.SortName);
            return ;
        else
            v11.OnClickSeeAllSubcategories(l_subcategory_0.children, v11.CategoryName, v11.SortName);
            return ;
        end;
    end, {
        v11.OnClickSeeAllSubcategories, 
        v11.OnClickSeeAllAssets, 
        v11.CategoryName, 
        v11.SortName
    });
    local v17 = v3.useCallback(function(v16)
        v11.OnClickSubcategory(v16.name, v16, v11.CategoryName, v11.SortName, v16.queryParams);
    end, {
        v11.CategoryName, 
        v11.SortName
    });
    if v12 and #v12 > 0 then
        return v3.createElement(v4, {
            Sections = v12, 
            PageSize = v11.InitialPageSize, 
            OnSeeAllActivated = v15, 
            OnSwimlaneTileActivated = v17, 
            AssetLogicWrapperProps = {
                CanInsertAsset = v11.CanInsertAsset, 
                LogAssetImpression = v11.LogAssetImpression, 
                OnAssetPreviewButtonClicked = v11.OnAssetPreviewButtonClicked, 
                TryInsert = v11.TryInsert, 
                TryOpenAssetConfig = v11.TryOpenAssetConfig
            }
        });
    else
        return nil;
    end;
end;
