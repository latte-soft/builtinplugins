local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local l_Localization_0 = v1.ContextServices.Localization;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_deepCopy_0 = v1.Util.deepCopy;
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_useMemo_0 = v2.useMemo;
local l_useRef_0 = v2.useRef;
local l_useState_0 = v2.useState;
local l_Form_0 = v1.UI.Form;
local l_IconButton_0 = v1.UI.IconButton;
local l_Pane_0 = v1.UI.Pane;
local v15 = require(l_script_FirstAncestor_0.Src.Components.Renderers.Material);
local v16 = require(script.Elevation);
local v17 = require(script.Slope);
local v18 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v19 = require(l_script_FirstAncestor_0.Src.Util.MaterialPresetSettingsHelper);
local l_Category_0 = require(l_script_FirstAncestor_0.Src.Types).Category;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v22 = {
    MaterialIndex = "MaterialIndex", 
    Multiple = "Multiple", 
    None = "None"
};
return function(v23)
    local v24, v25 = l_useState_0(v23.Value);
    l_useEffect_0(function()
        local v26 = l_deepCopy_0(v23.Value);
        if v26.MaterialIndex ~= v24.MaterialIndex then
            v26.MaterialIndex = v24.MaterialIndex;
        end;
        table.sort(v26.MaterialList, function(v27, v28)
            return v27.Priority < v28.Priority;
        end);
        v25(v26);
    end, {
        v23.Value
    });
    local l_Schema_0 = v23.Schema;
    local l_Height_0 = l_Schema_0.Height;
    local v31 = v18:use():getRoot();
    local v32, v33 = l_useState_0(false);
    local v34 = l_Localization_0:use();
    local v35 = l_Stylizer_0:use("MaterialRangesRenderer");
    local v49 = l_useCallback_0(function(v36, v37)
        local function v38(v39, v40)
            local v41 = {};
            for v42, v43 in v40, nil, nil do
                if not v39[v42] or typeof(v39[v42]) ~= typeof(v43) then
                    v41[v42] = v43;
                elseif typeof(v43) == "table" then
                    v41[v42] = v38(v39[v42], v43);
                elseif v43 ~= v39[v42] then
                    v41[v42] = v43;
                end;
            end;
            for v44, _ in v39, nil, nil do
                if not v40[v44] then
                    v41[v44] = false;
                end;
            end;
            if next(v41) == nil then
                return nil;
            else
                return v41;
            end;
        end;
        local v46 = v38(v36, v37);
        if v46 then
            for v47, _ in v46, nil, nil do
                if v47 ~= "MaterialIndex" then
                    return v22.Multiple;
                end;
            end;
            if next(v46) ~= nil then
                return v22.MaterialIndex;
            else
                return v22.None;
            end;
        else
            return v22.None;
        end;
    end);
    local v50 = l_useMemo_0(function()
        return v19.Get(v24, v34);
    end, {
        v24
    });
    local v51, v52 = l_useState_0(false);
    local v53 = l_useRef_0();
    local v54 = l_useCallback_0(function()
        if v53.current then
            if v53.current.AbsoluteSize.Y < v35.MinHeight then
                v52(true);
                return ;
            else
                v52(false);
            end;
        end;
    end, {});
    local v55, v56 = l_useState_0({});
    return v2.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, 32)
    }, {
        Button = v2.createElement(l_IconButton_0, {
            OnClick = function()
                v33(true);
            end, 
            Size = UDim2.fromScale(1, 1), 
            Text = v34:getText(l_Category_0.ElevationSettings, "Edit"), 
            TextXAlignment = Enum.TextXAlignment.Center
        }), 
        Portal = if not not v32 and v31 then v3.createPortal({
            Dismiss = v2.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundColor = v35.BackgroundColor, 
                BackgroundTransparency = 0.2, 
                Position = UDim2.fromOffset(0, 0), 
                ref = v53, 
                Size = UDim2.fromScale(1, 1), 
                [v2.Event.Activated] = function()
                    v33(false);
                    local _, v58 = v49(v24, v23.Value);
                    if v58 ~= v22.None then
                        v23.OnChanged(v24);
                    end;
                end, 
                [v2.Change.AbsoluteSize] = v54
            }), 
            Image = v2.createElement("ImageLabel", v35.CloseButton), 
            Edit = v2.createElement("TextButton", {
                AutomaticSize = if not v51 then Enum.AutomaticSize.Y else nil, 
                AutoButtonColor = false, 
                AnchorPoint = v35.Dialog.AnchorPoint, 
                Position = v35.Dialog.Position, 
                Size = if not v51 then v35.Dialog.Size else v35.Dialog.FillSize, 
                [v2.Change.AbsoluteSize] = v54
            }, {
                Contents = v2.createElement(l_Pane_0, {
                    AutomaticSize = if not v51 then Enum.AutomaticSize.Y else nil, 
                    BackgroundColor = v35.Dialog.BackgroundColor, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Layout = Enum.FillDirection.Vertical, 
                    Padding = v35.Padding, 
                    Size = if not v51 then UDim2.fromScale(1, 0) else UDim2.fromScale(1, 1), 
                    Spacing = v35.Padding
                }, {
                    Form = v2.createElement(l_Form_0, {
                        Expansion = v55, 
                        ExpandByDefault = true, 
                        Items = v50, 
                        LabelHeight = 20, 
                        LabelWidth = UDim.new(0, 100), 
                        LayoutOrder = 1, 
                        OnChange = function(v59)
                            local v60 = v19.Set(v59, v24, l_Height_0);
                            table.sort(v60.MaterialList, function(v61, v62)
                                return v61.Priority < v62.Priority;
                            end);
                            v25(v60);
                            if v49(v24, v60) == v22.Multiple then
                                v23.OnChanged(v60);
                            end;
                        end, 
                        OnExpansionChange = v56, 
                        Renderers = {
                            Elevation = v16, 
                            Material = v15, 
                            Slope = v17
                        }, 
                        Size = if not v51 then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 1, -v35.Reset.Size.Y.Offset), 
                        UseScrollingFrame = v51
                    }), 
                    Button = v2.createElement(l_IconButton_0, {
                        LayoutOrder = 2, 
                        LeftIcon = v35.Reset.Icon, 
                        OnClick = l_Schema_0.OnReset, 
                        Size = v35.Reset.Size, 
                        Text = "Reset"
                    })
                })
            })
        }, v31) else nil
    });
end;
