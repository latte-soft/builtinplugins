local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Separator_0 = l_UI_0.Separator;
local v11 = require(l_script_FirstAncestor_0.Src.Controllers.PresetController);
local v12 = require(l_script_FirstAncestor_0.Src.Components.AssetImportTree);
local v13 = require(l_script_FirstAncestor_0.Src.Components.Properties.ImportConfiguration);
local v14 = require(l_script_FirstAncestor_0.Src.Components.TopBar);
local v15 = require(l_script_FirstAncestor_0.Src.Components.Preview.PreviewContainer);
local v16 = v1.PureComponent:extend("AssetImporterUI");
v16.render = function(v17)
    local l_props_0 = v17.props;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local l_Sizes_0 = l_Stylizer_1.Sizes;
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical
    }, {
        TopBar = v1.createElement(v14, {
            LayoutOrder = 1, 
            Padding = l_Stylizer_1.TopBarPadding, 
            Size = UDim2.new(1, 0, 0, l_Sizes_0.TopBarHeight), 
            FileName = l_props_0.Filename or ""
        }), 
        TopSeparator = v1.createElement(l_Separator_0, {
            DominantAxis = Enum.DominantAxis.Width, 
            LayoutOrder = 2
        }), 
        BottomPanel = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = 3, 
            Position = UDim2.new(1, 0, 0, l_Sizes_0.TopBarHeight), 
            Size = UDim2.new(1, 0, 1, -(l_Sizes_0.TopBarHeight + 2))
        }, {
            LeftPanel = v1.createElement(l_Pane_0, {
                LayoutOrder = 1, 
                Layout = Enum.FillDirection.Vertical, 
                Size = UDim2.new(0.5, 0, 1, 0)
            }, {
                PreviewContainer = v1.createElement(v15, {
                    LayoutOrder = 1
                }), 
                Separator = v1.createElement(l_Separator_0, {
                    DominantAxis = Enum.DominantAxis.Width, 
                    LayoutOrder = 2
                }), 
                TreeContainer = v1.createElement(l_Pane_0, {
                    LayoutOrder = 3, 
                    Size = UDim2.new(1, 0, l_Sizes_0.PreviewRatio, -1)
                }, {
                    TreeView = v1.createElement(v12, {
                        Instances = {
                            l_props_0.ImportTree
                        }, 
                        FileName = l_props_0.Filename or ""
                    })
                })
            }), 
            Separator = v1.createElement(l_Separator_0, {
                DominantAxis = Enum.DominantAxis.Height, 
                LayoutOrder = 2
            }), 
            RightPanel = v1.createElement(l_Pane_0, {
                LayoutOrder = 3, 
                Size = UDim2.new(0.5, -1, 1, 0)
            }, {
                ImportConfiguration = v1.createElement(v13, {
                    ImportItem = l_props_0.SelectedImportItem, 
                    AssetImportSession = l_props_0.AssetImportSession
                })
            })
        })
    });
end;
return v2.connect(function(v21)
    return {
        AssetImportSession = v21.Preview.assetImportSession, 
        ImportTree = v21.Preview.importTree, 
        Filename = v21.Preview.filename, 
        SelectedImportItem = v21.Preview.selectedImportItem
    };
end, nil)((l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    PresetController = v11
})(v16)));
