local CoreGui = game:FindFirstChild('CoreGui') or game:GetService('Players').LocalPlayer.PlayerGui;
local Tween = game:GetService('TweenService');

local src = Instance.new("ScreenGui");
local MainFrame = Instance.new("Frame");
local UIListLayout = Instance.new("UIListLayout");

src.Name = "src";
src.Parent = CoreGui;
src.ResetOnSpawn = false;
src.ZIndexBehavior = Enum.ZIndexBehavior.Global;

MainFrame.Parent = src;
MainFrame.AnchorPoint = Vector2.new(1, 0);
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
MainFrame.BackgroundTransparency = 1.000;
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0);
MainFrame.BorderSizePixel = 0;
MainFrame.Position = UDim2.new(1, -15, 0, -5);
MainFrame.Size = UDim2.new(0, 219, 0, 42);

UIListLayout.Parent = MainFrame;
UIListLayout.FillDirection = Enum.FillDirection.Horizontal;
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right;
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center;
UIListLayout.Padding = UDim.new(0,15)

local MobileButton = {};

function MobileButton.new(setup)
	setup = setup or {};
	setup.Icon = setup.Icon or "rbxassetid://10734975692";
	setup.Tip = setup.Tip or "Button";
	
	local Meta = {};
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIStroke = Instance.new("UIStroke")
	local Icon = Instance.new("ImageLabel")
	local TextLabel = Instance.new("TextLabel")
	local Button = Instance.new("TextButton")

	Frame.Parent = MainFrame
	Frame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Size = UDim2.new(1, 0, 1, 0)
	Frame.SizeConstraint = Enum.SizeConstraint.RelativeYY

	UICorner.CornerRadius = UDim.new(0.5, 0)
	UICorner.Parent = Frame

	UIStroke.Thickness = 3.500
	UIStroke.Color = Color3.fromRGB(44, 44, 44)
	UIStroke.Parent = Frame
	UIStroke.Enabled = false;
	
	Icon.Name = "Icon"
	Icon.Parent = Frame
	Icon.AnchorPoint = Vector2.new(0.5, 0.5)
	Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Icon.BackgroundTransparency = 1.000
	Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Icon.BorderSizePixel = 0
	Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
	Icon.Size = UDim2.new(0.699999988, 0, 0.699999988, 0)
	Icon.Image = setup.Icon or "rbxassetid://10734975692"
	Icon.ImageTransparency = 0.450

	TextLabel.Parent = Frame
	TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextLabel.Size = UDim2.new(0, 50, 0, 12)
	TextLabel.Font = Enum.Font.GothamBold
	TextLabel.Text = setup.Tip
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextTransparency = 1.000
	TextLabel.TextWrapped = true
	TextLabel.ZIndex = -5;
	
	Button.Name = "Button"
	Button.Parent = Frame
	Button.AnchorPoint = Vector2.new(0.5, 0.5)
	Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Button.BackgroundTransparency = 1.000
	Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Button.BorderSizePixel = 0
	Button.Position = UDim2.new(0.5, 0, 0.5, 0)
	Button.Size = UDim2.new(1, 0, 1, 0)
	Button.ZIndex = 5
	Button.Font = Enum.Font.SourceSans
	Button.Text = ""
	Button.TextColor3 = Color3.fromRGB(0, 0, 0)
	Button.TextSize = 14.000
	Button.TextTransparency = 1.000
	
	Button.MouseEnter:Connect(function()
		UIStroke.Enabled = true;
		
		Tween:Create(TextLabel,TweenInfo.new(0.1),{
			TextTransparency = 0.1,
			Position = UDim2.new(0.5, 0, 1.29999995, 0),
		}):Play();
		
		Tween:Create(TextLabel,TweenInfo.new(0.74),{
			Size = UDim2.new(1.5, 50, 0, 12)
		}):Play();
	end)
	
	Button.MouseLeave:Connect(function()
		UIStroke.Enabled = false;
		
		Tween:Create(TextLabel,TweenInfo.new(0.31),{
			TextTransparency = 1,
			Position = UDim2.new(0.5, 0, 0.5, 0),
		}):Play();
		
		Tween:Create(TextLabel,TweenInfo.new(0.2),{
			Size = UDim2.new(0, 50, 0, 12)
		}):Play();
	end)
	
	function Meta:Enable()
		Tween:Create(Frame,TweenInfo.new(0.4),{
			Size = UDim2.fromScale(1,1),
		}):Play();
		
		Tween:Create(Icon,TweenInfo.new(0.4),{
			ImageTransparency = 0.450,
		}):Play();
	end;
	
	function Meta:Disable()
		Tween:Create(Frame,TweenInfo.new(0.4,Enum.EasingStyle.Quint),{
			Size = UDim2.fromScale(0,0),
		}):Play();

		Tween:Create(Icon,TweenInfo.new(0.4,Enum.EasingStyle.Quint),{
			ImageTransparency = 1,
		}):Play();
	end;
	
	function Meta:AddCallback(func)
		Button.MouseButton1Click:Connect(func);	
	end;
	
	return Meta;
end;

return MobileButton;
