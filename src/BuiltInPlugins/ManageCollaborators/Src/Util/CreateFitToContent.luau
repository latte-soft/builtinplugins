local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
return function(v3, v4, v5)
    local v6 = v1.Component:extend((("FitComponent(%s, %s)"):format(v3, v4)));
    v6.init = function(v7)
        v7.layoutRef = v1.createRef();
        v7.containerRef = v1.createRef();
        v7.layoutProps = v2.Dictionary.join(v5, {
            [v1.Ref] = v7.layoutRef, 
            [v1.Change.AbsoluteContentSize] = function()
                if v7.layoutRef.current ~= nil and v7.containerRef.current ~= nil then
                    v7:resizeContainer();
                end;
            end
        });
    end;
    v6.render = function(v8)
        assert(v8.props.Size == nil, "Size must not be specified");
        local _ = nil;
        return v1.createElement(v3, (v2.Dictionary.join(v8.props, {
            [v1.Children] = if #v8.props[v1.Children] == 1 and typeof(v8.props[v1.Children][1] == "table") then v2.Dictionary.join({
                Layout = v1.createElement(v4, v8.layoutProps)
            }, v8.props[v1.Children][1]) else v2.Dictionary.join({
                Layout = v1.createElement(v4, v8.layoutProps)
            }, v8.props[v1.Children]), 
            [v1.Ref] = v8.containerRef
        })));
    end;
    v6.didMount = function(v10)
        v10:resizeContainer();
    end;
    v6.didUpdate = function(v11)
        v11:resizeContainer();
    end;
    v6.resizeContainer = function(v12)
        local l_current_0 = v12.layoutRef.current;
        if l_current_0 then
            v12.containerRef.current.Size = UDim2.new(1, 0, 0, l_current_0.AbsoluteContentSize.Y);
        end;
    end;
    return v6;
end;
