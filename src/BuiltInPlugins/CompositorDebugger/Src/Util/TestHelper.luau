local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v2 = require(l_script_FirstAncestor_0.Packages.Dev.Rhodium);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v4 = require(l_Util_0.CircularBuffer);
local v5 = require(l_Util_0.Constants);
local v6 = require(l_Util_0.debugFlags);
local v7 = {};
v7.findDeepInstance = function(v8, v9)
    if not (not v8 or not v9) and #v9 > 0 then
        local v10 = table.remove(v9, 1);
        if not v10 then
            return nil;
        else
            local l_v8_FirstChild_0 = v8:FindFirstChild(v10);
            if not l_v8_FirstChild_0 then
                return nil;
            else
                return (v7.findDeepInstance(l_v8_FirstChild_0, v9));
            end;
        end;
    else
        return v8;
    end;
end;
v7.getLayerView = function(v12)
    return v7.findDeepInstance(v12, {
        "MainSplitPane", 
        "Contents", 
        "Pane 2", 
        "Child", 
        "LayerData"
    });
end;
v7.getLayerTree = function(v13)
    return v7.findDeepInstance(v13, {
        "MainSplitPane", 
        "Contents", 
        "Pane 1", 
        "Child"
    });
end;
v7.getLayerViewItem = function(v14, v15)
    if v6.ShowLayerID then
        v15 = v15 + 1;
    end;
    return (v7.findDeepInstance(v14, {
        "Contents", 
        "List", 
        "Child", 
        (tostring(v15))
    }));
end;
v7.getLayerViewLabel = function(v16, v17)
    return (v7.findDeepInstance(v7.getLayerViewItem(v16, v17), {
        "1", 
        "Left", 
        "Text"
    }));
end;
v7.getLayerViewValue = function(v18, v19)
    return (v7.findDeepInstance(v7.getLayerViewItem(v18, v19), {
        "2", 
        "Left", 
        "Text"
    }));
end;
v7.getLayerViewTextBox = function(v20, v21)
    return (v7.findDeepInstance(v7.getLayerViewItem(v20, v21), {
        "2", 
        "Left", 
        "Text", 
        "PropertyCell", 
        "Content", 
        "TextInput", 
        "Contents", 
        "TextBox"
    }));
end;
v7.getLayerViewCheckBox = function(v22, v23)
    return (v7.findDeepInstance(v7.getLayerViewItem(v22, v23), {
        "2", 
        "Left", 
        "Text", 
        "Content", 
        "Contents", 
        "TextButton"
    }));
end;
v7.getLayerViewDeleteButton = function(v24, v25)
    return (v7.findDeepInstance(v7.getLayerViewItem(v24, v25), {
        "2", 
        "Right", 
        v5.LAYERVIEW_ACTIONS.Clear
    }));
end;
v7.getLayerViewHistoryButton = function(v26, v27)
    return (v7.findDeepInstance(v7.getLayerViewItem(v26, v27), {
        "2", 
        "Right", 
        v5.LAYERVIEW_ACTIONS.History
    }));
end;
v7.getLayerTreeItem = function(v28, v29)
    return (v7.findDeepInstance(v28, {
        "List", 
        (tostring(v29))
    }));
end;
v7.getLayerPanelTab = function(v30, v31)
    return v7.findDeepInstance(v30, {
        "Tabs", 
        (tostring(v31))
    });
end;
local function v40(v32, v33, v34, v35, v36)
    local v37 = v4.new(60);
    for v38 = 1, v35 do
        local v39 = {
            layerMap = {
                [v32] = {
                    [v33] = {
                        number = math.random(), 
                        vector2 = Vector2.new(math.random(), math.random()), 
                        vector3 = Vector3.new(math.random(), math.random(), math.random())
                    }
                }
            }, 
            timestamp = (v38 - 1) * 0.1
        };
        if v39.layerMap[v32][v33][v34] == nil then
            if v36 == "number" then
                v39.layerMap[v32][v33][v34] = math.random();
            elseif v36 == "Vector2" then
                v39.layerMap[v32][v33][v34] = Vector2.new(math.random(), math.random());
            elseif v36 == "Vector3" then
                v39.layerMap[v32][v33][v34] = Vector3.new(math.random(), math.random(), math.random());
            end;
        end;
        v37:push(v39);
    end;
    return v37;
end;
v7.makeHistoryGraphProperties = function(v41, v42, v43, v44, v45)
    return {
        FrameBuffer = v40(v41, v42, v43, v44, v45), 
        HistoryField = {
            id = v41, 
            section = v42, 
            field = v43
        }
    };
end;
v7.clickComponent = function(v46, v47)
    local v48 = v2.Element.new(v46):getCenter();
    v1.act(function()
        v2.VirtualInput.Mouse.multiClick(v48, v47 or 1);
        v2.VirtualInput.waitForInputEventsProcessed();
    end);
end;
v7.clearText = function(v49)
    local v50 = v2.Element.new(v49);
    v1.act(function()
        v50:click(2);
        v50:sendKey(Enum.KeyCode.Delete);
        task.wait(0.1);
    end);
end;
v7.sendText = function(v51, v52)
    local v53 = v2.Element.new(v51);
    v1.act(function()
        v53:sendText(v52);
        task.wait(0.1);
        v53:sendKey(Enum.KeyCode.Return);
        task.wait(0.1);
    end);
end;
v7.dragComponent = function(v54, v55)
    local v56 = v2.Element.new(v54):getCenter();
    v1.act(function()
        v2.VirtualInput.Mouse.mouseLeftDown(v56);
        v2.VirtualInput.Mouse.mouseDrag(v56, v56 + v55, 5);
        v2.VirtualInput.Mouse.mouseLeftUp(v56);
    end);
end;
v7.getLayerViewCell = function(v57, v58, v59)
    local v60 = v7.findDeepInstance(v7.getLayerViewItem(v57, v58), {
        tostring(v59), 
        "Left", 
        "Text"
    });
    if not v60 then
        return nil;
    else
        return v60.Text;
    end;
end;
v7.checkLayerViewItemLabels = function(v61, v62, v63, v64)
    local v65 = v7.getLayerViewLabel(v61, v62);
    assert(v65);
    if v65.Text ~= v63 then
        return false;
    else
        local v66 = v7.getLayerViewValue(v61, v62);
        if not v64 then
            return v66 == nil;
        else
            assert(v66);
            return v66.Text == v64;
        end;
    end;
end;
v7.getBlendDots = function(v67)
    local v68 = v7.findDeepInstance(v67, {
        "Content", 
        "1"
    });
    if v68 then
        local v69 = {};
        for _, v71 in v68:GetChildren() do
            if v71:IsA("ImageButton") then
                v69[v71.Name] = v71;
            end;
        end;
        return v69;
    else
        return {};
    end;
end;
v7.repeatFlakyTest = function(v72, v73, v74)
    local v75 = v74 or 3;
    for v76 = 1, v75 - 1 do
        if not pcall(v72) then
            print(string.format("WARN: Flaky test [%d/%d]", v76, v75));
            if v73 then
                v73();
            end;
        else
            return ;
        end;
    end;
    v72();
end;
return v7;
