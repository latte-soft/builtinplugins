local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Components.SurveyDialog.Stars);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_UI_0 = v2.UI;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v15 = {
    "Teeth", 
    "Mouth", 
    "Eyes", 
    "Eyebrows", 
    "Eyelashes", 
    "Hair"
};
return function(v16)
    local v17 = l_Localization_0:use();
    local v18 = l_Stylizer_0:use("Survey");
    local v19 = l_LayoutOrderIterator_0.new();
    local v26 = v3.useCallback(function(v20)
        v16.setResults(function(v21)
            local v22 = table.clone(v21);
            local v23 = table.clone(v22.problems);
            if not v23[v20] then
                v23[v20] = true;
            else
                v23[v20] = nil;
            end;
            if v20 == "HeadLooksBad" then
                for _, v25 in v15, nil, nil do
                    v23[("Head%*"):format(v25)] = nil;
                end;
            end;
            v22.problems = v23;
            return v22;
        end);
    end, {});
    local function v28(v27)
        return v3.createElement(l_Checkbox_0, {
            Key = v27, 
            Checked = v16.results.problems[v27], 
            LayoutOrder = v19:getNextOrder(), 
            OnClick = v26, 
            Text = v17:getText("Survey", (("Problem%*"):format(v27))), 
            TextWrapped = true
        });
    end;
    return v3.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        Spacing = v18.Spacing, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        [v3.Change.AbsoluteSize] = function(v29)
            v16.setHeight(v29.AbsoluteSize.Y);
        end
    }, {
        PleaseRateYourExperience = v3.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v19:getNextOrder(), 
            Style = "Bold", 
            Text = v17:getText("Survey", "PleaseRateYourExperience")
        }), 
        Stars = v3.createElement(v4, {
            layoutOrder = v19:getNextOrder(), 
            rating = v16.results.rating, 
            setRating = v3.useCallback(function(v30)
                v16.setResults(function(v31)
                    local v32 = table.clone(v31);
                    v32.rating = v30;
                    return v32;
                end);
            end, {})
        }), 
        Gap = v3.createElement("Frame", {
            LayoutOrder = v19:getNextOrder()
        }), 
        UserIntent = v3.createElement(v3.Fragment, {}, {
            IntentForResults = v3.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v19:getNextOrder(), 
                Style = "Bold", 
                Text = v17:getText("Survey", "IntentForResults")
            }), 
            UseAsNPC = v28("UseAsNPC"), 
            UseForMarketplace = v28("UseForMarketplace"), 
            Gap1 = v3.createElement("Frame", {
                LayoutOrder = v19:getNextOrder()
            })
        }), 
        WhatAreasShouldWeImproveOn = v3.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v19:getNextOrder(), 
            Style = "Bold", 
            Text = v17:getText("Survey", "WhatAreasShouldWeImproveOn")
        }), 
        CharacterDoesntBend = v28("CharacterDoesntBend"), 
        CharacterWeirdBend = v28("CharacterWeirdBend"), 
        BadLayeredClothing = v28("BadLayeredClothing"), 
        Heads = v3.createElement(v3.Fragment, {}, {
            HeadLooksBad = v28("HeadLooksBad"), 
            SpecificProblems = v16.results.problems.HeadLooksBad and v3.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v19:getNextOrder(), 
                Spacing = v18.Spacing, 
                Layout = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v18.HeadIndent)
                }), 
                Specifically = v3.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v19:getNextOrder(), 
                    Text = v17:getText("Survey", "Specifically")
                }), 
                SpecificProblems = v3.createElement(v3.Fragment, {}, v1.map(v15, function(v33)
                    return v28((("Head%*"):format(v33))), v33;
                end))
            })
        }), 
        Gap2 = v3.createElement("Frame", {
            LayoutOrder = v19:getNextOrder()
        }), 
        Message = v3.createElement(l_TextInput_0, {
            MultiLine = true, 
            LayoutOrder = v19:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, v18.MessageHeight), 
            PlaceholderText = v17:getText("Survey", "MessagePlaceholder"), 
            Text = v16.results.message, 
            OnTextChanged = v3.useCallback(function(v34)
                v16.setResults(function(v35)
                    local v36 = table.clone(v35);
                    v36.message = v34;
                    return v36;
                end);
            end, {})
        })
    });
end;
