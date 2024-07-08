local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_TextLabel_0 = v2.UI.TextLabel;
local l_join_0 = v2.Dash.join;
local l_TextService_0 = game:GetService("TextService");
local v6 = utf8.char(8230);
local v7 = v1.PureComponent:extend("FooLabel");
v7.init = function(v8)
    v8.textRef = v1.createRef();
    v8.getTextWidth = function(v9)
        local l_current_0 = v8.textRef.current;
        if l_current_0 then
            return l_TextService_0:GetTextSize(v9, l_current_0.TextSize, l_current_0.Font, Vector2.new(math.huge, math.huge)).x;
        else
            return 0;
        end;
    end;
    v8.updateText = function()
        local l_Text_0 = v8.props.Text;
        local l_current_1 = v8.textRef.current;
        if l_current_1 then
            local l_X_0 = l_current_1.AbsoluteSize.X;
            if v8.getTextWidth(l_Text_0) <= l_X_0 then
                l_current_1.Text = l_Text_0;
                l_current_1.TextXAlignment = Enum.TextXAlignment.Left;
                return ;
            else
                l_current_1.TextXAlignment = Enum.TextXAlignment.Right;
                local v14 = 0;
                for v15 = -1, -#l_Text_0, -1 do
                    if not (l_X_0 < v8.getTextWidth(l_Text_0:sub(v15))) then
                        v14 = v15;
                    else
                        break;
                    end;
                end;
                if v14 >= -2 then
                    l_current_1.Text = v6;
                    return ;
                else
                    l_current_1.Text = v6 .. l_Text_0:sub(v14 + 2);
                    return ;
                end;
            end;
        else
            return ;
        end;
    end;
    v8.onAbsoluteSizeChange = function()
        if v8.props[v1.Change.AbsoluteSize] then
            v8.props[v1.Change.AbsoluteSize]();
        end;
        v8.updateText();
    end;
end;
v7.didMount = function(v16)
    v16.updateText();
end;
v7.didUpdate = function(v17, v18, _)
    if v18.Text ~= v17.props.Text then
        v17.updateText();
    end;
end;
v7.render = function(v20)
    return v1.createElement(l_TextLabel_0, l_join_0(v20.props, {
        [v1.Ref] = v20.textRef, 
        [v1.Change.AbsoluteSize] = v20.onAbsoluteSizeChange
    }));
end;
return v7;
