local ESP_Lib = ({});
ESP_Lib.loaded = ({});

local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;

local function DistBetweenAToB(a, b)
	return (a.Position - b.Position).Magnitude;
end;

local function CreateUI()
	local Board = Instance.new("BillboardGui");
	Board.AlwaysOnTop = true;
	
	local Text = Instance.new("TextLabel", Board);
	Text.BackgroundTransparency = 1;
	Text.TextScaled = true;
	
	return Board, Text;
end;

local function GetSize(Instance : Model & BasePart) : UDim2
    if Instance:IsA('BasePart') then
        return UDim2.new(Instance.Size.X + 15,10,Instance.Size.Y + 15,10);
    elseif Instance:IsA('Model') then
        local world = Instance:GetModelSize();

        return UDim2.new(world.X + 15,10,world.Y + 15,10);
    end;
end;

function ESP_Lib.create(Model : Model, Configuration)
	if typeof(Model) ~= "Instance" then 
		print("OUT")
		return;
	end;
	
	local Modules = ({});
	
	local Keywords = Configuration.Keywords or false;
	local ESPColor = Configuration.Colors or false;
	local showDistance = Configuration.Distance or false; 
	
	local BasedPart = nil;
	
	if Model.ClassName == "Model" then 
		if Model.PrimaryPart ~= nil then 
			BasedPart = Model.PrimaryPart;
		else 
			BasedPart = Model:FindFirstChildOfClass("Part");
		end; 
	else 
		BasedPart = Model;
	end;
	
	table.insert(ESP_Lib.loaded, Model);
	
	local BillboardGui, TextLabel = CreateUI();
	
	BillboardGui.Parent = BasedPart;
	BillboardGui.Size = GetSize(BasedPart);
	
	TextLabel.Size = UDim2.new(1, 0, 1, 0);
	TextLabel.TextColor3 = ESPColor; 
	TextLabel.Text = Keywords;
	
	local AutoUpdate = nil;
	if (showDistance) then 
		AutoUpdate = task.spawn(function()
			while true do task.wait()
				local RootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
				
				
				local ModelPivot = Model:GetPivot();
				
				if RootPart and ModelPivot then 
					TextLabel.Text = Keywords .. "\n" .. tostring(math.floor(DistBetweenAToB(RootPart, ModelPivot))) .. "m";
				end;
			end;
		end);
	end;
	
	function Modules:SetText(newTxt)
		print(newTxt)
		Keywords = newTxt;
		TextLabel.Text = newTxt;
	end;

	function Modules:SetColor(newColor)	
		TextLabel.TextColor3 = newColor;
	end;
	
	Modules.Clear = (function()
		if AutoUpdate ~= nil then 
			task.cancel(AutoUpdate);
			AutoUpdate = nil;
		end;
		
		table.remove(ESP_Lib.loaded, table.find(ESP_Lib.loaded, Model));
		BillboardGui:Destroy();
	end);
	
	return Modules;
end;

return ESP_Lib;
