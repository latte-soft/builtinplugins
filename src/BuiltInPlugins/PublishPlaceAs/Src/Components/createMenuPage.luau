local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_StyleModifier_0 = v4.Util.StyleModifier;
local v8 = require(l_Parent_0.Src.Actions.AddChange);
return function(v9, v10)
    local v11 = v1.PureComponent:extend("Page");
    v11.init = function(v12)
        v12.state = {
            StyleModifier = nil, 
            showDialog = false
        };
        v12.onMouseEnter = function()
            if v12.state.StyleModifier == nil then
                v12:setState({
                    StyleModifier = l_StyleModifier_0.Hover
                });
            end;
        end;
        v12.onMouseLeave = function()
            if v12.state.StyleModifier == l_StyleModifier_0.Hover then
                v12:setState({
                    StyleModifier = v1.None
                });
            end;
        end;
    end;
    v11.didMount = function(v13)
        if v13.props.GetPlayerAcceptances then
            v13.props.GetPlayerAcceptances((v13.props.API:get()));
        end;
    end;
    v11.render = function(v14)
        local l_props_0 = v14.props;
        local v16 = not not l_props_0.Content and l_props_0.Content(v14) or {};
        local l_LayoutOrder_0 = l_props_0.LayoutOrder;
        local l_AddLayout_0 = l_props_0.AddLayout;
        local l_ContentHeightChanged_0 = l_props_0.ContentHeightChanged;
        return v1.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            LayoutOrder = l_LayoutOrder_0
        }, v3.Dictionary.join(v16, {
            Padding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 20), 
                PaddingRight = UDim.new(0, 20)
            }), 
            Layout = l_AddLayout_0 and v1.createElement("UIListLayout", {
                Padding = UDim.new(0, 15), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                [v1.Change.AbsoluteContentSize] = function(v20)
                    if l_ContentHeightChanged_0 then
                        l_ContentHeightChanged_0(v20.AbsoluteContentSize.y);
                    end;
                end
            })
        }));
    end;
    return v2.connect(function(v21, _)
        if v9 then
            return v9(function(v23)
                if v21.NewGameSettings.changed[v23] ~= nil then
                    return v21.NewGameSettings.changed[v23];
                else
                    return v21.NewGameSettings.current[v23];
                end;
            end, v21);
        else
            return ;
        end;
    end, function(v24)
        if v10 then
            return v10(function(v25)
                return function(v26)
                    v24(v8(v25, v26));
                end;
            end, v24);
        else
            return ;
        end;
    end)((l_withContext_0({
        Stylizer = l_ContextServices_0.Stylizer, 
        Localization = l_ContextServices_0.Localization, 
        Mouse = l_ContextServices_0.Mouse, 
        API = l_ContextServices_0.API
    })(v11)));
end;
