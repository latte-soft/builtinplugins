local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v2 = require(l_script_FirstAncestor_0.Packages.Dev.Rhodium);
return function(v3)
    local v4 = {
        isOpen = function()
            return v3.subWindows()[1];
        end, 
        getSubWindow = function()
            return v3.getSubWindow(1);
        end
    };
    v4.getEntry = function(v5)
        return v4.getSubWindow().SolidBackground.Contents.Contents.Contents.Scroller[v5];
    end;
    v4.getWarningText = function(v6)
        local l_Warning_0 = v4.getEntry(v6).ItemNames:FindFirstChild("Warning");
        return l_Warning_0 and l_Warning_0.Text;
    end;
    v4.openDropdown = function(v8)
        local l_SelectInput_0 = v8.SelectInput;
        v1.act(function()
            v2.Element.new(l_SelectInput_0):click();
        end);
        local l_Container_0 = v4.getSubWindow().TopLevelDetector.ScrollBlocker.Menu.Contents.Container;
        local v11 = {};
        for _, v13 in l_Container_0:GetChildren() do
            if v13:IsA("Frame") then
                local l_TextButton_0 = v13.Contents.TextButton;
                v11[tonumber(v13.Name)] = {
                    label = l_TextButton_0.Label.Text, 
                    click = function()
                        for _, v16 in l_Container_0:GetChildren() do
                            if not (not (v16 ~= v13) or not v16:IsA("Frame")) then
                                v16.Visible = false;
                            end;
                        end;
                        v1.act(function()
                            v2.Element.new(l_TextButton_0):click();
                        end);
                    end
                };
            end;
        end;
        return v11;
    end;
    v4.clickMatchingDropdownEntry = function(v17, v18)
        for _, v20 in v17, nil, nil do
            if v20.label:match(v18) then
                v20.click();
                return ;
            end;
        end;
        local v21 = {
            ("Couldn't find dropdown entry that matched pattern \"%*\""):format(v18), 
            "Found the following labels:"
        };
        for _, v23 in v17, nil, nil do
            table.insert(v21, (("- %*"):format(v23.label)));
        end;
        error(table.concat(v21, "\n"));
    end;
    v4.openAmbiguousAssetTypeDropdown = function(v24)
        return v4.openDropdown(v24.Children.Dropdown.DropdownMenu);
    end;
    v4.openLoneMeshPartAssetTypeDropdown = function(v25)
        return v4.openDropdown(v25.Children.Children.AssetTypeDropdown);
    end;
    v4.attachmentDropdownExists = function(v26)
        return v26.Children.Children:FindFirstChild("AttachmentDropdown") ~= nil;
    end;
    v4.openAttachmentDropdown = function(v27)
        return v4.openDropdown(v27.Children.Children.AttachmentDropdown);
    end;
    v4.clickOk = function()
        v1.act(function()
            v3.clickStyledDialogButton(v4.getSubWindow(), 1);
        end);
    end;
    return v4;
end;
