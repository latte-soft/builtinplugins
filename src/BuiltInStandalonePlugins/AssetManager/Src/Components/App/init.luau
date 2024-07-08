local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_SplitPane_0 = v2.UI.SplitPane;
local v5 = require(script.MainView);
local v6 = require(script.Sidebar);
local l_useState_0 = v1.useState;
local v8 = require(script.styles);
return function(_)
    local v10 = l_LayoutOrderIterator_0.new();
    local v11 = {
        v8:GetAttribute("DefaultSizeSidebar"), 
        v8:GetAttribute("DefaultSizeMainView")
    };
    local v12 = {
        v8:GetAttribute("MinimumSizeSidebar"), 
        v8:GetAttribute("MinimumSizeMainView")
    };
    local v13, v14 = l_useState_0(v11);
    return v1.createElement(l_SplitPane_0, {
        UseScale = true, 
        ClampSize = true, 
        HideBars = true, 
        MinSizes = v12, 
        Sizes = v13, 
        OnSizesChange = function(v15)
            v14(v15);
        end, 
        [v1.Tag] = "App"
    }, {
        v1.createElement(v6, {
            LayoutOrder = v10:getNextOrder()
        }), 
        v1.createElement(v5, {
            LayoutOrder = v10:getNextOrder()
        })
    });
end;
