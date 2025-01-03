local bind = {};

function bind.new(title)

	local ScreenGui = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIStroke = Instance.new("UIStroke")
	local ImageLabel = Instance.new("ImageLabel")
	local TextLabel = Instance.new("TextLabel")
	local TextBox = Instance.new("TextBox")
	local UICorner_2 = Instance.new("UICorner")
	local UIStroke_2 = Instance.new("UIStroke")
	local Buttons = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	ScreenGui.Parent = game:FindFirstChild('CoreGui') or game.Players.LocalPlayer:WaitForChild("PlayerGui")
	ScreenGui.ResetOnSpawn = false
	ScreenGui.IgnoreGuiInset = true
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

	Frame.Parent = ScreenGui
	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	Frame.Size = UDim2.new(0, 0, 0, 0)
	Frame.ClipsDescendants = true
	
	game:GetService('TweenService'):Create(Frame,TweenInfo.new(1.5,Enum.EasingStyle.Quint,Enum.EasingDirection.InOut),{
		Size = UDim2.new(0, 250, 0, 150)
	}):Play()
	
	UICorner.Parent = Frame

	UIStroke.Parent = Frame
	UIStroke.Color = Color3.fromRGB(111, 111, 111)
	UIStroke.Transparency = 0.800

	ImageLabel.Parent = Frame
	ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel.BorderSizePixel = 0
	ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	ImageLabel.Size = UDim2.new(1, 47, 1, 47)
	ImageLabel.ZIndex = -1
	ImageLabel.Image = "rbxassetid://6015897843"
	ImageLabel.ImageColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel.ImageTransparency = 1
	ImageLabel.ScaleType = Enum.ScaleType.Slice
	ImageLabel.SliceCenter = Rect.new(49, 49, 450, 450)
	ImageLabel.Rotation = 0.0001;
	
	game:GetService('TweenService'):Create(ImageLabel,TweenInfo.new(1.5,Enum.EasingStyle.Quint,Enum.EasingDirection.InOut),{
		ImageTransparency = 0.500
	}):Play()
	
	TextLabel.Parent = Frame
	TextLabel.AnchorPoint = Vector2.new(0.5, 0)
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.5, 0, 0, 10)
	TextLabel.Size = UDim2.new(1, -20, 0, 15)
	TextLabel.Font = Enum.Font.GothamMedium
	TextLabel.Text = title or "Key System"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 14.000

	TextBox.Parent = Frame
	TextBox.AnchorPoint = Vector2.new(0.5, 0)
	TextBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextBox.BorderSizePixel = 0
	TextBox.Position = UDim2.new(0.5, 0, 0, 35)
	TextBox.Size = UDim2.new(1, -20, 0, 25)
	TextBox.ZIndex = 2
	TextBox.ClearTextOnFocus = false
	TextBox.Font = Enum.Font.GothamMedium
	TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	TextBox.PlaceholderText = "Enter Key"
	TextBox.Text = ""
	TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.TextSize = 10.000
	TextBox.TextTransparency = 0.400
	TextBox.TextWrapped = true

	UICorner_2.CornerRadius = UDim.new(0, 3)
	UICorner_2.Parent = TextBox

	UIStroke_2.Parent = TextBox
	UIStroke_2.Color = Color3.fromRGB(34, 34, 34)
	UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	Buttons.Name = "Buttons"
	Buttons.Parent = Frame
	Buttons.AnchorPoint = Vector2.new(0.5, 0)
	Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Buttons.BackgroundTransparency = 1.000
	Buttons.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Buttons.BorderSizePixel = 0
	Buttons.Position = UDim2.new(0.5, 0, 0, 70)
	Buttons.Size = UDim2.new(1, -20, 1, -75)
	Buttons.ZIndex = 3

	UIListLayout.Parent = Buttons
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)
	UIListLayout.Wraps = true
	
	local slnaf = Frame;
	return {
		AddButton = function(name , callback)
			local Frame = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")
			local Label = Instance.new("TextLabel")
			local Button = Instance.new("TextButton")

			Frame.Parent = Buttons
			Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			Frame.BackgroundTransparency = 0.500
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(0, 100, 0, 25)

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Frame

			UIStroke.Parent = Frame
			UIStroke.Color = Color3.fromRGB(34, 34, 34)
			UIStroke.Transparency = 0.500
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

			Label.Name = "Label"
			Label.Parent = Frame
			Label.AnchorPoint = Vector2.new(0.5, 0.5)
			Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Label.BackgroundTransparency = 1.000
			Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Label.BorderSizePixel = 0
			Label.Position = UDim2.new(0.5, 0, 0.5, 0)
			Label.Size = UDim2.new(1, -20, 0.5, 0)
			Label.ZIndex = 6
			Label.Font = Enum.Font.GothamMedium
			Label.Text = tostring(name)
			Label.TextColor3 = Color3.fromRGB(255, 255, 255)
			Label.TextSize = 12.000
			Label.TextTransparency = 0.450

			Button.Name = "Button"
			Button.Parent = Frame
			Button.AnchorPoint = Vector2.new(0.5, 0.5)
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BackgroundTransparency = 1.000
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Position = UDim2.new(0.5, 0, 0.5, 0)
			Button.Size = UDim2.new(1, 0, 1, 0)
			Button.ZIndex = 15
			Button.Font = Enum.Font.SourceSans
			Button.Text = ""
			Button.TextColor3 = Color3.fromRGB(0, 0, 0)
			Button.TextSize = 14.000
			Button.TextTransparency = 1.000

			Button.MouseEnter:Connect(function()
				game:GetService('TweenService'):Create(UIStroke,TweenInfo.new(0.1),{
					Transparency = 0.2500
				}):Play();

				game:GetService('TweenService'):Create(Label,TweenInfo.new(0.1),{
					TextTransparency = 0.150
				}):Play();

				game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.1),{
					BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				}):Play();
			end);

			Button.MouseLeave:Connect(function()
				game:GetService('TweenService'):Create(UIStroke,TweenInfo.new(0.1),{
					Transparency = 0.50
				}):Play();

				game:GetService('TweenService'):Create(Label,TweenInfo.new(0.1),{
					TextTransparency = 0.450
				}):Play();

				game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.1),{
					BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				}):Play();
			end);
			
			Button.MouseButton1Down:Connect(function()
				game:GetService('TweenService'):Create(UIStroke,TweenInfo.new(0.1),{
					Transparency = 0.50
				}):Play();

				game:GetService('TweenService'):Create(Label,TweenInfo.new(0.1),{
					TextTransparency = 0.450
				}):Play();

				game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.1),{
					BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				}):Play();
			end);
			
			Button.MouseButton1Up:Connect(function()
				game:GetService('TweenService'):Create(UIStroke,TweenInfo.new(0.1),{
					Transparency = 0.2500
				}):Play();

				game:GetService('TweenService'):Create(Label,TweenInfo.new(0.1),{
					TextTransparency = 0.150
				}):Play();

				game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.1),{
					BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				}):Play();
			end);
			
			Button.MouseButton1Click:Connect(function()
				
				callback({
					Text = TextBox.Text,
					Close = function()
						game:GetService('TweenService'):Create(slnaf,TweenInfo.new(1.5,Enum.EasingStyle.Quint,Enum.EasingDirection.InOut),{
							Size = UDim2.new(0, 0, 0, 0)
						}):Play()
						
						game:GetService('TweenService'):Create(ImageLabel,TweenInfo.new(1.5,Enum.EasingStyle.Quint,Enum.EasingDirection.InOut),{
							ImageTransparency = 1
						}):Play()
						
						task.delay(1.55,function()
							ScreenGui:Destroy()
						end)
					end,
				})
			end)
		end,
	}
end;

return bind;
