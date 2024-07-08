local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local l_showContextMenu_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.showContextMenu;
local v2 = require(l_script_FirstAncestor_0.Src.Util.ContextMenuUtils);
return function(v3, v4, v5)
    l_showContextMenu_0(v5, {
        {
            Text = v4:getText("ContextMenu", "CopyAssetId"), 
            OnItemClicked = function()
                v2.copyAssetId(v3);
            end
        }, 
        {
            Text = v4:getText("ContextMenu", "ViewInBrowser"), 
            OnItemClicked = function()
                v2.openItemInBrowser(v3);
            end
        }, 
        {
            Text = v4:getText("ContextMenu", "EditAsset"), 
            OnItemClicked = function()
                v2.openAssetConfig(v3);
            end
        }
    });
end;
