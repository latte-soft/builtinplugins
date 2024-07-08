local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_Stylizer_0 = v4.Style.Stylizer;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v4.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local v14 = require(l_Parent_0.Src.Actions.ClearMaterial);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local v16 = require(l_Parent_0.Src.Components.MaterialPreview);
local v17 = v2.PureComponent:extend("MaterialHeader");
v17.init = function(v18)
    v18.onClose = function()
        v18.props.dispatchClearMaterial();
    end;
end;
v17.render = function(v19)
    local l_props_0 = v19.props;
    local l_MaterialHeader_0 = l_props_0.Stylizer.MaterialHeader;
    local l_Material_0 = l_props_0.Material;
    if l_Material_0 then
        return v2.createElement(l_Pane_0, {
            LayoutOrder = l_props_0.LayoutOrder, 
            Size = l_MaterialHeader_0.HeaderSize
        }, {
            Preview = v2.createElement(v16, {
                BackgroundColor = l_MaterialHeader_0.HeaderBackground, 
                DisableZoom = true, 
                LayoutOrder = 1, 
                Material = l_Material_0.Material, 
                MaterialVariant = l_Material_0.MaterialVariant, 
                Position = UDim2.fromOffset(0, 0)
            }), 
            Close = v2.createElement(l_Button_0, {
                OnClick = v19.onClose, 
                Position = l_MaterialHeader_0.ButtonPosition, 
                Size = l_MaterialHeader_0.ButtonSize, 
                Style = l_MaterialHeader_0.ButtonStyle, 
                ZIndex = 2
            }, {
                Image = v2.createElement(l_Image_0, {
                    Style = l_MaterialHeader_0.Close, 
                    Size = l_MaterialHeader_0.ImageSize, 
                    Position = l_MaterialHeader_0.ImagePosition
                })
            })
        });
    else
        return v2.createElement(l_Pane_0);
    end;
end;
return v3.connect(function(v23, v24)
    return {
        Material = v24.MockMaterial or v23.MaterialBrowserReducer.Material
    };
end, function(v25)
    return {
        dispatchClearMaterial = function()
            v25(v14());
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v17)));
