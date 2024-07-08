local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_LuaMeshEditingModuleContext_0 = v2.Contexts.LuaMeshEditingModuleContext;
local l_TransparencySlider_0 = v2.Components.TransparencySlider;
local l_AccessoryAndBodyToolShared_0 = v2.Util.AccessoryAndBodyToolShared;
local l_TransparencyUtil_0 = l_AccessoryAndBodyToolShared_0.TransparencyUtil;
local _ = l_AccessoryAndBodyToolShared_0.ItemCharacteristics;
local _ = require(l_Parent_0.Src.Thunks.ChangeCageTransparency);
local l_EditingItemContext_0 = v2.Contexts.EditingItemContext;
local v10 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v10.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = v10.UI.Pane;
local _ = require(l_Parent_0.Src.Util.Constants);
local v15 = v1.PureComponent:extend("EditTransparencyView");
local _ = v10.Util.LayoutOrderIterator;
v15.init = function(v17)
    v17.setValue = function(v18)
        local l_LuaMeshEditingModuleContext_1 = v17.props.LuaMeshEditingModuleContext;
        if l_LuaMeshEditingModuleContext_1 then
            l_LuaMeshEditingModuleContext_1:setTransparency(l_TransparencyUtil_0.transparencyFromLCEditorToProperty(v18));
        end;
    end;
end;
v15.render = function(v20)
    local l_props_0 = v20.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v23 = l_props_0.EditingItemContext:getItem();
    local l_LuaMeshEditingModuleContext_2 = v20.props.LuaMeshEditingModuleContext;
    local l_IsCageSlider_0 = l_props_0.IsCageSlider;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v27 = 0;
    if not l_IsCageSlider_0 then
        v27 = l_TransparencyUtil_0.getTransparency(v23);
    elseif l_LuaMeshEditingModuleContext_2 then
        v27 = l_TransparencyUtil_0.transparencyFromPropertyToLCEditor(l_LuaMeshEditingModuleContext_2:getTransparency());
    end;
    return v1.createElement(l_TransparencySlider_0, {
        Value = v27, 
        Height = l_Stylizer_0.SliderHeight, 
        LayoutOrder = l_LayoutOrder_0, 
        Item = if l_IsCageSlider_0 then nil else v23, 
        SetValue = if not l_IsCageSlider_0 then nil else v20.setValue
    });
end;
return (l_withContext_0({
    LuaMeshEditingModuleContext = l_LuaMeshEditingModuleContext_0, 
    Stylizer = l_ContextServices_0.Stylizer, 
    EditingItemContext = l_EditingItemContext_0
})(v15));
