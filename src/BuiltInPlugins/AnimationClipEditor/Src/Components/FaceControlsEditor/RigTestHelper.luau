return {
    buildTestRig = function()
        local l_Model_0 = Instance.new("Model");
        local v1 = Instance.new("Part", l_Model_0);
        v1.Name = "HumanoidRootPart";
        local v2 = Instance.new("Part", l_Model_0);
        v2.Name = "UpperTorso";
        local v3 = Instance.new("Part", l_Model_0);
        v3.Name = "Head";
        local v4 = Instance.new("Motor6D", v2);
        v4.Part0 = v1;
        v4.Part1 = v2;
        local v5 = Instance.new("Motor6D", v3);
        v5.Part0 = v2;
        v5.Part1 = v3;
        Instance.new("Attachment", v1).Name = "RootAttachment";
        Instance.new("Attachment", v2).Name = "RootAttachment";
        local v6 = Instance.new("Attachment", v2);
        v6.Name = "NeckAttachment";
        local v7 = Instance.new("Attachment", v3);
        v7.Name = "NeckAttachment";
        local v8 = Instance.new("BallSocketConstraint", l_Model_0);
        v8.Enabled = false;
        v8.Attachment0 = v6;
        v8.Attachment1 = v7;
        return l_Model_0;
    end
};
