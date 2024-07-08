local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Components.Sections.VisualizationModeSectionDivider);
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
return function()
    local v6 = l_LayoutOrderIterator_0.new();
    local v7 = {};
    local v8 = {};
    local function _()
        table.insert(v7, v2.createElement(v4, {
            LayoutOrder = v6:getNextOrder()
        }));
    end;
    return table.freeze({
        addSection = function(v10)
            v8[v10.key] = v10.renderContent(v6:getNextOrder(), v10.visible);
            if v10.visible ~= false then
                table.insert(v7, v2.createElement(v4, {
                    LayoutOrder = v6:getNextOrder()
                }));
            end;
        end, 
        getSections = function()
            local v11 = table.clone(v7);
            table.remove(v11);
            return v2.createElement(v2.Fragment, {}, {
                Sections = v2.createElement(v2.Fragment, {}, v8), 
                Dividers = v2.createElement(v2.Fragment, {}, v11)
            });
        end
    });
end;
