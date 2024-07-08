local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v3.useCallback;
local l_useEffect_0 = v3.useEffect;
local l_useState_0 = v3.useState;
local l_Button_0 = v2.UI.Button;
local l_Image_0 = v2.UI.Image;
local l_Pane_0 = v2.UI.Pane;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v12 = require(script.RangeInputs);
local v13 = require(script.MaterialSlider);
local v14 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v17 = require(l_script_FirstAncestor_0.Src.Util.CreateUniqueKey);
return function(v18)
    local v19 = l_Stylizer_0:use("ElevationRenderer");
    local v20, v21 = l_useState_0(v18.Value);
    local l_Min_0 = v20.Min;
    local l_Max_0 = v20.Max;
    local l_Unit_0 = v20.Unit;
    local l_MaterialIndex_0 = v20.MaterialIndex;
    local _ = v18.Schema;
    local v27 = l_LayoutOrderIterator_0.new();
    local v28 = v17();
    local v29 = {};
    local v30 = table.clone(v20.MaterialList);
    l_useEffect_0(function()
        v21(v18.Value);
    end, {
        v18.Value
    });
    local v31 = l_useCallback_0(function()
        v18.OnChanged(v20);
    end, {
        v20, 
        v18.OnChanged
    });
    local v34 = l_useCallback_0(function(v32)
        local v33 = table.clone(v20);
        v33.MaterialIndex = v32;
        v18.OnChanged(v33);
    end, {
        v20, 
        v30, 
        l_MaterialIndex_0
    });
    local v37 = l_useCallback_0(function(v35)
        local v36 = table.clone(v20);
        v36.MaterialList = table.clone(v30);
        v36.MaterialList[l_MaterialIndex_0] = v1.join(v30[l_MaterialIndex_0], v35);
        v21(v36);
    end, {
        v20, 
        v30, 
        l_MaterialIndex_0
    });
    local v41 = l_useCallback_0(function(v38, v39)
        local v40 = table.clone(v20);
        if v38 then
            v40.Min = v38;
        end;
        if v39 then
            v40.Max = v39;
        end;
        v18.OnChanged(v40);
    end, {
        v20, 
        v18.OnChanged
    });
    local v43 = l_useCallback_0(function()
        local v42 = table.clone(v20);
        v42.MaterialList = table.clone(v30);
        table.insert(v42.MaterialList, if not v42.MaterialList[l_MaterialIndex_0] then {
            Priority = #v42.MaterialList, 
            Material = Enum.Material.Grass, 
            MinHeight = 0, 
            MaxHeight = 1, 
            MinSlope = 0, 
            MaxSlope = 20
        } else table.clone(v42.MaterialList[l_MaterialIndex_0]));
        v42.MaterialIndex = #v42.MaterialList;
        v18.OnChanged(v42);
    end, {
        v20, 
        v30, 
        l_MaterialIndex_0, 
        v18.OnChanged
    });
    local v46 = l_useCallback_0(function()
        local v44 = table.clone(v20);
        v44.MaterialList = table.clone(v30);
        table.remove(v44.MaterialList, l_MaterialIndex_0);
        for v45 = l_MaterialIndex_0, #v44.MaterialList do
            v44.MaterialList[v45].Priority = v45 - 1;
        end;
        v44.MaterialIndex = if l_MaterialIndex_0 == 1 then l_MaterialIndex_0 else l_MaterialIndex_0 - 1;
        v18.OnChanged(v44);
    end, {
        v20, 
        v30, 
        l_MaterialIndex_0, 
        v18.OnChanged
    });
    local v47 = v30[l_MaterialIndex_0];
    v29.RangeInputs = v3.createElement(v12, {
        LayoutOrder = v27:getNextOrder(), 
        Max = l_Max_0, 
        MaxHeight = if not v47 then nil else v47.MaxHeight, 
        Min = l_Min_0, 
        MinHeight = if not v47 then nil else v47.MinHeight, 
        OnChanged = function(v48)
            if not v48.Min and not v48.Max then
                v37(v48);
                return ;
            else
                v41(v48.Min, v48.Max);
                return ;
            end;
        end, 
        Unit = l_Unit_0
    });
    for v49, v50 in v30, nil, nil do
        v29[v28(v50.Material.Name)] = v3.createElement(v13, {
            CanDelete = #v30 > 1, 
            LayoutOrder = v27:getNextOrder(), 
            Material = v50.Material, 
            Max = l_Max_0, 
            MaxHeight = v50.MaxHeight, 
            Min = l_Min_0, 
            MinHeight = v50.MinHeight, 
            OnChanged = v37, 
            OnCommit = v31, 
            OnRemove = v46, 
            OnSelect = function()
                v34(v49);
            end, 
            Selected = l_MaterialIndex_0 == v49
        });
    end;
    if #v30 < v14.MaxMaterialListSize then
        v29.AddMaterial = v3.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v27:getNextOrder(), 
            Spacing = v19.Spacing - 2, 
            Size = UDim2.fromScale(0, 0)
        }, {
            MaterialSliderPlaceHolder = v3.createElement(l_Pane_0, {
                LayoutOrder = v27:getNextOrder(), 
                Size = v19.SliderSize
            }), 
            Add = v3.createElement(l_Button_0, {
                OnClick = v43, 
                LayoutOrder = v27:getNextOrder(), 
                Size = v19.MaterialPreviewSize, 
                Style = "RoundSubtle"
            }, {
                v3.createElement(l_Image_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = v19.ButtonSize, 
                    Style = v19.AddStyle
                })
            })
        });
    end;
    return v3.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Padding = {
            Top = v19.TextBoxSize.Y.Offset / 2, 
            Bottom = v19.TextBoxSize.Y.Offset / 2
        }, 
        Spacing = v19.Spacing
    }, v29);
end;
