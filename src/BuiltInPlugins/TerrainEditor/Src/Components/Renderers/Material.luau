local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local _ = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.MaterialFramework);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_useCallback_0 = v4.useCallback;
local l_useMemo_0 = v4.useMemo;
local _ = v4.useState;
local l_Button_0 = v2.UI.Button;
local l_Image_0 = v2.UI.Image;
local l_Pane_0 = v2.UI.Pane;
local l_SelectInput_0 = v2.UI.SelectInput;
local l_TextLabel_0 = v2.UI.TextLabel;
local l_MaterialPreview_0 = v3.Components.MaterialPreview;
local l_MaterialGrid_0 = v3.Components.MaterialGrid;
local l_ViewType_0 = v3.Enums.ViewType;
local v18 = require(l_script_FirstAncestor_0.Src.Util.getMaterials);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorGenerationFeature);
local v21 = v20();
local function v23(v22)
    return v4.createElement(l_Pane_0, {
        Padding = 2, 
        Size = v22.Size
    }, {
        Image = v4.createElement(l_Image_0, {
            Style = {
                Image = "rbxasset://studio_svg_textures/Lua/TerrainEditor/Dark/Large/Air.png"
            }
        })
    });
end;
local function v25(v24)
    return v4.createElement(l_Pane_0, {
        Padding = 2, 
        Size = v24.Size
    }, {
        Image = v4.createElement(l_Image_0, {
            Style = {
                Image = "rbxasset://studio_svg_textures/Lua/TerrainEditor/Dark/Large/Water.png"
            }
        })
    });
end;
return function(v26)
    local v27 = l_Stylizer_0:use("MaterialRenderer");
    local l_Schema_0 = v26.Schema;
    local v29 = l_useMemo_0(function()
        return v18(l_Schema_0.AllowAir, l_Schema_0.AllowWater);
    end, {
        l_Schema_0.AllowAir, 
        l_Schema_0.AllowWater
    });
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    if v20() then
        v30 = l_Localization_0:use();
        v31 = l_useMemo_0(function()
            local v33 = {};
            for _, v35 in v29, nil, nil do
                table.insert(v33, {
                    Id = v35.Name, 
                    Label = v30:getText("Materials", v35.Name), 
                    Material = v35
                });
            end;
            return v33;
        end, {
            v29
        });
        v32 = l_useCallback_0(function(v36, v37, v38, _)
            return v4.createElement(l_Button_0, {
                LayoutOrder = v37, 
                OnClick = v38, 
                Size = UDim2.new(1, 0, 0, v27.DropdownItemHeight)
            }, {
                Contents = v4.createElement(l_Pane_0, {
                    Layout = Enum.FillDirection.Horizontal, 
                    Size = UDim2.fromScale(1, 1), 
                    Spacing = v27.Spacing
                }, {
                    PreviewContainer = v4.createElement(l_Pane_0, {
                        LayoutOrder = 1, 
                        Size = UDim2.fromOffset(v27.DropdownItemHeight, v27.DropdownItemHeight)
                    }, {
                        PreviewCenter = v4.createElement(l_Pane_0, {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            Size = UDim2.fromOffset(v27.PreviewSize, v27.PreviewSize)
                        }, {
                            Preview = v4.createElement(l_MaterialPreview_0, {
                                CornerRadius = UDim.new(0, 4), 
                                InitialDistance = 4, 
                                LayoutOrder = 1, 
                                Material = v36.Material, 
                                Size = UDim2.fromScale(1, 1)
                            })
                        })
                    }), 
                    Label = v4.createElement(l_TextLabel_0, {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, -v27.DropdownItemHeight, 1, 0), 
                        Text = v36.Label, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    })
                })
            });
        end, {
            v27
        });
    end;
    local function v41(v40)
        v26.OnChanged(v40.Material);
    end;
    if not v21 or not l_Schema_0.Dropdown then
        return v4.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Horizontal, 
            Size = UDim2.fromScale(1, 0), 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            Grid = v4.createElement(l_MaterialGrid_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                CustomPreviews = {
                    [Enum.Material.Air] = v23, 
                    [Enum.Material.Water] = v25
                }, 
                GridItemSize = v27.GridItemSize, 
                InitialDistance = v27.InitialDistance, 
                OnClick = v41, 
                Items = v29, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                SelectedItem = v26.Value, 
                ShowGridLabels = false, 
                Size = UDim2.fromScale(1, 0), 
                ViewType = l_ViewType_0.Grid
            })
        });
    else
        return v4.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Horizontal, 
            Size = UDim2.fromScale(1, 1), 
            Spacing = v27.Spacing
        }, {
            v4.createElement(l_MaterialPreview_0, {
                CornerRadius = UDim.new(0, 4), 
                InitialDistance = 4, 
                Material = v26.Value, 
                Size = UDim2.fromOffset(v27.PreviewSize, v27.PreviewSize)
            }), 
            v4.createElement(l_SelectInput_0, {
                Items = v31, 
                OnItemActivated = function(v42)
                    v26.OnChanged(v42.Material);
                end, 
                OnRenderItem = v32, 
                SelectedId = v26.Value.Name, 
                Size = UDim2.new(1, -v27.PreviewSize - v27.Spacing, 0, v27.PreviewSize)
            })
        });
    end;
end;
