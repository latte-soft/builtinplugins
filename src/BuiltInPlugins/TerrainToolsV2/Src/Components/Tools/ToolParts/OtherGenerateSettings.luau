local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Parent_1 = script.Parent;
local v6 = require(l_Parent_1.LabeledElementPair);
local v7 = require(l_Parent_1.LabeledTextInput);
local v8 = require(l_Parent_1.Panel);
local v9 = v2.PureComponent:extend(script.Name);
v9.init = function(v10)
    v10.onSeedFocusLost = function(_, v12)
        if utf8.len(v12) == 0 then
            v10.props.setSeed(v10.props.seed);
            return v10.props.seed;
        else
            v10.props.setSeed(v12);
            return ;
        end;
    end;
end;
v9.render = function(v13)
    local l_Localization_0 = v13.props.Localization;
    return v2.createElement(v8, {
        Title = l_Localization_0:getText("Generate", "OtherSettings"), 
        LayoutOrder = v13.props.LayoutOrder
    }, {
        Seed = v2.createElement(v6, {
            Size = UDim2.new(1, 0, 0, 60), 
            Text = l_Localization_0:getText("Generate", "Seed"), 
            SizeToContent = true
        }, {
            SeedTextBox = v2.createElement(v7, {
                MaxGraphemes = 12, 
                IgnoreNumFormatting = true, 
                Text = v13.props.seed, 
                OnFocusLost = v13.onSeedFocusLost
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v9));
