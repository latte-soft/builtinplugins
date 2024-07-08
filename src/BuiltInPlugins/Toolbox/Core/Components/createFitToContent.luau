local l_Packages_0 = script.Parent.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Roact);
local v2 = require(l_Packages_0.Cryo);
return function(v3, v4, v5)
    local v6 = v1.Component:extend((("FitComponent(%s, %s)"):format(v3, v4)));
    local v7 = v5.BorderSize or 0;
    v5 = v2.Dictionary.join(v5, {
        BorderSize = v2.None
    });
    v6.init = function(v8)
        v8.layoutRef = v1.createRef();
        v8.containerRef = v1.createRef();
        v8.layoutProps = v2.Dictionary.join(v5, {
            [v1.Ref] = v8.layoutRef, 
            [v1.Change.AbsoluteContentSize] = function()
                if v8.layoutRef.current ~= nil and v8.containerRef.current ~= nil then
                    v8:resizeContainer();
                end;
            end
        });
    end;
    v6.render = function(v9)
        assert(v9.props.Size == nil, "Size must not be specified");
        local l_join_0 = v2.Dictionary.join;
        local v11 = {
            Layout = v1.createElement(v4, v9.layoutProps)
        };
        local v12 = false;
        if v7 > 0 then
            v12 = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v7), 
                PaddingBottom = UDim.new(0, v7), 
                PaddingLeft = UDim.new(0, v7), 
                PaddingRight = UDim.new(0, v7)
            });
        end;
        v11.Padding = v12;
        return v1.createElement(v3, (v2.Dictionary.join(v9.props, {
            [v1.Children] = l_join_0(v11, v9.props[v1.Children]), 
            [v1.Ref] = v9.containerRef
        })));
    end;
    v6.didMount = function(v13)
        v13:resizeContainer();
    end;
    v6.resizeContainer = function(v14)
        v14.containerRef.current.Size = UDim2.new(1, 0, 0, v14.layoutRef.current.AbsoluteContentSize.Y + v7 * 2);
    end;
    return v6;
end;
