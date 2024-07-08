local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Packages.Cryo);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.ClearMaterial);
local v6 = require(l_Actions_0.ClearMaterialWrapper);
local v7 = require(l_Actions_0.SetExpandedPane);
local v8 = require(l_Actions_0.SetMaterial);
local v9 = require(l_Actions_0.DEPRECATED_SetMaterialAsTool);
local v10 = require(l_Actions_0.SetMaterialBrowserLayout);
local v11 = require(l_Actions_0.SetMaterialList);
local v12 = require(l_Actions_0.SetMaterialOverride);
local v13 = require(l_Actions_0.SetMaterialOverrides);
local v14 = require(l_Actions_0.SetMaterialStatus);
local v15 = require(l_Actions_0.SetMaterialTileSize);
local v16 = require(l_Actions_0.SetMaterialVariant);
local v17 = require(l_Actions_0.SetMaterialWrapper);
local v18 = require(l_Actions_0.SetMenuHover);
local v19 = require(l_Actions_0.SetPath);
local v20 = require(l_Actions_0.SetSearch);
local v21 = require(l_Actions_0.SetUse2022Materials);
local v22 = require(l_Actions_0.SetViewType);
local v23 = require(l_Parent_0.Src.Util.CompareMaterials);
local v24 = require(l_Parent_0.Src.Resources.Constants.getSettingsNames);
local v25 = require(l_Parent_0.Src.Flags.getFFlagMaterialActionAsTool);
local v26 = v24();
local v27 = {};
for _, v29 in pairs(v26) do
    v27[v29] = true;
end;
return (v2.createReducer({
    DEPRECATED_ActiveAsTool = not not v25() and nil, 
    ExpandedPane = v27, 
    MaterialBrowserLayout = {
        BaseShowSideBar = true, 
        OverrideShowSideBar = false, 
        SideBarWidth = 200
    }, 
    MaterialOverride = {}, 
    MaterialOverrides = {}, 
    Materials = {}, 
    MaterialStatus = {}, 
    MaterialTileSize = 130, 
    MenuHover = false, 
    Path = {}, 
    Search = "", 
    Use2022Materials = false, 
    ViewType = "Grid"
}, {
    [v5.name] = function(v30, _)
        return v3.Dictionary.join(v30, {
            Material = v3.None
        });
    end, 
    [v6.name] = function(v32, v33)
        local v34 = if not v33.MaterialWrapper.MaterialVariant then v33.MaterialWrapper.Material else v33.MaterialWrapper.MaterialVariant;
        return v3.Dictionary.join(v32, {
            Materials = v3.Dictionary.join(v32.Materials, {
                [v34] = v3.None
            }), 
            Material = if not v23(v32.Materials[v34], v32.Material) then nil else v3.None
        });
    end, 
    [v7.name] = function(v35, v36)
        return v3.Dictionary.join(v35, {
            ExpandedPane = v3.Dictionary.join(v35.ExpandedPane, {
                [v36.PaneName] = v36.ExpandedPaneState
            })
        });
    end, 
    [v8.name] = function(v37, v38)
        return v3.Dictionary.join(v37, {
            Material = v38.Material
        });
    end, 
    [v9.name] = not v25() and function(v39, v40)
        return v3.Dictionary.join(v39, {
            DEPRECATED_ActiveAsTool = v40.DEPRECATED_ActiveAsTool
        });
    end or nil, 
    [v10.name] = function(v41, v42)
        return v3.Dictionary.join(v41, {
            MaterialBrowserLayout = v3.Dictionary.join(v41.MaterialBrowserLayout, v42.MaterialBrowserLayout)
        });
    end, 
    [v11.name] = function(v43, v44)
        return v3.Dictionary.join(v43, {
            MaterialList = v44.MaterialList
        });
    end, 
    [v12.name] = function(v45, v46)
        return v3.Dictionary.join(v45, {
            MaterialOverride = v3.Dictionary.join(v45.MaterialOverride, {
                [v46.Material] = v46.Index
            })
        });
    end, 
    [v13.name] = function(v47, v48)
        return v3.Dictionary.join(v47, {
            MaterialOverrides = v3.Dictionary.join(v47.MaterialOverrides, {
                [v48.Material] = v48.Overrides
            })
        });
    end, 
    [v14.name] = function(v49, v50)
        return v3.Dictionary.join(v49, {
            MaterialStatus = v3.Dictionary.join(v49.MaterialStatus, {
                [v50.Material] = v50.MaterialStatus
            })
        });
    end, 
    [v15.name] = function(v51, v52)
        return v3.Dictionary.join(v51, {
            MaterialTileSize = v52.MaterialTileSize
        });
    end, 
    [v16.name] = function(v53, v54)
        return v3.Dictionary.join(v53, {
            Material = v53.Materials[v54.MaterialVariant]
        });
    end, 
    [v17.name] = function(v55, v56)
        local v57 = if not v56.MaterialWrapper.MaterialVariant then v56.MaterialWrapper.Material else v56.MaterialWrapper.MaterialVariant;
        return v3.Dictionary.join(v55, {
            Materials = v3.Dictionary.join(v55.Materials, {
                [v57] = v56.MaterialWrapper
            }), 
            Material = if not not v55.Material and v23(v55.Materials[v57], v55.Material) then v56.MaterialWrapper else nil
        });
    end, 
    [v18.name] = function(v58, v59)
        return v3.Dictionary.join(v58, {
            MenuHover = v59.MenuHover
        });
    end, 
    [v19.name] = function(v60, v61)
        return v3.Dictionary.join(v60, {
            Path = v61.Path
        });
    end, 
    [v20.name] = function(v62, v63)
        return v3.Dictionary.join(v62, {
            Search = v63.Search
        });
    end, 
    [v22.name] = function(v64, v65)
        return v3.Dictionary.join(v64, {
            ViewType = v65.ViewType
        });
    end, 
    [v21.name] = function(v66, v67)
        return v3.Dictionary.join(v66, {
            Use2022Materials = v67.Use2022Materials
        });
    end
}));
