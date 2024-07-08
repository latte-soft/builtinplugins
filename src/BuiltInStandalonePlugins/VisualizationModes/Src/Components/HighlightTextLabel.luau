local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local l_TextService_0 = game:GetService("TextService");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local l_TextLabel_0 = v3.UI.TextLabel;
local function v10(v6)
    local v7 = string.sub(v6.Text, v6.StartIndex, v6.FinishIndex);
    local v8 = v4.useMemo(function()
        return l_TextService_0:GetTextSize(string.sub(v6.Text, 1, v6.StartIndex - 1), 16, Enum.Font.SourceSans, Vector2.new(math.huge, math.huge)).X;
    end, {
        v6.StartIndex, 
        v6.Text
    });
    local v9 = v4.useMemo(function()
        return l_TextService_0:GetTextSize(string.sub(v6.Text, 1, v6.FinishIndex), 16, Enum.Font.SourceSans, Vector2.new(math.huge, math.huge)).X;
    end, {
        v6.FinishIndex, 
        v6.Text
    });
    return v4.createElement(v4.Fragment, {}, {
        Highlight = v4.createElement("Frame", {
            [v4.Tag] = "VisualizationModes-Highlight", 
            Size = UDim2.fromOffset(v9 - v8, 24), 
            Position = UDim2.new(0, v8, 0.5, 0), 
            ZIndex = 2
        }), 
        HighlightTextLabel = v4.createElement(l_TextLabel_0, {
            Text = v7, 
            [v4.Tag] = "VisualizationModes-Highlight-TextLabel", 
            Size = UDim2.fromOffset(v9 - v8, 24), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, v8, 0.5, 0), 
            ZIndex = 3
        })
    });
end;
local function v19(v11)
    if v11.MatchIndexes == nil then
        return nil;
    else
        local l_Text_0 = v11.Text;
        if l_Text_0 == nil then
            return nil;
        else
            local l_MatchIndexes_0 = v11.MatchIndexes;
            local v14 = {};
            local v15 = nil;
            local v16 = nil;
            for _, v18 in l_MatchIndexes_0, nil, nil do
                if v15 == nil then
                    v15 = v18;
                    v16 = v18;
                elseif v16 ~= nil and v18 == v16 + 1 then
                    v16 = v18;
                elseif v15 ~= nil and v16 ~= nil then
                    table.insert(v14, v4.createElement(v10, {
                        Text = l_Text_0, 
                        StartIndex = v15, 
                        FinishIndex = v16
                    }));
                    v15 = v18;
                    v16 = v18;
                end;
            end;
            if v15 ~= nil and v16 ~= nil then
                table.insert(v14, v4.createElement(v10, {
                    Text = l_Text_0, 
                    StartIndex = v15, 
                    FinishIndex = v16
                }));
            end;
            return v4.createElement(v4.Fragment, {}, v14);
        end;
    end;
end;
return function(v20)
    return v4.createElement("Frame", {
        LayoutOrder = v20.LayoutOrder, 
        [v4.Tag] = "VisualizationModes-TextLabel-Container"
    }, {
        TextLabel = v4.createElement(l_TextLabel_0, {
            Text = v20.Text, 
            [v4.Tag] = v3.Styling.joinTags("VisualizationModes-TextLabel", v20[v4.Tag]), 
            TextTruncate = Enum.TextTruncate.SplitWord, 
            ZIndex = 2
        }), 
        HighlightGroup = v4.createElement(v19, {
            Text = v20.Text, 
            MatchIndexes = v20.MatchIndexes
        })
    });
end;
