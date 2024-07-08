return function(v0, v1)
    local l_Parent_0 = script.Parent.Parent;
    local v3 = require(l_Parent_0.Packages.Roact);
    local v4 = require(l_Parent_0.Src.MainPlugin);
    local v5 = nil;
    local function _()
        v0.Name = l_Parent_0.Name;
        v5 = v3.mount((v3.createElement(v4, {
            Plugin = v0, 
            ClickableWhenViewportHidden = true, 
            pluginLoaderContext = v1
        })));
    end;
    v0.Unloading:Connect(function()
        if v5 then
            v3.unmount(v5);
            v5 = nil;
        end;
    end);
    v0.Name = l_Parent_0.Name;
    v5 = v3.mount((v3.createElement(v4, {
        Plugin = v0, 
        ClickableWhenViewportHidden = true, 
        pluginLoaderContext = v1
    })));
end;
