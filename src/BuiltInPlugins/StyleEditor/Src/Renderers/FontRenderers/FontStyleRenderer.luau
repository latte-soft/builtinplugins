local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.RoactRodux);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.Framework);
local l_joinTags_0 = v3.Styling.joinTags;
local l_Pane_0 = v3.UI.Pane;
local _ = require(l_Parent_0.Src.Renderers.RendererTypes);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
return v1.connect(function(v9)
    return {
        Fonts = v9.Asset.Fonts
    };
end)(function(v10)
    local l_Value_0 = v10.Value;
    local v12 = l_Value_0.Style == Enum.FontStyle.Italic;
    local l_Bold_0 = l_Value_0.Bold;
    return v2.createElement(l_Pane_0, {
        [v2.Tag] = "X-Middle X-PadS X-RowM"
    }, {
        Bold = v2.createElement(l_Pane_0, {
            [v2.Tag] = not l_Bold_0 and "FontStyle X-Corner X-Stroke" or l_joinTags_0("FontStyle X-Corner X-Stroke", "Selected")
        }, {
            BoldButton = v2.createElement("TextButton", {
                [v2.Event.Activated] = function(_)
                    l_Value_0.Weight = if not l_Bold_0 then Enum.FontWeight.Bold else Enum.FontWeight.Regular;
                    v10.OnChanged(l_Value_0);
                end, 
                [v2.Tag] = not l_Bold_0 and "FontStyle ItemTextSize X-Fill" or l_joinTags_0("FontStyle ItemTextSize X-Fill", "Selected")
            })
        }), 
        Italic = v2.createElement(l_Pane_0, {
            [v2.Tag] = not v12 and "FontStyle X-Corner X-Stroke" or l_joinTags_0("FontStyle X-Corner X-Stroke", "Selected")
        }, {
            ItalicButton = v2.createElement("TextButton", {
                [v2.Event.Activated] = function(_)
                    l_Value_0.Style = if not v12 then Enum.FontStyle.Italic else Enum.FontStyle.Normal;
                    v10.OnChanged(l_Value_0);
                end, 
                [v2.Tag] = not v12 and "FontStyle ItemTextSize X-Fill" or l_joinTags_0("FontStyle ItemTextSize X-Fill", "Selected")
            })
        })
    });
end);
