local mcs = {}
mcs.Zone = {};
mcs.CoreGui = game:FindFirstChild('CoreGui') or game:GetService('Players').LocalPlayer.PlayerGui;
mcs.Folder = Instance.new('Folder',mcs.CoreGui);

function mcs:GetHash() : string
	return string.gsub(tostring(tick()),'..',function() return string.char(math.random(50,120)) end)
end;

function mcs:GetSize(Instance : Model & BasePart) : UDim2
	if Instance:IsA('BasePart') then
		return UDim2.new(Instance.Size.X + 1,10,Instance.Size.Y + 1,10);
	elseif Instance:IsA('Model') then
		local world = Instance:GetModelSize();

		return UDim2.new(world.X + 1,10,world.Y + 1,10);
	end;
end;

function mcs:GetDistance(target : Vector3) : number
	return (workspace.CurrentCamera.Focus.Position - target).Magnitude
end;

function mcs.new(config)
	config = config or {};
	config.ZoneId = config.ZoneId or mcs:GetHash();
	config.Defalut = config.Defalut or {
		HeadTextColor = Color3.fromRGB(255, 255, 255),
		ContentTextColor = Color3.fromRGB(255, 255, 255),
		HealthBar = true,
		RedDot = true,
		BackgroundColor = Color3.fromRGB(255, 255, 255),
	};
	
	mcs.Zone[config.ZoneId] = {};
	
	function config:Create(target : BasePart | Model , NewConfig)
		local Size = mcs:GetSize(target);
		local IndexFuncs = {
			Enable = true,	
		};
		
		IndexFuncs.Threads = {};
		
		NewConfig = NewConfig or table.clone(config.Defalut);
		
		local BillboardGui = Instance.new("BillboardGui")
		local bg = Instance.new("Frame")
		local rline = Instance.new("Frame")
		local lline = Instance.new("Frame")
		local tline = Instance.new("Frame")
		local bline = Instance.new("Frame")
		local header = Instance.new("TextLabel")
		local content = Instance.new("TextLabel")
		local healthbar = Instance.new("Frame")
		local Frame = Instance.new("Frame")
		local dot = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		
		rawset(mcs.Zone[config.ZoneId] , target , IndexFuncs);
		
		BillboardGui.Parent = target
		BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		BillboardGui.Active = true
		BillboardGui.Adornee = target
		BillboardGui.AlwaysOnTop = true
		BillboardGui.LightInfluence = 1.000
		BillboardGui.Size = Size;
		BillboardGui.Name = mcs:GetHash();
		
		bg.Name = mcs:GetHash()
		bg.Parent = BillboardGui
		bg.BackgroundColor3 = NewConfig.BackgroundColor;
		bg.BackgroundTransparency = 0.800
		bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
		bg.BorderSizePixel = 0
		bg.Size = UDim2.new(1, 0, 1, 0)
		bg.ZIndex = -1

		rline.Name = mcs:GetHash()
		rline.Parent = bg
		rline.AnchorPoint = Vector2.new(1, 0)
		rline.BackgroundColor3 = NewConfig.BackgroundColor;
		rline.BorderColor3 = Color3.fromRGB(0, 0, 0)
		rline.BorderSizePixel = 0
		rline.Position = UDim2.new(1, 0, 0, 0)
		rline.Size = UDim2.new(0, 1, 1, 0)

		lline.Name = mcs:GetHash()
		lline.Parent = bg
		lline.AnchorPoint = Vector2.new(0, 1)
		lline.BackgroundColor3 = NewConfig.BackgroundColor;
		lline.BorderColor3 = Color3.fromRGB(0, 0, 0)
		lline.BorderSizePixel = 0
		lline.Position = UDim2.new(0, 0, 1, 0)
		lline.Size = UDim2.new(0, 1, 1, 0)

		tline.Name = mcs:GetHash()
		tline.Parent = bg
		tline.BackgroundColor3 = NewConfig.BackgroundColor;
		tline.BorderColor3 = Color3.fromRGB(0, 0, 0)
		tline.BorderSizePixel = 0
		tline.Size = UDim2.new(1, 0, 0, 1)

		bline.Name = mcs:GetHash()
		bline.Parent = bg
		bline.AnchorPoint = Vector2.new(0, 1)
		bline.BackgroundColor3 = NewConfig.BackgroundColor;
		bline.BorderColor3 = Color3.fromRGB(0, 0, 0)
		bline.BorderSizePixel = 0
		bline.Position = UDim2.new(0, 0, 1, 0)
		bline.Size = UDim2.new(1, 0, 0, 1)

		header.Name = mcs:GetHash()
		header.Parent = BillboardGui
		header.AnchorPoint = Vector2.new(0.5, 1)
		header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		header.BackgroundTransparency = 1.000
		header.BorderColor3 = Color3.fromRGB(0, 0, 0)
		header.BorderSizePixel = 0
		header.Position = UDim2.new(0.5, 0, 0, 1)
		header.Size = UDim2.new(0, 200, 0, 15)
		header.Font = Enum.Font.GothamMedium
		header.Text = ""
		header.TextColor3 = NewConfig.HeadTextColor;
		header.TextScaled = true
		header.TextSize = 13.000
		header.TextWrapped = true

		content.Name = mcs:GetHash()
		content.Parent = BillboardGui
		content.AnchorPoint = Vector2.new(0.5, 0)
		content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		content.BackgroundTransparency = 1.000
		content.BorderColor3 = Color3.fromRGB(0, 0, 0)
		content.BorderSizePixel = 0
		content.Position = UDim2.new(0.5, 0, 1, -1)
		content.Size = UDim2.new(0, 200, 0, 15)
		content.Font = Enum.Font.GothamMedium
		content.Text = ""
		content.TextColor3 = NewConfig.ContentTextColor;
		content.TextSize = 9.000
		content.TextWrapped = true

		healthbar.Name = mcs:GetHash()
		healthbar.Parent = BillboardGui
		healthbar.AnchorPoint = Vector2.new(1, 0)
		healthbar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		healthbar.BackgroundTransparency = 0.500
		healthbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		healthbar.BorderSizePixel = 0
		healthbar.ClipsDescendants = true
		healthbar.Position = UDim2.new(0, 1, 0, 0)
		healthbar.Size = UDim2.new(0, 3, 1, 0)
		healthbar.Visible = NewConfig.HealthBar;
		
		Frame.Parent = healthbar
		Frame.AnchorPoint = Vector2.new(0, 1)
		Frame.BackgroundColor3 = Color3.fromRGB(38, 255, 0)
		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0, 0, 1, 0)
		Frame.Size = UDim2.new(1, 0, 0.5, 0)

		dot.Name = mcs:GetHash()
		dot.Parent = BillboardGui
		dot.AnchorPoint = Vector2.new(0.5, 0.5)
		dot.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
		dot.BackgroundTransparency = 0.750
		dot.BorderColor3 = Color3.fromRGB(0, 0, 0)
		dot.BorderSizePixel = 0
		dot.Position = UDim2.new(0.5, 0, 0.5, 0)
		dot.Size = UDim2.new(0.0500000007, 0, 0.0500000007, 0)
		dot.Visible = NewConfig.RedDot;
		
		UICorner.CornerRadius = UDim.new(1, 0)
		UICorner.Parent = dot;
		
		IndexFuncs.Root = target;
		
		function IndexFuncs:SetHeader(text)
			header.Text = text;
		end;
		
		function IndexFuncs:SetContent(text)
			content.Text = text;
		end;
		
		function IndexFuncs:SetHealth(value)
			Frame.Size = UDim2.new(1, 0, value, 0)
		end;
		
		function IndexFuncs:Destroy()
			rawset(mcs.Zone[config.ZoneId] , target , nil);
			
			for i,v in next , IndexFuncs.Threads do
				task.cancel(v);
			end;
			
			BillboardGui:Destroy();
		end;
		
		function IndexFuncs:SetVisible(value)
			if value then
				BillboardGui.Enabled = true;
			else
				BillboardGui.Enabled = false;
			end;
			
			IndexFuncs.Enable = value;
		end;
		
		function IndexFuncs:SetLoop(callback)
			local code = function()
				while true do task.wait();
					if IndexFuncs.Enable then
						local status , message = pcall(callback,IndexFuncs);

						if not status then
							warn(message);
						end;
					end;
				end;
			end;
			
			local thread = coroutine.create(code);
			
			coroutine.resume(thread);
			
			table.insert(IndexFuncs.Threads , thread)
		end;
		
		return IndexFuncs;
	end;

	
	return config;
end;

------------------------
mcs.Folder.Name = mcs:GetHash();
------------------------

return mcs;
