--[[
    		Compkiller Interface

    Author: 4lpaca
    License: MIT
    Github: https://github.com/4lpaca-pin/CompKiller
    Original: compkiller.net

        Version: 2.6
    - Improved Performance Mode
    	Compkiller:OptimizeMode(< boolean >)
  	- Added Auto Color Logo
		Compkiller:CustomIconHighlight()
--]]

--- Export Types ---

export type cloneref = (target: Instance) -> Instance;

export type Window = {
	Name: string,
	Keybind: string | Enum.KeyCode,
	Logo: string,
	Scale: UDim2,
	TextSize: number
};

export type ConfigManager = {
	Directory: string,
	Config: string,
};

export type WriteConfig = {
	Name: string,
	Author: string,
};

export type WindowUpdate = {
	Username: string,
	ExpireDate: string,
	Logo: string,
	WindowName: string,
	UserProfile: string
};

export type ConfigFunctions = {
	Directory: string,
	WriteConfig: (self: ConfigFunctions , Config: WriteConfig) -> any?,
	ReadInfo: (self: ConfigFunctions , ConfigName: string) -> any?,
	DeleteConfig: (self: ConfigFunctions , ConfigName: string) -> any?,
	LoadConfig: (self: ConfigFunctions , ConfigName: string) -> any?,
	GetConfigs: (self: ConfigFunctions , ConfigName: string) -> {string},
	GetConfigCount: (self: ConfigFunctions) -> number,
	GetFullConfigs: (self: ConfigFunctions , ConfigName: string) -> {
		{
			Name: string,
			Info: {
				Type: string,
				Author: string,
				Name: string,
				CreatedDate: string,
			}
		}	
	},
};

export type KeybindSettings = {
	Key : string,
	On : boolean | number,
	Off : boolean | number,
	Mode : number,
	Name : string,
}

export type SecurityConfig = {
	BlurEnabled : boolean,
	ImageScale: number,
};

export type Notify = {
	Icon: string,
	Title: string,
	Content: string,
	Duration: number
};

export type NotifyPayback = {
	SetProgress: (self: Notify , time: number) -> any?,
	Content: (self: Notify , str: string) -> any?,
	Title: (self: Notify , str: string) -> any?,
	Close: () -> any?,
}

export type Watermark = {
	Icon: string,
	Text: string
};

export type TabConfig = {
	Name: string,
	Icon: string,
	Type: string,
	EnableScrolling: boolean
};

export type TabConfigManager = {
	Name: string,
	Icon: string,
	Config: ConfigFunctions
}

export type ContainerTab = {
	Name: string,
	Icon: string,
	EnableScrolling: boolean
};

export type Category = {
	Name: string
};

export type Section = {
	Name: string,
	Position: string
};

export type Toggle = {
	Name: string,
	Default: boolean,
	Flag: string | nil,
	Risky: boolean,
	Callback: (Value: boolean) -> any?
};

export type MiniToggle = {
	Default: boolean,
	Flag: string | nil,
	Callback: (Value: boolean) -> any?
};

export type TextBoxConfig = {
	Name: string,
	Default: string,
	Placeholder: string,
	Flag: string | nil,
	Numeric: boolean,
	Callback: (Text: string) -> any?
};

export type ColorPicker = {
	Name: string,
	Default: Color3,
	Flag: string | nil,
	Transparency: number,
	Callback: (Value: Color3 , Trans: number) -> any?
};

export type MiniColorPicker = {
	Default: Color3,
	Transparency: number,
	Flag: string | nil,
	Callback: (Value: Color3 , Trans: number) -> any?
};

export type Slider = {
	Name: string,
	Min: number,
	Max: number,
	Default: number,
	Type: string,
	Round: number,
	Callback: (Value: number) -> any?
};

export type Dropdown = {
	Name: string,
	Default: string | {string},
	Values: {string},
	Multi: boolean,
	Callback: (Value: string | {[string]: boolean}) -> any?
};

export type Button = {
	Name: string,
	Callback: () -> any?
};

export type Keybind = {
	Name: string,
	Default: string | Enum.KeyCode,
	Callback: (Value: string) -> any,
	Blacklist: {string | Enum.KeyCode}
};

export type MiniKeybind = {
	Default: string | Enum.KeyCode,
	Callback: (Value: string) -> any,
	Blacklist: {string | Enum.KeyCode}
};

export type Helper = {
	Text: string
};

export type Paragraph = {
	Title: string,
	Content: string
}

pcall(function() -- for Luraph
	local Constant = table.concat({"LP","H_NO"}).."_VI".."RTU".."AL".."IZE";
	getfenv()[Constant] = getfenv()[Constant] or function(f) return f end; 
	-- LPH_NO_VIRTUALIZE
end);

pcall(function() -- for IB1
	local Constant = "IB".."_NO_VI".."RTU".."AL".."IZE";
	getfenv()[Constant] = getfenv()[Constant] or function(f) return f end; 
	-- IB_NO_VIRTUALIZE
end);

getgenv = getgenv or getfenv;

-- Please ignore the ugly code. [Custom File System] --
if game:GetService('RunService'):IsStudio() then
	local BaseWorkspace = Instance.new('Folder',game:GetService("ReplicatedFirst"));

	BaseWorkspace.Name = tostring(string.char(math.random(50,120)))..tostring(string.char(math.random(50,120)))..tostring(string.char(math.random(50,120)))..tostring(string.char(math.random(50,120)))..tostring(string.char(math.random(50,120)))..tostring(string.char(math.random(50,120)));

	local __get_path_c = function(path)
		return (string.find(path,'/',1,true) and string.split(path,'/')) or (string.find(path,'\\',1,true) and string.split(path,'\\')) or {path};
	end;

	local __get_path = function(path)
		local main = __get_path_c(path);

		local block = BaseWorkspace;

		for i,v in next , main do
			block = block[v];
		end;

		return block;
	end;

	getgenv().readfile = function(path)
		local path : StringValue = __get_path(path);

		return path.Value;
	end;

	getgenv().isfile = function(path)
		local success , message = pcall(function()
			return __get_path(path);
		end);

		if success and not message:IsA("Folder") then
			return true;
		end;

		return false;
	end;

	getgenv().isfolder = function(path)
		local success , message = pcall(function()
			return __get_path(path);
		end);

		if success and message:IsA("Folder") then
			return true;
		end;

		return false;
	end;

	getgenv().writefile = function(path,content)
		local main = __get_path_c(path);

		local block = BaseWorkspace;

		for i,v in next , main do
			local item = block:FindFirstChild(v);
			if not item then
				local c = Instance.new('StringValue',block);

				c.Name = tostring(v);
				c.Value = content;
			else
				if item:IsA('StringValue') and tostring(item) == v then
					item.Name = tostring(v);
					item.Value = content;
				end;

				block = item;
			end;
		end;
	end;

	getgenv().listfiles = function(path)
		local fold = __get_path(path);
		local pa = {};

		for i,v in next , fold:GetChildren() do
			if v:IsA('StringValue') then
				table.insert(pa,path..'/'..tostring(v));
			end;
		end;

		return pa;
	end;

	getgenv().makefolder = function(path)
		local main = __get_path_c(path);

		local block = BaseWorkspace;

		for i,v in next , main do
			local item = block:FindFirstChild(v);
			if not item then
				local c = Instance.new('Folder',block);

				c.Name = tostring(v);
			else
				block = item;
			end;
		end;
	end;

	getgenv().delfile = function(path)
		local main = __get_path_c(path);

		local block = BaseWorkspace;

		for i,v in next , main do
			local item = block:FindFirstChild(v);
			if item and item:IsA('StringValue') then
				item:Destroy();
			else
				block = item;
			end;
		end;
	end;
end;

--- Local Variables ---
local cloneref: cloneref = cloneref or function(f) return f end;
local TweenService: TweenService = cloneref(game:GetService('TweenService'));
local UserInputService: UserInputService = cloneref(game:GetService('UserInputService'));
local TextService: TextService = cloneref(game:GetService('TextService'));
local RunService: RunService = cloneref(game:GetService('RunService'));
local Players: Players = cloneref(game:GetService('Players'));
local HttpService: HttpService = cloneref(game:GetService('HttpService'));
local LocalPlayer: Player = Players.LocalPlayer;
local CoreGui: PlayerGui = (gethui and gethui()) or (get_hidden_gui and get_hidden_gui()) or cloneref(game:FindFirstChild('CoreGui')) or cloneref(LocalPlayer.PlayerGui);
local Mouse: Mouse = LocalPlayer:GetMouse();
local CurrentCamera: Camera? = cloneref(workspace.CurrentCamera);

local Compkiller = {
	Version = '2.6',
	Logo = "rbxassetid://120245531583106",
	Windows = {},
	Scale = {
		Window = UDim2.new(0, 485,0, 565),
		Mobile = UDim2.new(0, 450,0, 375),
		TabOpen = 185,
		TabClose = 85,
	},
	PerformanceMode = false,
	WindowsNil = {},
	NilFolder = Instance.new('Folder'),
	ArcylicParent = CurrentCamera,
	ProtectGui = protect_gui or protectgui or (syn and syn.protect_gui) or function(s) return s; end,
};

Compkiller.Colors = {
	Highlight = Color3.fromRGB(17, 238, 253),
	Toggle = Color3.fromRGB(14, 203, 213),
	Risky = Color3.fromRGB(251, 255, 39),
	BGDBColor = Color3.fromRGB(22, 24, 29),
	BlockColor = Color3.fromRGB(28, 29, 34),
	StrokeColor = Color3.fromRGB(37, 38, 43),
	SwitchColor = Color3.fromRGB(255, 255, 255),
	DropColor = Color3.fromRGB(33, 35, 39),
	MouseEnter = Color3.fromRGB(55, 58, 65),
	BlockBackground = Color3.fromRGB(39, 40, 47),
	LineColor = Color3.fromRGB(65, 65, 65),
	HighStrokeColor = Color3.fromRGB(55, 56, 63),
};

Compkiller.Elements = {
	Highlight = {},
	DropHighlight = {},
	Risky = {},
	BGDBColor = {},
	BlockColor = {},
	StrokeColor = {},
	SwitchColor = {},
	DropColor = {},
	BlockBackground = {},
	LineColor = {},
	HighStrokeColor = {},
};

Compkiller.DragBlacklist = {};
Compkiller.IaDrag = false;
Compkiller.LastDrag = tick();
Compkiller.Flags = {};

Compkiller.Lucide = {
	['lucide-mouse-2'] = "rbxassetid://10088146939",
	['lucide-internet'] = "rbxassetid://12785195438",
	['lucide-earth'] = "rbxassetid://115986292591138",
	['lucide-settings-3'] = "rbxassetid://14007344336",
	["lucide-accessibility"] = "rbxassetid://10709751939",
	["lucide-activity"] = "rbxassetid://10709752035",
	["lucide-air-vent"] = "rbxassetid://10709752131",
	["lucide-airplay"] = "rbxassetid://10709752254",
	["lucide-alarm-check"] = "rbxassetid://10709752405",
	["lucide-alarm-clock"] = "rbxassetid://10709752630",
	["lucide-alarm-clock-off"] = "rbxassetid://10709752508",
	["lucide-alarm-minus"] = "rbxassetid://10709752732",
	["lucide-alarm-plus"] = "rbxassetid://10709752825",
	["lucide-album"] = "rbxassetid://10709752906",
	["lucide-alert-circle"] = "rbxassetid://10709752996",
	["lucide-alert-octagon"] = "rbxassetid://10709753064",
	["lucide-alert-triangle"] = "rbxassetid://10709753149",
	["lucide-align-center"] = "rbxassetid://10709753570",
	["lucide-align-center-horizontal"] = "rbxassetid://10709753272",
	["lucide-align-center-vertical"] = "rbxassetid://10709753421",
	["lucide-align-end-horizontal"] = "rbxassetid://10709753692",
	["lucide-align-end-vertical"] = "rbxassetid://10709753808",
	["lucide-align-horizontal-distribute-center"] = "rbxassetid://10747779791",
	["lucide-align-horizontal-distribute-end"] = "rbxassetid://10747784534",
	["lucide-align-horizontal-distribute-start"] = "rbxassetid://10709754118",
	["lucide-align-horizontal-justify-center"] = "rbxassetid://10709754204",
	["lucide-align-horizontal-justify-end"] = "rbxassetid://10709754317",
	["lucide-align-horizontal-justify-start"] = "rbxassetid://10709754436",
	["lucide-align-horizontal-space-around"] = "rbxassetid://10709754590",
	["lucide-align-horizontal-space-between"] = "rbxassetid://10709754749",
	["lucide-align-justify"] = "rbxassetid://10709759610",
	["lucide-align-left"] = "rbxassetid://10709759764",
	["lucide-align-right"] = "rbxassetid://10709759895",
	["lucide-align-start-horizontal"] = "rbxassetid://10709760051",
	["lucide-align-start-vertical"] = "rbxassetid://10709760244",
	["lucide-align-vertical-distribute-center"] = "rbxassetid://10709760351",
	["lucide-align-vertical-distribute-end"] = "rbxassetid://10709760434",
	["lucide-align-vertical-distribute-start"] = "rbxassetid://10709760612",
	["lucide-align-vertical-justify-center"] = "rbxassetid://10709760814",
	["lucide-align-vertical-justify-end"] = "rbxassetid://10709761003",
	["lucide-align-vertical-justify-start"] = "rbxassetid://10709761176",
	["lucide-align-vertical-space-around"] = "rbxassetid://10709761324",
	["lucide-align-vertical-space-between"] = "rbxassetid://10709761434",
	["lucide-anchor"] = "rbxassetid://10709761530",
	["lucide-angry"] = "rbxassetid://10709761629",
	["lucide-annoyed"] = "rbxassetid://10709761722",
	["lucide-aperture"] = "rbxassetid://10709761813",
	["lucide-apple"] = "rbxassetid://10709761889",
	["lucide-archive"] = "rbxassetid://10709762233",
	["lucide-archive-restore"] = "rbxassetid://10709762058",
	["lucide-armchair"] = "rbxassetid://10709762327",
	["lucide-arrow-big-down"] = "rbxassetid://10747796644",
	["lucide-arrow-big-left"] = "rbxassetid://10709762574",
	["lucide-arrow-big-right"] = "rbxassetid://10709762727",
	["lucide-arrow-big-up"] = "rbxassetid://10709762879",
	["lucide-arrow-down"] = "rbxassetid://10709767827",
	["lucide-arrow-down-circle"] = "rbxassetid://10709763034",
	["lucide-arrow-down-left"] = "rbxassetid://10709767656",
	["lucide-arrow-down-right"] = "rbxassetid://10709767750",
	["lucide-arrow-left"] = "rbxassetid://10709768114",
	["lucide-arrow-left-circle"] = "rbxassetid://10709767936",
	["lucide-arrow-left-right"] = "rbxassetid://10709768019",
	["lucide-arrow-right"] = "rbxassetid://10709768347",
	["lucide-arrow-right-circle"] = "rbxassetid://10709768226",
	["lucide-arrow-up"] = "rbxassetid://10709768939",
	["lucide-arrow-up-circle"] = "rbxassetid://10709768432",
	["lucide-arrow-up-down"] = "rbxassetid://10709768538",
	["lucide-arrow-up-left"] = "rbxassetid://10709768661",
	["lucide-arrow-up-right"] = "rbxassetid://10709768787",
	["lucide-asterisk"] = "rbxassetid://10709769095",
	["lucide-at-sign"] = "rbxassetid://10709769286",
	["lucide-award"] = "rbxassetid://10709769406",
	["lucide-axe"] = "rbxassetid://10709769508",
	["lucide-axis-3d"] = "rbxassetid://10709769598",
	["lucide-baby"] = "rbxassetid://10709769732",
	["lucide-backpack"] = "rbxassetid://10709769841",
	["lucide-baggage-claim"] = "rbxassetid://10709769935",
	["lucide-banana"] = "rbxassetid://10709770005",
	["lucide-banknote"] = "rbxassetid://10709770178",
	["lucide-bar-chart"] = "rbxassetid://10709773755",
	["lucide-bar-chart-2"] = "rbxassetid://10709770317",
	["lucide-bar-chart-3"] = "rbxassetid://10709770431",
	["lucide-bar-chart-4"] = "rbxassetid://10709770560",
	["lucide-bar-chart-horizontal"] = "rbxassetid://10709773669",
	["lucide-barcode"] = "rbxassetid://10747360675",
	["lucide-baseline"] = "rbxassetid://10709773863",
	["lucide-bath"] = "rbxassetid://10709773963",
	["lucide-battery"] = "rbxassetid://10709774640",
	["lucide-battery-charging"] = "rbxassetid://10709774068",
	["lucide-battery-full"] = "rbxassetid://10709774206",
	["lucide-battery-low"] = "rbxassetid://10709774370",
	["lucide-battery-medium"] = "rbxassetid://10709774513",
	["lucide-beaker"] = "rbxassetid://10709774756",
	["lucide-bed"] = "rbxassetid://10709775036",
	["lucide-bed-double"] = "rbxassetid://10709774864",
	["lucide-bed-single"] = "rbxassetid://10709774968",
	["lucide-beer"] = "rbxassetid://10709775167",
	["lucide-bell"] = "rbxassetid://10709775704",
	["lucide-bell-minus"] = "rbxassetid://10709775241",
	["lucide-bell-off"] = "rbxassetid://10709775320",
	["lucide-bell-plus"] = "rbxassetid://10709775448",
	["lucide-bell-ring"] = "rbxassetid://10709775560",
	["lucide-bike"] = "rbxassetid://10709775894",
	["lucide-binary"] = "rbxassetid://10709776050",
	["lucide-bitcoin"] = "rbxassetid://10709776126",
	["lucide-bluetooth"] = "rbxassetid://10709776655",
	["lucide-bluetooth-connected"] = "rbxassetid://10709776240",
	["lucide-bluetooth-off"] = "rbxassetid://10709776344",
	["lucide-bluetooth-searching"] = "rbxassetid://10709776501",
	["lucide-bold"] = "rbxassetid://10747813908",
	["lucide-bomb"] = "rbxassetid://10709781460",
	["lucide-bone"] = "rbxassetid://10709781605",
	["lucide-book"] = "rbxassetid://10709781824",
	["lucide-book-open"] = "rbxassetid://10709781717",
	["lucide-bookmark"] = "rbxassetid://10709782154",
	["lucide-bookmark-minus"] = "rbxassetid://10709781919",
	["lucide-bookmark-plus"] = "rbxassetid://10709782044",
	["lucide-bot"] = "rbxassetid://10709782230",
	["lucide-box"] = "rbxassetid://10709782497",
	["lucide-box-select"] = "rbxassetid://10709782342",
	["lucide-boxes"] = "rbxassetid://10709782582",
	["lucide-briefcase"] = "rbxassetid://10709782662",
	["lucide-brush"] = "rbxassetid://10709782758",
	["lucide-bug"] = "rbxassetid://10709782845",
	["lucide-building"] = "rbxassetid://10709783051",
	["lucide-building-2"] = "rbxassetid://10709782939",
	["lucide-bus"] = "rbxassetid://10709783137",
	["lucide-cake"] = "rbxassetid://10709783217",
	["lucide-calculator"] = "rbxassetid://10709783311",
	["lucide-calendar"] = "rbxassetid://10709789505",
	["lucide-calendar-check"] = "rbxassetid://10709783474",
	["lucide-calendar-check-2"] = "rbxassetid://10709783392",
	["lucide-calendar-clock"] = "rbxassetid://10709783577",
	["lucide-calendar-days"] = "rbxassetid://10709783673",
	["lucide-calendar-heart"] = "rbxassetid://10709783835",
	["lucide-calendar-minus"] = "rbxassetid://10709783959",
	["lucide-calendar-off"] = "rbxassetid://10709788784",
	["lucide-calendar-plus"] = "rbxassetid://10709788937",
	["lucide-calendar-range"] = "rbxassetid://10709789053",
	["lucide-calendar-search"] = "rbxassetid://10709789200",
	["lucide-calendar-x"] = "rbxassetid://10709789407",
	["lucide-calendar-x-2"] = "rbxassetid://10709789329",
	["lucide-camera"] = "rbxassetid://10709789686",
	["lucide-camera-off"] = "rbxassetid://10747822677",
	["lucide-car"] = "rbxassetid://10709789810",
	["lucide-carrot"] = "rbxassetid://10709789960",
	["lucide-cast"] = "rbxassetid://10709790097",
	["lucide-charge"] = "rbxassetid://10709790202",
	["lucide-check"] = "rbxassetid://10709790644",
	["lucide-check-circle"] = "rbxassetid://10709790387",
	["lucide-check-circle-2"] = "rbxassetid://10709790298",
	["lucide-check-square"] = "rbxassetid://10709790537",
	["lucide-chef-hat"] = "rbxassetid://10709790757",
	["lucide-cherry"] = "rbxassetid://10709790875",
	["lucide-chevron-down"] = "rbxassetid://10709790948",
	["lucide-chevron-first"] = "rbxassetid://10709791015",
	["lucide-chevron-last"] = "rbxassetid://10709791130",
	["lucide-chevron-left"] = "rbxassetid://10709791281",
	["lucide-chevron-right"] = "rbxassetid://10709791437",
	["lucide-chevron-up"] = "rbxassetid://10709791523",
	["lucide-chevrons-down"] = "rbxassetid://10709796864",
	["lucide-chevrons-down-up"] = "rbxassetid://10709791632",
	["lucide-chevrons-left"] = "rbxassetid://10709797151",
	["lucide-chevrons-left-right"] = "rbxassetid://10709797006",
	["lucide-chevrons-right"] = "rbxassetid://10709797382",
	["lucide-chevrons-right-left"] = "rbxassetid://10709797274",
	["lucide-chevrons-up"] = "rbxassetid://10709797622",
	["lucide-chevrons-up-down"] = "rbxassetid://10709797508",
	["lucide-chrome"] = "rbxassetid://10709797725",
	["lucide-circle"] = "rbxassetid://10709798174",
	["lucide-circle-dot"] = "rbxassetid://10709797837",
	["lucide-circle-ellipsis"] = "rbxassetid://10709797985",
	["lucide-circle-slashed"] = "rbxassetid://10709798100",
	["lucide-citrus"] = "rbxassetid://10709798276",
	["lucide-clapperboard"] = "rbxassetid://10709798350",
	["lucide-clipboard"] = "rbxassetid://10709799288",
	["lucide-clipboard-check"] = "rbxassetid://10709798443",
	["lucide-clipboard-copy"] = "rbxassetid://10709798574",
	["lucide-clipboard-edit"] = "rbxassetid://10709798682",
	["lucide-clipboard-list"] = "rbxassetid://10709798792",
	["lucide-clipboard-signature"] = "rbxassetid://10709798890",
	["lucide-clipboard-type"] = "rbxassetid://10709798999",
	["lucide-clipboard-x"] = "rbxassetid://10709799124",
	["lucide-clock"] = "rbxassetid://10709805144",
	["lucide-clock-1"] = "rbxassetid://10709799535",
	["lucide-clock-10"] = "rbxassetid://10709799718",
	["lucide-clock-11"] = "rbxassetid://10709799818",
	["lucide-clock-12"] = "rbxassetid://10709799962",
	["lucide-clock-2"] = "rbxassetid://10709803876",
	["lucide-clock-3"] = "rbxassetid://10709803989",
	["lucide-clock-4"] = "rbxassetid://10709804164",
	["lucide-clock-5"] = "rbxassetid://10709804291",
	["lucide-clock-6"] = "rbxassetid://10709804435",
	["lucide-clock-7"] = "rbxassetid://10709804599",
	["lucide-clock-8"] = "rbxassetid://10709804784",
	["lucide-clock-9"] = "rbxassetid://10709804996",
	["lucide-cloud"] = "rbxassetid://10709806740",
	["lucide-cloud-cog"] = "rbxassetid://10709805262",
	["lucide-cloud-drizzle"] = "rbxassetid://10709805371",
	["lucide-cloud-fog"] = "rbxassetid://10709805477",
	["lucide-cloud-hail"] = "rbxassetid://10709805596",
	["lucide-cloud-lightning"] = "rbxassetid://10709805727",
	["lucide-cloud-moon"] = "rbxassetid://10709805942",
	["lucide-cloud-moon-rain"] = "rbxassetid://10709805838",
	["lucide-cloud-off"] = "rbxassetid://10709806060",
	["lucide-cloud-rain"] = "rbxassetid://10709806277",
	["lucide-cloud-rain-wind"] = "rbxassetid://10709806166",
	["lucide-cloud-snow"] = "rbxassetid://10709806374",
	["lucide-cloud-sun"] = "rbxassetid://10709806631",
	["lucide-cloud-sun-rain"] = "rbxassetid://10709806475",
	["lucide-cloudy"] = "rbxassetid://10709806859",
	["lucide-clover"] = "rbxassetid://10709806995",
	["lucide-code"] = "rbxassetid://10709810463",
	["lucide-code-2"] = "rbxassetid://10709807111",
	["lucide-codepen"] = "rbxassetid://10709810534",
	["lucide-codesandbox"] = "rbxassetid://10709810676",
	["lucide-coffee"] = "rbxassetid://10709810814",
	["lucide-cog"] = "rbxassetid://10709810948",
	["lucide-coins"] = "rbxassetid://10709811110",
	["lucide-columns"] = "rbxassetid://10709811261",
	["lucide-command"] = "rbxassetid://10709811365",
	["lucide-compass"] = "rbxassetid://10709811445",
	["lucide-component"] = "rbxassetid://10709811595",
	["lucide-concierge-bell"] = "rbxassetid://10709811706",
	["lucide-connection"] = "rbxassetid://10747361219",
	["lucide-contact"] = "rbxassetid://10709811834",
	["lucide-contrast"] = "rbxassetid://10709811939",
	["lucide-cookie"] = "rbxassetid://10709812067",
	["lucide-copy"] = "rbxassetid://10709812159",
	["lucide-copyleft"] = "rbxassetid://10709812251",
	["lucide-copyright"] = "rbxassetid://10709812311",
	["lucide-corner-down-left"] = "rbxassetid://10709812396",
	["lucide-corner-down-right"] = "rbxassetid://10709812485",
	["lucide-corner-left-down"] = "rbxassetid://10709812632",
	["lucide-corner-left-up"] = "rbxassetid://10709812784",
	["lucide-corner-right-down"] = "rbxassetid://10709812939",
	["lucide-corner-right-up"] = "rbxassetid://10709813094",
	["lucide-corner-up-left"] = "rbxassetid://10709813185",
	["lucide-corner-up-right"] = "rbxassetid://10709813281",
	["lucide-cpu"] = "rbxassetid://10709813383",
	["lucide-croissant"] = "rbxassetid://10709818125",
	["lucide-crop"] = "rbxassetid://10709818245",
	["lucide-cross"] = "rbxassetid://10709818399",
	["lucide-crosshair"] = "rbxassetid://10709818534",
	["lucide-crown"] = "rbxassetid://10709818626",
	["lucide-cup-soda"] = "rbxassetid://10709818763",
	["lucide-curly-braces"] = "rbxassetid://10709818847",
	["lucide-currency"] = "rbxassetid://10709818931",
	["lucide-database"] = "rbxassetid://10709818996",
	["lucide-delete"] = "rbxassetid://10709819059",
	["lucide-diamond"] = "rbxassetid://10709819149",
	["lucide-dice-1"] = "rbxassetid://10709819266",
	["lucide-dice-2"] = "rbxassetid://10709819361",
	["lucide-dice-3"] = "rbxassetid://10709819508",
	["lucide-dice-4"] = "rbxassetid://10709819670",
	["lucide-dice-5"] = "rbxassetid://10709819801",
	["lucide-dice-6"] = "rbxassetid://10709819896",
	["lucide-dices"] = "rbxassetid://10723343321",
	["lucide-diff"] = "rbxassetid://10723343416",
	["lucide-disc"] = "rbxassetid://10723343537",
	["lucide-divide"] = "rbxassetid://10723343805",
	["lucide-divide-circle"] = "rbxassetid://10723343636",
	["lucide-divide-square"] = "rbxassetid://10723343737",
	["lucide-dollar-sign"] = "rbxassetid://10723343958",
	["lucide-download"] = "rbxassetid://10723344270",
	["lucide-download-cloud"] = "rbxassetid://10723344088",
	["lucide-droplet"] = "rbxassetid://10723344432",
	["lucide-droplets"] = "rbxassetid://10734883356",
	["lucide-drumstick"] = "rbxassetid://10723344737",
	["lucide-edit"] = "rbxassetid://10734883598",
	["lucide-edit-2"] = "rbxassetid://10723344885",
	["lucide-edit-3"] = "rbxassetid://10723345088",
	["lucide-egg"] = "rbxassetid://10723345518",
	["lucide-egg-fried"] = "rbxassetid://10723345347",
	["lucide-electricity"] = "rbxassetid://10723345749",
	["lucide-electricity-off"] = "rbxassetid://10723345643",
	["lucide-equal"] = "rbxassetid://10723345990",
	["lucide-equal-not"] = "rbxassetid://10723345866",
	["lucide-eraser"] = "rbxassetid://10723346158",
	["lucide-euro"] = "rbxassetid://10723346372",
	["lucide-expand"] = "rbxassetid://10723346553",
	["lucide-external-link"] = "rbxassetid://10723346684",
	["lucide-eye"] = "rbxassetid://10723346959",
	["lucide-eye-off"] = "rbxassetid://10723346871",
	["lucide-factory"] = "rbxassetid://10723347051",
	["lucide-fan"] = "rbxassetid://10723354359",
	["lucide-fast-forward"] = "rbxassetid://10723354521",
	["lucide-feather"] = "rbxassetid://10723354671",
	["lucide-figma"] = "rbxassetid://10723354801",
	["lucide-file"] = "rbxassetid://10723374641",
	["lucide-file-archive"] = "rbxassetid://10723354921",
	["lucide-file-audio"] = "rbxassetid://10723355148",
	["lucide-file-audio-2"] = "rbxassetid://10723355026",
	["lucide-file-axis-3d"] = "rbxassetid://10723355272",
	["lucide-file-badge"] = "rbxassetid://10723355622",
	["lucide-file-badge-2"] = "rbxassetid://10723355451",
	["lucide-file-bar-chart"] = "rbxassetid://10723355887",
	["lucide-file-bar-chart-2"] = "rbxassetid://10723355746",
	["lucide-file-box"] = "rbxassetid://10723355989",
	["lucide-file-check"] = "rbxassetid://10723356210",
	["lucide-file-check-2"] = "rbxassetid://10723356100",
	["lucide-file-clock"] = "rbxassetid://10723356329",
	["lucide-file-code"] = "rbxassetid://10723356507",
	["lucide-file-cog"] = "rbxassetid://10723356830",
	["lucide-file-cog-2"] = "rbxassetid://10723356676",
	["lucide-file-diff"] = "rbxassetid://10723357039",
	["lucide-file-digit"] = "rbxassetid://10723357151",
	["lucide-file-down"] = "rbxassetid://10723357322",
	["lucide-file-edit"] = "rbxassetid://10723357495",
	["lucide-file-heart"] = "rbxassetid://10723357637",
	["lucide-file-image"] = "rbxassetid://10723357790",
	["lucide-file-input"] = "rbxassetid://10723357933",
	["lucide-file-json"] = "rbxassetid://10723364435",
	["lucide-file-json-2"] = "rbxassetid://10723364361",
	["lucide-file-key"] = "rbxassetid://10723364605",
	["lucide-file-key-2"] = "rbxassetid://10723364515",
	["lucide-file-line-chart"] = "rbxassetid://10723364725",
	["lucide-file-lock"] = "rbxassetid://10723364957",
	["lucide-file-lock-2"] = "rbxassetid://10723364861",
	["lucide-file-minus"] = "rbxassetid://10723365254",
	["lucide-file-minus-2"] = "rbxassetid://10723365086",
	["lucide-file-output"] = "rbxassetid://10723365457",
	["lucide-file-pie-chart"] = "rbxassetid://10723365598",
	["lucide-file-plus"] = "rbxassetid://10723365877",
	["lucide-file-plus-2"] = "rbxassetid://10723365766",
	["lucide-file-question"] = "rbxassetid://10723365987",
	["lucide-file-scan"] = "rbxassetid://10723366167",
	["lucide-file-search"] = "rbxassetid://10723366550",
	["lucide-file-search-2"] = "rbxassetid://10723366340",
	["lucide-file-signature"] = "rbxassetid://10723366741",
	["lucide-file-spreadsheet"] = "rbxassetid://10723366962",
	["lucide-file-symlink"] = "rbxassetid://10723367098",
	["lucide-file-terminal"] = "rbxassetid://10723367244",
	["lucide-file-text"] = "rbxassetid://10723367380",
	["lucide-file-type"] = "rbxassetid://10723367606",
	["lucide-file-type-2"] = "rbxassetid://10723367509",
	["lucide-file-up"] = "rbxassetid://10723367734",
	["lucide-file-video"] = "rbxassetid://10723373884",
	["lucide-file-video-2"] = "rbxassetid://10723367834",
	["lucide-file-volume"] = "rbxassetid://10723374172",
	["lucide-file-volume-2"] = "rbxassetid://10723374030",
	["lucide-file-warning"] = "rbxassetid://10723374276",
	["lucide-file-x"] = "rbxassetid://10723374544",
	["lucide-file-x-2"] = "rbxassetid://10723374378",
	["lucide-files"] = "rbxassetid://10723374759",
	["lucide-film"] = "rbxassetid://10723374981",
	["lucide-filter"] = "rbxassetid://10723375128",
	["lucide-fingerprint"] = "rbxassetid://10723375250",
	["lucide-flag"] = "rbxassetid://10723375890",
	["lucide-flag-off"] = "rbxassetid://10723375443",
	["lucide-flag-triangle-left"] = "rbxassetid://10723375608",
	["lucide-flag-triangle-right"] = "rbxassetid://10723375727",
	["lucide-flame"] = "rbxassetid://10723376114",
	["lucide-flashlight"] = "rbxassetid://10723376471",
	["lucide-flashlight-off"] = "rbxassetid://10723376365",
	["lucide-flask-conical"] = "rbxassetid://10734883986",
	["lucide-flask-round"] = "rbxassetid://10723376614",
	["lucide-flip-horizontal"] = "rbxassetid://10723376884",
	["lucide-flip-horizontal-2"] = "rbxassetid://10723376745",
	["lucide-flip-vertical"] = "rbxassetid://10723377138",
	["lucide-flip-vertical-2"] = "rbxassetid://10723377026",
	["lucide-flower"] = "rbxassetid://10747830374",
	["lucide-flower-2"] = "rbxassetid://10723377305",
	["lucide-focus"] = "rbxassetid://10723377537",
	["lucide-folder"] = "rbxassetid://10723387563",
	["lucide-folder-archive"] = "rbxassetid://10723384478",
	["lucide-folder-check"] = "rbxassetid://10723384605",
	["lucide-folder-clock"] = "rbxassetid://10723384731",
	["lucide-folder-closed"] = "rbxassetid://10723384893",
	["lucide-folder-cog"] = "rbxassetid://10723385213",
	["lucide-folder-cog-2"] = "rbxassetid://10723385036",
	["lucide-folder-down"] = "rbxassetid://10723385338",
	["lucide-folder-edit"] = "rbxassetid://10723385445",
	["lucide-folder-heart"] = "rbxassetid://10723385545",
	["lucide-folder-input"] = "rbxassetid://10723385721",
	["lucide-folder-key"] = "rbxassetid://10723385848",
	["lucide-folder-lock"] = "rbxassetid://10723386005",
	["lucide-folder-minus"] = "rbxassetid://10723386127",
	["lucide-folder-open"] = "rbxassetid://10723386277",
	["lucide-folder-output"] = "rbxassetid://10723386386",
	["lucide-folder-plus"] = "rbxassetid://10723386531",
	["lucide-folder-search"] = "rbxassetid://10723386787",
	["lucide-folder-search-2"] = "rbxassetid://10723386674",
	["lucide-folder-symlink"] = "rbxassetid://10723386930",
	["lucide-folder-tree"] = "rbxassetid://10723387085",
	["lucide-folder-up"] = "rbxassetid://10723387265",
	["lucide-folder-x"] = "rbxassetid://10723387448",
	["lucide-folders"] = "rbxassetid://10723387721",
	["lucide-form-input"] = "rbxassetid://10723387841",
	["lucide-forward"] = "rbxassetid://10723388016",
	["lucide-frame"] = "rbxassetid://10723394389",
	["lucide-framer"] = "rbxassetid://10723394565",
	["lucide-frown"] = "rbxassetid://10723394681",
	["lucide-fuel"] = "rbxassetid://10723394846",
	["lucide-function-square"] = "rbxassetid://10723395041",
	["lucide-gamepad"] = "rbxassetid://10723395457",
	["lucide-gamepad-2"] = "rbxassetid://10723395215",
	["lucide-gauge"] = "rbxassetid://10723395708",
	["lucide-gavel"] = "rbxassetid://10723395896",
	["lucide-gem"] = "rbxassetid://10723396000",
	["lucide-ghost"] = "rbxassetid://10723396107",
	["lucide-gift"] = "rbxassetid://10723396402",
	["lucide-gift-card"] = "rbxassetid://10723396225",
	["lucide-git-branch"] = "rbxassetid://10723396676",
	["lucide-git-branch-plus"] = "rbxassetid://10723396542",
	["lucide-git-commit"] = "rbxassetid://10723396812",
	["lucide-git-compare"] = "rbxassetid://10723396954",
	["lucide-git-fork"] = "rbxassetid://10723397049",
	["lucide-git-merge"] = "rbxassetid://10723397165",
	["lucide-git-pull-request"] = "rbxassetid://10723397431",
	["lucide-git-pull-request-closed"] = "rbxassetid://10723397268",
	["lucide-git-pull-request-draft"] = "rbxassetid://10734884302",
	["lucide-glass"] = "rbxassetid://10723397788",
	["lucide-glass-2"] = "rbxassetid://10723397529",
	["lucide-glass-water"] = "rbxassetid://10723397678",
	["lucide-glasses"] = "rbxassetid://10723397895",
	["lucide-globe"] = "rbxassetid://10723404337",
	["lucide-globe-2"] = "rbxassetid://10723398002",
	["lucide-grab"] = "rbxassetid://10723404472",
	["lucide-graduation-cap"] = "rbxassetid://10723404691",
	["lucide-grape"] = "rbxassetid://10723404822",
	["lucide-grid"] = "rbxassetid://10723404936",
	["lucide-grip-horizontal"] = "rbxassetid://10723405089",
	["lucide-grip-vertical"] = "rbxassetid://10723405236",
	["lucide-hammer"] = "rbxassetid://10723405360",
	["lucide-hand"] = "rbxassetid://10723405649",
	["lucide-hand-metal"] = "rbxassetid://10723405508",
	["lucide-hard-drive"] = "rbxassetid://10723405749",
	["lucide-hard-hat"] = "rbxassetid://10723405859",
	["lucide-hash"] = "rbxassetid://10723405975",
	["lucide-haze"] = "rbxassetid://10723406078",
	["lucide-headphones"] = "rbxassetid://10723406165",
	["lucide-heart"] = "rbxassetid://10723406885",
	["lucide-heart-crack"] = "rbxassetid://10723406299",
	["lucide-heart-handshake"] = "rbxassetid://10723406480",
	["lucide-heart-off"] = "rbxassetid://10723406662",
	["lucide-heart-pulse"] = "rbxassetid://10723406795",
	["lucide-help-circle"] = "rbxassetid://10723406988",
	["lucide-hexagon"] = "rbxassetid://10723407092",
	["lucide-highlighter"] = "rbxassetid://10723407192",
	["lucide-history"] = "rbxassetid://10723407335",
	["lucide-home"] = "rbxassetid://10723407389",
	["lucide-hourglass"] = "rbxassetid://10723407498",
	["lucide-ice-cream"] = "rbxassetid://10723414308",
	["lucide-image"] = "rbxassetid://10723415040",
	["lucide-image-minus"] = "rbxassetid://10723414487",
	["lucide-image-off"] = "rbxassetid://10723414677",
	["lucide-image-plus"] = "rbxassetid://10723414827",
	["lucide-import"] = "rbxassetid://10723415205",
	["lucide-inbox"] = "rbxassetid://10723415335",
	["lucide-indent"] = "rbxassetid://10723415494",
	["lucide-indian-rupee"] = "rbxassetid://10723415642",
	["lucide-infinity"] = "rbxassetid://10723415766",
	["lucide-info"] = "rbxassetid://10723415903",
	["lucide-inspect"] = "rbxassetid://10723416057",
	["lucide-italic"] = "rbxassetid://10723416195",
	["lucide-japanese-yen"] = "rbxassetid://10723416363",
	["lucide-joystick"] = "rbxassetid://10723416527",
	["lucide-key"] = "rbxassetid://10723416652",
	["lucide-keyboard"] = "rbxassetid://10723416765",
	["lucide-lamp"] = "rbxassetid://10723417513",
	["lucide-lamp-ceiling"] = "rbxassetid://10723416922",
	["lucide-lamp-desk"] = "rbxassetid://10723417016",
	["lucide-lamp-floor"] = "rbxassetid://10723417131",
	["lucide-lamp-wall-down"] = "rbxassetid://10723417240",
	["lucide-lamp-wall-up"] = "rbxassetid://10723417356",
	["lucide-landmark"] = "rbxassetid://10723417608",
	["lucide-languages"] = "rbxassetid://10723417703",
	["lucide-laptop"] = "rbxassetid://10723423881",
	["lucide-laptop-2"] = "rbxassetid://10723417797",
	["lucide-lasso"] = "rbxassetid://10723424235",
	["lucide-lasso-select"] = "rbxassetid://10723424058",
	["lucide-laugh"] = "rbxassetid://10723424372",
	["lucide-layers"] = "rbxassetid://10723424505",
	["lucide-layout"] = "rbxassetid://10723425376",
	["lucide-layout-dashboard"] = "rbxassetid://10723424646",
	["lucide-layout-grid"] = "rbxassetid://10723424838",
	["lucide-layout-list"] = "rbxassetid://10723424963",
	["lucide-layout-template"] = "rbxassetid://10723425187",
	["lucide-leaf"] = "rbxassetid://10723425539",
	["lucide-library"] = "rbxassetid://10723425615",
	["lucide-life-buoy"] = "rbxassetid://10723425685",
	["lucide-lightbulb"] = "rbxassetid://10723425852",
	["lucide-lightbulb-off"] = "rbxassetid://10723425762",
	["lucide-line-chart"] = "rbxassetid://10723426393",
	["lucide-link"] = "rbxassetid://10723426722",
	["lucide-link-2"] = "rbxassetid://10723426595",
	["lucide-link-2-off"] = "rbxassetid://10723426513",
	["lucide-list"] = "rbxassetid://10723433811",
	["lucide-list-checks"] = "rbxassetid://10734884548",
	["lucide-list-end"] = "rbxassetid://10723426886",
	["lucide-list-minus"] = "rbxassetid://10723426986",
	["lucide-list-music"] = "rbxassetid://10723427081",
	["lucide-list-ordered"] = "rbxassetid://10723427199",
	["lucide-list-plus"] = "rbxassetid://10723427334",
	["lucide-list-start"] = "rbxassetid://10723427494",
	["lucide-list-video"] = "rbxassetid://10723427619",
	["lucide-list-x"] = "rbxassetid://10723433655",
	["lucide-loader"] = "rbxassetid://10723434070",
	["lucide-loader-2"] = "rbxassetid://10723433935",
	["lucide-locate"] = "rbxassetid://10723434557",
	["lucide-locate-fixed"] = "rbxassetid://10723434236",
	["lucide-locate-off"] = "rbxassetid://10723434379",
	["lucide-lock"] = "rbxassetid://10723434711",
	["lucide-log-in"] = "rbxassetid://10723434830",
	["lucide-log-out"] = "rbxassetid://10723434906",
	["lucide-luggage"] = "rbxassetid://10723434993",
	["lucide-magnet"] = "rbxassetid://10723435069",
	["lucide-mail"] = "rbxassetid://10734885430",
	["lucide-mail-check"] = "rbxassetid://10723435182",
	["lucide-mail-minus"] = "rbxassetid://10723435261",
	["lucide-mail-open"] = "rbxassetid://10723435342",
	["lucide-mail-plus"] = "rbxassetid://10723435443",
	["lucide-mail-question"] = "rbxassetid://10723435515",
	["lucide-mail-search"] = "rbxassetid://10734884739",
	["lucide-mail-warning"] = "rbxassetid://10734885015",
	["lucide-mail-x"] = "rbxassetid://10734885247",
	["lucide-mails"] = "rbxassetid://10734885614",
	["lucide-map"] = "rbxassetid://10734886202",
	["lucide-map-pin"] = "rbxassetid://10734886004",
	["lucide-map-pin-off"] = "rbxassetid://10734885803",
	["lucide-maximize"] = "rbxassetid://10734886735",
	["lucide-maximize-2"] = "rbxassetid://10734886496",
	["lucide-medal"] = "rbxassetid://10734887072",
	["lucide-megaphone"] = "rbxassetid://10734887454",
	["lucide-megaphone-off"] = "rbxassetid://10734887311",
	["lucide-meh"] = "rbxassetid://10734887603",
	["lucide-menu"] = "rbxassetid://10734887784",
	["lucide-message-circle"] = "rbxassetid://10734888000",
	["lucide-message-square"] = "rbxassetid://10734888228",
	["lucide-mic"] = "rbxassetid://10734888864",
	["lucide-mic-2"] = "rbxassetid://10734888430",
	["lucide-mic-off"] = "rbxassetid://10734888646",
	["lucide-microscope"] = "rbxassetid://10734889106",
	["lucide-microwave"] = "rbxassetid://10734895076",
	["lucide-milestone"] = "rbxassetid://10734895310",
	["lucide-minimize"] = "rbxassetid://10734895698",
	["lucide-minimize-2"] = "rbxassetid://10734895530",
	["lucide-minus"] = "rbxassetid://10734896206",
	["lucide-minus-circle"] = "rbxassetid://10734895856",
	["lucide-minus-square"] = "rbxassetid://10734896029",
	["lucide-monitor"] = "rbxassetid://10734896881",
	["lucide-monitor-off"] = "rbxassetid://10734896360",
	["lucide-monitor-speaker"] = "rbxassetid://10734896512",
	["lucide-moon"] = "rbxassetid://10734897102",
	["lucide-more-horizontal"] = "rbxassetid://10734897250",
	["lucide-more-vertical"] = "rbxassetid://10734897387",
	["lucide-mountain"] = "rbxassetid://10734897956",
	["lucide-mountain-snow"] = "rbxassetid://10734897665",
	["lucide-mouse"] = "rbxassetid://10734898592",
	["lucide-mouse-pointer"] = "rbxassetid://10734898476",
	["lucide-mouse-pointer-2"] = "rbxassetid://10734898194",
	["lucide-mouse-pointer-click"] = "rbxassetid://10734898355",
	["lucide-move"] = "rbxassetid://10734900011",
	["lucide-move-3d"] = "rbxassetid://10734898756",
	["lucide-move-diagonal"] = "rbxassetid://10734899164",
	["lucide-move-diagonal-2"] = "rbxassetid://10734898934",
	["lucide-move-horizontal"] = "rbxassetid://10734899414",
	["lucide-move-vertical"] = "rbxassetid://10734899821",
	["lucide-music"] = "rbxassetid://10734905958",
	["lucide-music-2"] = "rbxassetid://10734900215",
	["lucide-music-3"] = "rbxassetid://10734905665",
	["lucide-music-4"] = "rbxassetid://10734905823",
	["lucide-navigation"] = "rbxassetid://10734906744",
	["lucide-navigation-2"] = "rbxassetid://10734906332",
	["lucide-navigation-2-off"] = "rbxassetid://10734906144",
	["lucide-navigation-off"] = "rbxassetid://10734906580",
	["lucide-network"] = "rbxassetid://10734906975",
	["lucide-newspaper"] = "rbxassetid://10734907168",
	["lucide-octagon"] = "rbxassetid://10734907361",
	["lucide-option"] = "rbxassetid://10734907649",
	["lucide-outdent"] = "rbxassetid://10734907933",
	["lucide-package"] = "rbxassetid://10734909540",
	["lucide-package-2"] = "rbxassetid://10734908151",
	["lucide-package-check"] = "rbxassetid://10734908384",
	["lucide-package-minus"] = "rbxassetid://10734908626",
	["lucide-package-open"] = "rbxassetid://10734908793",
	["lucide-package-plus"] = "rbxassetid://10734909016",
	["lucide-package-search"] = "rbxassetid://10734909196",
	["lucide-package-x"] = "rbxassetid://10734909375",
	["lucide-paint-bucket"] = "rbxassetid://10734909847",
	["lucide-paintbrush"] = "rbxassetid://10734910187",
	["lucide-paintbrush-2"] = "rbxassetid://10734910030",
	["lucide-palette"] = "rbxassetid://10734910430",
	["lucide-palmtree"] = "rbxassetid://10734910680",
	["lucide-paperclip"] = "rbxassetid://10734910927",
	["lucide-party-popper"] = "rbxassetid://10734918735",
	["lucide-pause"] = "rbxassetid://10734919336",
	["lucide-pause-circle"] = "rbxassetid://10735024209",
	["lucide-pause-octagon"] = "rbxassetid://10734919143",
	["lucide-pen-tool"] = "rbxassetid://10734919503",
	["lucide-pencil"] = "rbxassetid://10734919691",
	["lucide-percent"] = "rbxassetid://10734919919",
	["lucide-person-standing"] = "rbxassetid://10734920149",
	["lucide-phone"] = "rbxassetid://10734921524",
	["lucide-phone-call"] = "rbxassetid://10734920305",
	["lucide-phone-forwarded"] = "rbxassetid://10734920508",
	["lucide-phone-incoming"] = "rbxassetid://10734920694",
	["lucide-phone-missed"] = "rbxassetid://10734920845",
	["lucide-phone-off"] = "rbxassetid://10734921077",
	["lucide-phone-outgoing"] = "rbxassetid://10734921288",
	["lucide-pie-chart"] = "rbxassetid://10734921727",
	["lucide-piggy-bank"] = "rbxassetid://10734921935",
	["lucide-pin"] = "rbxassetid://10734922324",
	["lucide-pin-off"] = "rbxassetid://10734922180",
	["lucide-pipette"] = "rbxassetid://10734922497",
	["lucide-pizza"] = "rbxassetid://10734922774",
	["lucide-plane"] = "rbxassetid://10734922971",
	["lucide-play"] = "rbxassetid://10734923549",
	["lucide-play-circle"] = "rbxassetid://10734923214",
	["lucide-plus"] = "rbxassetid://10734924532",
	["lucide-plus-circle"] = "rbxassetid://10734923868",
	["lucide-plus-square"] = "rbxassetid://10734924219",
	["lucide-podcast"] = "rbxassetid://10734929553",
	["lucide-pointer"] = "rbxassetid://10734929723",
	["lucide-pound-sterling"] = "rbxassetid://10734929981",
	["lucide-power"] = "rbxassetid://10734930466",
	["lucide-power-off"] = "rbxassetid://10734930257",
	["lucide-printer"] = "rbxassetid://10734930632",
	["lucide-puzzle"] = "rbxassetid://10734930886",
	["lucide-quote"] = "rbxassetid://10734931234",
	["lucide-radio"] = "rbxassetid://10734931596",
	["lucide-radio-receiver"] = "rbxassetid://10734931402",
	["lucide-rectangle-horizontal"] = "rbxassetid://10734931777",
	["lucide-rectangle-vertical"] = "rbxassetid://10734932081",
	["lucide-recycle"] = "rbxassetid://10734932295",
	["lucide-redo"] = "rbxassetid://10734932822",
	["lucide-redo-2"] = "rbxassetid://10734932586",
	["lucide-refresh-ccw"] = "rbxassetid://10734933056",
	["lucide-refresh-cw"] = "rbxassetid://10734933222",
	["lucide-refrigerator"] = "rbxassetid://10734933465",
	["lucide-regex"] = "rbxassetid://10734933655",
	["lucide-repeat"] = "rbxassetid://10734933966",
	["lucide-repeat-1"] = "rbxassetid://10734933826",
	["lucide-reply"] = "rbxassetid://10734934252",
	["lucide-reply-all"] = "rbxassetid://10734934132",
	["lucide-rewind"] = "rbxassetid://10734934347",
	["lucide-rocket"] = "rbxassetid://10734934585",
	["lucide-rocking-chair"] = "rbxassetid://10734939942",
	["lucide-rotate-3d"] = "rbxassetid://10734940107",
	["lucide-rotate-ccw"] = "rbxassetid://10734940376",
	["lucide-rotate-cw"] = "rbxassetid://10734940654",
	["lucide-rss"] = "rbxassetid://10734940825",
	["lucide-ruler"] = "rbxassetid://10734941018",
	["lucide-russian-ruble"] = "rbxassetid://10734941199",
	["lucide-sailboat"] = "rbxassetid://10734941354",
	["lucide-save"] = "rbxassetid://10734941499",
	["lucide-scale"] = "rbxassetid://10734941912",
	["lucide-scale-3d"] = "rbxassetid://10734941739",
	["lucide-scaling"] = "rbxassetid://10734942072",
	["lucide-scan"] = "rbxassetid://10734942565",
	["lucide-scan-face"] = "rbxassetid://10734942198",
	["lucide-scan-line"] = "rbxassetid://10734942351",
	["lucide-scissors"] = "rbxassetid://10734942778",
	["lucide-screen-share"] = "rbxassetid://10734943193",
	["lucide-screen-share-off"] = "rbxassetid://10734942967",
	["lucide-scroll"] = "rbxassetid://10734943448",
	["lucide-search"] = "rbxassetid://10734943674",
	["lucide-send"] = "rbxassetid://10734943902",
	["lucide-separator-horizontal"] = "rbxassetid://10734944115",
	["lucide-separator-vertical"] = "rbxassetid://10734944326",
	["lucide-server"] = "rbxassetid://10734949856",
	["lucide-server-cog"] = "rbxassetid://10734944444",
	["lucide-server-crash"] = "rbxassetid://10734944554",
	["lucide-server-off"] = "rbxassetid://10734944668",
	["lucide-settings"] = "rbxassetid://10734950309",
	["lucide-settings-2"] = "rbxassetid://10734950020",
	["lucide-share"] = "rbxassetid://10734950813",
	["lucide-share-2"] = "rbxassetid://10734950553",
	["lucide-sheet"] = "rbxassetid://10734951038",
	["lucide-shield"] = "rbxassetid://10734951847",
	["lucide-shield-alert"] = "rbxassetid://10734951173",
	["lucide-shield-check"] = "rbxassetid://10734951367",
	["lucide-shield-close"] = "rbxassetid://10734951535",
	["lucide-shield-off"] = "rbxassetid://10734951684",
	["lucide-shirt"] = "rbxassetid://10734952036",
	["lucide-shopping-bag"] = "rbxassetid://10734952273",
	["lucide-shopping-cart"] = "rbxassetid://10734952479",
	["lucide-shovel"] = "rbxassetid://10734952773",
	["lucide-shower-head"] = "rbxassetid://10734952942",
	["lucide-shrink"] = "rbxassetid://10734953073",
	["lucide-shrub"] = "rbxassetid://10734953241",
	["lucide-shuffle"] = "rbxassetid://10734953451",
	["lucide-sidebar"] = "rbxassetid://10734954301",
	["lucide-sidebar-close"] = "rbxassetid://10734953715",
	["lucide-sidebar-open"] = "rbxassetid://10734954000",
	["lucide-sigma"] = "rbxassetid://10734954538",
	["lucide-signal"] = "rbxassetid://10734961133",
	["lucide-signal-high"] = "rbxassetid://10734954807",
	["lucide-signal-low"] = "rbxassetid://10734955080",
	["lucide-signal-medium"] = "rbxassetid://10734955336",
	["lucide-signal-zero"] = "rbxassetid://10734960878",
	["lucide-siren"] = "rbxassetid://10734961284",
	["lucide-skip-back"] = "rbxassetid://10734961526",
	["lucide-skip-forward"] = "rbxassetid://10734961809",
	["lucide-skull"] = "rbxassetid://10734962068",
	["lucide-slack"] = "rbxassetid://10734962339",
	["lucide-slash"] = "rbxassetid://10734962600",
	["lucide-slice"] = "rbxassetid://10734963024",
	["lucide-sliders"] = "rbxassetid://10734963400",
	["lucide-sliders-horizontal"] = "rbxassetid://10734963191",
	["lucide-smartphone"] = "rbxassetid://10734963940",
	["lucide-smartphone-charging"] = "rbxassetid://10734963671",
	["lucide-smile"] = "rbxassetid://10734964441",
	["lucide-smile-plus"] = "rbxassetid://10734964188",
	["lucide-snowflake"] = "rbxassetid://10734964600",
	["lucide-sofa"] = "rbxassetid://10734964852",
	["lucide-sort-asc"] = "rbxassetid://10734965115",
	["lucide-sort-desc"] = "rbxassetid://10734965287",
	["lucide-speaker"] = "rbxassetid://10734965419",
	["lucide-sprout"] = "rbxassetid://10734965572",
	["lucide-square"] = "rbxassetid://10734965702",
	["lucide-star"] = "rbxassetid://10734966248",
	["lucide-star-half"] = "rbxassetid://10734965897",
	["lucide-star-off"] = "rbxassetid://10734966097",
	["lucide-stethoscope"] = "rbxassetid://10734966384",
	["lucide-sticker"] = "rbxassetid://10734972234",
	["lucide-sticky-note"] = "rbxassetid://10734972463",
	["lucide-stop-circle"] = "rbxassetid://10734972621",
	["lucide-stretch-horizontal"] = "rbxassetid://10734972862",
	["lucide-stretch-vertical"] = "rbxassetid://10734973130",
	["lucide-strikethrough"] = "rbxassetid://10734973290",
	["lucide-subscript"] = "rbxassetid://10734973457",
	["lucide-sun"] = "rbxassetid://10734974297",
	["lucide-sun-dim"] = "rbxassetid://10734973645",
	["lucide-sun-medium"] = "rbxassetid://10734973778",
	["lucide-sun-moon"] = "rbxassetid://10734973999",
	["lucide-sun-snow"] = "rbxassetid://10734974130",
	["lucide-sunrise"] = "rbxassetid://10734974522",
	["lucide-sunset"] = "rbxassetid://10734974689",
	["lucide-superscript"] = "rbxassetid://10734974850",
	["lucide-swiss-franc"] = "rbxassetid://10734975024",
	["lucide-switch-camera"] = "rbxassetid://10734975214",
	["lucide-sword"] = "rbxassetid://10734975486",
	["lucide-swords"] = "rbxassetid://10734975692",
	["lucide-syringe"] = "rbxassetid://10734975932",
	["lucide-table"] = "rbxassetid://10734976230",
	["lucide-table-2"] = "rbxassetid://10734976097",
	["lucide-tablet"] = "rbxassetid://10734976394",
	["lucide-tag"] = "rbxassetid://10734976528",
	["lucide-tags"] = "rbxassetid://10734976739",
	["lucide-target"] = "rbxassetid://10734977012",
	["lucide-tent"] = "rbxassetid://10734981750",
	["lucide-terminal"] = "rbxassetid://10734982144",
	["lucide-terminal-square"] = "rbxassetid://10734981995",
	["lucide-text-cursor"] = "rbxassetid://10734982395",
	["lucide-text-cursor-input"] = "rbxassetid://10734982297",
	["lucide-thermometer"] = "rbxassetid://10734983134",
	["lucide-thermometer-snowflake"] = "rbxassetid://10734982571",
	["lucide-thermometer-sun"] = "rbxassetid://10734982771",
	["lucide-thumbs-down"] = "rbxassetid://10734983359",
	["lucide-thumbs-up"] = "rbxassetid://10734983629",
	["lucide-ticket"] = "rbxassetid://10734983868",
	["lucide-timer"] = "rbxassetid://10734984606",
	["lucide-timer-off"] = "rbxassetid://10734984138",
	["lucide-timer-reset"] = "rbxassetid://10734984355",
	["lucide-toggle-left"] = "rbxassetid://10734984834",
	["lucide-toggle-right"] = "rbxassetid://10734985040",
	["lucide-tornado"] = "rbxassetid://10734985247",
	["lucide-toy-brick"] = "rbxassetid://10747361919",
	["lucide-train"] = "rbxassetid://10747362105",
	["lucide-trash"] = "rbxassetid://10747362393",
	["lucide-trash-2"] = "rbxassetid://10747362241",
	["lucide-tree-deciduous"] = "rbxassetid://10747362534",
	["lucide-tree-pine"] = "rbxassetid://10747362748",
	["lucide-trees"] = "rbxassetid://10747363016",
	["lucide-trending-down"] = "rbxassetid://10747363205",
	["lucide-trending-up"] = "rbxassetid://10747363465",
	["lucide-triangle"] = "rbxassetid://10747363621",
	["lucide-trophy"] = "rbxassetid://10747363809",
	["lucide-truck"] = "rbxassetid://10747364031",
	["lucide-tv"] = "rbxassetid://10747364593",
	["lucide-tv-2"] = "rbxassetid://10747364302",
	["lucide-type"] = "rbxassetid://10747364761",
	["lucide-umbrella"] = "rbxassetid://10747364971",
	["lucide-underline"] = "rbxassetid://10747365191",
	["lucide-undo"] = "rbxassetid://10747365484",
	["lucide-undo-2"] = "rbxassetid://10747365359",
	["lucide-unlink"] = "rbxassetid://10747365771",
	["lucide-unlink-2"] = "rbxassetid://10747397871",
	["lucide-unlock"] = "rbxassetid://10747366027",
	["lucide-upload"] = "rbxassetid://10747366434",
	["lucide-upload-cloud"] = "rbxassetid://10747366266",
	["lucide-usb"] = "rbxassetid://10747366606",
	["lucide-user"] = "rbxassetid://10747373176",
	["lucide-user-check"] = "rbxassetid://10747371901",
	["lucide-user-cog"] = "rbxassetid://10747372167",
	["lucide-user-minus"] = "rbxassetid://10747372346",
	["lucide-user-plus"] = "rbxassetid://10747372702",
	["lucide-user-x"] = "rbxassetid://10747372992",
	["lucide-users"] = "rbxassetid://10747373426",
	["lucide-utensils"] = "rbxassetid://10747373821",
	["lucide-utensils-crossed"] = "rbxassetid://10747373629",
	["lucide-venetian-mask"] = "rbxassetid://10747374003",
	["lucide-verified"] = "rbxassetid://10747374131",
	["lucide-vibrate"] = "rbxassetid://10747374489",
	["lucide-vibrate-off"] = "rbxassetid://10747374269",
	["lucide-video"] = "rbxassetid://10747374938",
	["lucide-video-off"] = "rbxassetid://10747374721",
	["lucide-view"] = "rbxassetid://10747375132",
	["lucide-voicemail"] = "rbxassetid://10747375281",
	["lucide-volume"] = "rbxassetid://10747376008",
	["lucide-volume-1"] = "rbxassetid://10747375450",
	["lucide-volume-2"] = "rbxassetid://10747375679",
	["lucide-volume-x"] = "rbxassetid://10747375880",
	["lucide-wallet"] = "rbxassetid://10747376205",
	["lucide-wand"] = "rbxassetid://10747376565",
	["lucide-wand-2"] = "rbxassetid://10747376349",
	["lucide-watch"] = "rbxassetid://10747376722",
	["lucide-waves"] = "rbxassetid://10747376931",
	["lucide-webcam"] = "rbxassetid://10747381992",
	["lucide-wifi"] = "rbxassetid://10747382504",
	["lucide-wifi-off"] = "rbxassetid://10747382268",
	["lucide-wind"] = "rbxassetid://10747382750",
	["lucide-wrap-text"] = "rbxassetid://10747383065",
	["lucide-wrench"] = "rbxassetid://10747383470",
	["lucide-x"] = "rbxassetid://10747384394",
	["lucide-x-circle"] = "rbxassetid://10747383819",
	["lucide-x-octagon"] = "rbxassetid://10747384037",
	["lucide-x-square"] = "rbxassetid://10747384217",
	["lucide-zoom-in"] = "rbxassetid://10747384552",
	["lucide-zoom-out"] = "rbxassetid://10747384679",
};

Compkiller.FontAwesome = {
	a = "rbxassetid://74244459944328",
	['accessible-icon'] = "rbxassetid://135242143909610",
	accusoft = "rbxassetid://94057545767519",
	['address-book'] = "rbxassetid://129578640498728",
	['address-card'] = 'rbxassetid://102106715141928',
	['align-center'] = "rbxassetid://84408132800466",
	['align-justify'] = "rbxassetid://125569339749500",
	['align-left'] = "rbxassetid://110008004178539",
	['align-right'] = "rbxassetid://79774893981710",
	alipay = "rbxassetid://134274199490629",
	anchor = "rbxassetid://94979524088900",
	['anchor-circle-check'] = "rbxassetid://91871463373335",
	['anchor-circle-exclamation'] = "rbxassetid://72303311082053",
	['anchor-circle-xmark'] = "rbxassetid://106917001300524",
	['anchor-lock'] = "rbxassetid://109198662645391",
	android = "rbxassetid://93605821179752",
	['angle-down'] = "rbxassetid://122395101934469",
	['angle-left'] = "rbxassetid://132632410309959",
	['angle-right'] = "rbxassetid://105971664068240",
	['angles-down'] = "rbxassetid://96703500127872",
	['angles-left'] = "rbxassetid://70595546989447",
	['angles-right'] = "rbxassetid://131176182882747",
	['angles-up'] = "rbxassetid://96847020381396",
	['angle-up'] = "rbxassetid://136517226470297",
	['arrow-down'] = "rbxassetid://100174052036797",
	['arrow-left'] = "rbxassetid://133922718486450",
	['arrow-pointer'] = "rbxassetid://128639550333559",
	['arrow-right'] = 'rbxassetid://105166519175969',
	['arrow-right-arrow-left'] = "rbxassetid://87405428139040",
	['arrow-right-from-bracket'] = "rbxassetid://111722018253482",
	['arrow-right-to-bracket'] = "rbxassetid://79400903745367",
	['arrow-rotate-left'] = "rbxassetid://127876635051023",
	['arrow-rotate-right'] = "rbxassetid://82773599534347",
	['arrows-left-right'] = "rbxassetid://85625938291926",
	['arrows-rotate'] = "rbxassetid://109882153776270",
	['arrows-up-down'] = "rbxassetid://88240470530518",
	['arrows-up-down-left-right'] = "rbxassetid://136830364721572",
	['arrow-trend-down'] = "rbxassetid://138593805214121",
	['arrow-trend-up'] = "rbxassetid://121301107868410",
	['arrow-up'] = "rbxassetid://116473498857626",
	['arrow-up-from-bracket'] = "rbxassetid://77716847027695",
	['arrow-up-right-from-square'] = "rbxassetid://101883941536459",
	at = "rbxassetid://116468402170315",
	atom = "rbxassetid://136905279132440",
	['audio-description'] = 'rbxassetid://137490376195308',
	award = "rbxassetid://134322732056464",
	backward = "rbxassetid://115437448962693",
	['backward-fast'] = "rbxassetid://133478473989228",
	['backward-step'] = "rbxassetid://118301206125870",
	ban = "rbxassetid://89004310664420",
	bandage = "rbxassetid://109104902535966",
	bars = "rbxassetid://127661324755454",
	['bars-progress'] = "rbxassetid://77774174241071",
	['bars-staggered'] = "rbxassetid://97337529919486",
	baseball = "rbxassetid://87677782809968",
	basketball = "rbxassetid://71403045563776",
	['basket-shopping'] = "rbxassetid://129578273645224",
	['battery-empty'] = "rbxassetid://99777750808099",
	['battery-full'] = "rbxassetid://93999278270214",
	['battery-half'] = "rbxassetid://87762099115036",
	['battery-quarter'] = "rbxassetid://96680551535938",
	['battery-three-quarters'] = "rbxassetid://130840615974067",
	bell = "rbxassetid://109971903438934",
	['bell-slash'] = "rbxassetid://101758939103378",
	bilibili = "rbxassetid://85834752961243",
	biohazard = "rbxassetid://102610067899783",
	bitcoin = "rbxassetid://131632152157382",
	['bitcoin-sign'] = "rbxassetid://127809070259506",
	['bluetooth-b'] = "rbxassetid://96522278309021",
	bluetooth = "rbxassetid://113081372628241",
	bolt = "rbxassetid://89858717966393",
	bomb = "rbxassetid://113184250292244",
	book = "rbxassetid://134006112957521",
	['book-open'] = "rbxassetid://109774137257967",
	bug = "rbxassetid://105314179657552",
	['bug-slash'] = "rbxassetid://133973969610093",
	broom = "rbxassetid://95267009545395",
	bullhorn = "rbxassetid://87251830910561",
	['bullseye'] = "rbxassetid://83080500555400",
	bus = "rbxassetid://126579638968493",
	calculator = "rbxassetid://119527046782470",
	camera = "rbxassetid://133029797251962",
	['cc-amazon-pay'] = "rbxassetid://108859760370504",
	['cc-amex'] = "rbxassetid://138233598058785",
	['cc-apple-pay'] = "rbxassetid://133747941882534",
	['cc-diners-club'] = "rbxassetid://99626539664553",
	['cc-mastercard'] = "rbxassetid://118541621561504",
	['cc-visa'] = "rbxassetid://120055576031063",
	['cc-paypal'] = "rbxassetid://87250418163030",
	check = "rbxassetid://129443092324752",
	['chevron-down'] = "rbxassetid://109535175596957",
	['chevron-left'] = "rbxassetid://129113930144228",
	['chevron-right'] = "rbxassetid://105723602996553",
	['chevron-up'] = "rbxassetid://117264500851637",
	chromecast = "rbxassetid://71543589030583",
	circle = "rbxassetid://131274957777266",
	['circle-check'] = "rbxassetid://98678528147000",
	['circle-info'] = "rbxassetid://97519285421665",
	clipboard = 'rbxassetid://111512950362265',
	['clipboard-check'] = "rbxassetid://118535733506457",
	clock = "rbxassetid://98767608471295",
	code = "rbxassetid://91882036126433",
	['computer-mouse'] = "rbxassetid://114752565381440",
	cookie = "rbxassetid://101854685117513",
	copy = "rbxassetid://76996819137437",
	copyright = "rbxassetid://131736117717053",
	['credit-card'] = "rbxassetid://85213342061383",
	['crosshairs'] = "rbxassetid://133441774847498",
	database = "rbxassetid://109882554524389",
	discord = "rbxassetid://75871011309830",
	display = "rbxassetid://101851152220134",
	download = "rbxassetid://122321311031549",
	['earth-africa'] = "rbxassetid://107029199584204",
	['earth-americas'] = "rbxassetid://105574352653407",
	['earth-asia'] = "rbxassetid://138155660327900",
	['earth-europe'] = "rbxassetid://134638370907021",
	['earth-oceania'] = "rbxassetid://121780690380624",
	envelope = "rbxassetid://136184483524922",
	['envelope-open'] = "rbxassetid://132492127839357",
	envira = "rbxassetid://75781570526788",
	equals = "rbxassetid://134271902308970",
	eraser = "rbxassetid://128970640154301",
	ethereum = "rbxassetid://103421769879532",
	exclamation = "rbxassetid://125718656366676",
	eye = "rbxassetid://95235861336970",
	feather = "rbxassetid://135995843954302",
	fingerprint = "rbxassetid://125379360015007",
	fire = "rbxassetid://122498238725085",
	['floppy-disk'] = "rbxassetid://101374426361499",
	folder = "rbxassetid://131374292202389",
	['folder-open'] = "rbxassetid://78238714442180",
	forward = "rbxassetid://107937467448020",
	['forward-fast'] = "rbxassetid://83735840669276",
	['forward-step'] = "rbxassetid://104040171143566",
	gear = "rbxassetid://137945854328407",
	gift = "rbxassetid://129718366414314",
	git = "rbxassetid://117711060446092",
	github = "rbxassetid://123783733365919",
	globe = "rbxassetid://102861769355196",
	['hand-holding-hand'] = "rbxassetid://120797412134954",
	headphones = "rbxassetid://86076153665072",
	headset = "rbxassetid://108070801288944",
	['headphones-simple'] = "rbxassetid://97516570978183",
	house = "rbxassetid://86540166012974",
	['house-chimney'] = "rbxassetid://90066192203346",
	image = "rbxassetid://107205506080751",
	infinity = "rbxassetid://129024756905166",
	info = "rbxassetid://113157514619684",
	keyboard = "rbxassetid://97417417526948",
	list = "rbxassetid://87155993544457",
	['location-arrow'] = "rbxassetid://72621673664457",
	['location-crosshairs'] = "rbxassetid://93887450723164",
	lock = 'rbxassetid://80031239225283',
	palette = "rbxassetid://81372281623830",
	paste = "rbxassetid://88846256867074",
	paw = "rbxassetid://80005916079930",
	pen = "rbxassetid://97404859124912",
	pencil = "rbxassetid://76590960968733",
	['pen-nib'] = "rbxassetid://91232219924341",
	['pen-ruler'] = "rbxassetid://138407458813207",
	phone = "rbxassetid://72814141651992",
	plane = "rbxassetid://136248807279679",
	plus = "rbxassetid://133137619535544",
	['right-left'] = "rbxassetid://91273051324368",
	['right-to-bracket'] = "rbxassetid://137132451900886",
	rotate = "rbxassetid://95883878890200",
	['rotate-right'] = "rbxassetid://93357988077552",
	['rotate-left'] = "rbxassetid://96753646113822",
	shield = "rbxassetid://73441026473893",
	['shield-halved'] = "rbxassetid://114554606211174",
	user = "rbxassetid://98376828270066",
	unlock = "rbxassetid://99060354229117",
	trash = "rbxassetid://82859108629080",
	['trash-can'] = "rbxassetid://81463703129214",
	skull = "rbxassetid://99276754296574",
	robot = "rbxassetid://134497060038109",
	tag = "rbxassetid://129024358125754",
	thumbtack = "rbxassetid://119847869089109",
	['thumbs-up'] = "rbxassetid://74340984021785",
	['thumbs-down'] = "rbxassetid://86090492737223",
	['user-gear'] = "rbxassetid://137604201056497",
	video = "rbxassetid://112274059143251",
	virus = "rbxassetid://91843339206686",
	volleyball = "rbxassetid://73870192536894",
	['magnifying-glass'] = "rbxassetid://74387839235930",
};

function Compkiller:OptimizeMode(v)
	Compkiller.PerformanceMode = v;
end;

function Compkiller:IsStudio()
	return RunService:IsStudio()	
end;

function Compkiller:CustomIconHighlight()
	Compkiller.CustomHighlightMode = true;
end;

function Compkiller:_SetNilP(Ins: Instance , Parent: Instance)
	Compkiller.WindowsNil = Compkiller.WindowsNil or {};
	Compkiller.NilFolder = Compkiller.NilFolder or Instance.new('Folder');

	if not Compkiller.WindowsNil[Ins] then
		local win = Compkiller:_GetWindowFromElement(Ins);

		Compkiller.WindowsNil[Ins] = win;
	end;

	Ins.Parent = Parent or Compkiller.NilFolder;
end;

function Compkiller:SetAllText(flags : {[string] : string})
	if not flags then -- reset to default
		for i,v in next , Compkiller.Flags do
			if v.SetText then
				v:SetText(nil);
			end;
		end;

		return;
	end;

	flags = flags or {};

	for i,v in next , flags do
		if Compkiller.Flags[i] and Compkiller.Flags[i].SetText then
			Compkiller.Flags[i]:SetText(v);
		end;
	end;
end;

function Compkiller:_GetIcon(name : string , font_aws) : string
	if Compkiller.SecureMode then
		local AssetId;

		if font_aws then
			AssetId = Compkiller.FontAwesome[name] or name;
		else
			AssetId = Compkiller.Lucide['lucide-'..tostring(name)] or Compkiller.Lucide[name] or Compkiller.Lucide[tostring(name)] or Compkiller.FontAwesome[name] or name;
		end;

		if AssetId and AssetId ~= nil then
			local asset = Compkiller:CacheImage(AssetId);

			return asset;	
		end;	

		return "";
	end;

	if font_aws then
		return Compkiller.FontAwesome[name] or name;
	end;

	return Compkiller.Lucide['lucide-'..tostring(name)] or Compkiller.Lucide[name] or Compkiller.Lucide[tostring(name)] or Compkiller.FontAwesome[name] or name;
end;

function Compkiller:_RandomString() : string
	return "CK="..string.char(math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102));	
end;

function Compkiller:_IsMouseOverFrame(Frame : Frame) : boolean
	if not Frame then
		return;
	end;

	local AbsPos: Vector2, AbsSize: Vector2 = Frame.AbsolutePosition, Frame.AbsoluteSize;

	if Mouse.X >= AbsPos.X and Mouse.X <= AbsPos.X + AbsSize.X and Mouse.Y >= AbsPos.Y and Mouse.Y <= AbsPos.Y + AbsSize.Y then
		return true;
	end;
end;

function Compkiller:_Rounding(num: number, numDecimalPlaces: number) : number
	local mult: number = 10 ^ (numDecimalPlaces or 0);
	return math.floor(num * mult + 0.5) / mult;
end;

function Compkiller:_Animation(Self: Instance , Info: TweenInfo , Property :{[K] : V})
	local Tween = TweenService:Create(Self , Info or TweenInfo.new(0.25) , Property);

	Tween:Play();

	return Tween;
end;

function Compkiller:_Input(Frame : Frame , Callback : () -> ()) : TextButton
	local Button = Instance.new('TextButton',Frame);

	Button.ZIndex = Frame.ZIndex + 10;
	Button.Size = UDim2.fromScale(1,1);
	Button.BackgroundTransparency = 1;
	Button.TextTransparency = 1;

	if Callback then
		Button.MouseButton1Click:Connect(Callback);
	end;

	return Button;
end;

function Compkiller:GetCalculatePosition(planePos: number, planeNormal: number, rayOrigin: number, rayDirection: number) : number
	local n = planeNormal;
	local d = rayDirection;
	local v = rayOrigin - planePos;

	local num = (n.x * v.x) + (n.y * v.y) + (n.z * v.z);
	local den = (n.x * d.x) + (n.y * d.y) + (n.z * d.z);
	local a = -num / den;

	return rayOrigin + (a * rayDirection);
end;

function Compkiller:_Blur(element : Frame , WindowRemote) : RBXScriptSignal
	if Compkiller.SecureMode and not Compkiller.SecurityConfig.BlurEnabled then
		return game.Changed:Connect(function() end);
	end;

	local Part = Instance.new('Part',Compkiller.ArcylicParent);
	local DepthOfField = Instance.new('DepthOfFieldEffect',cloneref(game:GetService('Lighting')));
	local BlockMesh = Instance.new("BlockMesh");
	local userSettings = UserSettings():GetService("UserGameSettings");

	BlockMesh.Parent = Part;

	Part.Material = Enum.Material.Glass;
	Part.Transparency = 1;
	Part.Reflectance = 1;
	Part.CastShadow = false;
	Part.Anchored = true;
	Part.CanCollide = false;
	Part.CanQuery = false;
	Part.CollisionGroup = Compkiller:_RandomString();
	Part.Size = Vector3.new(1, 1, 1) * 0.01;
	Part.Color = Color3.fromRGB(0,0,0);

	DepthOfField.Enabled = true;
	DepthOfField.FarIntensity = 0;
	DepthOfField.FocusDistance = 0;
	DepthOfField.InFocusRadius = 1000;
	DepthOfField.NearIntensity = 1;
	DepthOfField.Name = Compkiller:_RandomString();

	Part.Name = Compkiller:_RandomString();

	local disconnect;

	local UpdateFunction = function()
		if Compkiller.SecureMode then
			if Part then
				Part:Destroy();
				Part = nil;
			end;

			if DepthOfField then
				DepthOfField:Destroy();
				DepthOfField = nil;
			end;

			if BlockMesh then
				BlockMesh:Destroy();
				BlockMesh = nil;
			end;

			if disconnect then
				disconnect();
				disconnect = nil;
			end;

			return;
		end;

		local IsWindowActive = WindowRemote:GetValue();

		if IsWindowActive then

			Compkiller:_Animation(DepthOfField,TweenInfo.new(0.1),{
				NearIntensity = 1
			})

			Compkiller:_Animation(Part,TweenInfo.new(0.1),{
				Transparency = 0.97,
				Size = Vector3.new(1, 1, 1) * 0.01;
			})
		else
			Compkiller:_Animation(DepthOfField,TweenInfo.new(0.1),{
				NearIntensity = 0
			})

			Compkiller:_Animation(Part,TweenInfo.new(0.1),{
				Size = Vector3.zero,
				Transparency = 1.5,
			})

			return false;
		end;

		if IsWindowActive then
			local corner0 = element.AbsolutePosition;
			local corner1 = corner0 + element.AbsoluteSize;

			local ray0 = CurrentCamera.ScreenPointToRay(CurrentCamera,corner0.X, corner0.Y, 1);
			local ray1 = CurrentCamera.ScreenPointToRay(CurrentCamera,corner1.X, corner1.Y, 1);

			local planeOrigin = CurrentCamera.CFrame.Position + CurrentCamera.CFrame.LookVector * (0.05 - CurrentCamera.NearPlaneZ);

			local planeNormal = CurrentCamera.CFrame.LookVector;

			local pos0 = Compkiller:GetCalculatePosition(planeOrigin, planeNormal, ray0.Origin, ray0.Direction);
			local pos1 = Compkiller:GetCalculatePosition(planeOrigin, planeNormal, ray1.Origin, ray1.Direction);

			pos0 = CurrentCamera.CFrame:PointToObjectSpace(pos0);
			pos1 = CurrentCamera.CFrame:PointToObjectSpace(pos1);

			local size   = pos1 - pos0;
			local center = (pos0 + pos1) / 2;

			BlockMesh.Offset = center
			BlockMesh.Scale  = size / 0.0101;
			Part.CFrame = CurrentCamera.CFrame;
		end;
	end;

	local rbxsignal = CurrentCamera:GetPropertyChangedSignal('CFrame'):Connect(UpdateFunction)
	local loopThread = UserInputService.InputChanged:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
			pcall(UpdateFunction);
		end;
	end);

	local THREAD = task.spawn(function()
		while true do task.wait(0.1)
			pcall(UpdateFunction);
		end;
	end);

	disconnect = function()
		rbxsignal:Disconnect();
		loopThread:Disconnect();
		task.cancel(THREAD);
		Part:Destroy();
		DepthOfField:Destroy();
	end;

	element.Destroying:Connect(disconnect);

	return rbxsignal;
end;

function Compkiller:_AddDragBlacklist(Frame: Frame)
	local IsAdded = false;
	local BASE_TIME = 0.01;

	local SET_BLACKLIST = function(value)
		local index = table.find(Compkiller.DragBlacklist , Frame);

		if value and not Compkiller.IS_DRAG_MOVE then
			if not index then
				table.insert(Compkiller.DragBlacklist,Frame);
			end;
		else
			if index then
				table.remove(Compkiller.DragBlacklist,index);
			end;
		end;
	end;

	Frame.InputBegan:Connect(function(input)
		if Compkiller:_IsMouseOverFrame(Frame) then
			SET_BLACKLIST(true)
		end;
	end);

	Frame.InputEnded:Connect(function(input)
		SET_BLACKLIST(false);
	end);

	UserInputService.InputChanged:Connect(function()
		if not Compkiller:_IsMouseOverFrame(Frame) then
			SET_BLACKLIST(false);
		end
	end);
end;

function Compkiller:_GetWindowFromElement(Element)
	if Compkiller.WindowsNil[Element] then
		return Compkiller.WindowsNil[Element];
	end;

	for i,v : ScreenGui in next , Compkiller.Windows do
		if v and Element:IsDescendantOf(v) then
			return v;
		end;
	end;

	for Frame,Window in next , Compkiller.WindowsNil do
		if Element:IsDescendantOf(Frame) or Frame == Element then
			return Window;
		end;
	end;
end;

function Compkiller.__SIGNAL(default)
	local Bindable = Instance.new('BindableEvent');

	Bindable.Name = string.sub(tostring({}),7);

	Bindable:SetAttribute('Value',default);

	local Binds = {
		__signals = {}	
	};

	function Binds:Connect(event)
		event(Bindable:GetAttribute("Value"));

		local signal = Bindable.Event:Connect(event);

		table.insert(Binds.__signals,signal);

		return signal;
	end;

	function Binds:Fire(value)
		local IsSame = Bindable:GetAttribute("Value") == value;

		Bindable:SetAttribute('Value',value);

		if not IsSame then
			Bindable:Fire(value);
		end;
	end;

	function Binds:GetValue()
		return Bindable:GetAttribute("Value");
	end;

	return Binds;
end;

function Compkiller:_Hover(Frame: Frame , OnHover: () -> any?, Release: () -> any?)
	Frame.MouseEnter:Connect(OnHover);

	Frame.MouseLeave:Connect(Release);
end;

function Compkiller.__CONFIG(config , default)
	config = config or {};

	for i,v in next , default do
		if config[i] == nil then
			config[i] = v;
		end;
	end;

	return config;
end;

function Compkiller:Drag(InputFrame: Frame, MoveFrame: Frame, Speed : number)
	local dragToggle: boolean = false;
	local dragStart: Vector3 = nil;
	local startPos: UDim2 = nil;
	local Tween = TweenInfo.new(Speed);

	local updateInput = function(input)
		local delta = input.Position - dragStart;
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y);

		Compkiller:_Animation(MoveFrame,Tween,{
			Position = position
		});
	end;

	InputFrame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and #Compkiller.DragBlacklist <= 0 then 
			dragToggle = true
			dragStart = input.Position
			startPos = MoveFrame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false;
					Compkiller.IS_DRAG_MOVE = false;
				end
			end)
		end

		if not Compkiller.IsDrage and dragToggle then
			Compkiller.LastDrag = tick();
		end;

		Compkiller.IaDrag = dragToggle;
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch and #Compkiller.DragBlacklist <= 0 then
			if dragToggle then
				Compkiller.IS_DRAG_MOVE = true;
				updateInput(input)
			else
				Compkiller.IS_DRAG_MOVE = false;
			end
		else
			if #Compkiller.DragBlacklist > 0 then
				dragToggle = false
				Compkiller.IS_DRAG_MOVE = false;
			end
		end

		Compkiller.IaDrag = dragToggle;
	end);
end;

function Compkiller:_IsMobile()
	return UserInputService.TouchEnabled;
end;

function Compkiller:_AddLinkValue(Name , Default , GlobalBlock , LinkValues , rep , Signal)
	if Name == "Toggle" then
		local Toggle = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local ToggleValue = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")

		Toggle.Name = Compkiller:_RandomString()
		Toggle.Parent = LinkValues
		Toggle.BackgroundColor3 = Compkiller.Colors.DropColor
		Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Toggle.BorderSizePixel = 0
		Toggle.Size = UDim2.new(0, 30, 0, 16)
		Toggle.ZIndex = GlobalBlock.ZIndex + 1
		Toggle.LayoutOrder = -#LinkValues:GetChildren();

		table.insert(Compkiller.Elements.DropColor , {
			Element = Toggle,
			Property = "BackgroundColor3"
		})

		UICorner.CornerRadius = UDim.new(1, 0)
		UICorner.Parent = Toggle

		UIStroke.Color = Compkiller.Colors.HighStrokeColor
		UIStroke.Parent = Toggle

		table.insert(Compkiller.Elements.HighStrokeColor,{
			Element = UIStroke,
			Property = "Color"
		})

		ToggleValue.Name = Compkiller:_RandomString()
		ToggleValue.Parent = Toggle
		ToggleValue.AnchorPoint = Vector2.new(0.5, 0.5)
		ToggleValue.BackgroundColor3 = Compkiller.Colors.SwitchColor
		ToggleValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ToggleValue.BorderSizePixel = 0
		ToggleValue.Position = UDim2.new(0.25, 0, 0.5, 0)
		ToggleValue.Size = UDim2.new(0.550000012, 0, 0.550000012, 0)
		ToggleValue.SizeConstraint = Enum.SizeConstraint.RelativeYY
		ToggleValue.ZIndex = GlobalBlock.ZIndex + 2

		UICorner_2.CornerRadius = UDim.new(1, 0)
		UICorner_2.Parent = ToggleValue;

		local ToggleElement = function(bool,noChange)
			if not noChange then
				Default = bool;
			end;

			if bool then
				Toggle:SetAttribute('Enabled',true);

				Compkiller:_Animation(ToggleValue,rep.Tween,{
					Position = UDim2.new(0.75, 0, 0.5, 0)
				})

				Compkiller:_Animation(Toggle,rep.Tween,{
					BackgroundColor3 = Compkiller.Colors.Toggle
				})
			else
				Toggle:SetAttribute('Enabled',false);

				Compkiller:_Animation(ToggleValue,rep.Tween,{
					Position = UDim2.new(0.25, 0, 0.5, 0)
				})

				Compkiller:_Animation(Toggle,rep.Tween,{
					BackgroundColor3 = Compkiller.Colors.DropColor
				})
			end;
		end;

		local Input = Compkiller:_Input(Toggle);

		Compkiller:_Hover(Input , function()
			if not Default then
				Compkiller:_Animation(ToggleValue,rep.Tween,{
					Size = UDim2.new(0.6, 0, 0.6, 0)
				})
			end;
		end , function()
			Compkiller:_Animation(ToggleValue,rep.Tween,{
				Size = UDim2.new(0.550000012, 0, 0.550000012, 0)
			})
		end);

		local ToggleUI = function(bool)
			if bool then
				ToggleElement(Default,true);

				Compkiller:_Animation(ToggleValue,rep.Tween,{
					BackgroundTransparency = 0
				})

				Compkiller:_Animation(Toggle,rep.Tween,{
					BackgroundTransparency = 0
				})

				Compkiller:_Animation(UIStroke,rep.Tween,{
					Transparency = 0
				})
			else
				ToggleElement(false,true);

				Compkiller:_Animation(ToggleValue,rep.Tween,{
					BackgroundTransparency = 1
				})

				Compkiller:_Animation(Toggle,rep.Tween,{
					BackgroundTransparency = 1
				})

				Compkiller:_Animation(UIStroke,rep.Tween,{
					Transparency = 1
				})
			end;
		end;

		ToggleElement(Default);

		Signal:Connect(ToggleUI)

		return {
			Root = Toggle,
			ChangeValue = ToggleElement,
			Input = Input,
			ToggleUI = ToggleUI,
		};
	elseif Name == "ColorPicker" then
		local ColorPicker = Instance.new("Frame")
		local ColorFrame = Instance.new("Frame")
		local UIScale = Instance.new("UIScale")
		local UIStroke = Instance.new("UIStroke")
		local UICorner = Instance.new("UICorner")

		ColorPicker.Name = Compkiller:_RandomString()
		ColorPicker.Parent = LinkValues
		ColorPicker.BackgroundTransparency = 1.000
		ColorPicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ColorPicker.BorderSizePixel = 0
		ColorPicker.Size = UDim2.new(0, 16, 0, 16)
		ColorPicker.ZIndex = GlobalBlock.ZIndex + 1
		ColorPicker.LayoutOrder = -#LinkValues:GetChildren();

		ColorFrame.Name = Compkiller:_RandomString()
		ColorFrame.Parent = ColorPicker
		ColorFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		ColorFrame.BackgroundColor3 = Color3.fromRGB(15, 255, 207)
		ColorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ColorFrame.BorderSizePixel = 0
		ColorFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		ColorFrame.Size = UDim2.new(1, -1, 1, -1)
		ColorFrame.ZIndex = GlobalBlock.ZIndex + 1

		UIScale.Parent = ColorFrame

		UIStroke.Color = Compkiller.Colors.HighStrokeColor
		UIStroke.Parent = ColorFrame

		table.insert(Compkiller.Elements.HighStrokeColor,{
			Element = UIStroke,
			Property = "Color"
		})

		UICorner.CornerRadius = UDim.new(0, 3)
		UICorner.Parent = ColorFrame

		Signal:Connect(function(bool)
			if bool then
				Compkiller:_Animation(ColorFrame,TweenInfo.new(0.15),{
					BackgroundTransparency = 0,
				})

				Compkiller:_Animation(UIStroke,TweenInfo.new(0.15),{
					Transparency = 0,
				})
			else
				Compkiller:_Animation(ColorFrame,TweenInfo.new(0.15),{
					BackgroundTransparency = 1,
				})

				Compkiller:_Animation(UIStroke,TweenInfo.new(0.15),{
					Transparency = 1,
				})
			end;
		end)

		Compkiller:_Hover(ColorPicker, function()
			if Signal:GetValue() then
				Compkiller:_Animation(UIScale,TweenInfo.new(0.35),{
					Scale = 1.2
				})
			end;
		end , function()
			if Signal:GetValue() then
				Compkiller:_Animation(UIScale,TweenInfo.new(0.35),{
					Scale = 1
				})
			end;
		end)

		return ColorPicker , ColorFrame;
	elseif Name == "Keybind" then
		local Keys = {
			One = '1',
			Two = '2',
			Three = '3',
			Four = '4',
			Five = '5',
			Six = '6',
			Seven = '7',
			Eight = '8',
			Nine = '9',
			Zero = '0',
			['Minus'] = "-",
			['Plus'] = "+",
			BackSlash = "\\",
			Slash = "/",
			Period = '.',
			Semicolon = ';',
			Colon = ":",
			LeftControl = "LCtrl",
			RightControl = "RCtrl",
			LeftShift = "LShift",
			RightShift = "RShift",
			Return = "Enter",
			LeftBracket = "[",
			RightBracket = "]",
			Quote = "'",
			Comma = ",",
			Equals = "=",
			LeftSuper = "Super",
			RightSuper = "Super",
			LeftAlt = "LAlt",
			RightAlt = "RAlt",
			Escape = "Esc",
		};

		local GetItem = function(item)
			if item then
				if typeof(item) == 'EnumItem' then
					return Keys[item.Name] or item.Name;
				else
					return Keys[tostring(item)] or tostring(item);
				end;
			else
				return 'None';
			end;
		end;

		local Keybind = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local TextLabel = Instance.new("TextLabel")

		Keybind.Name = Compkiller:_RandomString()
		Keybind.Parent = LinkValues
		Keybind.BackgroundColor3 = Compkiller.Colors.DropColor
		Keybind.BackgroundTransparency = 0.8
		Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Keybind.BorderSizePixel = 0
		Keybind.Size = UDim2.new(0, 45, 0, 16)
		Keybind.ZIndex = GlobalBlock.ZIndex + 2
		Keybind.ClipsDescendants = true
		Keybind.LayoutOrder = -#LinkValues:GetChildren();


		table.insert(Compkiller.Elements.DropColor , {
			Element = Keybind,
			Property = "BackgroundColor3"
		})

		UICorner.CornerRadius = UDim.new(0, 3)
		UICorner.Parent = Keybind

		UIStroke.Color = Compkiller.Colors.HighStrokeColor
		UIStroke.Parent = Keybind

		table.insert(Compkiller.Elements.HighStrokeColor,{
			Element = UIStroke,
			Property = "Color"
		})

		TextLabel.Parent = Keybind
		TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextLabel.Size = UDim2.new(1, -5, 1, -5)
		TextLabel.ZIndex = GlobalBlock.ZIndex + 3
		TextLabel.Font = Enum.Font.Gotham
		TextLabel.Text = GetItem(Default or "None");
		TextLabel.TextColor3 = Compkiller.Colors.SwitchColor
		TextLabel.TextSize = 12.000
		TextLabel.TextTransparency = 0.200

		table.insert(Compkiller.Elements.SwitchColor,{
			Element = TextLabel,
			Property = "TextColor3"
		});

		local Update = function()
			local size = TextService:GetTextSize(TextLabel.Text,TextLabel.TextSize,TextLabel.Font,Vector2.new(math.huge,math.huge));

			Compkiller:_Animation(Keybind,TweenInfo.new(0.1),{
				Size = UDim2.new(0, size.X + 5, 0, 16)
			});
		end;

		Update();

		local ToggleUI = function(bool)
			if bool then
				Compkiller:_Animation(Keybind,rep.Tween,{
					BackgroundTransparency = 0.8
				})

				Compkiller:_Animation(UIStroke,rep.Tween,{
					Transparency = 0
				})

				Compkiller:_Animation(TextLabel,rep.Tween,{
					TextTransparency = 0.200
				})
			else
				Compkiller:_Animation(Keybind,rep.Tween,{
					BackgroundTransparency = 1
				})

				Compkiller:_Animation(UIStroke,rep.Tween,{
					Transparency = 1
				})

				Compkiller:_Animation(TextLabel,rep.Tween,{
					TextTransparency = 1
				})
			end;
		end;

		Signal:Connect(ToggleUI);

		return {
			SetValue = function(text)
				TextLabel.Text = GetItem(text or "None");

				Update();
			end,
			Root = Keybind,
		};
	elseif Name == "Helper" then
		local InfoButton = Instance.new("ImageButton")
		local UICorner = Instance.new("UICorner")
		local BlockText = Instance.new("TextLabel")
		local UIStroke = Instance.new("UIStroke")
		local UICorner_2 = Instance.new("UICorner")

		InfoButton.Name = Compkiller:_RandomString()
		InfoButton.Parent = LinkValues
		InfoButton.BackgroundTransparency = 1.000
		InfoButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		InfoButton.BorderSizePixel = 0
		InfoButton.LayoutOrder = -#LinkValues:GetChildren();
		InfoButton.Size = UDim2.new(0, 15, 0, 15)
		InfoButton.ZIndex = GlobalBlock.ZIndex + 25
		InfoButton.Image = Compkiller:CacheImage("rbxassetid://10723415903")
		InfoButton.ImageTransparency = 0.500

		UICorner.CornerRadius = UDim.new(1, 0)
		UICorner.Parent = InfoButton

		BlockText.Name = Compkiller:_RandomString()
		BlockText.Parent = InfoButton
		BlockText.AnchorPoint = Vector2.new(0, 0)
		BlockText.BackgroundColor3 = Compkiller.Colors.BlockColor

		table.insert(Compkiller.Elements.BlockColor , {
			Element = BlockText,
			Property = "BackgroundColor3"
		});

		BlockText.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BlockText.BorderSizePixel = 0
		BlockText.Position = UDim2.new(0, 5, 0, 0)
		BlockText.Size = UDim2.new(0, 250, 0, 15)
		BlockText.ZIndex = GlobalBlock.ZIndex + 26
		BlockText.Font = Enum.Font.GothamMedium
		BlockText.Text = " "
		BlockText.TextColor3 = Compkiller.Colors.SwitchColor
		BlockText.TextSize = 13.000
		BlockText.TextTransparency = 0.300
		BlockText.TextXAlignment = Enum.TextXAlignment.Left

		table.insert(Compkiller.Elements.SwitchColor,{
			Element = BlockText,
			Property = "TextColor3"
		});

		UIStroke.Color = Compkiller.Colors.StrokeColor
		UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		UIStroke.Parent = BlockText

		table.insert(Compkiller.Elements.StrokeColor,{
			Element = UIStroke,
			Property = "Color"
		});

		UICorner_2.CornerRadius = UDim.new(0, 3)
		UICorner_2.Parent = BlockText

		Signal:Connect(function(bool)
			if bool then
				Compkiller:_Animation(InfoButton,TweenInfo.new(0.15),{
					ImageTransparency = 0.500
				})
			else
				Compkiller:_Animation(InfoButton,TweenInfo.new(0.15),{
					ImageTransparency = 1
				})
			end;
		end)

		Compkiller:_Hover(InfoButton, function()
			if Signal:GetValue() then
				Compkiller:_Animation(InfoButton,TweenInfo.new(0.15),{
					ImageTransparency = 0.1
				})
			end;
		end , function()
			if Signal:GetValue() then
				Compkiller:_Animation(InfoButton,TweenInfo.new(0.15),{
					ImageTransparency = 0.500
				})
			end;
		end)

		return {
			Text = BlockText,
			UIStroke = UIStroke,
			InfoButton = InfoButton,
		};
	elseif Name == "Option" then
		local OptionButton = Instance.new("ImageButton")
		local UICorner = Instance.new("UICorner")

		OptionButton.Name = Compkiller:_RandomString()
		OptionButton.Parent = LinkValues
		OptionButton.BackgroundTransparency = 1.000
		OptionButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		OptionButton.BorderSizePixel = 0
		OptionButton.Size = UDim2.new(0, 15, 0, 15)
		OptionButton.ZIndex = GlobalBlock.ZIndex + 2
		OptionButton.Image = Compkiller:CacheImage("rbxassetid://14007344336")
		OptionButton.ImageTransparency = 0.500
		OptionButton.LayoutOrder = -#LinkValues:GetChildren();

		UICorner.CornerRadius = UDim.new(1, 0)
		UICorner.Parent = OptionButton

		Signal:Connect(function(bool)
			if bool then
				Compkiller:_Animation(OptionButton,TweenInfo.new(0.15),{
					ImageTransparency = 0.500
				})
			else
				Compkiller:_Animation(OptionButton,TweenInfo.new(0.15),{
					ImageTransparency = 1
				})
			end;
		end)

		Compkiller:_Hover(OptionButton, function()
			if Signal:GetValue() then
				Compkiller:_Animation(OptionButton,TweenInfo.new(0.15),{
					ImageTransparency = 0.1
				})
			end;
		end , function()
			if Signal:GetValue() then
				Compkiller:_Animation(OptionButton,TweenInfo.new(0.15),{
					ImageTransparency = 0.500
				})
			end;
		end)

		return OptionButton;
	end;
end;

function Compkiller:_CreateBlock(Signal)
	local GlobalBlock = Instance.new("Frame")
	local BlockText = Instance.new("TextLabel")
	local LinkValues = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local BlockLine = Instance.new("Frame")

	if Compkiller:_IsMobile() then
		Compkiller:_AddDragBlacklist(GlobalBlock);
	end;

	GlobalBlock.Name = Compkiller:_RandomString()
	GlobalBlock.BackgroundTransparency = 1.000
	GlobalBlock.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GlobalBlock.BorderSizePixel = 0
	GlobalBlock.Size = UDim2.new(1, -1, 0, 30)
	GlobalBlock.ZIndex = 10

	BlockText.Name = Compkiller:_RandomString()
	BlockText.Parent = GlobalBlock
	BlockText.AnchorPoint = Vector2.new(0, 0.5)
	BlockText.BackgroundTransparency = 1.000
	BlockText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	BlockText.BorderSizePixel = 0
	BlockText.Position = UDim2.new(0, 12, 0.5, 0)
	BlockText.Size = UDim2.new(1, -20, 0, 25)
	BlockText.ZIndex = 10
	BlockText.Font = Enum.Font.GothamMedium
	BlockText.Text = "Block"
	BlockText.TextColor3 = Compkiller.Colors.SwitchColor
	BlockText.TextSize = 14.000
	BlockText.TextTransparency = 0.300
	BlockText.TextXAlignment = Enum.TextXAlignment.Left

	table.insert(Compkiller.Elements.SwitchColor , {
		Element = BlockText,
		Property = 'TextColor3'
	});

	LinkValues.Name = Compkiller:_RandomString()
	LinkValues.Parent = GlobalBlock
	LinkValues.AnchorPoint = Vector2.new(1, 0.540000021)
	LinkValues.BackgroundTransparency = 1.000
	LinkValues.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LinkValues.BorderSizePixel = 0
	LinkValues.Position = UDim2.new(1, -12, 0.5, 0)
	LinkValues.Size = UDim2.new(1, 0, 0, 18)
	LinkValues.ZIndex = 11

	UIListLayout.Parent = LinkValues
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout.Padding = UDim.new(0, 8)

	BlockLine.Name = Compkiller:_RandomString()
	BlockLine.Parent = GlobalBlock
	BlockLine.AnchorPoint = Vector2.new(0.5, 1)
	BlockLine.BackgroundColor3 = Compkiller.Colors.LineColor
	BlockLine.BackgroundTransparency = 0.500
	BlockLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
	BlockLine.BorderSizePixel = 0
	BlockLine.Position = UDim2.new(0.5, 0, 1, 0)
	BlockLine.Size = UDim2.new(1, -26, 0, 1)
	BlockLine.ZIndex = 12

	table.insert(Compkiller.Elements.LineColor,{
		Element = BlockLine,
		Property = "BackgroundColor3"
	});

	local rep = {
		TextTransparency = 0.300,
		Root = GlobalBlock,
		Tween = TweenInfo.new(0.25),
	};

	function rep:SetText(Text)
		BlockText.Text = Text;
	end;

	function rep:GetText()
		return BlockText.Text;
	end;

	function rep:SetTextColor(Color)
		local oldIndex = table.find(Compkiller.Elements.SwitchColor , BlockText);

		table.remove(Compkiller.Elements.SwitchColor , oldIndex);

		BlockText.TextColor3 = Color;

		table.insert(Compkiller.Elements.Risky , {
			Element = BlockText,
			Property = 'TextColor3'
		});

	end;

	function rep:SetLine(visible)
		BlockLine.Visible = visible;

		if not visible then
			BlockLine.Parent = nil;
		else
			BlockLine.Parent = rep.Root;
		end;
	end;

	function rep:SetTransparency(num)
		rep.TextTransparency = num;

		Compkiller:_Animation(BlockText,TweenInfo.new(0.3),{
			TextTransparency = rep.TextTransparency
		});
	end;

	function rep:SetParent(parent: Frame)
		GlobalBlock.Parent = parent;

		local ZINDEX = parent.ZIndex;

		GlobalBlock.ZIndex = ZINDEX + 1;
		BlockText.ZIndex = ZINDEX + 2;
		LinkValues.ZIndex = ZINDEX + 2;
		BlockLine.ZIndex = ZINDEX + 2;
	end;

	function rep:SetVisible(bool)
		if bool then
			Compkiller:_Animation(BlockText,rep.Tween,{
				TextTransparency = rep.TextTransparency
			});

			Compkiller:_Animation(BlockLine,rep.Tween,{
				BackgroundTransparency = 0.500
			});
		else
			Compkiller:_Animation(BlockText,rep.Tween,{
				TextTransparency = 1
			});

			Compkiller:_Animation(BlockLine,rep.Tween,{
				BackgroundTransparency = 1
			});
		end;
	end;

	function rep:AddLink(Name , Default)
		return Compkiller:_AddLinkValue(Name , Default , GlobalBlock , LinkValues , rep , Signal);
	end;

	return rep;
end;

Compkiller.Hash = function(str: string)
	if typeof(str) ~= "string" then
		return "ck-unknow";
	end;

	local hex = #str;

	string.gsub(str,'.',function(byte)
		hex += byte:byte() + #str;
	end);

	local dh = string.match(str,'%d+');

	return "ck-"..tostring(math.round(hex + 15))..tostring(dh);
end;

function Compkiller:CacheImage(id: string) : string
	if not Compkiller.SecureMode or not id or not id:byte() then
		return id or "";
	end;

	assert(Compkiller.SecureMode , "please use Compkiller:Security(< string >) before cache image")
	assert(Compkiller.CacheDirectory , "please use Compkiller:Security(< string >) before cache image")

	local ids = string.match(id , "%d+");

	if ids == nil then
		return id;
	end;

	local Hash = Compkiller.Hash(id);

	local cache_path = string.format("%s/cache-%s.png" ,Compkiller.CacheDirectory , Hash);

	if isfile(cache_path) then
		return (getcustomasset or getsynasset or function() return ''; end)(cache_path);
	end;

	local imgSize = Compkiller.SecurityConfig.ImageScale;

	local imagesize = (imgSize and string.format("%sx%s", tostring(math.round(imgSize)), tostring(math.round(imgSize)))) or "150x150"

	if imagesize == nil then
		return ''
	end;

	local endpoint = string.format(
		"https://thumbnails.roblox.com/v1/assets?assetIds=%s&size=%s&format=Png&isCircular=false",
		ids,
		imagesize
	);

	local json = game:HttpGet(endpoint);

	local JSON_Decode = select(2, pcall(function()
		return HttpService:JSONDecode(json);
	end));

	if typeof(JSON_Decode) == "table" and JSON_Decode and JSON_Decode.data and JSON_Decode.data[1] and JSON_Decode.data[1].imageUrl and JSON_Decode.data[1].state == "Completed" then task.wait()
		local en = JSON_Decode.data[1].imageUrl;

		writefile(cache_path , game:HttpGet(en));

		task.wait();

		return (getcustomasset or getsynasset or function() return ''; end)(cache_path);
	end;

	return "";
end;

function Compkiller:PreloadIcons()
	local RequiredAssets = {
		"http://www.roblox.com/asset/?id=112554223509763",
		"rbxassetid://4805639000",
		"rbxassetid://6198493000",
		"rbxassetid://10709790948",
		"rbxassetid://18518299306",
		"rbxassetid://10747362393",
		"rbxassetid://18720640102",
		"rbxassetid://10723344270",
		"rbxassetid://109535175596957",
		"rbxassetid://10747384394",
		"rbxassetid://10734941499",
		Compkiller.Logo,
	};

	if Compkiller.SecureMode then
		for i,v in next , RequiredAssets do task.wait()
			pcall(function()
				Compkiller:CacheImage(v);
			end);
		end;
	else
		local ContentProvider: ContentProvider = cloneref(game:GetService('ContentProvider'));

		for i,v in next , RequiredAssets do
			ContentProvider:Preload(v);
		end;
	end;
end;

function Compkiller:Security(directory: string,Config: SecurityConfig) -- Security Mode
	directory = directory or "Compkiller-Cache";

	if not isfolder(directory) then
		makefolder(directory);
	end;

	Compkiller.SecureMode = true;

	Compkiller.SecurityConfig = Config or {};

	Compkiller.CacheDirectory = directory;
end;

function Compkiller:_AddColorPickerPanel(Button: ImageButton , Callback: (Color: Color3) -> any?)
	local Window = Compkiller:_GetWindowFromElement(Button);
	local BaseZ_Index = math.random(1,15) * 100;

	local ColorPickerWindow = Instance.new("Frame")
	local UIStroke = Instance.new("UIStroke")
	local UICorner = Instance.new("UICorner")
	local ColorPickBox = Instance.new("ImageLabel")
	local MouseMovement = Instance.new("ImageLabel")
	local UICorner_2 = Instance.new("UICorner")
	local UIStroke_2 = Instance.new("UIStroke")
	local ColorRedGreenBlue = Instance.new("Frame")
	local UIGradient = Instance.new("UIGradient")
	local UICorner_3 = Instance.new("UICorner")
	local ColorRGBSlide = Instance.new("Frame")
	local Left = Instance.new("Frame")
	local UIStroke_3 = Instance.new("UIStroke")
	local Right = Instance.new("Frame")
	local UIStroke_4 = Instance.new("UIStroke")
	local ColorOpc = Instance.new("Frame")
	local UICorner_4 = Instance.new("UICorner")
	local ColorOptSlide = Instance.new("Frame")
	local Left_2 = Instance.new("Frame")
	local UIStroke_5 = Instance.new("UIStroke")
	local Right_2 = Instance.new("Frame")
	local UIStroke_6 = Instance.new("UIStroke")
	local UIGradient_2 = Instance.new("UIGradient")
	local UIStroke_7 = Instance.new("UIStroke")
	local TransparentImage = Instance.new("ImageLabel")
	local UICorner_5 = Instance.new("UICorner")
	local HexFrame = Instance.new("Frame")
	local UICorner_6 = Instance.new("UICorner")
	local UIStroke_8 = Instance.new("UIStroke")
	local TextLabel = Instance.new("TextLabel")

	ColorPickerWindow.Name = Compkiller:_RandomString()
	ColorPickerWindow.Parent = Window
	ColorPickerWindow.BackgroundColor3 = Compkiller.Colors.BlockBackground
	ColorPickerWindow.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorPickerWindow.BorderSizePixel = 0
	ColorPickerWindow.Position = UDim2.new(123, 0, 123, 0)
	ColorPickerWindow.Size = UDim2.new(0, 175, 0, 200)
	ColorPickerWindow.ZIndex = BaseZ_Index
	ColorPickerWindow.AnchorPoint = Vector2.new(0.5,0)
	ColorPickerWindow.Active = true;

	table.insert(Compkiller.Elements.BlockBackground,{
		Element = ColorPickerWindow,
		Property = "BackgroundColor3"
	});

	Compkiller:_AddDragBlacklist(ColorPickerWindow)

	UIStroke.Color = Compkiller.Colors.HighStrokeColor
	UIStroke.Parent = ColorPickerWindow

	table.insert(Compkiller.Elements.HighStrokeColor , {
		Element = UIStroke,
		Property = "Color"
	})

	UICorner.CornerRadius = UDim.new(0, 6)
	UICorner.Parent = ColorPickerWindow

	ColorPickBox.Name = Compkiller:_RandomString()
	ColorPickBox.Parent = ColorPickerWindow
	ColorPickBox.BackgroundColor3 = Color3.fromRGB(39, 255, 35)
	ColorPickBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorPickBox.BorderSizePixel = 0
	ColorPickBox.Position = UDim2.new(0, 7, 0, 7)
	ColorPickBox.Size = UDim2.new(0, 145, 0, 145)
	ColorPickBox.ZIndex = BaseZ_Index + 1
	ColorPickBox.Image = Compkiller:CacheImage("http://www.roblox.com/asset/?id=112554223509763");

	MouseMovement.Name = Compkiller:_RandomString()
	MouseMovement.Parent = ColorPickBox
	MouseMovement.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MouseMovement.BackgroundTransparency = 1.000
	MouseMovement.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MouseMovement.BorderSizePixel = 0
	MouseMovement.Position = UDim2.new(0.822222233, 0, 0.0592592582, 0)
	MouseMovement.Size = UDim2.new(0, 12, 0, 12)
	MouseMovement.ZIndex = BaseZ_Index + 5
	MouseMovement.AnchorPoint = Vector2.new(0.5,0.5)
	MouseMovement.Image = Compkiller:CacheImage("rbxassetid://4805639000")

	UICorner_2.CornerRadius = UDim.new(0, 2)
	UICorner_2.Parent = ColorPickBox

	UIStroke_2.Color = Color3.fromRGB(29, 29, 29)
	UIStroke_2.Parent = ColorPickBox

	ColorRedGreenBlue.Name = Compkiller:_RandomString()
	ColorRedGreenBlue.Parent = ColorPickerWindow
	ColorRedGreenBlue.AnchorPoint = Vector2.new(1, 0)
	ColorRedGreenBlue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ColorRedGreenBlue.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorRedGreenBlue.BorderSizePixel = 0
	ColorRedGreenBlue.ClipsDescendants = true
	ColorRedGreenBlue.Position = UDim2.new(1, -7, 0, 7)
	ColorRedGreenBlue.Size = UDim2.new(0, 10, 0, 145)
	ColorRedGreenBlue.ZIndex = BaseZ_Index + 6

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 153, 0)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(203, 255, 0)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(50, 255, 0)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 102)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 101, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(50, 0, 255)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(204, 0, 255)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 153)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))}
	UIGradient.Rotation = 90
	UIGradient.Parent = ColorRedGreenBlue

	UICorner_3.CornerRadius = UDim.new(1, 0)
	UICorner_3.Parent = ColorRedGreenBlue

	ColorRGBSlide.Name = Compkiller:_RandomString()
	ColorRGBSlide.Parent = ColorRedGreenBlue
	ColorRGBSlide.AnchorPoint = Vector2.new(0.5, 0)
	ColorRGBSlide.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ColorRGBSlide.BackgroundTransparency = 1.000
	ColorRGBSlide.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorRGBSlide.BorderSizePixel = 0
	ColorRGBSlide.Position = UDim2.new(0.5, 0, 0.5, 0)
	ColorRGBSlide.Size = UDim2.new(1, 0, 0, 2)
	ColorRGBSlide.ZIndex = BaseZ_Index + 7

	Left.Name = Compkiller:_RandomString()
	Left.Parent = ColorRGBSlide
	Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Left.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Left.BorderSizePixel = 0
	Left.Size = UDim2.new(0, 2, 1, 0)
	Left.ZIndex = BaseZ_Index + 100

	UIStroke_3.Parent = Left

	Right.Name = Compkiller:_RandomString()
	Right.Parent = ColorRGBSlide
	Right.AnchorPoint = Vector2.new(1, 0)
	Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Right.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Right.BorderSizePixel = 0
	Right.Position = UDim2.new(1, 0, 0, 0)
	Right.Size = UDim2.new(0, 2, 1, 0)
	Right.ZIndex = BaseZ_Index + 100

	UIStroke_4.Parent = Right

	ColorOpc.Name = Compkiller:_RandomString()
	ColorOpc.Parent = ColorPickerWindow
	ColorOpc.BackgroundColor3 = Color3.fromRGB(102, 255, 0)
	ColorOpc.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorOpc.BorderSizePixel = 0
	ColorOpc.Position = UDim2.new(0, 7, 0, 160)
	ColorOpc.Size = UDim2.new(1, -30, 0, 9)
	ColorOpc.ZIndex = BaseZ_Index + 6

	UICorner_4.CornerRadius = UDim.new(1, 0)
	UICorner_4.Parent = ColorOpc

	ColorOptSlide.Name = Compkiller:_RandomString()
	ColorOptSlide.Parent = ColorOpc
	ColorOptSlide.AnchorPoint = Vector2.new(0, 0.5)
	ColorOptSlide.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ColorOptSlide.BackgroundTransparency = 1.000
	ColorOptSlide.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorOptSlide.BorderSizePixel = 0
	ColorOptSlide.Position = UDim2.new(0.5, 0, 0.5, 0)
	ColorOptSlide.Size = UDim2.new(0, 2, 1, 0)
	ColorOptSlide.ZIndex = BaseZ_Index + 7

	Left_2.Name = Compkiller:_RandomString()
	Left_2.Parent = ColorOptSlide
	Left_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Left_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Left_2.BorderSizePixel = 0
	Left_2.Size = UDim2.new(1, 0, 0, 2)
	Left_2.ZIndex = BaseZ_Index + 100

	UIStroke_5.Parent = Left_2

	Right_2.Name = Compkiller:_RandomString()
	Right_2.Parent = ColorOptSlide
	Right_2.AnchorPoint = Vector2.new(0, 1)
	Right_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Right_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Right_2.BorderSizePixel = 0
	Right_2.Position = UDim2.new(0, 0, 1, 0)
	Right_2.Size = UDim2.new(1, 0, 0, 2)
	Right_2.ZIndex = BaseZ_Index + 100

	UIStroke_6.Parent = Right_2

	UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient_2.Parent = ColorOpc

	UIStroke_7.Transparency = 0.500
	UIStroke_7.Color = Color3.fromRGB(29, 29, 29)
	UIStroke_7.Parent = ColorOpc

	TransparentImage.Name = Compkiller:_RandomString()
	TransparentImage.Parent = ColorOpc
	TransparentImage.BackgroundTransparency = 1.000
	TransparentImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TransparentImage.BorderSizePixel = 0
	TransparentImage.Size = UDim2.new(1, 0, 1, 0)
	TransparentImage.ZIndex = BaseZ_Index + 5
	TransparentImage.Image = Compkiller:CacheImage("rbxassetid://6198493000")
	TransparentImage.ImageColor3 = Color3.fromRGB(206, 206, 206)
	TransparentImage.ScaleType = Enum.ScaleType.Crop

	UICorner_5.CornerRadius = UDim.new(1, 0)
	UICorner_5.Parent = TransparentImage

	HexFrame.Name = Compkiller:_RandomString()
	HexFrame.Parent = ColorPickerWindow
	HexFrame.AnchorPoint = Vector2.new(0.5, 1)
	HexFrame.BackgroundColor3 = Compkiller.Colors.BlockColor
	HexFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HexFrame.BorderSizePixel = 0
	HexFrame.Position = UDim2.new(0.5, 0, 1, -5)
	HexFrame.Size = UDim2.new(1, -16, 0, 20)
	HexFrame.ZIndex = BaseZ_Index + 205

	table.insert(Compkiller.Elements.BlockColor,{
		Element = HexFrame,
		Property = "BackgroundColor3"
	});

	UICorner_6.CornerRadius = UDim.new(0, 4)
	UICorner_6.Parent = HexFrame

	UIStroke_8.Color = Compkiller.Colors.HighStrokeColor
	UIStroke_8.Parent = HexFrame

	table.insert(Compkiller.Elements.HighStrokeColor,{
		Element = UIStroke_8,
		Property = "Color"
	});

	TextLabel.Parent = HexFrame
	TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextLabel.Size = UDim2.new(1, -10, 1, -5)
	TextLabel.ZIndex = BaseZ_Index + 206
	TextLabel.Font = Enum.Font.Gotham
	TextLabel.Text = "#FFFFFFF"
	TextLabel.TextColor3 = Compkiller.Colors.SwitchColor
	TextLabel.TextSize = 13.000
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left

	table.insert(Compkiller.Elements.SwitchColor , {
		Element = TextLabel,
		Property = 'TextColor3'
	});

	local Args = {
		IsHold = false,
		IsVisible = false,
	};

	local Tween = TweenInfo.new(0.2 , Enum.EasingStyle.Quad);
	local Tween2 = TweenInfo.new(0.275 , Enum.EasingStyle.Quad);

	Compkiller:_AddPropertyEvent(ColorPickerWindow,function(v)
		ColorPickerWindow.Visible = v;

		if Compkiller.PerformanceMode then
			if ColorPickerWindow.Visible then
				Compkiller:_SetNilP(ColorPickerWindow , Window);
			else
				Compkiller:_SetNilP(ColorPickerWindow , nil);
			end;
		else
			Compkiller:_SetNilP(ColorPickerWindow , Window);
		end;
	end)

	local ToggleUI = function(bool)
		local IsSame = Args.IsVisible == bool;

		Args.IsVisible = bool;

		local MainPosition = UDim2.new(0,Button.AbsolutePosition.X + 95,0,Button.AbsolutePosition.Y + 65);
		local DropPosition = UDim2.new(0,MainPosition.X.Offset,0,MainPosition.Y.Offset + 15);

		local MUL = Window.AbsoluteSize.Y / 2;

		if MainPosition.Y.Offset > MUL then -- go up
			MainPosition = UDim2.fromOffset(Button.AbsolutePosition.X,Button.AbsolutePosition.Y + 45);
			DropPosition = UDim2.fromOffset(MainPosition.X.Offset,MainPosition.Y.Offset - 25);

			ColorPickerWindow.AnchorPoint = Vector2.new(0.5,1)
		else
			ColorPickerWindow.AnchorPoint = Vector2.new(0.5,0)
		end;

		if bool then

			if not IsSame then
				ColorPickerWindow.Position = DropPosition
			end;

			Compkiller:_Animation(ColorPickerWindow,Tween2,{
				BackgroundTransparency = 0,
				Size = UDim2.new(0, 175, 0, 200)
			});

			Compkiller:_Animation(ColorPickerWindow,Tween,{
				Position = MainPosition,
			});

			Compkiller:_Animation(UIStroke_8,Tween,{
				Transparency = 0
			});

			Compkiller:_Animation(UIStroke_7,Tween,{
				Transparency = 0.5
			});

			Compkiller:_Animation(UIStroke_6,Tween,{
				Transparency = 0
			});

			Compkiller:_Animation(UIStroke_5,Tween,{
				Transparency = 0
			});

			Compkiller:_Animation(UIStroke_4,Tween,{
				Transparency = 0
			});

			Compkiller:_Animation(UIStroke_3,Tween,{
				Transparency = 0
			});

			Compkiller:_Animation(UIStroke_2,Tween,{
				Transparency = 0
			});

			Compkiller:_Animation(UIStroke,Tween,{
				Transparency = 0
			});

			Compkiller:_Animation(ColorPickBox,Tween,{
				BackgroundTransparency = 0,
				ImageTransparency = 0
			});

			Compkiller:_Animation(MouseMovement,Tween,{
				ImageTransparency = 0
			});

			Compkiller:_Animation(ColorOpc,Tween,{
				BackgroundTransparency = 0
			});

			Compkiller:_Animation(TransparentImage,Tween,{
				ImageTransparency = 0
			});

			Compkiller:_Animation(Left,Tween,{
				BackgroundTransparency = 0
			});

			Compkiller:_Animation(Left_2,Tween,{
				BackgroundTransparency = 0
			});

			Compkiller:_Animation(Right,Tween,{
				BackgroundTransparency = 0
			});

			Compkiller:_Animation(Right_2,Tween,{
				BackgroundTransparency = 0
			});

			Compkiller:_Animation(ColorRedGreenBlue,Tween,{
				BackgroundTransparency = 0
			});

			Compkiller:_Animation(HexFrame,Tween,{
				BackgroundTransparency = 0
			});

			Compkiller:_Animation(TextLabel,Tween,{
				TextTransparency = 0
			});
		else
			Compkiller:_Animation(UIStroke_8,Tween,{
				Transparency = 1
			});

			Compkiller:_Animation(UIStroke_7,Tween,{
				Transparency = 1
			});

			Compkiller:_Animation(UIStroke_6,Tween,{
				Transparency = 1
			});

			Compkiller:_Animation(UIStroke_5,Tween,{
				Transparency = 1
			});

			Compkiller:_Animation(UIStroke_4,Tween,{
				Transparency = 1
			});

			Compkiller:_Animation(UIStroke_3,Tween,{
				Transparency = 1
			});

			Compkiller:_Animation(UIStroke_2,Tween,{
				Transparency = 1
			});

			Compkiller:_Animation(UIStroke,Tween,{
				Transparency = 1
			});

			Compkiller:_Animation(ColorPickerWindow,Tween2,{
				BackgroundTransparency = 1,
			});

			Compkiller:_Animation(ColorPickerWindow,Tween,{
				Position = DropPosition,
			});

			Compkiller:_Animation(ColorPickBox,Tween,{
				BackgroundTransparency = 1,
				ImageTransparency = 1
			});

			Compkiller:_Animation(MouseMovement,Tween,{
				ImageTransparency = 1
			});

			Compkiller:_Animation(ColorOpc,Tween,{
				BackgroundTransparency = 1
			});

			Compkiller:_Animation(TransparentImage,Tween,{
				ImageTransparency = 1
			});

			Compkiller:_Animation(Left,Tween,{
				BackgroundTransparency = 1
			});

			Compkiller:_Animation(Left_2,Tween,{
				BackgroundTransparency = 1
			});

			Compkiller:_Animation(Right,Tween,{
				BackgroundTransparency = 1
			});

			Compkiller:_Animation(Right_2,Tween,{
				BackgroundTransparency = 1
			});

			Compkiller:_Animation(ColorRedGreenBlue,Tween,{
				BackgroundTransparency = 1
			});

			Compkiller:_Animation(HexFrame,Tween,{
				BackgroundTransparency = 1
			});

			Compkiller:_Animation(TextLabel,Tween,{
				TextTransparency = 1
			});
		end;
	end;

	Button.MouseButton1Click:Connect(function()
		ToggleUI(true);
	end)

	local H , S , V = 0,0,0;
	local Transparency = 0;

	function Args:SetColor(Color: Color3 , TransparencyValue: number)
		H , S , V = Color:ToHSV();
		Transparency = TransparencyValue;
	end;

	function Args:Update()
		local MainColor = Color3.fromHSV(H , S , 1);
		local RealColor = Color3.fromHSV(H , S , V);

		Compkiller:_Animation(ColorPickBox,TweenInfo.new(0.2),{
			BackgroundColor3 = Color3.fromHSV(H , 1 , 1)
		});

		Compkiller:_Animation(ColorOpc,TweenInfo.new(0.2),{
			BackgroundColor3 = RealColor
		});

		Compkiller:_Animation(MouseMovement,TweenInfo.new(0.2),{
			Position = UDim2.fromScale(S , 1 - V)
		});

		Compkiller:_Animation(ColorOptSlide,TweenInfo.new(0.2),{
			Position = UDim2.new(Transparency ,0 , 0.5 ,0)
		});

		Compkiller:_Animation(ColorRGBSlide,TweenInfo.new(0.2),{
			Position = UDim2.new(0.5 ,0 , H ,0)
		});

		TextLabel.Text = "#" .. tostring(RealColor:ToHex())

		Callback(RealColor , Transparency);
	end;

	local SPAWN_THREAD;

	ColorPickerWindow.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			Args.IsHold = true;

			if SPAWN_THREAD then
				task.cancel(SPAWN_THREAD);
				SPAWN_THREAD = nil;
			end;

			SPAWN_THREAD = task.spawn(function()
				while true do task.wait(0.00001)
					if not Args.IsHold then
						break;	
					end;

					Callback(Color3.fromHSV(H , S , V),Transparency);
				end;
			end);
		end;
	end)

	ColorPickerWindow.InputEnded:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			Args.IsHold = false;

			if SPAWN_THREAD then
				task.cancel(SPAWN_THREAD);
				SPAWN_THREAD = nil;
			end;
		end;
	end)

	UserInputService.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			if not Compkiller:_IsMouseOverFrame(ColorPickerWindow) then
				ToggleUI(false);
			end;
		end;
	end)

	ColorRedGreenBlue.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			Args.IsHold = true;

			while (UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or Args.IsHold) do task.wait()
				local ColorY = ColorRedGreenBlue.AbsolutePosition.Y
				local ColorYM = ColorY + ColorRedGreenBlue.AbsoluteSize.Y;
				local Value = math.clamp(Mouse.Y, ColorY, ColorYM)
				local Code = ((Value - ColorY) / (ColorYM - ColorY));

				H = Code;

				Args:Update();
			end;
		end;
	end);

	ColorOpc.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			Args.IsHold = true;

			while (UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or Args.IsHold) do task.wait()
				local transparency = math.clamp((((Mouse.X) - ColorOpc.AbsolutePosition.X) / ColorOpc.AbsoluteSize.X), 0, 1);
				local RealColor = Color3.fromHSV(H , S , V);

				TextLabel.Text = "#" .. tostring(RealColor:ToHex())

				Transparency = transparency;

				Args:Update();
			end;
		end;
	end);

	ColorPickBox.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			Args.IsHold = true;

			while (UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or Args.IsHold) do task.wait();
				local PosX = ColorPickBox.AbsolutePosition.X
				local ScaleX = PosX + ColorPickBox.AbsoluteSize.X
				local Value, PosY = math.clamp(Mouse.X, PosX, ScaleX), ColorPickBox.AbsolutePosition.Y
				local ScaleY = PosY + ColorPickBox.AbsoluteSize.Y
				local Vals = math.clamp(Mouse.Y, PosY, ScaleY)
				local RealColor = Color3.fromHSV(H , S , V);

				S = (Value - PosX) / (ScaleX - PosX);
				V = (1 - ((Vals - PosY) / (ScaleY - PosY)));

				TextLabel.Text = "#" .. tostring(RealColor:ToHex())

				Args:Update();
			end
		end
	end)

	return Args;
end;

function Compkiller:_DrawKeybinds(Window: ScreenGui)
	if Compkiller.__KEYBINDS_CACHE then
		return Compkiller.__KEYBINDS_CACHE;
	end;

	local Keybinds = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local IconFrame = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Frame = Instance.new("Frame")
	local Icon = Instance.new("ImageLabel")
	local HeaderFrame = Instance.new("Frame")
	local HeadLabel = Instance.new("TextLabel")
	local MainFrame = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local MovingFrame = Instance.new("Frame")

	Keybinds.Name = Compkiller:_RandomString()
	Keybinds.Parent = Window
	Keybinds.BackgroundColor3 = Compkiller.Colors.BGDBColor;
	Keybinds.BackgroundTransparency = 0.025
	Keybinds.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Keybinds.BorderSizePixel = 0
	Keybinds.Position = UDim2.new(0,100,0,100)
	Keybinds.Size = UDim2.new(0, 125, 0, 25)
	Keybinds.ZIndex = 150

	table.insert(Compkiller.Elements.BGDBColor,{
		Element = Keybinds,
		Property = 'BackgroundColor3'
	});


	UICorner.CornerRadius = UDim.new(0, 3)
	UICorner.Parent = Keybinds

	IconFrame.Name = Compkiller:_RandomString()
	IconFrame.Parent = Keybinds
	IconFrame.AnchorPoint = Vector2.new(1, 0.5)
	IconFrame.BackgroundColor3 = Compkiller.Colors.BGDBColor
	IconFrame.BackgroundTransparency = 0.300
	IconFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	IconFrame.BorderSizePixel = 0
	IconFrame.Position = UDim2.new(0, 5, 0.5, 0)
	IconFrame.Size = UDim2.new(1, 10, 1, 0)
	IconFrame.SizeConstraint = Enum.SizeConstraint.RelativeYY
	IconFrame.ZIndex = 149

	table.insert(Compkiller.Elements.BGDBColor,{
		Element = IconFrame,
		Property = 'BackgroundColor3'
	});

	UICorner_2.CornerRadius = UDim.new(0, 3)
	UICorner_2.Parent = IconFrame

	Frame.Parent = IconFrame
	Frame.AnchorPoint = Vector2.new(0, 0.5)
	Frame.BackgroundColor3 = Compkiller.Colors.Highlight;
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(1, -5, 0.5, 0)
	Frame.Size = UDim2.new(0, 2, 1, 0)
	Frame.ZIndex = 151

	table.insert(Compkiller.Elements.Highlight,{
		Element = Frame,
		Property = 'BackgroundColor3'
	});

	Icon.Name = Compkiller:_RandomString()
	Icon.Parent = IconFrame
	Icon.AnchorPoint = Vector2.new(0.5, 0.5)
	Icon.BackgroundTransparency = 1.000
	Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Icon.BorderSizePixel = 0
	Icon.Position = UDim2.new(0.5, -2, 0.5, 0)
	Icon.Size = UDim2.new(0, 20, 0, 20)
	Icon.SizeConstraint = Enum.SizeConstraint.RelativeYY
	Icon.ZIndex = 159
	Icon.Image = Compkiller:CacheImage("rbxassetid://10723416765");

	HeaderFrame.Name = Compkiller:_RandomString()
	HeaderFrame.Parent = Keybinds
	HeaderFrame.AnchorPoint = Vector2.new(0.5, 0)
	HeaderFrame.BackgroundTransparency = 1.000
	HeaderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HeaderFrame.BorderSizePixel = 0
	HeaderFrame.ClipsDescendants = true
	HeaderFrame.Position = UDim2.new(0.5, 0, 0, 0)
	HeaderFrame.Size = UDim2.new(1, -10, 1, 0)
	HeaderFrame.ZIndex = 155

	HeadLabel.Name = Compkiller:_RandomString()
	HeadLabel.Parent = HeaderFrame
	HeadLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	HeadLabel.BackgroundTransparency = 1.000
	HeadLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HeadLabel.BorderSizePixel = 0
	HeadLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	HeadLabel.Size = UDim2.new(1, -10, 1, 0)
	HeadLabel.ZIndex = 156
	HeadLabel.Font = Enum.Font.GothamMedium
	HeadLabel.Text = "Keybinds"
	HeadLabel.TextColor3 = Compkiller.Colors.SwitchColor
	HeadLabel.TextSize = 12.000

	table.insert(Compkiller.Elements.SwitchColor,{
		Element = HeadLabel,
		Property = 'TextColor3'
	});

	MainFrame.Name = Compkiller:_RandomString()
	MainFrame.Parent = Keybinds
	MainFrame.AnchorPoint = Vector2.new(1, 0)
	MainFrame.BackgroundTransparency = 1.000
	MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(1, 0, 1, 5)
	MainFrame.Size = UDim2.new(1, 30, 1, 3)
	MainFrame.ZIndex = 156;
	MainFrame.ClipsDescendants = true;

	UIListLayout.Parent = MainFrame
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)

	MovingFrame.Name = Compkiller:_RandomString()
	MovingFrame.Parent = Keybinds
	MovingFrame.AnchorPoint = Vector2.new(1, 0.5)
	MovingFrame.BackgroundTransparency = 1.000
	MovingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MovingFrame.BorderSizePixel = 0
	MovingFrame.Position = UDim2.new(1, 0, 0.5, 0)
	MovingFrame.Size = UDim2.new(1, 30, 1, 0)

	Compkiller:Drag(MovingFrame,Keybinds,0.1);

	local Ref = {
		Root = Keybinds
	};

	Ref.THREAD = task.spawn(function()
		while true do task.wait()
			Compkiller:_Animation(MainFrame,TweenInfo.new(0.4),{
				Size = UDim2.new(1, 30, 1, UIListLayout.AbsoluteContentSize.Y + 1)
			});

			if UIListLayout.AbsoluteContentSize.Y > 1 then
				Compkiller:_Animation(IconFrame,TweenInfo.new(0.25),{
					BackgroundTransparency = 0.3
				})

				Compkiller:_Animation(Frame,TweenInfo.new(0.25),{
					BackgroundTransparency = 0
				})

				Compkiller:_Animation(HeadLabel,TweenInfo.new(0.25),{
					TextTransparency = 0
				})

				Compkiller:_Animation(Icon,TweenInfo.new(0.25),{
					ImageTransparency = 0
				});

				local LargF = 100;

				for i,v in next , MainFrame:GetChildren() do
					if v:GetAttribute('AvgScale') then
						if v:GetAttribute('AvgScale') > LargF then
							LargF = v:GetAttribute('AvgScale');
						end;
					end;
				end;

				Compkiller:_Animation(Keybinds,TweenInfo.new(0.25),{
					BackgroundTransparency = 0.025,
					Size = UDim2.new(0, LargF, 0, 25)
				})
			else
				Compkiller:_Animation(HeadLabel,TweenInfo.new(0.25),{
					TextTransparency = 1
				})

				Compkiller:_Animation(Keybinds,TweenInfo.new(0.25),{
					BackgroundTransparency = 1
				})

				Compkiller:_Animation(IconFrame,TweenInfo.new(0.25),{
					BackgroundTransparency = 1
				})

				Compkiller:_Animation(Frame,TweenInfo.new(0.25),{
					BackgroundTransparency = 1
				})

				Compkiller:_Animation(Icon,TweenInfo.new(0.25),{
					ImageTransparency = 1
				});
			end;

			Keybinds.Visible = (Keybinds.BackgroundTransparency < 0.9 and true) or false;

			if Compkiller.PerformanceMode then
				if Keybinds.Visible then
					Compkiller:_SetNilP(Keybinds , Window);
				else
					Compkiller:_SetNilP(Keybinds , nil);
				end;
			else
				Compkiller:_SetNilP(Keybinds , Window);
			end;
		end;
	end);

	function Ref:AddFrame()
		local Keyholder = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Label = Instance.new("TextLabel")
		local Line = Instance.new("Frame")
		local TypeLabel = Instance.new("TextLabel")
		local UICorner_2 = Instance.new("UICorner")

		Keyholder.Name = Compkiller:_RandomString()
		Keyholder.BackgroundColor3 = Compkiller.Colors.BGDBColor
		Keyholder.BackgroundTransparency = 1
		Keyholder.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Keyholder.BorderSizePixel = 0
		Keyholder.Size = UDim2.new(1, 0, 0, 28)
		Keyholder.ZIndex = MainFrame.ZIndex + 3
		Keyholder.ClipsDescendants = true;

		table.insert(Compkiller.Elements.BGDBColor,{
			Element = Keyholder,
			Property = 'BackgroundColor3'
		});

		UICorner.CornerRadius = UDim.new(0, 3)
		UICorner.Parent = Keyholder

		Label.Name = Compkiller:_RandomString()
		Label.Parent = Keyholder
		Label.AnchorPoint = Vector2.new(0.5, 0.5)
		Label.BackgroundTransparency = 1.000
		Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Label.BorderSizePixel = 0
		Label.Position = UDim2.new(0.5, 0, 0.5, 0)
		Label.Size = UDim2.new(1, -10, 1, 0)
		Label.ZIndex = MainFrame.ZIndex + 5;
		Label.Font = Enum.Font.GothamMedium
		Label.TextColor3 = Compkiller.Colors.SwitchColor
		Label.TextSize = 11.000
		Label.TextTransparency = 1
		Label.TextXAlignment = Enum.TextXAlignment.Left

		table.insert(Compkiller.Elements.SwitchColor,{
			Element = Label,
			Property = 'TextColor3'
		});

		Line.Name = Compkiller:_RandomString()
		Line.Parent = Keyholder
		Line.AnchorPoint = Vector2.new(1, 0.5)
		Line.BackgroundColor3 = Compkiller.Colors.BGDBColor
		Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Line.BorderSizePixel = 0
		Line.Position = UDim2.new(1, 0, 0.5, 0)
		Line.Size = UDim2.new(0, 30, 1, 0)
		Line.ZIndex = MainFrame.ZIndex + 4

		table.insert(Compkiller.Elements.BGDBColor,{
			Element = Line,
			Property = 'BackgroundColor3'
		});

		TypeLabel.Name = Compkiller:_RandomString()
		TypeLabel.Parent = Line
		TypeLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		TypeLabel.BackgroundTransparency = 1.000
		TypeLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TypeLabel.BorderSizePixel = 0
		TypeLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		TypeLabel.Size = UDim2.new(1, 0, 1, 0)
		TypeLabel.ZIndex = MainFrame.ZIndex + 6
		TypeLabel.Font = Enum.Font.GothamMedium
		TypeLabel.TextColor3 = Compkiller.Colors.SwitchColor
		TypeLabel.TextSize = 11.000

		table.insert(Compkiller.Elements.SwitchColor,{
			Element = TypeLabel,
			Property = 'TextColor3'
		});

		UICorner_2.CornerRadius = UDim.new(0, 3)
		UICorner_2.Parent = Line

		local UpdateScale = function()
			local t = TextService:GetTextSize(TypeLabel.Text , TypeLabel.TextSize , TypeLabel.Font , Vector2.new(math.huge,math.huge));
			local z = TextService:GetTextSize(Label.Text , Label.TextSize , Label.Font , Vector2.new(math.huge,math.huge));

			Line.Size = UDim2.new(0, t.X + 5, 1, 0);

			Keyholder:SetAttribute('AvgScale',(t.X + z.X) + 55);
		end;

		UpdateScale();

		local frame_ref = {};

		function frame_ref:SetName(str: string)
			Label.Text = str or Label.Text;

			UpdateScale();
		end;

		function frame_ref:SetType(str: string)
			TypeLabel.Text = str or TypeLabel.Text;

			UpdateScale();
		end;

		function frame_ref:SetVisible(v)
			if v then
				Compkiller:_Animation(Keyholder,TweenInfo.new(0.1),{
					BackgroundTransparency = 0.600,
					Size = UDim2.new(1, 0, 0, 28)
				});

				Compkiller:_Animation(Label,TweenInfo.new(0.15),{
					TextTransparency = 0.100
				});

				Compkiller:_Animation(Line,TweenInfo.new(0.15),{
					BackgroundTransparency = 0
				});

				Compkiller:_Animation(TypeLabel,TweenInfo.new(0.15),{
					TextTransparency = 0
				});
			else
				Compkiller:_Animation(Keyholder,TweenInfo.new(0.1),{
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0)
				});

				Compkiller:_Animation(Label,TweenInfo.new(0.15),{
					TextTransparency = 1
				});

				Compkiller:_Animation(Line,TweenInfo.new(0.15),{
					BackgroundTransparency = 1
				});

				Compkiller:_Animation(TypeLabel,TweenInfo.new(0.15),{
					TextTransparency = 1
				});
			end;

			if Keyholder.BackgroundTransparency <= 0.95 then
				Keyholder.Parent = MainFrame;
			else
				Keyholder.Parent = nil;
			end;

			UpdateScale();
		end;

		return frame_ref;
	end;

	Compkiller.__KEYBINDS_CACHE = Ref;

	return Ref;
end;

function Compkiller:_KeybindHandler(Parent: Frame , ObjectType: string , ElementAPI: Toggle & Slider , Signal , Zindex: number , ElementCFG: Slider)
	local Window = Compkiller:_GetWindowFromElement(Parent);
	local KB_Signal = Compkiller.__SIGNAL(false);
	local SubIndex = math.random(40,100);
	local KeybindInd = Compkiller:_DrawKeybinds(Window);
	local KeybindFrame = KeybindInd:AddFrame();

	local KeybindHandler = Instance.new("Frame")
	local UIStroke = Instance.new("UIStroke")
	local UICorner = Instance.new("UICorner")
	local ElementObjs = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	KeybindHandler.Name = Compkiller:_RandomString()
	KeybindHandler.Parent = Window
	KeybindHandler.BackgroundColor3 = Compkiller.Colors.BlockBackground
	KeybindHandler.BorderColor3 = Color3.fromRGB(0, 0, 0)
	KeybindHandler.BorderSizePixel = 0
	KeybindHandler.ClipsDescendants = true
	KeybindHandler.Position = UDim2.new(1,999,1,999)
	KeybindHandler.Size = UDim2.new(0, 225, 0, 0)
	KeybindHandler.ZIndex = Zindex + SubIndex
	KeybindHandler.AnchorPoint = Vector2.new(0.5,0)

	table.insert(Compkiller.Elements.BlockBackground,{
		Element = KeybindHandler,
		Property = 'BackgroundColor3'
	});

	UIStroke.Color = Compkiller.Colors.HighStrokeColor
	UIStroke.Parent = KeybindHandler

	table.insert(Compkiller.Elements.HighStrokeColor,{
		Element = UIStroke,
		Property = 'Color'
	});

	UICorner.CornerRadius = UDim.new(0, 6)
	UICorner.Parent = KeybindHandler

	ElementObjs.Name = Compkiller:_RandomString()
	ElementObjs.Parent = KeybindHandler
	ElementObjs.AnchorPoint = Vector2.new(0.5, 0.5)
	ElementObjs.BackgroundTransparency = 1.000
	ElementObjs.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ElementObjs.BorderSizePixel = 0
	ElementObjs.Position = UDim2.new(0.5, 0, 0.5, 0)
	ElementObjs.Size = UDim2.new(1, -5, 1, -5)
	ElementObjs.ZIndex = Zindex + SubIndex + 10

	UIListLayout.Parent = ElementObjs
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	local refreshPF = function()
		if Compkiller.PerformanceMode then
			if KeybindHandler.Size.Y.Offset > 1 then
				Compkiller:_SetNilP(KeybindHandler , Window);
			else
				Compkiller:_SetNilP(KeybindHandler , nil);
			end;
		else
			Compkiller:_SetNilP(KeybindHandler , Window);
		end;
	end;

	KeybindHandler:GetPropertyChangedSignal('Size'):Connect(refreshPF);

	task.delay(0.1,refreshPF);

	local ToggleUI = function(bool)
		if bool then
			KeybindHandler.Position = UDim2.new(0,Parent.AbsolutePosition.X + 225,0,Parent.AbsolutePosition.Y)

			Compkiller:_Animation(KeybindHandler,TweenInfo.new(0.25),{
				BackgroundTransparency = 0,
				Size = UDim2.new(0, 225, 0, UIListLayout.AbsoluteContentSize.Y + 5)
			});

			Compkiller:_Animation(UIStroke,TweenInfo.new(0.3),{
				Transparency = 0
			});
		else
			Compkiller:_Animation(KeybindHandler,TweenInfo.new(0.3),{
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 225, 0, 0)
			});

			Compkiller:_Animation(UIStroke,TweenInfo.new(0.3),{
				Transparency = 1
			});
		end;
	end;

	ToggleUI(false);

	KB_Signal:Connect(ToggleUI);

	local APIRef = {
		Name = ElementAPI:GetText()
	};

	local ModeEnum = {
		[1] = 'Off', -- disabled / off
		[2] = "Hold",
		[3] = "Toggle",
		[4] = "On", -- alway on
	};

	local e_m = {
		['Off'] = 1,
		['Hold'] = 2,
		['Toggle'] = 3,
		['On'] = 4,
	};

	if ObjectType == "Toggle" then
		APIRef.Off = false;
		APIRef.On = true;
		APIRef.Keybind = nil;
		APIRef.Mode = e_m.Off;


	elseif ObjectType == "Number" then
		APIRef.Off = 1;
		APIRef.On = 0;
		APIRef.Keybind = nil;
		APIRef.Mode = e_m.Off;
	end;

	local Flag = {};

	APIRef.Update = function()
		KeybindFrame:SetName(APIRef.Name);
		KeybindFrame:SetType(ModeEnum[APIRef.Mode]);
	end

	local ElementAPIs = Compkiller:_LoadElement(ElementObjs , true , KB_Signal , true);

	Flag.Key = ElementAPIs:AddKeybind({
		Name = "Key",
		Default = APIRef.Keybind,
		Callback = function(v)
			APIRef.Keybind = v;
		end,
	});

	Flag.Mode = ElementAPIs:AddDropdown({
		Name = "Mode",
		Default = ModeEnum[APIRef.Mode],
		Values = ModeEnum,
		Callback = function(v)
			APIRef.Mode = e_m[v];

			if APIRef.Mode == 4 then
				ElementAPI:SetValue(APIRef.On);
			end;
		end,
	});

	if ObjectType == "Toggle" then
		Flag.On = ElementAPIs:AddToggle({
			Name = "ON Value",
			Default = APIRef.On,
			Callback = function(v)
				APIRef.On = v;
			end,
		});

		Flag.Off = ElementAPIs:AddToggle({
			Name = "OFF Value",
			Default = APIRef.Off,
			Callback = function(v)
				APIRef.Off = v;
			end,
		});
	elseif ObjectType == "Number" then
		Flag.On = ElementAPIs:AddSlider({
			Name = "ON Value",
			Default = APIRef.On,
			Min = ElementCFG.Min,
			Round = ElementCFG.Round,
			Max = ElementCFG.Max,
			Type = ElementCFG.Type,
			Callback = function(v)
				APIRef.On = v;
			end,
		});

		Flag.Off = ElementAPIs:AddSlider({
			Name = "OFF Value",
			Default = APIRef.Off,
			Min = ElementCFG.Min,
			Round = ElementCFG.Round,
			Max = ElementCFG.Max,
			Type = ElementCFG.Type,
			Callback = function(v)
				APIRef.Off = v;
			end,
		});
	end;

	Flag.ShowInKeybindList = ElementAPIs:AddTextBox({
		Name = "Name",
		Default = APIRef.Name,
		Placeholder = "Keybind Name",
		Callback = function(v)
			APIRef.Name = v;
		end,
	})

	function APIRef:GetSettings()
		APIRef.Update();

		return {
			Key = APIRef.Keybind,
			On = APIRef.On,
			Off = APIRef.Off,
			Mode = APIRef.Mode,
			Name = APIRef.Name,
		};
	end;

	function APIRef:LoadSettings(cfg : KeybindSettings)
		Flag.ShowInKeybindList:SetValue(cfg.Name);
		Flag.Off:SetValue(cfg.Off);
		Flag.On:SetValue(cfg.On);
		Flag.Mode:SetValue(ModeEnum[cfg.Mode]);
		Flag.Key:SetValue(cfg.Key);

		APIRef.Update();
	end;

	APIRef.Thread = task.spawn(function()
		while true do task.wait(0.01)
			if APIRef.Mode ~= 1 then
				if ElementAPI:GetValue() == APIRef.On then
					KeybindFrame:SetVisible(true);
				else
					KeybindFrame:SetVisible(false);
				end;

				APIRef.Update();
			else
				KeybindFrame:SetVisible(false);
			end;
		end;
	end)

	Parent.InputEnded:Connect(function(Input,Typing)
		if Input.UserInputType == Enum.UserInputType.MouseButton2 and not Typing then
			KB_Signal:Fire(true);
		end;
	end);

	UserInputService.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.MouseButton2 or Input.UserInputType == Enum.UserInputType.Touch then
			if not Compkiller:_IsMouseOverFrame(Parent) and not Compkiller:_IsMouseOverFrame(KeybindHandler) then
				KB_Signal:Fire(false);
			end;
		end;
	end);

	UserInputService.InputBegan:Connect(function(Input,Typing)
		if Input.KeyCode.Name == APIRef.Keybind or Input.KeyCode == APIRef.Keybind or (Input.UserInputType == Enum.UserInputType.MouseButton1 and APIRef.Keybind == "MouseLeft") or (Input.UserInputType == Enum.UserInputType.MouseButton2 and APIRef.Keybind == "MouseRight") then

			if APIRef.Mode == 2 or APIRef.Mode == 4 then
				ElementAPI:SetValue(APIRef.On);
			elseif APIRef.Mode == 3 then
				if ElementAPI:GetValue() == APIRef.On then
					ElementAPI:SetValue(APIRef.Off);
				else
					ElementAPI:SetValue(APIRef.On);
				end;
			end;
		end;
	end);

	UserInputService.InputEnded:Connect(function(Input,Typing)
		if Input.KeyCode.Name == APIRef.Keybind or Input.KeyCode == APIRef.Keybind or (Input.UserInputType == Enum.UserInputType.MouseButton1 and APIRef.Keybind == "MouseLeft") or (Input.UserInputType == Enum.UserInputType.MouseButton2 and APIRef.Keybind == "MouseRight") then

			if APIRef.Mode == 2 then
				ElementAPI:SetValue(APIRef.Off);
			elseif APIRef.Mode == 4 then
				ElementAPI:SetValue(APIRef.On);
			end;
		end;
	end);

	return APIRef;
end;

function Compkiller:_AddPropertyEvent(Target: Frame , Callback: (boolean) -> any)
	Target:GetPropertyChangedSignal('BackgroundTransparency'):Connect(function()
		Callback(Target.BackgroundTransparency <= 0.9)
	end)
end;

function Compkiller:_LoadOption(Value , TabSignal)
	local Args = {};
	local Window = Compkiller:_GetWindowFromElement(Value.Root);
	local Tween = TweenInfo.new(0.3,Enum.EasingStyle.Quint);

	function Args:AddKeybind(Config: MiniKeybind)
		Config = Compkiller.__CONFIG(Config,{
			Name = "Keybind",
			Default = nil,
			Flag = nil,
			Callback = function() end;
			Blacklist = {}
		});

		local Keybind = Value:AddLink('Keybind' , Config.Default);

		local IsBinding = false;

		local IsBlacklist = function(v)
			return Config.Blacklist and (Config.Blacklist[v] or table.find(Config.Blacklist,v))
		end;

		Compkiller:_Input(Keybind.Root,function()
			if IsBinding then
				return;
			end;

			Keybind.SetValue("...");

			local Selected = nil;

			while not Selected do
				local Key = UserInputService.InputBegan:Wait();

				if Key.KeyCode ~= Enum.KeyCode.Unknown and not IsBlacklist(Key.KeyCode) and not IsBlacklist(Key.KeyCode.Name) then
					Selected = Key.KeyCode;
				else
					if Key.UserInputType == Enum.UserInputType.MouseButton1 and not IsBlacklist(Enum.UserInputType.MouseButton1) and not IsBlacklist("MouseLeft") then
						Selected = "MouseLeft";
					elseif Key.UserInputType == Enum.UserInputType.MouseButton2 and not IsBlacklist(Enum.UserInputType.MouseButton2) and not IsBlacklist("MouseRight") then
						Selected = "MouseRight";
					end;
				end;
			end;

			local KeyName = (typeof(Selected) == "string" and Selected) or Selected.Name;

			Config.Default = KeyName;

			Keybind.SetValue(Selected);

			IsBinding = false;

			Config.Callback(KeyName);
		end);

		local Args = {};

		Args.Flag = Config.Flag;

		function Args:SetValue(value)
			Config.Default = value;

			Keybind.SetValue(Config.Default);

			Config.Callback(Config.Default);
		end;

		function Args:GetValue()
			return (typeof(Config.Default) == "string" and Config.Default) or Config.Default.Name;
		end;

		if Config.Flag then
			Compkiller.Flags[Config.Flag] = Args;
		end;

		return Args;
	end;

	function Args:AddHelper(Config: Helper)
		Config = Compkiller.__CONFIG(Config,{
			Text = "Information."
		});

		local Helper = Value:AddLink("Helper" , Config.Default);
		local Button: ImageButton = Helper.InfoButton;

		Helper.Text.Parent = Window;

		Helper.UIStroke:GetPropertyChangedSignal('Transparency'):Connect(function()
			if Helper.UIStroke.Transparency > 0.9 then
				Helper.Text.Visible = false;
			else
				Helper.Text.Visible = true;
			end;

			if Compkiller.PerformanceMode then
				if Helper.Text.Visible then
					Compkiller:_SetNilP(Helper.Text , Window);
				else
					Compkiller:_SetNilP(Helper.Text , nil);
				end;
			else
				Compkiller:_SetNilP(Helper.Text , Window);
			end;
		end)

		local Update = function()
			local mainText = " "..Config.Text;

			mainText = string.gsub(mainText,'\n','\n ')

			Helper.Text.Text = mainText;

			local scale = TextService:GetTextSize(Helper.Text.Text,Helper.Text.TextSize,Helper.Text.Font,Vector2.new(math.huge,math.huge));

			Compkiller:_Animation(Helper.Text , TweenInfo.new(0.15), {
				Size = UDim2.fromOffset(scale.X + 50, scale.Y + 5)
			})

			return scale;
		end;

		local Release = function()
			local scale = Update()

			Compkiller:_Animation(Helper.Text,TweenInfo.new(0.15),{
				TextTransparency = 1,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(Button.AbsolutePosition.X,Button.AbsolutePosition.Y + (45))
			});

			Compkiller:_Animation(Helper.UIStroke,TweenInfo.new(0.15),{
				Transparency = 1
			});
		end;

		local Hold = function()
			local scale = Update()

			if not Helper.Text.Visible then
				Helper.Text.Position = UDim2.fromOffset(Button.AbsolutePosition.X,Button.AbsolutePosition.Y + (45))
			end;

			Compkiller:_Animation(Helper.Text,TweenInfo.new(0.15),{
				TextTransparency = 0.35,
				BackgroundTransparency = 0,
				Position = UDim2.fromOffset(Button.AbsolutePosition.X,Button.AbsolutePosition.Y + (40 - (scale.Y / 2)))
			});

			Compkiller:_Animation(Helper.UIStroke,TweenInfo.new(0.15),{
				Transparency = 0
			});

		end;

		Compkiller:_Hover(Button,  Hold, Release);

		Release();

		local Args = {};

		function Args:SetValue(value)
			Config.Text = value;
		end;

		return Args;
	end;

	function Args:AddColorPicker(Config: MiniColorPicker)
		Config = Compkiller.__CONFIG(Config,{
			Default = Color3.fromRGB(255,255,255),
			Transparency = 0,
			Callback = function() end
		});

		local ColorPicker:Frame , ColorFrame: Frame = Value:AddLink('ColorPicker' , Config.Default);

		local Button = Compkiller:_Input(ColorPicker);

		local ColorPicker = Compkiller:_AddColorPickerPanel(Button,function(color,opc)
			Config.Default = color;
			Config.Transparency = opc;

			ColorFrame.BackgroundColor3 = color;
			ColorFrame.BackgroundTransparency = opc;

			Config.Callback(Config.Default , Config.Transparency);
		end);

		ColorPicker:SetColor(Config.Default,Config.Transparency);
		ColorPicker:Update()

		local Args = {};

		Args.Flag = Config.Flag;

		function Args:SetValue(value,opc)
			Config.Default = value;
			Config.Transparency = opc;

			ColorPicker:SetColor(value,opc)

			ColorPicker:Update()

			Config.Callback(value,opc);
		end;

		function Args:GetValue()
			return {
				ColorPicker = {
					Color = Config.Default,
					Transparency = Config.Transparency
				}
			};
		end;

		if Config.Flag then
			Compkiller.Flags[Config.Flag] = Args;
		end;

		return Args;
	end;

	function Args:AddToggle(Config : MiniToggle)
		Config = Compkiller.__CONFIG(Config,{
			Flag = nil,
			Default = false,
			Callback = function() end;
		});

		local Toggle = Value:AddLink("Toggle" , Config.Default);

		Toggle.Input.MouseButton1Click:Connect(function()
			Config.Default = not Config.Default;

			Toggle.ChangeValue(Config.Default);

			Config.Callback(Config.Default);
		end);

		local Args = {};

		Args.Flag = Config.Flag

		function Args:SetValue(value)
			Config.Default = value;

			Toggle.ChangeValue(Config.Default);

			Config.Callback(Config.Default);
		end;

		function Args:GetValue()
			return Config.Default;
		end;

		if Config.Flag then
			Compkiller.Flags[Config.Flag] = Args;
		end;

		return Args;
	end;

	function Args:AddOption()
		local Element: ImageButton = Value:AddLink("Option");
		local BaseZ_Index = math.random(1,15) * 100;

		local Signal = Compkiller.__SIGNAL(false);

		local ExtractElement = Instance.new("Frame")
		local UIStroke = Instance.new("UIStroke")
		local UICorner = Instance.new("UICorner")
		local Elements = Instance.new("Frame")
		local UIListLayout = Instance.new("UIListLayout")
		local Toggl = false;

		local ToggleUI = function(bool)
			local IsSameValue = bool == Toggl;

			Toggl = bool;

			local MainPosition = UDim2.fromOffset(Element.AbsolutePosition.X,Element.AbsolutePosition.Y + 80);
			local DropPosition = UDim2.fromOffset(MainPosition.X.Offset,MainPosition.Y.Offset + 15);
			local MUL = Window.AbsoluteSize.Y / 2;

			if MainPosition.Y.Offset > MUL then -- go up
				MainPosition = UDim2.fromOffset(Element.AbsolutePosition.X,Element.AbsolutePosition.Y + 45);
				DropPosition = UDim2.fromOffset(MainPosition.X.Offset,MainPosition.Y.Offset - 25);
				ExtractElement.AnchorPoint = Vector2.new(0,1)
			else
				ExtractElement.AnchorPoint = Vector2.new(0,0)
			end;

			if bool then
				Signal:Fire(true);

				if not IsSameValue then
					ExtractElement.Position = DropPosition
				end;

				Compkiller:_Animation(ExtractElement , Tween , {
					Position = MainPosition,
					BackgroundTransparency = 0,
					Size = UDim2.new(0, 225, 0, UIListLayout.AbsoluteContentSize.Y)
				});

				Compkiller:_Animation(UIStroke , Tween , {
					Transparency = 0
				});

			else
				Signal:Fire(false);

				Compkiller:_Animation(ExtractElement , Tween , {
					Position = DropPosition,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 225, 0, UIListLayout.AbsoluteContentSize.Y - 10)
				});

				Compkiller:_Animation(UIStroke , Tween , {
					Transparency = 1
				});
			end;
		end;

		Compkiller:_AddPropertyEvent(ExtractElement,function(bool)
			ExtractElement.Visible = bool;

			if Compkiller.PerformanceMode then
				if ExtractElement.Visible then
					Compkiller:_SetNilP(ExtractElement , Window);
				else
					Compkiller:_SetNilP(ExtractElement , nil);
				end;
			else
				Compkiller:_SetNilP(ExtractElement , Window);
			end;
		end);

		Compkiller:_AddDragBlacklist(ExtractElement);

		ExtractElement.Name = Compkiller:_RandomString()
		ExtractElement.Parent = Window
		ExtractElement.BackgroundColor3 = Compkiller.Colors.BlockBackground
		ExtractElement.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ExtractElement.BorderSizePixel = 0
		ExtractElement.ClipsDescendants = true
		ExtractElement.Position = UDim2.new(123, 0, 123, 0)
		ExtractElement.Size = UDim2.new(0, 225, 0, 35)
		ExtractElement.ZIndex = BaseZ_Index
		ExtractElement.Visible = false
		ExtractElement.ClipsDescendants = true

		table.insert(Compkiller.Elements.BlockBackground,{
			Element = ExtractElement,
			Property = "BackgroundColor3"
		});

		UIStroke.Color = Compkiller.Colors.HighStrokeColor
		UIStroke.Parent = ExtractElement

		table.insert(Compkiller.Elements.HighStrokeColor,{
			Element = UIStroke,
			Property = "Color"
		});

		UICorner.CornerRadius = UDim.new(0, 6)
		UICorner.Parent = ExtractElement

		Elements.Name = Compkiller:_RandomString()
		Elements.Parent = ExtractElement
		Elements.AnchorPoint = Vector2.new(0.5, 0.5)
		Elements.BackgroundTransparency = 1.000
		Elements.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Elements.BorderSizePixel = 0
		Elements.Position = UDim2.new(0.5, 0, 0.5, 0)
		Elements.Size = UDim2.new(1, -5, 1,-1)
		Elements.ZIndex = BaseZ_Index + 20

		UIListLayout.Parent = Elements
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 0)

		ToggleUI(false);

		Element.MouseButton1Click:Connect(function()
			ToggleUI(true);
		end);

		UserInputService.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				if Toggl and not Compkiller:_IsMouseOverFrame(ExtractElement) and not Compkiller:_IsMouseOverFrame(Element) then
					ToggleUI(false);
				end;
			end
		end)		

		return Compkiller:_LoadElement(Elements , true , Signal)
	end;

	return Args;
end;

function Compkiller:_LoadDropdown(BaseParent: TextButton , Callback: () -> any)
	local Window = Compkiller:_GetWindowFromElement(BaseParent);

	local BaseZ_Index = BaseParent.ZIndex + (math.random(1,15) * 100);

	local DropdownWindow = Instance.new("Frame")
	local UIStroke = Instance.new("UIStroke")
	local UICorner = Instance.new("UICorner")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local ToggleDb = Compkiller.__SIGNAL(false);
	local EventOut = Compkiller.__SIGNAL(0);

	DropdownWindow.Name = Compkiller:_RandomString()
	DropdownWindow.Parent = Window
	DropdownWindow.BackgroundColor3 = Compkiller.Colors.BlockBackground
	DropdownWindow.BorderColor3 = Color3.fromRGB(0, 0, 0)
	DropdownWindow.BorderSizePixel = 0
	DropdownWindow.Position = UDim2.new(123, 0, 123, 0)
	DropdownWindow.Size = UDim2.new(0, 190, 0, 200)
	DropdownWindow.ZIndex = BaseZ_Index

	table.insert(Compkiller.Elements.BlockBackground,{
		Element = DropdownWindow,
		Property = "BackgroundColor3"
	});

	Compkiller:_AddDragBlacklist(DropdownWindow);
	Compkiller:_AddPropertyEvent(DropdownWindow,function(v)
		DropdownWindow.Visible = v;

		if Compkiller.PerformanceMode then
			if DropdownWindow.Visible then
				Compkiller:_SetNilP(DropdownWindow , Window);
			else
				Compkiller:_SetNilP(DropdownWindow , nil);
			end;
		else
			Compkiller:_SetNilP(DropdownWindow , Window);
		end;
	end)

	UIStroke.Color = Compkiller.Colors.HighStrokeColor
	UIStroke.Parent = DropdownWindow

	table.insert(Compkiller.Elements.HighStrokeColor , {
		Element = UIStroke,
		Property = "Color"
	})

	UICorner.CornerRadius = UDim.new(0, 6)
	UICorner.Parent = DropdownWindow

	ScrollingFrame.Parent = DropdownWindow
	ScrollingFrame.Active = true
	ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	ScrollingFrame.BackgroundTransparency = 1.000
	ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	ScrollingFrame.Size = UDim2.new(1, -5, 1, -5)
	ScrollingFrame.ZIndex = BaseZ_Index + 5
	ScrollingFrame.BottomImage = ""
	ScrollingFrame.ScrollBarThickness = 0
	ScrollingFrame.TopImage = ""

	UIListLayout.Parent = ScrollingFrame
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 10)

	UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
		ScrollingFrame.CanvasSize = UDim2.fromOffset(UIListLayout.AbsoluteContentSize.X,UIListLayout.AbsoluteContentSize.Y)
	end);

	local ToggleUI = function(bool)
		local IsSame = ToggleDb:GetValue() == bool;

		EventOut:Fire(bool);
		ToggleDb:Fire(bool);

		local MUL = Window.AbsoluteSize.Y / 2;

		local MainPosition = UDim2.fromOffset(BaseParent.AbsolutePosition.X + 1,BaseParent.AbsolutePosition.Y + 80);
		local DropPosition = UDim2.fromOffset(MainPosition.X.Offset,MainPosition.Y.Offset + 25);

		if MainPosition.Y.Offset > MUL then -- go up
			MainPosition = UDim2.fromOffset(BaseParent.AbsolutePosition.X + 1,BaseParent.AbsolutePosition.Y + 55);
			DropPosition = UDim2.fromOffset(MainPosition.X.Offset,MainPosition.Y.Offset - 25);

			DropdownWindow.AnchorPoint = Vector2.new(0,1);
		else
			DropdownWindow.AnchorPoint = Vector2.zero;
		end;

		if bool then
			if not IsSame then
				DropdownWindow.Position = DropPosition;
			end;

			Compkiller:_Animation(DropdownWindow,TweenInfo.new(0.2),{
				BackgroundTransparency = 0,
				Position = MainPosition,
				Size = UDim2.new(0, BaseParent.AbsoluteSize.X - 1, 0, math.clamp(UIListLayout.AbsoluteContentSize.Y + 10,10 , 200))
			})

			Compkiller:_Animation(UIStroke,TweenInfo.new(0.2),{
				Transparency = 0
			})
		else
			Compkiller:_Animation(DropdownWindow,TweenInfo.new(0.2),{
				BackgroundTransparency = 1,
				Position = DropPosition,
				Size = UDim2.new(0, BaseParent.AbsoluteSize.X - 1, 0, math.clamp(UIListLayout.AbsoluteContentSize.Y / 1.5, 10 , 200))
			})

			Compkiller:_Animation(UIStroke,TweenInfo.new(0.2),{
				Transparency = 1
			})
		end;
	end;

	ToggleUI(false)

	local SpamUpdate,_Delay = false , tick();
	local __signals = {};
	local Default = nil;
	local Values = nil;
	local IsMulti = false;

	local DrawButton = function()
		local DropdownItem = Instance.new("Frame")
		local BlockText = Instance.new("TextLabel")
		local BlockLine = Instance.new("Frame")

		DropdownItem.Name = Compkiller:_RandomString()
		DropdownItem.BackgroundTransparency = 1.000
		DropdownItem.BorderColor3 = Color3.fromRGB(0, 0, 0)
		DropdownItem.BorderSizePixel = 0
		DropdownItem.Size = UDim2.new(1, -1, 0, 20)
		DropdownItem.ZIndex = BaseZ_Index + 6

		BlockText.Name = Compkiller:_RandomString()
		BlockText.Parent = DropdownItem
		BlockText.AnchorPoint = Vector2.new(0, 0.5)
		BlockText.BackgroundTransparency = 1.000
		BlockText.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BlockText.BorderSizePixel = 0
		BlockText.Position = UDim2.new(0, 5, 0.5, 0)
		BlockText.Size = UDim2.new(1, -10, 0, 25)
		BlockText.ZIndex = BaseZ_Index + 6
		BlockText.Font = Enum.Font.GothamMedium
		BlockText.Text = ""
		BlockText.TextColor3 = Compkiller.Colors.SwitchColor
		BlockText.TextSize = 13.000
		BlockText.TextTransparency = 0.500
		BlockText.TextXAlignment = Enum.TextXAlignment.Left

		table.insert(Compkiller.Elements.SwitchColor , {
			Element = BlockText,
			Property = 'TextColor3'
		});

		BlockLine.Name = Compkiller:_RandomString()
		BlockLine.Parent = DropdownItem
		BlockLine.AnchorPoint = Vector2.new(0.5, 1)
		BlockLine.BackgroundColor3 = Compkiller.Colors.LineColor
		BlockLine.BackgroundTransparency = 0.500
		BlockLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BlockLine.BorderSizePixel = 0
		BlockLine.Position = UDim2.new(0.5, 0, 1, 0)
		BlockLine.Size = UDim2.new(1, -6, 0, 1)
		BlockLine.ZIndex = BaseZ_Index + 7

		table.insert(Compkiller.Elements.LineColor,{
			Element = BlockLine,
			Property = "BackgroundColor3"
		});

		return {
			BlockText = BlockText,
			DropdownItem = DropdownItem,
			BlockLine = BlockLine,
		};
	end;

	local ClearDropdown = function()
		for i,v in next , ScrollingFrame:GetChildren() do
			if v:IsA('Frame') then
				v:Destroy();
			end;
		end;

		for i,v in next,  __signals do
			v:Disconnect();
		end;
	end;

	local IsDefault = function(v)
		return (typeof(Default) == 'table' and (Default[v] or table.find(Default,v))) or Default == v;
	end;

	local MatchDefault = function(v,DataFrame)
		return (typeof(DataFrame) == 'table' and (DataFrame[v] or table.find(DataFrame,v))) or DataFrame == v;
	end;

	local UpdateDropdown = function()
		local DataFrame;

		if IsMulti then
			DataFrame = {};
		end;

		for i,v in next , Values do
			local bth = DrawButton();

			bth.BlockText.Text = tostring(v);

			bth.DropdownItem.Parent = ScrollingFrame;

			bth.Value = v;

			table.insert(__signals , ToggleDb:Connect(function(bool)
				if bool then
					Compkiller:_Animation(bth.BlockText,TweenInfo.new(0.2),{
						TextTransparency = ((IsDefault(v) or MatchDefault(v,DataFrame)) and 0) or 0.5
					});

					Compkiller:_Animation(bth.BlockLine,TweenInfo.new(0.2),{
						BackgroundTransparency = 0
					});
				else
					Compkiller:_Animation(bth.BlockText,TweenInfo.new(0.2),{
						TextTransparency = 1
					});

					Compkiller:_Animation(bth.BlockLine,TweenInfo.new(0.2),{
						BackgroundTransparency = 1
					});
				end;
			end));

			if ToggleDb:GetValue() then
				Compkiller:_Animation(bth.BlockText,TweenInfo.new(0.2),{
					TextTransparency = ((IsDefault(v) or MatchDefault(v,DataFrame)) and 0) or 0.5
				});
			end;

			if IsDefault(v) and not IsMulti then
				DataFrame = bth;
			end;

			if IsMulti then
				if IsDefault(v) or MatchDefault(v,DataFrame) then
					DataFrame[v] = true;
				else
					DataFrame[v] = false;
				end;

				Compkiller:_Animation(bth.BlockText,TweenInfo.new(0.2),{
					TextTransparency = ((MatchDefault(v,DataFrame)) and 0) or 0.5
				});

				Compkiller:_Input(bth.DropdownItem,function()
					DataFrame[v] = not DataFrame[v];

					Compkiller:_Animation(bth.BlockText,TweenInfo.new(0.2),{
						TextTransparency = ((MatchDefault(v,DataFrame)) and 0) or 0.5
					});

					Callback(DataFrame)
				end);
			else
				Compkiller:_Input(bth.DropdownItem,function()
					if DataFrame then
						Compkiller:_Animation(DataFrame.BlockText,TweenInfo.new(0.2),{
							TextTransparency = ((IsDefault(v) or MatchDefault(v,DataFrame)) and 0) or 0.5
						});
					end;

					Default = v;

					DataFrame = bth;

					Compkiller:_Animation(bth.BlockText,TweenInfo.new(0.2),{
						TextTransparency = ((IsDefault(v) or MatchDefault(v,DataFrame)) and 0) or 0.5
					});

					Callback(DataFrame.Value)
				end);
			end;
		end;
	end;

	BaseParent.MouseButton1Click:Connect(function()
		if SpamUpdate then
			ClearDropdown();
			UpdateDropdown();
		end;

		ToggleUI(true);

		if not ToggleDb:GetValue() then
			ToggleUI(false);
		end
	end);

	UserInputService.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			if not Compkiller:_IsMouseOverFrame(DropdownWindow) then
				ToggleUI(false);
			end;
		end;
	end);

	local Args = {};

	function Args:SetDefault(v)
		Default = v;
	end;

	function Args:SetData(Def,Val,Multi,Vis)
		if Vis and ((tick() - _Delay) <= 0.5 or #Val > 10) then
			_Delay = tick();
			SpamUpdate = true;
		else
			SpamUpdate = false;	
		end;

		IsMulti = Multi;
		Default = Def;
		Values = Val;

		if Vis and not SpamUpdate then
			ClearDropdown();
			UpdateDropdown();
		end;
	end;

	function Args:Refersh()
		ClearDropdown();
		UpdateDropdown();
	end;

	Args.EventOut = EventOut;

	return Args;
end;

function Compkiller:_LoadElement(Parent: Frame , EnabledLine: boolean , Signal , DisableStackKeybind)
	local Zindex = Parent.ZIndex + 1;
	local Tween = TweenInfo.new(0.25,Enum.EasingStyle.Quint);

	local Args = {};

	function Args:AddToggle(Config : Toggle)
		Config = Compkiller.__CONFIG(Config,{
			Name = "Toggle",
			Default = false,
			Flag = nil,
			Risky = false,
			Callback = function() end;
		});

		local Block = Compkiller:_CreateBlock(Signal);

		Block:SetParent(Parent);

		Block:SetText(Config.Name);

		if Config.Risky then
			Block:SetTextColor(Compkiller.Colors.Risky);
		end;

		Block:SetLine(EnabledLine);

		Block:SetVisible(Signal:GetValue());

		local Toggle = Block:AddLink('Toggle' , Config.Default);

		Toggle.Input.MouseButton1Click:Connect(function()
			Config.Default = not Config.Default;

			Toggle.ChangeValue(Config.Default);

			Block:SetTransparency((Config.Default and 0.1) or 0.3);

			Config.Callback(Config.Default);
		end);

		local Args = {};

		Args.Flag = Config.Flag;

		function Args:SetValue(value)
			Config.Default = value;

			Toggle.ChangeValue(Config.Default);

			Block:SetTransparency((Config.Default and 0.1) or 0.3);

			Config.Callback(Config.Default);
		end;

		Args.Signal = Signal:Connect(function(bool)
			Block:SetVisible(bool);

		end);

		Args.Link = Compkiller:_LoadOption(Block);

		function Args:GetValue()
			return Config.Default;
		end;

		function Args:SetText(str : string)
			Block:SetText(str or Config.Name);
		end;

		function Args:GetText()
			return Block:GetText();
		end;

		if Config.Flag then
			Compkiller.Flags[Config.Flag] = Args;
		end;

		if not DisableStackKeybind then
			local AutoKeybind = Compkiller:_KeybindHandler(Block.Root , "Toggle" , Args , Signal , Zindex , Config);

			Args.AutoKeybind = AutoKeybind;
		end;

		return Args;
	end;

	function Args:AddKeybind(Config : Keybind)
		Config = Compkiller.__CONFIG(Config,{
			Name = "Keybind",
			Default = nil,
			Flag = nil,
			Callback = function() end;
			Blacklist = {}
		});

		local Block = Compkiller:_CreateBlock(Signal);

		Block:SetParent(Parent);

		Block:SetText(Config.Name);

		Block:SetLine(EnabledLine);

		Block:SetVisible(Signal:GetValue());

		local Keybind = Block:AddLink('Keybind' , Config.Default);

		local IsBinding = false;

		local IsBlacklist = function(v)
			return Config.Blacklist and (Config.Blacklist[v] or table.find(Config.Blacklist,v))
		end;

		Compkiller:_Input(Keybind.Root,function()
			if IsBinding then
				return;
			end;

			Keybind.SetValue("...");

			local Selected = nil;

			while not Selected do
				local Key = UserInputService.InputBegan:Wait();

				if Key.KeyCode ~= Enum.KeyCode.Unknown and not IsBlacklist(Key.KeyCode) and not IsBlacklist(Key.KeyCode.Name) then
					Selected = Key.KeyCode;
				else
					if Key.UserInputType == Enum.UserInputType.MouseButton1 and not IsBlacklist(Enum.UserInputType.MouseButton1) and not IsBlacklist("MouseLeft") then
						Selected = "MouseLeft";
					elseif Key.UserInputType == Enum.UserInputType.MouseButton2 and not IsBlacklist(Enum.UserInputType.MouseButton2) and not IsBlacklist("MouseRight") then
						Selected = "MouseRight";
					end;
				end;
			end;

			local KeyName = typeof(Selected) == "string" and Selected or Selected.Name;

			Config.Default = KeyName;

			Keybind.SetValue(Selected);

			IsBinding = false;

			Config.Callback(KeyName);
		end);

		local Args = {};

		Args.Flag = Config.Flag;

		function Args:SetText(str : string)
			Block:SetText(str or Config.Name);
		end;

		function Args:GetText()
			return Block:GetText();
		end;

		function Args:SetValue(value)
			Config.Default = value;

			Keybind.SetValue(Config.Default);

			Config.Callback(Config.Default);
		end;

		Args.Signal = Signal:Connect(function(bool)
			Block:SetVisible(bool);
		end);

		Args.Link = Compkiller:_LoadOption(Block);

		function Args:GetValue()
			return (typeof(Config.Default) == "string" and Config.Default) or Config.Default.Name;
		end;

		if Config.Flag then
			Compkiller.Flags[Config.Flag] = Args;
		end;

		return Args;
	end;

	function Args:AddColorPicker(Config: ColorPicker)
		Config = Compkiller.__CONFIG(Config,{
			Name = "ColorPicker",
			Default = Color3.fromRGB(255,255,255),
			Flag = nil,
			Transparency = 0,
			Callback = function() end;
		});

		local Block = Compkiller:_CreateBlock(Signal);

		Block:SetParent(Parent);

		Block:SetText(Config.Name);

		Block:SetLine(EnabledLine);

		Block:SetVisible(Signal:GetValue());

		local ColorPicker:Frame , ColorFrame: Frame = Block:AddLink('ColorPicker' , Config.Default);

		local Button = Compkiller:_Input(ColorPicker);

		local ColorPicker = Compkiller:_AddColorPickerPanel(Button,function(color,opc)
			Config.Default = color;
			Config.Transparency = opc;

			ColorFrame.BackgroundColor3 = color;
			ColorFrame.BackgroundTransparency = opc;

			Config.Callback(Config.Default , Config.Transparency);
		end);

		ColorPicker:SetColor(Config.Default,Config.Transparency);
		ColorPicker:Update()

		local Args = {};

		Args.Flag = Config.Flag;

		function Args:SetValue(value,opc)
			Config.Default = value;
			Config.Transparency = opc;

			ColorPicker:SetColor(value,opc);
			ColorPicker:Update();

			Config.Callback(value,opc);
		end;

		function Args:SetText(str : string)
			Block:SetText(str or Config.Name);
		end;

		function Args:GetText()
			return Block:GetText();
		end;

		Args.Signal = Signal:Connect(function(bool)
			Block:SetVisible(bool);
		end);

		Args.Link = Compkiller:_LoadOption(Block);

		function Args:GetValue()
			return {
				ColorPicker = {
					Color = Config.Default,
					Transparency = Config.Transparency
				}
			};
		end;

		if Config.Flag then
			Compkiller.Flags[Config.Flag] = Args;
		end;

		return Args;
	end;

	function Args:AddButton(Config: Button)
		Config = Compkiller.__CONFIG(Config , {
			Name = 'Button',
			Callback = function() end
		});

		local Button = Instance.new("Frame")
		local BlockLine = Instance.new("Frame")
		local Frame = Instance.new("Frame")
		local UIStroke = Instance.new("UIStroke")
		local UICorner = Instance.new("UICorner")
		local TextLabel = Instance.new("TextLabel")

		if Compkiller:_IsMobile() then
			Compkiller:_AddDragBlacklist(Button);
		end;

		Button.Name = Compkiller:_RandomString()
		Button.Parent = Parent
		Button.BackgroundTransparency = 1.000
		Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Button.BorderSizePixel = 0
		Button.Size = UDim2.new(1, -1, 0, 30)
		Button.ZIndex = Zindex + 5

		BlockLine.Name = Compkiller:_RandomString()
		BlockLine.Parent = Button
		BlockLine.AnchorPoint = Vector2.new(0.5, 1)
		BlockLine.BackgroundColor3 = Compkiller.Colors.LineColor
		BlockLine.BackgroundTransparency = 0.500
		BlockLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BlockLine.BorderSizePixel = 0
		BlockLine.Position = UDim2.new(0.5, 0, 1, 0)
		BlockLine.Size = UDim2.new(1, -26, 0, 1)
		BlockLine.ZIndex = Zindex + 6

		table.insert(Compkiller.Elements.LineColor,{
			Element = BlockLine,
			Property = "BackgroundColor3"
		});

		Frame.Parent = Button
		Frame.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame.BackgroundColor3 = Compkiller.Colors.Highlight
		Frame.BackgroundTransparency = 0.100
		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame.Size = UDim2.new(1, -15, 1, -5)
		Frame.ZIndex = Zindex + 7;

		table.insert(Compkiller.Elements.Highlight,{
			Element = Frame,
			Property = "BackgroundColor3"
		});

		UIStroke.Color = Compkiller.Colors.StrokeColor
		UIStroke.Parent = Frame

		table.insert(Compkiller.Elements.StrokeColor,{
			Element = UIStroke,
			Property = "Color"
		});

		UICorner.CornerRadius = UDim.new(0, 3)
		UICorner.Parent = Frame

		TextLabel.Parent = Frame
		TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextLabel.Size = UDim2.new(1, 0, 1, 0)
		TextLabel.ZIndex = Zindex + 8
		TextLabel.Font = Enum.Font.GothamMedium
		TextLabel.Text = Config.Name;
		TextLabel.TextColor3 = Compkiller.Colors.SwitchColor
		TextLabel.TextSize = 12.000
		TextLabel.TextStrokeTransparency = 0.900

		table.insert(Compkiller.Elements.SwitchColor , {
			Element = TextLabel,
			Property = 'TextColor3'
		});

		Compkiller:_Hover(Frame,function()
			if Signal:GetValue() then
				Compkiller:_Animation(Frame,TweenInfo.new(0.2),{
					BackgroundTransparency = 0
				})
			end;
		end,function()
			if Signal:GetValue() then
				Compkiller:_Animation(Frame,TweenInfo.new(0.2),{
					BackgroundTransparency = 0.1
				})
			end;
		end);

		Compkiller:_Input(Frame,function()
			Config.Callback();
		end);

		local Args = {};

		Args.Signal = Signal:Connect(function(bool)
			if bool then
				Compkiller:_Animation(BlockLine, TweenInfo.new(0.35),{
					BackgroundTransparency = 0.500
				});

				Compkiller:_Animation(Frame, TweenInfo.new(0.35),{
					BackgroundTransparency = 0.1
				});

				Compkiller:_Animation(UIStroke, TweenInfo.new(0.35),{
					Transparency = 0
				});

				Compkiller:_Animation(TextLabel, TweenInfo.new(0.35),{
					TextStrokeTransparency = 0.900,
					TextTransparency = 0
				});

			else
				Compkiller:_Animation(BlockLine, TweenInfo.new(0.35),{
					BackgroundTransparency = 1
				});

				Compkiller:_Animation(Frame, TweenInfo.new(0.35),{
					BackgroundTransparency = 1
				});

				Compkiller:_Animation(UIStroke, TweenInfo.new(0.35),{
					Transparency = 1
				});

				Compkiller:_Animation(TextLabel, TweenInfo.new(0.35),{
					TextStrokeTransparency = 1,
					TextTransparency = 1
				});
			end;
		end);

		function Args:SetText(t)
			Config.Name = t;
			TextLabel.Text = Config.Name;
		end;

		function Args:GetText()
			return TextLabel.Text;
		end;

		return Args;
	end;

	function Args:AddSlider(Config: Slider)
		Config = Compkiller.__CONFIG(Config , {
			Name = 'Slider',
			Default = 50,
			Min = 0,
			Max = 100,
			Type = "",
			Round = 0,
			Callback = function() end
		});

		local Slider = Instance.new("Frame")
		local BlockText = Instance.new("TextLabel")
		local BlockLine = Instance.new("Frame")
		local SliderBar = Instance.new("Frame")
		local UIStroke = Instance.new("UIStroke")
		local UICorner = Instance.new("UICorner")
		local SliderInput = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local Frame = Instance.new("Frame")
		local UICorner_3 = Instance.new("UICorner")
		local UIScale = Instance.new("UIScale")
		local ValueText = Instance.new("TextLabel")

		Compkiller:_AddDragBlacklist(Slider);

		Slider.Name = Compkiller:_RandomString()
		Slider.Parent = Parent
		Slider.BackgroundTransparency = 1.000
		Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Slider.BorderSizePixel = 0
		Slider.Size = UDim2.new(1, -1, 0, 45)
		Slider.ZIndex = Zindex + 1

		BlockText.Name = Compkiller:_RandomString()
		BlockText.Parent = Slider
		BlockText.BackgroundTransparency = 1.000
		BlockText.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BlockText.BorderSizePixel = 0
		BlockText.Position = UDim2.new(0, 12, 0, 1)
		BlockText.Size = UDim2.new(1, -20, 0, 25)
		BlockText.ZIndex = Zindex + 2
		BlockText.Font = Enum.Font.GothamMedium
		BlockText.Text = Config.Name
		BlockText.TextColor3 = Compkiller.Colors.SwitchColor
		BlockText.TextSize = 14.000
		BlockText.TextTransparency = 0.100
		BlockText.TextXAlignment = Enum.TextXAlignment.Left

		table.insert(Compkiller.Elements.SwitchColor , {
			Element = BlockText,
			Property = 'TextColor3'
		});

		BlockLine.Name = Compkiller:_RandomString()
		BlockLine.Parent = Slider
		BlockLine.AnchorPoint = Vector2.new(0.5, 1)
		BlockLine.BackgroundColor3 = Compkiller.Colors.LineColor
		BlockLine.BackgroundTransparency = 0.500
		BlockLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BlockLine.BorderSizePixel = 0
		BlockLine.Position = UDim2.new(0.5, 0, 1, 0)
		BlockLine.Size = UDim2.new(1, -26, 0, 1)
		BlockLine.ZIndex = Zindex + 2
		BlockLine.Visible = EnabledLine or false;

		table.insert(Compkiller.Elements.LineColor,{
			Element = BlockLine,
			Property = "BackgroundColor3"
		});

		SliderBar.Name = Compkiller:_RandomString()
		SliderBar.Parent = Slider
		SliderBar.AnchorPoint = Vector2.new(0.5, 1)
		SliderBar.BackgroundColor3 = Compkiller.Colors.DropColor
		SliderBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SliderBar.BorderSizePixel = 0
		SliderBar.ClipsDescendants = true
		SliderBar.Position = UDim2.new(0.5, 0, 1, -9)
		SliderBar.Size = UDim2.new(1, -25, 0, 10)
		SliderBar.ZIndex = Zindex + 3

		table.insert(Compkiller.Elements.DropColor , {
			Element = SliderBar,
			Property = "BackgroundColor3"
		})

		UIStroke.Color = Compkiller.Colors.StrokeColor
		UIStroke.Parent = SliderBar

		table.insert(Compkiller.Elements.StrokeColor,{
			Element = UIStroke,
			Property = "Color"
		});

		UICorner.CornerRadius = UDim.new(0, 6)
		UICorner.Parent = SliderBar

		SliderInput.Name = Compkiller:_RandomString()
		SliderInput.Parent = SliderBar
		SliderInput.AnchorPoint = Vector2.new(0, 0.5)
		SliderInput.BackgroundColor3 = Compkiller.Colors.Highlight
		SliderInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SliderInput.BorderSizePixel = 0
		SliderInput.Position = UDim2.new(0, 0, 0.5, 0)
		SliderInput.Size = UDim2.new(math.max((Config.Default - Config.Min) / (Config.Max - Config.Min) , 0.045), 0, 1, 0)
		SliderInput.ZIndex = Zindex + 4

		table.insert(Compkiller.Elements.Highlight,{
			Element = SliderInput,
			Property = "BackgroundColor3"
		});

		UICorner_2.CornerRadius = UDim.new(0, 6)
		UICorner_2.Parent = SliderInput

		Frame.Parent = SliderInput
		Frame.AnchorPoint = Vector2.new(1, 0.5)
		Frame.BackgroundColor3 = Compkiller.Colors.SwitchColor
		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(1, 5, 0.5, 0)
		Frame.Rotation = 45.000
		Frame.Size = UDim2.new(1, 0, 1, 0)
		Frame.SizeConstraint = Enum.SizeConstraint.RelativeYY
		Frame.ZIndex = Zindex + 6

		table.insert(Compkiller.Elements.SwitchColor , {
			Element = Frame,
			Property = 'BackgroundColor3'
		});

		UICorner_3.CornerRadius = UDim.new(3, 0)
		UICorner_3.Parent = Frame

		UIScale.Parent = Frame
		UIScale.Scale = 1.300

		ValueText.Name = Compkiller:_RandomString()
		ValueText.Parent = Slider
		ValueText.BackgroundTransparency = 1.000
		ValueText.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ValueText.BorderSizePixel = 0
		ValueText.Position = UDim2.new(0, 12, 0, 1)
		ValueText.Size = UDim2.new(1, -20, 0, 25)
		ValueText.ZIndex = Zindex + 4
		ValueText.Font = Enum.Font.GothamMedium
		ValueText.Text = tostring(Config.Default)..tostring(Config.Type)
		ValueText.TextColor3 = Compkiller.Colors.SwitchColor
		ValueText.TextSize = 12.000
		ValueText.TextTransparency = 0.750
		ValueText.TextXAlignment = Enum.TextXAlignment.Right

		table.insert(Compkiller.Elements.SwitchColor , {
			Element = ValueText,
			Property = 'TextColor3'
		});

		Compkiller:_Hover(SliderBar,function()
			if Signal:GetValue() then
				Compkiller:_Animation(ValueText,TweenInfo.new(0.2),{
					TextTransparency = 0.2
				})
			end;
		end,function()
			if Signal:GetValue() then
				Compkiller:_Animation(ValueText,TweenInfo.new(0.2),{
					TextTransparency = 0.750
				})
			end;
		end)	

		local IsHold = false;

		local Update = function(Input)
			local SizeScale = math.clamp((((Input.Position.X) - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X), 0, 1);

			local Main = ((Config.Max - Config.Min) * SizeScale) + Config.Min;

			local Value = Compkiller:_Rounding(Main,Config.Round);

			local PositionX = UDim2.fromScale(SizeScale, 1);

			local Size = (Value - Config.Min) / (Config.Max - Config.Min);

			TweenService:Create(SliderInput , TweenInfo.new(0.2),{
				Size = UDim2.new(math.clamp(Size,0.045,1), 0, 1, 0)
			}):Play();

			Config.Default = Value;

			ValueText.Text = tostring(Config.Default)..tostring(Config.Type)

			Config.Callback(Value)
		end;

		do
			SliderBar.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					IsHold = true
					Update(Input)
				end
			end)

			SliderBar.InputEnded:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					if UserInputService.TouchEnabled then
						if not Compkiller:_IsMouseOverFrame(SliderBar) then
							IsHold = false
						end;
					else
						IsHold = false
					end;
				end
			end)

			UserInputService.InputChanged:Connect(function(Input)
				if IsHold then
					if (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch)  then
						if UserInputService.TouchEnabled then
							if not Compkiller:_IsMouseOverFrame(SliderBar) then
								IsHold = false
							else
								Update(Input)
							end;
						else
							Update(Input)
						end;
					end;
				end;
			end);
		end;

		local Args = {};

		Args.Flag = Config.Flag;

		function Args:SetValue(Value)
			Config.Default = Value;

			ValueText.Text = tostring(Config.Default)..tostring(Config.Type)

			Compkiller:_Animation(SliderInput, TweenInfo.new(0.35),{
				Size = UDim2.new(math.max((Config.Default - Config.Min) / (Config.Max - Config.Min) , 0.045), 0, 1, 0)
			});

			Config.Callback(Value);
		end;

		function Args:SetText(str : string)
			BlockText.Text = str or Config.Name
		end;

		function Args:GetText()
			return BlockText.Text;
		end;

		Args.Signal = Signal:Connect(function(bool)
			if bool then
				Compkiller:_Animation(SliderInput, TweenInfo.new(0.35),{
					Size = UDim2.new(math.max((Config.Default - Config.Min) / (Config.Max - Config.Min) , 0.045), 0, 1, 0)
				});

				Compkiller:_Animation(ValueText,Tween,{
					TextTransparency = 0.750
				})

				Compkiller:_Animation(Frame,Tween,{
					BackgroundTransparency = 0
				})

				Compkiller:_Animation(SliderInput,Tween,{
					BackgroundTransparency = 0
				})

				Compkiller:_Animation(UIStroke,Tween,{
					Transparency = 0
				})

				Compkiller:_Animation(SliderBar,Tween,{
					BackgroundTransparency = 0
				})

				Compkiller:_Animation(BlockLine,Tween,{
					BackgroundTransparency = 0.5
				})

				Compkiller:_Animation(BlockText,Tween,{
					TextTransparency = 0.1
				})
			else
				Compkiller:_Animation(SliderInput, TweenInfo.new(0.35),{
					Size = UDim2.new(0, 0, 1, 0)
				});

				Compkiller:_Animation(ValueText,Tween,{
					TextTransparency = 1
				})

				Compkiller:_Animation(Frame,Tween,{
					BackgroundTransparency = 1
				})

				Compkiller:_Animation(SliderInput,Tween,{
					BackgroundTransparency = 1
				})

				Compkiller:_Animation(UIStroke,Tween,{
					Transparency = 1
				})

				Compkiller:_Animation(SliderBar,Tween,{
					BackgroundTransparency = 1
				})

				Compkiller:_Animation(BlockLine,Tween,{
					BackgroundTransparency = 1
				})

				Compkiller:_Animation(BlockText,Tween,{
					TextTransparency = 1
				})
			end;
		end);

		function Args:GetValue()
			return Config.Default;
		end;

		if Config.Flag then
			Compkiller.Flags[Config.Flag] = Args;
		end;

		if not DisableStackKeybind then
			local AutoKeybind = Compkiller:_KeybindHandler(Slider , "Number" , Args , Signal , Zindex , Config);

			Args.AutoKeybind = AutoKeybind;
		end;

		return Args;
	end;

	function Args:AddParagraph(Config: Paragraph) -- request by Neptune
		Config = Compkiller.__CONFIG(Config, {
			Title = "Paragraph",
			Content = "",
		});

		local Paragraph = Instance.new("Frame")
		local BlockText = Instance.new("TextLabel")
		local BlockLine = Instance.new("Frame")
		local DescriptionText = Instance.new("TextLabel")

		if Compkiller:_IsMobile() then
			Compkiller:_AddDragBlacklist(Paragraph);
		end;

		Paragraph.Name = Compkiller:_RandomString()
		Paragraph.Parent = Parent
		Paragraph.BackgroundTransparency = 1.000
		Paragraph.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Paragraph.BorderSizePixel = 0
		Paragraph.Size = UDim2.new(1, -1, 0, 40)
		Paragraph.ZIndex = Zindex + 2
		Paragraph.ClipsDescendants = true

		BlockText.Name = Compkiller:_RandomString()
		BlockText.Parent = Paragraph
		BlockText.AnchorPoint = Vector2.new(0, 0.5)
		BlockText.BackgroundTransparency = 1.000
		BlockText.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BlockText.BorderSizePixel = 0
		BlockText.Position = UDim2.new(0, 12, 0, 12)
		BlockText.Size = UDim2.new(1, -20, 0, 25)
		BlockText.ZIndex = Zindex + 3
		BlockText.Font = Enum.Font.GothamMedium
		BlockText.Text = Config.Title
		BlockText.TextColor3 = Compkiller.Colors.SwitchColor
		BlockText.TextSize = 14.000
		BlockText.TextTransparency = 0.300
		BlockText.TextXAlignment = Enum.TextXAlignment.Left
		BlockText.RichText = true

		table.insert(Compkiller.Elements.SwitchColor , {
			Element = BlockText,
			Property = 'TextColor3'
		});

		BlockLine.Name = Compkiller:_RandomString()
		BlockLine.Parent = Paragraph
		BlockLine.AnchorPoint = Vector2.new(0.5, 1)
		BlockLine.BackgroundColor3 = Compkiller.Colors.LineColor
		BlockLine.BackgroundTransparency = 0.500
		BlockLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BlockLine.BorderSizePixel = 0
		BlockLine.Position = UDim2.new(0.5, 0, 1, 0)
		BlockLine.Size = UDim2.new(1, -26, 0, 1)
		BlockLine.ZIndex = Zindex + 4

		table.insert(Compkiller.Elements.LineColor,{
			Element = BlockLine,
			Property = "BackgroundColor3"
		});

		DescriptionText.RichText = true
		DescriptionText.Name = Compkiller:_RandomString()
		DescriptionText.Parent = Paragraph
		DescriptionText.BackgroundTransparency = 1.000
		DescriptionText.BorderColor3 = Color3.fromRGB(0, 0, 0)
		DescriptionText.BorderSizePixel = 0
		DescriptionText.Position = UDim2.new(0, 12, 0, 22)
		DescriptionText.Size = UDim2.new(1, -20, 1, -25)
		DescriptionText.ZIndex = Zindex + 5
		DescriptionText.Font = Enum.Font.GothamMedium
		DescriptionText.Text = Config.Content
		DescriptionText.TextColor3 = Compkiller.Colors.SwitchColor
		DescriptionText.TextSize = 13.000
		DescriptionText.TextTransparency = 0.500
		DescriptionText.TextXAlignment = Enum.TextXAlignment.Left
		DescriptionText.TextYAlignment = Enum.TextYAlignment.Top

		table.insert(Compkiller.Elements.SwitchColor , {
			Element = DescriptionText,
			Property = 'TextColor3'
		});

		local Base = 15;

		local UpdateScale = function()

			if not DescriptionText.Text:byte() then
				local TitleScale = TextService:GetTextSize(BlockText.Text,BlockText.TextSize,BlockText.Font,Vector2.new(math.huge,math.huge));

				Compkiller:_Animation(Paragraph,TweenInfo.new(0.15),{
					Size = UDim2.new(1, -1, 0, TitleScale.Y + Base)
				});
			else
				local TitleScale = TextService:GetTextSize(BlockText.Text,BlockText.TextSize,BlockText.Font,Vector2.new(math.huge,math.huge));
				local ContentScale = TextService:GetTextSize(DescriptionText.Text,DescriptionText.TextSize,DescriptionText.Font,Vector2.new(math.huge,math.huge));

				Compkiller:_Animation(Paragraph,TweenInfo.new(0.15),{
					Size = UDim2.new(1, -1, 0, (TitleScale.Y + ContentScale.Y) + Base)
				});
			end;
		end;

		UpdateScale();

		local Args = {};

		function Args:SetTitle(title)
			BlockText.Text = title;
			UpdateScale();
		end;

		function Args:SetContent(content)
			DescriptionText.Text = content;
			UpdateScale();
		end;

		Args.Signal = Signal:Connect(function(bool)
			if bool then
				Compkiller:_Animation(BlockText,TweenInfo.new(0.2),{
					TextTransparency = 0.300
				});

				Compkiller:_Animation(DescriptionText,TweenInfo.new(0.2),{
					TextTransparency = 0.500
				});

				Compkiller:_Animation(BlockLine,TweenInfo.new(0.2),{
					BackgroundTransparency = 0.500
				});
			else
				Compkiller:_Animation(BlockText,TweenInfo.new(0.2),{
					TextTransparency = 1
				});

				Compkiller:_Animation(DescriptionText,TweenInfo.new(0.2),{
					TextTransparency = 1
				});

				Compkiller:_Animation(BlockLine,TweenInfo.new(0.2),{
					BackgroundTransparency = 1
				});
			end;
		end);

		return Args;
	end;

	function Args:AddTextBox(Config: TextBoxConfig)
		Config = Compkiller.__CONFIG(Config , {
			Name = "TextBox",
			Default = "",
			Placeholder = "Placeholder",
			Numberic = false,
			Callback = function() end,
		});

		local TextBox = Instance.new("Frame")
		local BlockText = Instance.new("TextLabel")
		local LinkValues = Instance.new("Frame")
		local UIStroke = Instance.new("UIStroke")
		local UICorner = Instance.new("UICorner")
		local TextBox_2 = Instance.new("TextBox")
		local BlockLine = Instance.new("Frame")

		if Compkiller:_IsMobile() then
			Compkiller:_AddDragBlacklist(TextBox);
		end;

		TextBox.Name = Compkiller:_RandomString()
		TextBox.Parent = Parent
		TextBox.BackgroundTransparency = 1.000
		TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextBox.BorderSizePixel = 0
		TextBox.Size = UDim2.new(1, -1, 0, 30)
		TextBox.ZIndex = Zindex + 1

		BlockText.Name = Compkiller:_RandomString()
		BlockText.Parent = TextBox
		BlockText.AnchorPoint = Vector2.new(0, 0.5)
		BlockText.BackgroundTransparency = 1.000
		BlockText.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BlockText.BorderSizePixel = 0
		BlockText.Position = UDim2.new(0, 12, 0.5, 0)
		BlockText.Size = UDim2.new(1, -20, 0, 25)
		BlockText.ZIndex = Zindex + 2
		BlockText.Font = Enum.Font.GothamMedium
		BlockText.Text = Config.Name
		BlockText.TextColor3 = Compkiller.Colors.SwitchColor
		BlockText.TextSize = 14.000
		BlockText.TextTransparency = 0.300
		BlockText.TextXAlignment = Enum.TextXAlignment.Left

		table.insert(Compkiller.Elements.SwitchColor,{
			Element = BlockText,
			Property = "TextColor3"
		})

		LinkValues.Name = Compkiller:_RandomString()
		LinkValues.Parent = TextBox
		LinkValues.AnchorPoint = Vector2.new(1, 0.540000021)
		LinkValues.BackgroundColor3 = Compkiller.Colors.DropColor
		LinkValues.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LinkValues.BorderSizePixel = 0
		LinkValues.Position = UDim2.new(1, -12, 0.5, 0)
		LinkValues.Size = UDim2.new(0, 95, 0, 16)
		LinkValues.ZIndex = Zindex + 3

		table.insert(Compkiller.Elements.DropColor,{
			Element = LinkValues,
			Property = "BackgroundColor3"
		})

		UIStroke.Color = Compkiller.Colors.StrokeColor
		UIStroke.Parent = LinkValues

		table.insert(Compkiller.Elements.StrokeColor,{
			Element = UIStroke,
			Property = "Color"
		})

		UICorner.CornerRadius = UDim.new(0, 3)
		UICorner.Parent = LinkValues

		TextBox_2.Parent = LinkValues
		TextBox_2.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBox_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextBox_2.BackgroundTransparency = 1.000
		TextBox_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextBox_2.BorderSizePixel = 0
		TextBox_2.ClipsDescendants = true
		TextBox_2.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextBox_2.Size = UDim2.new(1, -5, 1, 0)
		TextBox_2.ZIndex = Zindex + 5
		TextBox_2.ClearTextOnFocus = false
		TextBox_2.Font = Enum.Font.GothamMedium
		TextBox_2.PlaceholderText = Config.Placeholder
		TextBox_2.Text = Config.Default
		TextBox_2.TextColor3 = Compkiller.Colors.SwitchColor
		TextBox_2.TextSize = 11.000

		table.insert(Compkiller.Elements.SwitchColor,{
			Element = TextBox_2,
			Property = "TextColor3"
		})

		BlockLine.Name = Compkiller:_RandomString()
		BlockLine.Parent = TextBox
		BlockLine.AnchorPoint = Vector2.new(0.5, 1)
		BlockLine.BackgroundColor3 = Compkiller.Colors.LineColor
		BlockLine.BackgroundTransparency = 0.500
		BlockLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BlockLine.BorderSizePixel = 0
		BlockLine.Position = UDim2.new(0.5, 0, 1, 0)
		BlockLine.Size = UDim2.new(1, -26, 0, 1)
		BlockLine.ZIndex = Zindex + 3;

		table.insert(Compkiller.Elements.LineColor,{
			Element = BlockLine,
			Property = "BackgroundColor3"
		})

		local Update = function()
			local scale = TextService:GetTextSize(TextBox_2.Text,TextBox_2.TextSize,TextBox_2.Font,Vector2.new(math.huge,math.huge));
			local Base = TextService:GetTextSize(TextBox_2.PlaceholderText,TextBox_2.TextSize,TextBox_2.Font,Vector2.new(math.huge,math.huge));

			local MainScale = ((scale.X > Base.X) and scale.X) or Base.X;

			local xp = pcall(function()
				Compkiller:_Animation(LinkValues,TweenInfo.new(0.25),{
					Size = UDim2.fromOffset(math.clamp(MainScale + 7 , Base.X , TextBox.AbsoluteSize.X / 2) , 16)
				})
			end);

			if not xp then
				Compkiller:_Animation(LinkValues,TweenInfo.new(0.25),{
					Size = UDim2.fromOffset(MainScale + 7 , 16)
				})
			end;
		end;

		local parse = function(text)
			if not text then
				return "";	
			end;

			if Config.Numeric then
				local out = string.gsub(tostring(text), '[^0-9.]', '')

				if tonumber(out) then
					return tonumber(out);
				end;

				return nil;
			end;

			return text;
		end;

		Update();

		TextBox_2:GetPropertyChangedSignal('Text'):Connect(Update);

		TextBox_2:GetPropertyChangedSignal('Text'):Connect(function()
			local value = parse(TextBox_2.Text);

			if value then

				TextBox_2.Text = tostring(value);

				task.spawn(Config.Callback,value);

				Config.Default = value;
			else
				TextBox_2.Text = string.gsub(TextBox_2.Text, '[^0-9.]', '');

				Config.Default = TextBox_2.Text;
			end;
		end);

		local Args = {};

		Args.Flag = Config.Flag;

		function Args:SetText(str : string)
			BlockText.Text = str or Config.Name
		end;

		function Args:GetText()
			return BlockText.Text;
		end;

		function Args:SetValue(Value)
			Config.Default = Value;

			TextBox_2.Text = tostring(Config.Default);

			Config.Callback(Value);
		end;

		Args.Signal = Signal:Connect(function(bool)
			if bool then
				Compkiller:_Animation(BlockText,TweenInfo.new(0.2),{
					TextTransparency = 0.3
				});

				Compkiller:_Animation(BlockLine,TweenInfo.new(0.2),{
					BackgroundTransparency = 0.5
				});

				Compkiller:_Animation(UIStroke,TweenInfo.new(0.2),{
					Transparency = 0
				});

				Compkiller:_Animation(LinkValues,TweenInfo.new(0.2),{
					BackgroundTransparency = 0
				});

			else
				Compkiller:_Animation(BlockText,TweenInfo.new(0.2),{
					TextTransparency = 1
				});

				Compkiller:_Animation(BlockLine,TweenInfo.new(0.2),{
					BackgroundTransparency = 1
				});

				Compkiller:_Animation(UIStroke,TweenInfo.new(0.2),{
					Transparency = 1
				});

				Compkiller:_Animation(LinkValues,TweenInfo.new(0.2),{
					BackgroundTransparency = 1
				});

			end;
		end);

		function Args:GetValue()
			return Config.Default;
		end;

		if Config.Flag then
			Compkiller.Flags[Config.Flag] = Args;
		end;

		return Args;
	end;

	function Args:AddDropdown(Config : Dropdown)
		Config = Compkiller.__CONFIG(Config,{
			Name = "Dropdown",
			Default = nil,
			Values = {"Item 1","Item 2","Item 3"},
			Multi = false,
			Callback = function() end;
		});

		local DaTabarser = function(value)
			if not value then return ''; end;

			local Out;

			if typeof(value) == 'table' then
				if #value > 0 then
					local x = {};

					for i,v in next , value do
						table.insert(x , tostring(v))
					end;

					Out = table.concat(x,' , ');
				else
					local x = {};

					for i,v in next , value do
						if v == true then
							table.insert(x , tostring(i));
						end			
					end;

					Out = table.concat(x,' , ');
				end;
			else
				Out = tostring(value);
			end;

			return Out;
		end;

		local Dropdown = Instance.new("Frame")
		local BlockText = Instance.new("TextLabel")
		local BlockLine = Instance.new("Frame")
		local LinkValues = Instance.new("Frame")
		local UIListLayout = Instance.new("UIListLayout")
		local ValueItems = Instance.new("Frame")
		local UIStroke = Instance.new("UIStroke")
		local UICorner = Instance.new("UICorner")
		local ValueText = Instance.new("TextLabel")
		local MainButton = Instance.new("ImageButton")

		Dropdown.Name = Compkiller:_RandomString()
		Dropdown.Parent = Parent
		Dropdown.BackgroundTransparency = 1.000
		Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Dropdown.BorderSizePixel = 0
		Dropdown.Size = UDim2.new(1, -1, 0, 55)
		Dropdown.ZIndex = Zindex + 2

		BlockText.Name = Compkiller:_RandomString()
		BlockText.Parent = Dropdown
		BlockText.BackgroundTransparency = 1.000
		BlockText.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BlockText.BorderSizePixel = 0
		BlockText.Position = UDim2.new(0, 12, 0, 1)
		BlockText.Size = UDim2.new(1, -20, 0, 25)
		BlockText.ZIndex = Zindex + 3
		BlockText.Font = Enum.Font.GothamMedium
		BlockText.Text = Config.Name
		BlockText.TextColor3 = Compkiller.Colors.SwitchColor
		BlockText.TextSize = 14.000
		BlockText.TextTransparency = 0.100
		BlockText.TextXAlignment = Enum.TextXAlignment.Left

		if not BlockText.Text:byte() then
			Dropdown.Size = UDim2.new(1, -1, 0, 25)
		end;

		table.insert(Compkiller.Elements.SwitchColor , {
			Element = BlockText,
			Property = 'TextColor3'
		});

		BlockLine.Name = Compkiller:_RandomString()
		BlockLine.Parent = Dropdown
		BlockLine.AnchorPoint = Vector2.new(0.5, 1)
		BlockLine.BackgroundColor3 = Compkiller.Colors.LineColor
		BlockLine.BackgroundTransparency = 0.500
		BlockLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BlockLine.BorderSizePixel = 0
		BlockLine.Position = UDim2.new(0.5, 0, 1, 0)
		BlockLine.Size = UDim2.new(1, -26, 0, 1)
		BlockLine.ZIndex = Zindex + 3

		table.insert(Compkiller.Elements.LineColor,{
			Element = BlockLine,
			Property = "BackgroundColor3"
		});

		LinkValues.Name = Compkiller:_RandomString()
		LinkValues.Parent = Dropdown
		LinkValues.AnchorPoint = Vector2.new(1, 0.540000021)
		LinkValues.BackgroundTransparency = 1.000
		LinkValues.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LinkValues.BorderSizePixel = 0
		LinkValues.Position = UDim2.new(1, -12, 0, 15)
		LinkValues.Size = UDim2.new(1, 0, 0, 18)
		LinkValues.ZIndex = Zindex + 3

		UIListLayout.Parent = LinkValues
		UIListLayout.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		UIListLayout.Padding = UDim.new(0, 8)

		ValueItems.Name = Compkiller:_RandomString()
		ValueItems.Parent = Dropdown
		ValueItems.AnchorPoint = Vector2.new(0.5, 1)
		ValueItems.BackgroundColor3 = Compkiller.Colors.DropColor
		ValueItems.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ValueItems.BorderSizePixel = 0
		ValueItems.ClipsDescendants = true
		ValueItems.Position = UDim2.new(0.5, 0, 1, -7)
		ValueItems.Size = UDim2.new(1, -25, 0, 18)
		ValueItems.ZIndex = Zindex + 5

		table.insert(Compkiller.Elements.DropColor , {
			Element = ValueItems,
			Property = "BackgroundColor3"
		})

		UIStroke.Color = Compkiller.Colors.StrokeColor
		UIStroke.Parent = ValueItems

		table.insert(Compkiller.Elements.StrokeColor,{
			Element = UIStroke,
			Property = "Color"
		});

		UICorner.CornerRadius = UDim.new(0, 3)
		UICorner.Parent = ValueItems

		ValueText.Name = Compkiller:_RandomString()
		ValueText.Parent = ValueItems
		ValueText.AnchorPoint = Vector2.new(0.5, 0.5)
		ValueText.BackgroundTransparency = 1.000
		ValueText.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ValueText.BorderSizePixel = 0
		ValueText.Position = UDim2.new(0.5, 0, 0.5, 0)
		ValueText.Size = UDim2.new(1, -10, 0, 15)
		ValueText.ZIndex = Zindex + 8
		ValueText.Font = Enum.Font.Gotham
		ValueText.Text = DaTabarser(Config.Default)
		ValueText.TextColor3 = Compkiller.Colors.SwitchColor
		ValueText.TextSize = 11.000
		ValueText.TextXAlignment = Enum.TextXAlignment.Left

		table.insert(Compkiller.Elements.SwitchColor , {
			Element = ValueText,
			Property = 'TextColor3'
		});

		MainButton.Name = Compkiller:_RandomString()
		MainButton.Parent = ValueItems
		MainButton.AnchorPoint = Vector2.new(1, 0.5)
		MainButton.BackgroundTransparency = 1.000
		MainButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		MainButton.BorderSizePixel = 0
		MainButton.Position = UDim2.new(1, -5, 0.5, 0)
		MainButton.Size = UDim2.new(0, 13, 0, 13)
		MainButton.ZIndex = Zindex + 5
		MainButton.Image = Compkiller:CacheImage("rbxassetid://109535175596957")

		Compkiller:_Hover(ValueItems,function()
			Compkiller:_Animation(ValueItems,TweenInfo.new(0.3),{
				BackgroundColor3 = Compkiller.Colors.MouseEnter
			});
		end,function()
			Compkiller:_Animation(ValueItems,TweenInfo.new(0.3),{
				BackgroundColor3 = Compkiller.Colors.DropColor
			});
		end);

		local repi;
		local Button = Compkiller:_Input(ValueItems);

		repi = Compkiller:_LoadDropdown(Button,function(value)
			Config.Default = value;

			repi:SetData(Config.Default,Config.Values,Config.Multi,false);
			repi:SetDefault(Config.Default);

			ValueText.Text = DaTabarser(Config.Default);

			Config.Callback(Config.Default);
		end);

		repi.EventOut:Connect(function(v)
			if v then
				Compkiller:_Animation(MainButton,TweenInfo.new(0.2),{
					Rotation = -180
				})
			else
				Compkiller:_Animation(MainButton,TweenInfo.new(0.2),{
					Rotation = 0
				})
			end;
		end)

		repi:SetData(Config.Default,Config.Values,Config.Multi,false);
		repi:Refersh();

		local Args = {};

		Args.Flag = Config.Flag;

		function Args:SetValue(Value)
			Config.Default = Value;

			ValueText.Text = DaTabarser(Config.Default);

			repi:SetData(Config.Default,Config.Values,Config.Multi,true);

			Config.Callback(Value);
		end;

		function Args:SetText(str : string)
			BlockText.Text = str or Config.Name
		end;


		function Args:GetText()
			return BlockText.Text;
		end;

		function Args:SetValues(v)
			Config.Values = v;

			repi:SetData(Config.Default,Config.Values,Config.Multi,true);
		end;

		Args.Signal = Signal:Connect(function(bool)
			if bool then
				Compkiller:_Animation(BlockText,TweenInfo.new(0.2),{
					TextTransparency = 0.100
				});

				Compkiller:_Animation(BlockLine,TweenInfo.new(0.2),{
					BackgroundTransparency = 0.100
				});

				Compkiller:_Animation(ValueItems,TweenInfo.new(0.2),{
					BackgroundTransparency = 0
				});

				Compkiller:_Animation(UIStroke,TweenInfo.new(0.2),{
					Transparency = 0
				});

				Compkiller:_Animation(ValueText,TweenInfo.new(0.32),{
					TextTransparency = 0
				});

				Compkiller:_Animation(MainButton,TweenInfo.new(0.2),{
					ImageTransparency = 0
				});
			else
				Compkiller:_Animation(BlockText,TweenInfo.new(0.2),{
					TextTransparency = 1
				});

				Compkiller:_Animation(BlockLine,TweenInfo.new(0.2),{
					BackgroundTransparency = 1 
				});

				Compkiller:_Animation(ValueItems,TweenInfo.new(0.2),{
					BackgroundTransparency = 1
				});

				Compkiller:_Animation(UIStroke,TweenInfo.new(0.2),{
					Transparency = 1
				});

				Compkiller:_Animation(ValueText,TweenInfo.new(0.2),{
					TextTransparency = 1
				});

				Compkiller:_Animation(MainButton,TweenInfo.new(0.2),{
					ImageTransparency = 1
				});
			end;
		end);

		Args.Link = Compkiller:_LoadOption({
			AddLink = function(self ,Name , Default)
				return Compkiller:_AddLinkValue(Name , Default , LinkValues , LinkValues , {
					Tween = TweenInfo.new(0.2)	
				} , Signal);
			end,
			Root = Dropdown
		});

		function Args:GetValue()
			return Config.Default;
		end;

		if Config.Flag then
			Compkiller.Flags[Config.Flag] = Args;
		end;

		return Args;
	end;

	return Args;
end;

function Compkiller:GetTheme()
	return Compkiller.Colors;
end;

function Compkiller:SetTheme(name)
	if name == "Dark Green" then
		Compkiller.Colors = {
			["BGDBColor"] = Color3.new(0.0429964, 0.110345, 0.0727226),
			["BlockBackground"] = Color3.new(0.159287, 0.234483, 0.201811),
			["BlockColor"] = Color3.new(0, 0.137931, 0.0951249),
			["DropColor"] = Color3.new(0, 0.227586, 0.100452),
			["Highlight"] = Color3.new(0.0666667, 0.992157, 0.628343),
			["LineColor"] = Color3.new(0.263258, 0.372414, 0.329504),
			["MouseEnter"] = Color3.new(0, 0.841379, 0.51063),
			["Risky"] = Color3.new(1, 0.398296, 0.152941),
			["StrokeColor"] = Color3.new(0.132342, 0.241379, 0.198517),
			["SwitchColor"] = Color3.new(0.927586, 1, 0.980523),
			["Toggle"] = Color3.new(0, 0.613793, 0.220119),
			HighStrokeColor = Color3.new(0, 0.241379, 0.186445),
		};
	elseif name == "Default" then
		Compkiller.Colors = {
			Highlight = Color3.fromRGB(17, 238, 253),
			Toggle = Color3.fromRGB(14, 203, 213),
			Risky = Color3.fromRGB(251, 255, 39),
			BGDBColor = Color3.fromRGB(22, 24, 29),
			BlockColor = Color3.fromRGB(28, 29, 34),
			StrokeColor = Color3.fromRGB(37, 38, 43),
			SwitchColor = Color3.fromRGB(255, 255, 255),
			DropColor = Color3.fromRGB(33, 35, 39),
			MouseEnter = Color3.fromRGB(55, 58, 65),
			BlockBackground = Color3.fromRGB(39, 40, 47),
			LineColor = Color3.fromRGB(65, 65, 65),
			HighStrokeColor = Color3.fromRGB(55, 56, 63),
		};
	elseif name == "Dark Blue" then
		Compkiller.Colors = {
			["BGDBColor"] = Color3.new(0.0393817, 0.0754204, 0.165517),
			["BlockBackground"] = Color3.new(0, 0.0618311, 0.172414),
			["BlockColor"] = Color3.new(0, 0.0172414, 0.103448),
			["DropColor"] = Color3.new(0, 0.0965518, 0.289655),
			["HighStrokeColor"] = Color3.new(0, 0.132604, 0.234483),
			["Highlight"] = Color3.new(0.0666667, 0.781528, 0.992157),
			["LineColor"] = Color3.new(0, 0.110345, 0.275862),
			["MouseEnter"] = Color3.new(0, 0.606896, 1),
			["Risky"] = Color3.new(0.0310345, 0.819572, 1),
			["StrokeColor"] = Color3.new(0, 0.119857, 0.248276),
			["SwitchColor"] = Color3.new(1, 1, 1),
			["Toggle"] = Color3.new(0.054902, 0.463935, 0.835294)
		}
	elseif name == "Purple Rose" then
		Compkiller.Colors = {
			["BGDBColor"] = Color3.new(0.0459068, 0.030321, 0.117241),
			["BlockBackground"] = Color3.new(0.156272, 0.119596, 0.324138),
			["BlockColor"] = Color3.new(0.0948428, 0.0576457, 0.165517),
			["DropColor"] = Color3.new(0.131034, 0, 0.0813317),
			["HighStrokeColor"] = Color3.new(0.136259, 0.101237, 0.296552),
			["Highlight"] = Color3.new(0.992157, 0.0666667, 0.33474),
			["LineColor"] = Color3.new(0.20872, 0.137408, 0.372414),
			["MouseEnter"] = Color3.new(0.365517, 0, 0.120999),
			["Risky"] = Color3.new(1, 0.6086, 0.152941),
			["StrokeColor"] = Color3.new(0.148499, 0.137836, 0.248276),
			["SwitchColor"] = Color3.new(1, 1, 1),
			["Toggle"] = Color3.new(0.835294, 0.054902, 0.248654)
		}
	elseif name == "Skeet" then		
		Compkiller.Colors = {
			["BGDBColor"] = Color3.new(0.114578, 0.125191, 0.151724),
			["BlockBackground"] = Color3.new(0.128181, 0.131124, 0.151724),
			["BlockColor"] = Color3.new(0.0732699, 0.0760008, 0.0896552),
			["DropColor"] = Color3.new(0.0809037, 0.0861197, 0.0965517),
			["HighStrokeColor"] = Color3.new(0.119382, 0.1217, 0.137931),
			["Highlight"] = Color3.new(0, 0.634483, 0.0700119),
			["LineColor"] = Color3.new(0.151724, 0.151724, 0.151724),
			["MouseEnter"] = Color3.new(0.134007, 0.141391, 0.158621),
			["Risky"] = Color3.new(0.984314, 1, 0.152941),
			["StrokeColor"] = Color3.new(0.0769798, 0.0790924, 0.0896552),
			["SwitchColor"] = Color3.new(1, 1, 1),
			["Toggle"] = Color3.new(0, 0.324138, 0.10283)
		}
	end;

	Compkiller:RefreshCurrentColor()
end;

function Compkiller:RefreshCurrentColor()
	for i,v in next , Compkiller.Elements.Highlight do
		if v.Element and v.Property then
			v.Element[v.Property] = Compkiller.Colors.Highlight;
		end;
	end;

	for i,v in next , Compkiller.Elements do
		if v.Element and v.Property and v.Element:GetAttribute('Enabled') then
			v.Element[v.Property] = Compkiller.Colors.Highlight;
		end;
	end;

	for i,v in next , Compkiller.Elements.Risky do
		if v.Element and v.Property then
			v.Element[v.Property] = Compkiller.Colors.Risky;
		end;
	end;

	for i,v in next , Compkiller.Elements.BlockColor do
		if v.Element and v.Property then
			v.Element[v.Property] = Compkiller.Colors.BlockColor;
		end;
	end;

	for i,v in next , Compkiller.Elements.BGDBColor do
		if v.Element and v.Property then
			v.Element[v.Property] = Compkiller.Colors.BGDBColor;
		end;
	end;

	for i,v in next , Compkiller.Elements.StrokeColor do
		if v.Element and v.Property then
			v.Element[v.Property] = Compkiller.Colors.StrokeColor;
		end;
	end;

	for i,v in next , Compkiller.Elements.SwitchColor do
		if v.Element and v.Property and v.Element[v.Property] ~= Compkiller.Colors.MouseEnter then
			v.Element[v.Property] = Compkiller.Colors.SwitchColor;
		end;
	end;

	for i,v in next , Compkiller.Elements.BlockBackground do
		if v.Element and v.Property and v.Element[v.Property] then
			v.Element[v.Property] = Compkiller.Colors.BlockBackground;
		end;
	end;

	for i,v in next , Compkiller.Elements.DropColor do
		if v.Element and v.Property then
			v.Element[v.Property] = Compkiller.Colors.DropColor;
		end;
	end;

	for i,v in next , Compkiller.Elements.LineColor do
		if v.Element and v.Property then
			v.Element[v.Property] = Compkiller.Colors.LineColor;
		end;
	end;

	for i,v in next , Compkiller.Elements.HighStrokeColor do
		if v.Element and v.Property then
			v.Element[v.Property] = Compkiller.Colors.HighStrokeColor;
		end;
	end;
end;

function Compkiller:ChangeHighlightColor(NewColor: Color3)
	local H,S,V = NewColor:ToHSV();

	Compkiller.Colors.Highlight = NewColor;
	Compkiller.Colors.Toggle = Color3.fromHSV(H,S,V - 0.2);

	for i,v in next , Compkiller.Elements.Highlight do
		if v.Element and v.Property then
			v.Element[v.Property] = NewColor;
		end;
	end;

	for i,v in next , Compkiller.Elements do
		if v.Element and v.Property and v.Element:GetAttribute('Enabled') then
			v.Element[v.Property] = NewColor;
		end;
	end;
end;

function Compkiller.new(Config : Window)

	if not Config.Scale then
		if Compkiller:_IsMobile() then
			Config.Scale = Compkiller.Scale.Mobile;
		else
			Config.Scale = Compkiller.Scale.Window;
		end;
	end;

	Config = Compkiller.__CONFIG(Config , {
		Name = "COMPKILLER",
		Keybind = "Insert",
		Logo = Compkiller.Logo;
		Scale = Compkiller.Scale.Window,
		TextSize = 15
	});

	local TabHover = Compkiller.__SIGNAL(false);
	local WindowOpen = Compkiller.__SIGNAL(true);
	local WindowArgs = {
		SelectedTab = nil,
		Tabs = {},
		LastTab = nil,
		IsOpen = true,
		AlwayShowTab = false,
		THREADS = {},
		PerformanceMode = false,
		Notify = Compkiller.newNotify()
	};

	WindowArgs.Username = LocalPlayer.Name;

	if Compkiller:_IsMobile() then
		WindowArgs.AlwayShowTab = true;
	end;

	local CompKiller = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local TabFrame = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local LineFrame1 = Instance.new("Frame")
	local CompLogo = Instance.new("ImageLabel")
	local WindowLabel = Instance.new("TextLabel")
	local TabButtons = Instance.new("Frame")
	local SelectionFrame = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local TabButtonScrollingFrame = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local Userinfo = Instance.new("Frame")
	local UserProfile = Instance.new("ImageLabel")
	local UICorner_4 = Instance.new("UICorner")
	local UserText = Instance.new("TextLabel")
	local ExpireText = Instance.new("TextLabel")
	local TabMainFrame = Instance.new("Frame")

	Compkiller:_DrawKeybinds(CompKiller);

	UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
		TabButtonScrollingFrame.CanvasSize = UDim2.fromOffset(0,UIListLayout.AbsoluteContentSize.Y)
	end);

	CompKiller.Name = "u?name=compkiller_?"..Compkiller:_RandomString();
	CompKiller.Parent = CoreGui;
	CompKiller.ResetOnSpawn = false
	CompKiller.IgnoreGuiInset = true;
	CompKiller.ZIndexBehavior = Enum.ZIndexBehavior.Global;

	Compkiller.ProtectGui(CompKiller);

	WindowArgs.Root = CompKiller;

	table.insert(Compkiller.Windows , CompKiller);

	MainFrame.Active = true;
	MainFrame.Name = Compkiller:_RandomString()
	MainFrame.Parent = CompKiller
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Compkiller.Colors.BGDBColor

	table.insert(Compkiller.Elements.BGDBColor,{
		Element = MainFrame,
		Property = 'BackgroundColor3'
	});

	MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.fromScale(0.5,0.5);
	MainFrame.Size = Compkiller.Scale.Window
	MainFrame.ZIndex = 4

	MainFrame:GetPropertyChangedSignal('BackgroundTransparency'):Connect(function()
		if MainFrame.BackgroundTransparency > 0.9 then
			MainFrame.Visible = false;
		else
			MainFrame.Visible = true;
		end;
	end)

	Compkiller:_Animation(MainFrame,TweenInfo.new(1,Enum.EasingStyle.Quint,Enum.EasingDirection.InOut),{
		Size = Config.Scale
	});

	UICorner.Parent = MainFrame

	local TabFrameBaseTrans = 0.25;

	TabFrame.Active = true
	TabFrame.Name = Compkiller:_RandomString()
	TabFrame.Parent = MainFrame
	TabFrame.AnchorPoint = Vector2.new(1, 0)
	TabFrame.BackgroundColor3 = Compkiller.Colors.BGDBColor

	table.insert(Compkiller.Elements.BGDBColor,{
		Element = TabFrame,
		Property = 'BackgroundColor3'
	});

	TabFrame.BackgroundTransparency = TabFrameBaseTrans
	TabFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabFrame.BorderSizePixel = 0
	TabFrame.ClipsDescendants = true
	TabFrame.Position = UDim2.new(0, 25, 0, 0)
	TabFrame.Size = UDim2.new(0, 85, 1, 0)

	UICorner_2.Parent = TabFrame

	LineFrame1.Name = Compkiller:_RandomString()
	LineFrame1.Parent = TabFrame
	LineFrame1.AnchorPoint = Vector2.new(1, 0)
	LineFrame1.BackgroundColor3 = Compkiller.Colors.BGDBColor

	table.insert(Compkiller.Elements.BGDBColor,{
		Element = LineFrame1,
		Property = 'BackgroundColor3'
	});

	LineFrame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LineFrame1.BorderSizePixel = 0
	LineFrame1.Position = UDim2.new(1, -5, 0, 0)
	LineFrame1.Size = UDim2.new(0, 20, 1, 0)

	CompLogo.Name = Compkiller:_RandomString()
	CompLogo.Parent = TabFrame
	CompLogo.BackgroundTransparency = 1.000
	CompLogo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CompLogo.BorderSizePixel = 0
	CompLogo.Position = UDim2.new(0, 9, 0, 7)
	CompLogo.Size = UDim2.new(0, 45, 0, 45)
	CompLogo.Image = Config.Logo
	
	if Compkiller.CustomHighlightMode then
		CompLogo.ImageColor3 = Compkiller.Colors.Highlight;
		
		table.insert(Compkiller.Elements.Highlight , {
			Element = CompLogo,
			Property = 'ImageColor3'
		});
	end;
	
	WindowLabel.Name = Compkiller:_RandomString()
	WindowLabel.Parent = TabFrame
	WindowLabel.BackgroundTransparency = 1.000
	WindowLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WindowLabel.BorderSizePixel = 0
	WindowLabel.Position = UDim2.new(0, 60, 0, 17)
	WindowLabel.Size = UDim2.new(0, 200, 0, 25)
	WindowLabel.Font = Enum.Font.GothamBold
	WindowLabel.Text = Config.Name
	WindowLabel.TextColor3 = Compkiller.Colors.SwitchColor
	WindowLabel.TextSize = Config.TextSize
	WindowLabel.TextXAlignment = Enum.TextXAlignment.Left

	table.insert(Compkiller.Elements.SwitchColor , {
		Element = WindowLabel,
		Property = 'TextColor3'
	});

	TabButtons.Name = Compkiller:_RandomString()
	TabButtons.Parent = TabFrame
	TabButtons.BackgroundTransparency = 1.000
	TabButtons.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabButtons.BorderSizePixel = 0
	TabButtons.Position = UDim2.new(0, 0, 0, 60)
	TabButtons.Size = UDim2.new(1, -25, 1, -125)

	SelectionFrame.Name = Compkiller:_RandomString()
	SelectionFrame.Parent = TabButtons
	SelectionFrame.AnchorPoint = Vector2.new(1, 0)
	SelectionFrame.BackgroundColor3 = Compkiller.Colors.Highlight
	SelectionFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SelectionFrame.BorderSizePixel = 0
	SelectionFrame.Position = UDim2.new(1, 5, 0, 28)
	SelectionFrame.Size = UDim2.new(0, 8, 0, 27)

	table.insert(Compkiller.Elements.Highlight,{
		Element = SelectionFrame,
		Property = "BackgroundColor3"
	});

	UICorner_3.CornerRadius = UDim.new(1, 0)
	UICorner_3.Parent = SelectionFrame

	TabButtonScrollingFrame.Name = Compkiller:_RandomString()
	TabButtonScrollingFrame.Parent = TabButtons
	TabButtonScrollingFrame.Active = true
	TabButtonScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	TabButtonScrollingFrame.BackgroundTransparency = 1.000
	TabButtonScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabButtonScrollingFrame.BorderSizePixel = 0
	TabButtonScrollingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	TabButtonScrollingFrame.Size = UDim2.new(1, -5, 1, -5)
	TabButtonScrollingFrame.BottomImage = ""
	TabButtonScrollingFrame.ScrollBarThickness = 0
	TabButtonScrollingFrame.TopImage = ""

	UIListLayout.Parent = TabButtonScrollingFrame
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 4)

	Userinfo.Name = Compkiller:_RandomString()
	Userinfo.Parent = TabFrame
	Userinfo.AnchorPoint = Vector2.new(0, 1)
	Userinfo.BackgroundTransparency = 1.000
	Userinfo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Userinfo.BorderSizePixel = 0
	Userinfo.Position = UDim2.new(0, 0, 1, 0)
	Userinfo.Size = UDim2.new(1, -25, 0, 60)

	do
		local Highlight = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")

		Highlight.Name = Compkiller:_RandomString()
		Highlight.Parent = Userinfo
		Highlight.AnchorPoint = Vector2.new(0.5, 0)
		Highlight.BackgroundColor3 = Color3.fromRGB(161, 161, 161)
		Highlight.BackgroundTransparency = 1
		Highlight.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Highlight.BorderSizePixel = 0
		Highlight.Position = UDim2.new(0.5, 0, 0, 4)
		Highlight.Size = UDim2.new(1, -15, 1, -15)

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = Highlight

		Userinfo.MouseEnter:Connect(function()
			Compkiller:_Animation(Highlight,TweenInfo.new(0.2),{
				BackgroundTransparency = 0.925
			});
		end);

		Userinfo.MouseLeave:Connect(function()
			Compkiller:_Animation(Highlight,TweenInfo.new(0.2),{
				BackgroundTransparency = 1
			});
		end);

		Compkiller:_Input(Userinfo,function()
			if WindowArgs.UserSettings.Root then
				WindowArgs.UserSettings:Window(true);
			end;
		end);
	end;

	UserProfile.Name = Compkiller:_RandomString()
	UserProfile.Parent = Userinfo
	UserProfile.BackgroundTransparency = 1.000
	UserProfile.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UserProfile.BorderSizePixel = 0
	UserProfile.Position = UDim2.new(0, 13, 0, 9)
	UserProfile.Size = UDim2.new(0, 35, 0, 35)
	UserProfile.ZIndex = 2
	UserProfile.Image = Compkiller:CacheImage("rbxassetid://18518299306")

	UICorner_4.CornerRadius = UDim.new(1, 0)
	UICorner_4.Parent = UserProfile

	UserText.Name = Compkiller:_RandomString()
	UserText.Parent = Userinfo
	UserText.BackgroundTransparency = 1.000
	UserText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UserText.BorderSizePixel = 0
	UserText.Position = UDim2.new(0, 55, 0, 8)
	UserText.Size = UDim2.new(0, 200, 0, 20)
	UserText.ZIndex = 2
	UserText.Font = Enum.Font.GothamMedium
	UserText.Text = "Username"
	UserText.TextColor3 = Compkiller.Colors.SwitchColor
	UserText.TextSize = 13.000
	UserText.TextXAlignment = Enum.TextXAlignment.Left

	table.insert(Compkiller.Elements.SwitchColor , {
		Element = UserText,
		Property = 'TextColor3'
	});

	ExpireText.Name = Compkiller:_RandomString()
	ExpireText.Parent = Userinfo
	ExpireText.BackgroundTransparency = 1.000
	ExpireText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ExpireText.BorderSizePixel = 0
	ExpireText.Position = UDim2.new(0, 55, 0, 25)
	ExpireText.Size = UDim2.new(0, 200, 0, 20)
	ExpireText.ZIndex = 2
	ExpireText.Font = Enum.Font.GothamMedium
	ExpireText.Text = "0/0/0"
	ExpireText.TextColor3 = Compkiller.Colors.SwitchColor
	ExpireText.TextSize = 13.000
	ExpireText.TextTransparency = 0.500
	ExpireText.TextXAlignment = Enum.TextXAlignment.Left

	table.insert(Compkiller.Elements.SwitchColor , {
		Element = ExpireText,
		Property = 'TextColor3'
	});

	TabMainFrame.Name = Compkiller:_RandomString()
	TabMainFrame.Parent = MainFrame
	TabMainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	TabMainFrame.BackgroundTransparency = 1.000
	TabMainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabMainFrame.BorderSizePixel = 0
	TabMainFrame.ClipsDescendants = true
	TabMainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	TabMainFrame.Size = UDim2.new(1, 0, 1, 0)
	TabMainFrame.ZIndex = 5

	if Compkiller:_IsMobile() then
		Compkiller:_AddDragBlacklist(TabButtons);
	end;

	WindowOpen:Connect(function(v)
		if WindowArgs.PerformanceMode then
			MainFrame.BackgroundTransparency = (v and 0) or 1;
			return;	
		end;

		if v then
			Compkiller:_Animation(MainFrame,TweenInfo.new(0.2),{
				Size = Config.Scale
			})

			Compkiller:_Animation(TabButtonScrollingFrame,TweenInfo.new(0.35),{
				Position = UDim2.new(0.5, 0, 0.5, 0)
			})

			Compkiller:_Animation(CompLogo,TweenInfo.new(0.2),{
				ImageTransparency = 0
			})

			Compkiller:_Animation(WindowLabel,TweenInfo.new(0.2),{
				TextTransparency = 0
			})

			Compkiller:_Animation(UserProfile,TweenInfo.new(0.2),{
				ImageTransparency = 0
			})

			Compkiller:_Animation(UserText,TweenInfo.new(0.2),{
				TextTransparency = 0
			})

			Compkiller:_Animation(ExpireText,TweenInfo.new(0.2),{
				TextTransparency = 0.5
			})

			Compkiller:_Animation(MainFrame,TweenInfo.new(0.2),{
				BackgroundTransparency = 0
			})

			Compkiller:_Animation(LineFrame1,TweenInfo.new(0.3),{
				BackgroundTransparency = 0,
				Size = UDim2.new(0, 20, 1, 0)
			})

			Compkiller:_Animation(TabFrame,TweenInfo.new(0.2),{
				BackgroundTransparency = TabFrameBaseTrans
			})
		else
			Compkiller:_Animation(MainFrame,TweenInfo.new(0.2),{
				Size = UDim2.new(math.max(Config.Scale.X.Scale - 0.05,0) , Config.Scale.X.Offset - 10 , math.max(Config.Scale.Y.Scale - 0.05,0) , Config.Scale.Y.Offset - 10)
			})

			Compkiller:_Animation(TabButtonScrollingFrame,TweenInfo.new(0.35),{
				Position = UDim2.new(1.5, 100, 0.5, 0)
			})

			Compkiller:_Animation(LineFrame1,TweenInfo.new(0.1),{
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 1, 1, 0)
			})

			Compkiller:_Animation(CompLogo,TweenInfo.new(0.2),{
				ImageTransparency = 1
			})

			Compkiller:_Animation(WindowLabel,TweenInfo.new(0.2),{
				TextTransparency = 1
			})

			Compkiller:_Animation(UserProfile,TweenInfo.new(0.2),{
				ImageTransparency = 1
			})

			Compkiller:_Animation(UserText,TweenInfo.new(0.2),{
				TextTransparency = 1
			})

			Compkiller:_Animation(ExpireText,TweenInfo.new(0.2),{
				TextTransparency = 1
			})

			Compkiller:_Animation(MainFrame,TweenInfo.new(0.2),{
				BackgroundTransparency = 1
			})

			Compkiller:_Animation(TabFrame,TweenInfo.new(0.1),{
				BackgroundTransparency = 1
			})
		end;
	end);

	TabHover:Connect(function(value)
		local Style = TweenInfo.new(0.45,Enum.EasingStyle.Quint);

		if value then
			Compkiller:_Animation(TabFrame , Style , {
				Size = UDim2.new(0, 185,1, 0)
			});

			Compkiller:_Animation(WindowLabel , Style , {
				Position = UDim2.new(0, 60,0, 17),
				TextTransparency = 0
			});

			Compkiller:_Animation(UserText , Style , {
				Position = UDim2.new(0, 55,0, 8),
				TextTransparency = 0.1
			});

			Compkiller:_Animation(ExpireText , Style , {
				Position = UDim2.new(0, 55,0, 25),
				TextTransparency = 0.5
			});
		else
			Compkiller:_Animation(TabFrame , Style , {
				Size = UDim2.new(0, 85,1, 0)
			});

			Compkiller:_Animation(WindowLabel , Style , {
				Position = UDim2.new(0, 60 + 25,0, 17),
				TextTransparency = 1
			});

			Compkiller:_Animation(UserText , Style , {
				Position = UDim2.new(0, 55 + 25,0, 8),
				TextTransparency = 1
			});

			Compkiller:_Animation(ExpireText , Style , {
				Position = UDim2.new(0, 55 + 25,0, 25),
				TextTransparency = 1
			});
		end;
	end);

	WindowArgs.UserSettings = {};

	do
		local Signal = Compkiller.__SIGNAL(false);

		local UserSettings = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local SectionFrame = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local UIListLayout = Instance.new("UIListLayout")
		local Header = Instance.new("Frame")
		local HeaderText = Instance.new("TextLabel")
		local ImageLabel = Instance.new("ImageLabel")

		UserSettings.Name = Compkiller:_RandomString()
		UserSettings.Parent = CompKiller;
		UserSettings.BackgroundColor3 = Compkiller.Colors.BGDBColor;
		UserSettings.BackgroundTransparency = 1
		UserSettings.BorderColor3 = Color3.fromRGB(0, 0, 0)
		UserSettings.BorderSizePixel = 0
		UserSettings.Position = UDim2.new(0, 50, 0, 50)
		UserSettings.Size = UDim2.new(0, 235, 0, 300)
		UserSettings.ZIndex = 65;
		UserSettings.Visible = false;

		table.insert(Compkiller.Elements.BGDBColor,{
			Element = UserSettings,
			Property = 'BackgroundColor3'
		});

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = UserSettings

		SectionFrame.Name = Compkiller:_RandomString()
		SectionFrame.Parent = UserSettings
		SectionFrame.BackgroundColor3 = Compkiller.Colors.BGDBColor;
		SectionFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SectionFrame.BorderSizePixel = 0
		SectionFrame.Position = UDim2.new(0, 0, 0, 45)
		SectionFrame.Size = UDim2.new(1, 0, 1, -45)
		SectionFrame.ZIndex = 66

		table.insert(Compkiller.Elements.BGDBColor,{
			Element = SectionFrame,
			Property = 'BackgroundColor3'
		});

		UICorner_2.CornerRadius = UDim.new(0, 4)
		UICorner_2.Parent = SectionFrame

		UIListLayout.Parent = SectionFrame
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 5)

		Header.Name = Compkiller:_RandomString()
		Header.Parent = UserSettings
		Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Header.BackgroundTransparency = 1.000
		Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Header.BorderSizePixel = 0
		Header.Size = UDim2.new(1, 0, 0, 45)
		Header.ZIndex = 66

		HeaderText.Name = Compkiller:_RandomString()
		HeaderText.Parent = Header
		HeaderText.AnchorPoint = Vector2.new(0.5, 0.5)
		HeaderText.BackgroundTransparency = 1.000
		HeaderText.BorderColor3 = Color3.fromRGB(0, 0, 0)
		HeaderText.BorderSizePixel = 0
		HeaderText.Position = UDim2.new(0.5, 0, 0.5, 0)
		HeaderText.Size = UDim2.new(0, 200, 0, 25)
		HeaderText.ZIndex = 67
		HeaderText.Font = Enum.Font.GothamMedium
		HeaderText.Text = "User Settings"
		HeaderText.TextColor3 = Color3.fromRGB(255, 255, 255)
		HeaderText.TextSize = 15.000

		table.insert(Compkiller.Elements.SwitchColor,{
			Element = HeaderText,
			Property = 'TextColor3'
		});

		ImageLabel.Parent = Header
		ImageLabel.AnchorPoint = Vector2.new(1, 0)
		ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ImageLabel.BackgroundTransparency = 1.000
		ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel.BorderSizePixel = 0
		ImageLabel.Position = UDim2.new(1, -5, 0, 5)
		ImageLabel.Size = UDim2.new(0, 15, 0, 15)
		ImageLabel.ZIndex = 67
		ImageLabel.Image = Compkiller:CacheImage("rbxassetid://10747384394")
		ImageLabel.ImageTransparency = 0.500

		function WindowArgs.UserSettings:Create()

			WindowArgs.UserSettings.Root = UserSettings;
			WindowArgs.UserSettings.Signal = Signal;
			WindowArgs.UserSettings.Signal = Compkiller:_Blur(UserSettings,Signal);

			Compkiller:Drag(UserSettings , UserSettings, 0.15);

			UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
				Compkiller:_Animation(UserSettings,TweenInfo.new(0.2),{
					Size = UDim2.new(0, 235, 0, UIListLayout.AbsoluteContentSize.Y + 50)
				})
			end);

			UserSettings:GetPropertyChangedSignal('BackgroundTransparency'):Connect(function()
				if UserSettings.BackgroundTransparency < 1 then
					UserSettings.Visible = true;
				else
					UserSettings.Visible = false;
				end;
			end);

			function WindowArgs.UserSettings:Window(Value)
				if Value then
					Signal:Fire(true);

					Compkiller:_Animation(UserSettings,TweenInfo.new(0.2),{
						BackgroundTransparency = 0.250,
					});

					Compkiller:_Animation(SectionFrame,TweenInfo.new(0.2),{
						BackgroundTransparency = 0,
					});

					Compkiller:_Animation(HeaderText,TweenInfo.new(0.2),{
						TextTransparency = 0,
					});

					Compkiller:_Animation(ImageLabel,TweenInfo.new(0.2),{
						ImageTransparency = 0.5,
					});
				else
					Signal:Fire(false);

					Compkiller:_Animation(UserSettings,TweenInfo.new(0.2),{
						BackgroundTransparency = 1,
					});

					Compkiller:_Animation(SectionFrame,TweenInfo.new(0.2),{
						BackgroundTransparency = 1,
					});

					Compkiller:_Animation(HeaderText,TweenInfo.new(0.2),{
						TextTransparency = 1,
					});

					Compkiller:_Animation(ImageLabel,TweenInfo.new(0.2),{
						ImageTransparency = 1,
					});
				end;
			end;

			Compkiller:_Input(ImageLabel,function()
				WindowArgs.UserSettings:Window(false);
			end);

			WindowArgs.UserSettings:Window(false);

			return Compkiller:_LoadElement(SectionFrame , true , Signal);
		end;
	end;

	function WindowArgs:SetVisible(bool: boolean)
		CompKiller.Enabled = bool;
	end;

	function WindowArgs:DrawCategory(config : Category)
		config = config or {};
		config.Name = config.Name or "Category";

		local Category = Instance.new("Frame")
		local CategoryText = Instance.new("TextLabel")
		local Frame = Instance.new("Frame")
		local UIGradient = Instance.new("UIGradient")

		Category.Name = Compkiller:_RandomString()
		Category.Parent = TabButtonScrollingFrame
		Category.BackgroundTransparency = 1.000
		Category.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Category.BorderSizePixel = 0
		Category.ClipsDescendants = true
		Category.Size = UDim2.new(1, -10, 0, 22)

		if Compkiller:_IsMobile() then
			Compkiller:_AddDragBlacklist(Category);
		end;

		CategoryText.Name = Compkiller:_RandomString()
		CategoryText.Parent = Category
		CategoryText.BackgroundTransparency = 1.000
		CategoryText.BorderColor3 = Color3.fromRGB(0, 0, 0)
		CategoryText.BorderSizePixel = 0
		CategoryText.Position = UDim2.new(0, 5, 0, 8)
		CategoryText.Size = UDim2.new(1, 200, 0, 10)
		CategoryText.Font = Enum.Font.Gotham
		CategoryText.Text = config.Name
		CategoryText.TextColor3 = Compkiller.Colors.SwitchColor
		CategoryText.TextSize = 16.000
		CategoryText.TextTransparency = 0.500
		CategoryText.TextXAlignment = Enum.TextXAlignment.Left

		table.insert(Compkiller.Elements.SwitchColor , {
			Element = CategoryText,
			Property = 'TextColor3'
		});

		Frame.Parent = Category
		Frame.AnchorPoint = Vector2.new(0.5, 1)
		Frame.BackgroundColor3 = Compkiller.Colors.Highlight
		Frame.BackgroundTransparency = 0.750
		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0.5, 0, 1, 0)
		Frame.Size = UDim2.new(1, 0, 0, 1)

		table.insert(Compkiller.Elements.Highlight,{
			Element = Frame,
			Property = "BackgroundColor3"
		});

		UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.05, 0.21), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(0.96, 0.17), NumberSequenceKeypoint.new(1.00, 1.00)}
		UIGradient.Parent = Frame

		local Tween = TweenInfo.new(0.35,Enum.EasingStyle.Quint);

		TabHover:Connect(function(bool)
			if bool then
				Compkiller:_Animation(CategoryText,Tween,{
					TextTransparency = 0.500
				});

				Compkiller:_Animation(Frame,Tween,{
					BackgroundTransparency = 0.750
				});
			else
				Compkiller:_Animation(CategoryText,Tween,{
					TextTransparency = 1
				});

				Compkiller:_Animation(Frame,Tween,{
					BackgroundTransparency = 1
				});
			end;
		end);
	end;

	function WindowArgs:DrawContainerTab(TabConfig : ContainerTab)
		TabConfig = Compkiller.__CONFIG(TabConfig,{
			Name = "Tab",
			Icon = "eye",
		});

		local Tween = TweenInfo.new(0.35,Enum.EasingStyle.Quint);
		local TabOpenSignal = Compkiller.__SIGNAL(false);

		local TabArgs = {
			__Current = nil,
			Tabs = {}
		};

		-- Creating Button --

		local TabButton = Instance.new("Frame")
		local Icon = Instance.new("ImageLabel")
		local TabNameLabel = Instance.new("TextLabel")
		local Highlight = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")

		TabButton.Name = Compkiller:_RandomString()
		TabButton.Parent = TabButtonScrollingFrame
		TabButton.BackgroundTransparency = 1.000
		TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabButton.BorderSizePixel = 0
		TabButton.ClipsDescendants = true
		TabButton.Size = UDim2.new(1, -10, 0, 32)
		TabButton.ZIndex = 3

		if Compkiller:_IsMobile() then
			Compkiller:_AddDragBlacklist(TabButton);
		end;

		Icon.Name = Compkiller:_RandomString()
		Icon.Parent = TabButton
		Icon.AnchorPoint = Vector2.new(0, 0.5)
		Icon.BackgroundColor3 = Compkiller.Colors.Highlight
		Icon.BackgroundTransparency = 1.000
		Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon.BorderSizePixel = 0
		Icon.Position = UDim2.new(0, 15, 0.5, 0)
		Icon.Size = UDim2.new(0, 15, 0, 15)
		Icon.ZIndex = 3
		Icon.Image = Compkiller:_GetIcon(TabConfig.Icon);
		Icon.ImageColor3 = Compkiller.Colors.Highlight

		table.insert(Compkiller.Elements.Highlight,{
			Element = Icon,
			Property = "ImageColor3"
		});

		TabNameLabel.Name = Compkiller:_RandomString()
		TabNameLabel.Parent = TabButton
		TabNameLabel.AnchorPoint = Vector2.new(0, 0.5)
		TabNameLabel.BackgroundTransparency = 1.000
		TabNameLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabNameLabel.BorderSizePixel = 0
		TabNameLabel.Position = UDim2.new(0, 43, 0.5, 0)
		TabNameLabel.Size = UDim2.new(0, 200, 0, 25)
		TabNameLabel.ZIndex = 3
		TabNameLabel.Font = Enum.Font.GothamMedium
		TabNameLabel.Text = TabConfig.Name;
		TabNameLabel.TextColor3 = Compkiller.Colors.SwitchColor
		TabNameLabel.TextSize = 15.000
		TabNameLabel.TextXAlignment = Enum.TextXAlignment.Left

		table.insert(Compkiller.Elements.SwitchColor , {
			Element = TabNameLabel,
			Property = 'TextColor3'
		});

		Highlight.Name = Compkiller:_RandomString()
		Highlight.Parent = TabButton
		Highlight.AnchorPoint = Vector2.new(0.5, 0.5)
		Highlight.BackgroundColor3 = Color3.fromRGB(161, 161, 161)
		Highlight.BackgroundTransparency = 0.925
		Highlight.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Highlight.BorderSizePixel = 0
		Highlight.Position = UDim2.new(0.5, 0, 0.5, 0)
		Highlight.Size = UDim2.new(1, -17, 1, 0)
		Highlight.ZIndex = 2

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = Highlight

		-- Creating Container --

		local ContainerTab = Instance.new("Frame")
		local MainFrame = Instance.new("Frame")
		local Top = Instance.new("Frame")
		local UIListLayout = Instance.new("UIListLayout")

		ContainerTab.Name = Compkiller:_RandomString()
		ContainerTab.Parent = TabMainFrame
		ContainerTab.AnchorPoint = Vector2.new(0.5, 0.5)
		ContainerTab.BackgroundTransparency = 1.000
		ContainerTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ContainerTab.BorderSizePixel = 0
		ContainerTab.Position = UDim2.new(0.5, 0, 0.5, 0)
		ContainerTab.Size = UDim2.new(1, -15, 1, -15)
		ContainerTab.ZIndex = 6

		MainFrame.Name = Compkiller:_RandomString()
		MainFrame.Parent = ContainerTab
		MainFrame.AnchorPoint = Vector2.new(0.5, 1)
		MainFrame.BackgroundTransparency = 1.000
		MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		MainFrame.BorderSizePixel = 0
		MainFrame.Position = UDim2.new(0.5, 0, 1, -5)
		MainFrame.Size = UDim2.new(1, 0, 1, -35)
		MainFrame.ZIndex = 6
		MainFrame.ClipsDescendants = true

		Top.Name = Compkiller:_RandomString()
		Top.Parent = ContainerTab
		Top.BackgroundTransparency = 1.000
		Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Top.BorderSizePixel = 0
		Top.Size = UDim2.new(1, 0, 0, 25)
		Top.ZIndex = 7

		UIListLayout.Parent = Top
		UIListLayout.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		UIListLayout.Padding = UDim.new(0, 10)

		-- Functions --
		Highlight:GetPropertyChangedSignal('BackgroundTransparency'):Connect(function()
			if Highlight.BackgroundTransparency <= 0.99 then
				ContainerTab.Visible = true;
			else
				ContainerTab.Visible = false;
			end;

			if Compkiller.PerformanceMode then
				if ContainerTab.Visible then
					Compkiller:_SetNilP(ContainerTab , TabMainFrame);
				else
					Compkiller:_SetNilP(ContainerTab , nil);
				end;
			else
				Compkiller:_SetNilP(ContainerTab , TabMainFrame);
			end;
		end);

		local TabOpen = function(bool)
			if bool then
				WindowArgs.SelectedTab = TabButton;

				Compkiller:_Animation(Icon,Tween,{
					ImageTransparency = 0,
				});

				Compkiller:_Animation(TabNameLabel,Tween,{
					TextTransparency = 0
				});

				Compkiller:_Animation(Highlight,Tween,{
					BackgroundTransparency = 0.925
				});

				for i,v in next , TabArgs.Tabs do
					if v.Root == TabArgs.__Current.Root then
						v.Remote:Fire(true);
					end;
				end;
			else
				Compkiller:_Animation(Icon,Tween,{
					ImageTransparency = 0.5
				});

				Compkiller:_Animation(TabNameLabel,Tween,{
					TextTransparency = 0.5
				});

				Compkiller:_Animation(Highlight,Tween,{
					BackgroundTransparency = 1
				});

				for i,v in next , TabArgs.Tabs do
					v.Remote:Fire(false);
				end;
			end;
		end;

		if not WindowArgs.Tabs[1] then
			TabOpenSignal:Fire(true);
			TabOpen(true);
		else
			TabOpen(false);
		end;

		table.insert(WindowArgs.Tabs , {
			Root = TabButton,
			Remote = TabOpenSignal
		});

		Compkiller:_Hover(TabButton,function()
			if WindowArgs.SelectedTab ~= TabButton then
				Compkiller:_Animation(Icon,Tween,{
					ImageTransparency = 0.1
				});

				Compkiller:_Animation(TabNameLabel,Tween,{
					TextTransparency = 0.1
				});
			end;
		end , function()
			if WindowArgs.SelectedTab ~= TabButton then
				Compkiller:_Animation(Icon,Tween,{
					ImageTransparency = 0.5
				});

				Compkiller:_Animation(TabNameLabel,Tween,{
					TextTransparency = 0.5
				});
			end;
		end)

		TabOpenSignal:Connect(TabOpen);

		TabHover:Connect(function(bool)
			if bool then
				Compkiller:_Animation(TabButton,Tween,{
					Size = UDim2.new(1, -10, 0, 32)
				});

				Compkiller:_Animation(Icon,Tween,{
					Size = UDim2.new(0, 16, 0, 16),
				});

				Compkiller:_Animation(TabNameLabel,Tween,{
					Size = UDim2.new(0, 200, 0, 25),
					Position = UDim2.new(0, 43, 0.5, 0)
				});

				Compkiller:_Animation(UICorner,Tween,{
					CornerRadius = UDim.new(0, 4)
				});

				Compkiller:_Animation(Highlight,Tween,{
					Size = UDim2.new(1, -17, 1, 0),
					Position = UDim2.new(0.5, 0, 0.5, 0)
				});
			else
				Compkiller:_Animation(UICorner,Tween,{
					CornerRadius = UDim.new(0, 10)
				});

				Compkiller:_Animation(TabButton,Tween,{
					Size = UDim2.new(1, -10, 0, 32)
				});

				Compkiller:_Animation(Icon,Tween,{
					Size = UDim2.new(0, 16, 0, 16),
				});

				Compkiller:_Animation(TabNameLabel,Tween,{
					Size = UDim2.new(0, 200, 0, 25),
					Position = UDim2.new(0, 80, 0.5, 0)
				});

				Compkiller:_Animation(Highlight,Tween,{
					Size = UDim2.new(1, -10,1, 5),
					Position = UDim2.new(0.5, 0, 0.5, 0)
				});
			end;
		end);

		Compkiller:_Input(TabButton,function()
			for i,v in next, WindowArgs.Tabs do
				if v.Root == TabButton then
					v.Remote:Fire(true);
				else
					v.Remote:Fire(false);
				end;
			end;
		end);

		function TabArgs:DrawTab(TabConfig : TabConfig) -- Internal Tab
			TabConfig = Compkiller.__CONFIG(TabConfig,{
				Name = "Tab",
				Type = "Double",
				EnableScrolling = false,
			});

			local InternalSignal = Compkiller.__SIGNAL(false);
			local Frame = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")
			local Highlight = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local TextLabel = Instance.new("TextLabel")

			Frame.Parent = Top
			Frame.BackgroundColor3 = Compkiller.Colors.BlockColor

			table.insert(Compkiller.Elements.BlockColor , {
				Element = Frame,
				Property = "BackgroundColor3"
			});

			Frame.BackgroundTransparency = 1.000
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.ClipsDescendants = true
			Frame.Size = UDim2.new(0, 75, 0, 26)
			Frame.ZIndex = 10

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Frame

			UIStroke.Transparency = 1.000
			UIStroke.Color = Compkiller.Colors.StrokeColor
			UIStroke.Parent = Frame

			table.insert(Compkiller.Elements.StrokeColor,{
				Element = UIStroke,
				Property = "Color"
			});

			Highlight.Name = Compkiller:_RandomString()
			Highlight.Parent = Frame
			Highlight.AnchorPoint = Vector2.new(1, 0.5)
			Highlight.BackgroundColor3 = Compkiller.Colors.Highlight
			Highlight.BackgroundTransparency = 1.000
			Highlight.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Highlight.BorderSizePixel = 0
			Highlight.Position = UDim2.new(0, 3, 0.5, 0)
			Highlight.Size = UDim2.new(0, 5, 0, 10)
			Highlight.ZIndex = 11

			table.insert(Compkiller.Elements.Highlight,{
				Element = Highlight,
				Property = "BackgroundColor3"
			});

			UICorner_2.CornerRadius = UDim.new(1, 0)
			UICorner_2.Parent = Highlight

			TextLabel.Parent = Frame
			TextLabel.AnchorPoint = Vector2.new(0, 0.5)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0, 10, 0.5, 0)
			TextLabel.Size = UDim2.new(0, 200, 0, 20)
			TextLabel.ZIndex = 12
			TextLabel.Font = Enum.Font.GothamMedium
			TextLabel.Text = TabConfig.Name
			TextLabel.TextColor3 = Compkiller.Colors.SwitchColor
			TextLabel.TextSize = 13.000
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			table.insert(Compkiller.Elements.SwitchColor , {
				Element = TextLabel,
				Property = 'TextColor3'
			});

			local UpdateScale = function()
				local scale = TextService:GetTextSize(TextLabel.Text,TextLabel.TextSize,TextLabel.Font,Vector2.new(math.huge,math.huge));

				Frame.Size = UDim2.new(0, scale.X + 19, 0, 26)
			end;

			UpdateScale()

			local ToggleUI = function(bool)

				UpdateScale();

				if bool then

					Compkiller:_Animation(Highlight,TweenInfo.new(0.2),{
						BackgroundTransparency = 0,
						Size = UDim2.new(0, 5, 0, 10)
					})

					Compkiller:_Animation(Frame,TweenInfo.new(0.2),{
						BackgroundTransparency = 0
					})

					Compkiller:_Animation(UIStroke,TweenInfo.new(0.2),{
						Transparency = 0
					})

					Compkiller:_Animation(TextLabel,TweenInfo.new(0.2),{
						TextTransparency = 0
					})
				else

					Compkiller:_Animation(Highlight,TweenInfo.new(0.2),{
						BackgroundTransparency = 1,
						Size = UDim2.new(0, 5, 0, 2)
					})

					Compkiller:_Animation(Frame,TweenInfo.new(0.2),{
						BackgroundTransparency = 1
					})

					Compkiller:_Animation(UIStroke,TweenInfo.new(0.2),{
						Transparency = 1
					})

					Compkiller:_Animation(TextLabel,TweenInfo.new(0.2),{
						TextTransparency = 0.5
					})
				end;
			end;


			local Id = {
				Root = Frame,
				Remote = InternalSignal
			};

			InternalSignal:Connect(ToggleUI)


			if not TabArgs.Tabs[1] then
				TabArgs.__Current = Id;

				InternalSignal:Fire(true)
			end;

			table.insert(TabArgs.Tabs,Id)

			Compkiller:_Input(Frame,function()
				for i,v in next , TabArgs.Tabs do
					if v.Root == Frame then
						TabArgs.__Current = v;

						v.Remote:Fire(true);
					else
						v.Remote:Fire(false);
					end;
				end;
			end);

			return WindowArgs:DrawTab(TabConfig , {
				ID = Id,
				Highlight = Highlight,
				Signal = InternalSignal,
				Parent = MainFrame
			});
		end;

		return TabArgs;
	end;

	function WindowArgs:AddUnbind(UilistLayout: UIListLayout , Scrolling)

		local upd = function()
			Scrolling.ScrollingEnabled = true
			UilistLayout.VerticalFlex = Enum.UIFlexAlignment.None;
			Scrolling.CanvasSize = UDim2.fromOffset(0,UilistLayout.AbsoluteContentSize.Y + 5)
		end;

		UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(upd);

		return task.defer(function()
			while true do task.wait(1)
				upd();
			end;
		end)

		--[[local Parent: ScrollingFrame = UilistLayout.Parent;

		Parent = Parent or Scrolling;

		local Detection = function()
			local Target = (UilistLayout.AbsoluteContentSize.Y);

			for i,v in next , Parent:GetChildren() do task.wait(0.1)
				local UIList = v:FindFirstChildWhichIsA('UIListLayout');
				if v:IsA('Frame') and UIList then
					if (UIList.AbsoluteContentSize.Y >= Target) or (v.AbsoluteSize.Y >= Target) or (UilistLayout.AbsoluteContentSize.Y > Parent.AbsoluteSize.Y) then
						UilistLayout.VerticalFlex = Enum.UIFlexAlignment.None;
						Parent.ScrollingEnabled = true;
					else
						Parent.ScrollingEnabled = false;
						UilistLayout.VerticalFlex = Enum.UIFlexAlignment.None;
					end;
				end
			end;
		end;

		local Executable = function()
			while true do task.wait(0.15);
				pcall(Detection);
			end;
		end;

		table.insert(WindowArgs.THREADS,task.spawn(Executable))]]
	end;

	function WindowArgs:DrawConfig(Configuration : TabConfigManager , Internal)
		Configuration = Compkiller.__CONFIG(Configuration,{
			Name = "Config",
			Icon = "folder",
			Config = nil
		});

		local TabOpenSignal = Compkiller.__SIGNAL(false);
		local TabArgs = {};

		-- Button --
		local TabButton = Instance.new("Frame")
		local Icon = Instance.new("ImageLabel")
		local TabNameLabel = Instance.new("TextLabel")
		local Highlight = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")

		if Compkiller:_IsMobile() then
			Compkiller:_AddDragBlacklist(TabButton);
		end;

		TabButton.Name = Compkiller:_RandomString()
		TabButton.Parent = TabButtonScrollingFrame
		TabButton.BackgroundTransparency = 1.000
		TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabButton.BorderSizePixel = 0
		TabButton.ClipsDescendants = true
		TabButton.Size = UDim2.new(1, -10, 0, 32)
		TabButton.ZIndex = 3

		Icon.Name = Compkiller:_RandomString()
		Icon.Parent = TabButton
		Icon.AnchorPoint = Vector2.new(0, 0.5)
		Icon.BackgroundColor3 = Compkiller.Colors.Highlight
		Icon.BackgroundTransparency = 1.000
		Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon.BorderSizePixel = 0
		Icon.Position = UDim2.new(0, 15, 0.5, 0)
		Icon.Size = UDim2.new(0, 15, 0, 15)
		Icon.ZIndex = 3
		Icon.Image = Compkiller:_GetIcon(Configuration.Icon);
		Icon.ImageColor3 = Compkiller.Colors.Highlight

		table.insert(Compkiller.Elements.Highlight,{
			Element = Icon,
			Property = "ImageColor3"
		});

		TabNameLabel.Name = Compkiller:_RandomString()
		TabNameLabel.Parent = TabButton
		TabNameLabel.AnchorPoint = Vector2.new(0, 0.5)
		TabNameLabel.BackgroundTransparency = 1.000
		TabNameLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabNameLabel.BorderSizePixel = 0
		TabNameLabel.Position = UDim2.new(0, 43, 0.5, 0)
		TabNameLabel.Size = UDim2.new(0, 200, 0, 25)
		TabNameLabel.ZIndex = 3
		TabNameLabel.Font = Enum.Font.GothamMedium
		TabNameLabel.Text = Configuration.Name;
		TabNameLabel.TextColor3 = Compkiller.Colors.SwitchColor
		TabNameLabel.TextSize = 15.000
		TabNameLabel.TextXAlignment = Enum.TextXAlignment.Left

		table.insert(Compkiller.Elements.SwitchColor , {
			Element = TabNameLabel,
			Property = 'TextColor3'
		});

		Highlight.Name = Compkiller:_RandomString()
		Highlight.Parent = TabButton
		Highlight.AnchorPoint = Vector2.new(0.5, 0.5)
		Highlight.BackgroundColor3 = Color3.fromRGB(161, 161, 161)
		Highlight.BackgroundTransparency = 0.925
		Highlight.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Highlight.BorderSizePixel = 0
		Highlight.Position = UDim2.new(0.5, 0, 0.5, 0)
		Highlight.Size = UDim2.new(1, -17, 1, 0)
		Highlight.ZIndex = 2

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = Highlight

		local TabConfig = Instance.new("Frame")
		local ConfigList = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local Header = Instance.new("Frame")
		local SectionText = Instance.new("TextLabel")
		local SectionClose = Instance.new("ImageLabel")
		local ScrollingFrame = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		local Space = Instance.new("Frame")
		local AddConfig = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local UIStroke_2 = Instance.new("UIStroke")
		local Header_2 = Instance.new("Frame")
		local SectionText_2 = Instance.new("TextLabel")
		local SectionClose_2 = Instance.new("ImageLabel")
		local Frame = Instance.new("Frame")
		local UIStroke_3 = Instance.new("UIStroke")
		local UICorner_3 = Instance.new("UICorner")
		local TextBox = Instance.new("TextBox")
		local Button = Instance.new("Frame")
		local BlockLine = Instance.new("Frame")
		local Frame_2 = Instance.new("Frame")
		local UIStroke_4 = Instance.new("UIStroke")
		local UICorner_4 = Instance.new("UICorner")
		local TextLabel = Instance.new("TextLabel")

		TabConfig.Name = Compkiller:_RandomString()
		TabConfig.Parent = TabMainFrame
		TabConfig.AnchorPoint = Vector2.new(0.5, 0.5)
		TabConfig.BackgroundTransparency = 1.000
		TabConfig.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabConfig.BorderSizePixel = 0
		TabConfig.Position = UDim2.new(0.5, 0, 0.5, 0)
		TabConfig.Size = UDim2.new(1, 0, 1, 0)
		TabConfig.ZIndex = 6

		ConfigList.Name = Compkiller:_RandomString()
		ConfigList.Parent = TabConfig
		ConfigList.AnchorPoint = Vector2.new(0.5, 0)
		ConfigList.BackgroundColor3 = Compkiller.Colors.BlockColor

		table.insert(Compkiller.Elements.BlockColor , {
			Element = ConfigList,
			Property = "BackgroundColor3"
		});

		ConfigList.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ConfigList.BorderSizePixel = 0
		ConfigList.Position = UDim2.new(0.5, 0, 0, 5)
		ConfigList.Size = UDim2.new(1, -10, 1, -110)
		ConfigList.ZIndex = 9

		UICorner.CornerRadius = UDim.new(0, 6)
		UICorner.Parent = ConfigList

		UIStroke.Color = Compkiller.Colors.StrokeColor
		UIStroke.Parent = ConfigList

		table.insert(Compkiller.Elements.StrokeColor,{
			Element = UIStroke,
			Property = "Color"
		});

		Header.Name = Compkiller:_RandomString()
		Header.Parent = ConfigList
		Header.BackgroundTransparency = 1.000
		Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Header.BorderSizePixel = 0
		Header.Size = UDim2.new(1, 0, 0, 35)
		Header.ZIndex = 9

		SectionText.Name = Compkiller:_RandomString()
		SectionText.Parent = Header
		SectionText.AnchorPoint = Vector2.new(0, 0.5)
		SectionText.BackgroundTransparency = 1.000
		SectionText.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SectionText.BorderSizePixel = 0
		SectionText.Position = UDim2.new(0, 12, 0.5, 0)
		SectionText.Size = UDim2.new(0, 200, 0, 25)
		SectionText.ZIndex = 10
		SectionText.Font = Enum.Font.GothamMedium
		SectionText.Text = "Config List"
		SectionText.TextColor3 = Compkiller.Colors.SwitchColor
		SectionText.TextSize = 14.000
		SectionText.TextTransparency = 0.500
		SectionText.TextXAlignment = Enum.TextXAlignment.Left

		table.insert(Compkiller.Elements.SwitchColor , {
			Element = SectionText,
			Property = 'TextColor3'
		});

		SectionClose.Name = Compkiller:_RandomString()
		SectionClose.Parent = Header
		SectionClose.AnchorPoint = Vector2.new(1, 0.5)
		SectionClose.BackgroundTransparency = 1.000
		SectionClose.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SectionClose.BorderSizePixel = 0
		SectionClose.Position = UDim2.new(1, -12, 0.5, 0)
		SectionClose.Size = UDim2.new(0, 17, 0, 17)
		SectionClose.ZIndex = 10
		SectionClose.Image = Compkiller:CacheImage("rbxassetid://109535175596957")
		SectionClose.ImageTransparency = 0.500


		ScrollingFrame.Parent = ConfigList
		ScrollingFrame.Active = true
		ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0)
		ScrollingFrame.BackgroundTransparency = 1.000
		ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ScrollingFrame.BorderSizePixel = 0
		ScrollingFrame.Position = UDim2.new(0.5, 0, 0, 35)
		ScrollingFrame.Size = UDim2.new(1, -10, 1, -45)
		ScrollingFrame.ZIndex = 12
		ScrollingFrame.ScrollBarThickness = 0

		UIListLayout.Parent = ScrollingFrame
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 7)

		Space.Name = Compkiller:_RandomString()
		Space.Parent = ScrollingFrame
		Space.BackgroundTransparency = 1.000
		Space.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Space.BorderSizePixel = 0

		AddConfig.Name = Compkiller:_RandomString()
		AddConfig.Parent = TabConfig
		AddConfig.AnchorPoint = Vector2.new(0.5, 1)
		AddConfig.BackgroundColor3 = Compkiller.Colors.BlockColor

		table.insert(Compkiller.Elements.BlockColor , {
			Element = AddConfig,
			Property = "BackgroundColor3"
		});

		AddConfig.BorderColor3 = Color3.fromRGB(0, 0, 0)
		AddConfig.BorderSizePixel = 0
		AddConfig.Position = UDim2.new(0.5, 0, 1, -5)
		AddConfig.Size = UDim2.new(1, -10, 0, 95)
		AddConfig.ZIndex = 9

		UICorner_2.CornerRadius = UDim.new(0, 6)
		UICorner_2.Parent = AddConfig

		UIStroke_2.Color = Compkiller.Colors.StrokeColor
		UIStroke_2.Parent = AddConfig

		table.insert(Compkiller.Elements.StrokeColor,{
			Element = UIStroke_2,
			Property = "Color"
		});

		Header_2.Name = Compkiller:_RandomString()
		Header_2.Parent = AddConfig
		Header_2.BackgroundTransparency = 1.000
		Header_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Header_2.BorderSizePixel = 0
		Header_2.Size = UDim2.new(1, 0, 0, 35)
		Header_2.ZIndex = 9

		SectionText_2.Name = Compkiller:_RandomString()
		SectionText_2.Parent = Header_2
		SectionText_2.AnchorPoint = Vector2.new(0, 0.5)
		SectionText_2.BackgroundTransparency = 1.000
		SectionText_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SectionText_2.BorderSizePixel = 0
		SectionText_2.Position = UDim2.new(0, 12, 0.5, 0)
		SectionText_2.Size = UDim2.new(0, 200, 0, 25)
		SectionText_2.ZIndex = 10
		SectionText_2.Font = Enum.Font.GothamMedium
		SectionText_2.Text = "Add Config"
		SectionText_2.TextColor3 = Compkiller.Colors.SwitchColor
		SectionText_2.TextSize = 14.000
		SectionText_2.TextTransparency = 0.500
		SectionText_2.TextXAlignment = Enum.TextXAlignment.Left

		table.insert(Compkiller.Elements.SwitchColor , {
			Element = SectionText_2,
			Property = 'TextColor3'
		});

		SectionClose_2.Name = Compkiller:_RandomString()
		SectionClose_2.Parent = Header_2
		SectionClose_2.AnchorPoint = Vector2.new(1, 0.5)
		SectionClose_2.BackgroundTransparency = 1.000
		SectionClose_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SectionClose_2.BorderSizePixel = 0
		SectionClose_2.Position = UDim2.new(1, -12, 0.5, 0)
		SectionClose_2.Size = UDim2.new(0, 17, 0, 17)
		SectionClose_2.ZIndex = 10
		SectionClose_2.Image = Compkiller:CacheImage("rbxassetid://109535175596957")
		SectionClose_2.ImageTransparency = 0.500

		Frame.Parent = AddConfig
		Frame.AnchorPoint = Vector2.new(0.5, 0)
		Frame.BackgroundColor3 = Compkiller.Colors.BlockColor

		table.insert(Compkiller.Elements.BlockColor , {
			Element = Frame,
			Property = "BackgroundColor3"
		});

		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0.5, 0, 0, 35)
		Frame.Size = UDim2.new(1, -20, 0, 20)
		Frame.ZIndex = 15

		UIStroke_3.Color = Compkiller.Colors.StrokeColor
		UIStroke_3.Parent = Frame

		table.insert(Compkiller.Elements.StrokeColor,{
			Element = UIStroke_3,
			Property = "Color"
		});

		UICorner_3.CornerRadius = UDim.new(0, 4)
		UICorner_3.Parent = Frame

		TextBox.Parent = Frame
		TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBox.BackgroundTransparency = 1.000
		TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextBox.BorderSizePixel = 0
		TextBox.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextBox.Size = UDim2.new(1, -15, 1, -2)
		TextBox.ZIndex = 15
		TextBox.ClearTextOnFocus = false
		TextBox.Font = Enum.Font.GothamMedium
		TextBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
		TextBox.PlaceholderText = "Config Name..."
		TextBox.Text = ""
		TextBox.TextColor3 = Compkiller.Colors.SwitchColor
		TextBox.TextSize = 12.000
		TextBox.TextXAlignment = Enum.TextXAlignment.Left

		table.insert(Compkiller.Elements.SwitchColor , {
			Element = TextBox,
			Property = 'TextColor3'
		});

		Button.Name = Compkiller:_RandomString()
		Button.Parent = AddConfig
		Button.AnchorPoint = Vector2.new(0.5, 1)
		Button.BackgroundColor3 = Compkiller.Colors.SwitchColor
		Button.BackgroundTransparency = 1.000
		Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Button.BorderSizePixel = 0
		Button.Position = UDim2.new(0.5, 0, 1, -10)
		Button.Size = UDim2.new(1, -7, 0, 25)
		Button.ZIndex = 10

		BlockLine.Name = Compkiller:_RandomString()
		BlockLine.Parent = AddConfig
		BlockLine.AnchorPoint = Vector2.new(0.5, 1)
		BlockLine.BackgroundColor3 = Compkiller.Colors.LineColor
		BlockLine.BackgroundTransparency = 0.500
		BlockLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BlockLine.BorderSizePixel = 0
		BlockLine.Position = UDim2.new(0.5, 0, 0.5, 12)
		BlockLine.Size = UDim2.new(1, -26, 0, 1)
		BlockLine.ZIndex = 12

		table.insert(Compkiller.Elements.LineColor,{
			Element = BlockLine,
			Property = "BackgroundColor3"
		});

		Frame_2.Parent = Button
		Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame_2.BackgroundColor3 = Compkiller.Colors.Highlight
		Frame_2.BackgroundTransparency = 0.100
		Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame_2.BorderSizePixel = 0
		Frame_2.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame_2.Size = UDim2.new(1, -15, 1, -5)
		Frame_2.ZIndex = 9

		table.insert(Compkiller.Elements.Highlight,{
			Element = Frame_2,
			Property = "BackgroundColor3"
		});

		UIStroke_4.Color = Compkiller.Colors.StrokeColor
		UIStroke_4.Parent = Frame_2

		table.insert(Compkiller.Elements.StrokeColor,{
			Element = UIStroke_4,
			Property = "Color"
		});

		UICorner_4.CornerRadius = UDim.new(0, 3)
		UICorner_4.Parent = Frame_2

		TextLabel.Parent = Frame_2
		TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextLabel.Size = UDim2.new(1, 0, 1, 0)
		TextLabel.ZIndex = 10
		TextLabel.Font = Enum.Font.GothamMedium
		TextLabel.Text = "Add Config"
		TextLabel.TextColor3 = Compkiller.Colors.SwitchColor
		TextLabel.TextSize = 12.000
		TextLabel.TextStrokeTransparency = 0.900

		table.insert(Compkiller.Elements.SwitchColor , {
			Element = TextLabel,
			Property = 'TextColor3'
		});

		local Tween = TweenInfo.new(0.35,Enum.EasingStyle.Quint);

		Highlight:GetPropertyChangedSignal('BackgroundTransparency'):Connect(function()
			if Highlight.BackgroundTransparency <= 0.99 then
				TabConfig.Visible = true;
			else
				TabConfig.Visible = false;
			end;

			if Compkiller.PerformanceMode then
				if TabConfig.Visible then
					Compkiller:_SetNilP(TabConfig , TabMainFrame);
				else
					Compkiller:_SetNilP(TabConfig , nil);
				end;
			else
				Compkiller:_SetNilP(TabConfig , TabMainFrame);
			end;

		end)

		local TabOpen = function(bool)
			if bool then

				WindowArgs.SelectedTab = TabButton;

				Compkiller:_Animation(Icon,Tween,{
					ImageTransparency = 0,
				});

				Compkiller:_Animation(TabNameLabel,Tween,{
					TextTransparency = 0
				});

				Compkiller:_Animation(Highlight,Tween,{
					BackgroundTransparency = 0.925
				});

				--

				Compkiller:_Animation(ConfigList,Tween,{
					BackgroundTransparency = 0,
				});

				Compkiller:_Animation(AddConfig,Tween,{
					BackgroundTransparency = 0,
				});

				Compkiller:_Animation(UIStroke_4,Tween,{
					Transparency = 0,
				});

				Compkiller:_Animation(UIStroke_3,Tween,{
					Transparency = 0,
				});

				Compkiller:_Animation(UIStroke_2,Tween,{
					Transparency = 0,
				});

				Compkiller:_Animation(UIStroke,Tween,{
					Transparency = 0,
				});

				Compkiller:_Animation(SectionText,Tween,{
					TextTransparency = 0.5
				});

				Compkiller:_Animation(TextLabel,Tween,{
					TextTransparency = 0,
					TextStrokeTransparency = 0.9
				});

				Compkiller:_Animation(Frame_2,Tween,{
					BackgroundTransparency = 0.1,
				});

				Compkiller:_Animation(BlockLine,Tween,{
					BackgroundTransparency = 0.5,
				});

				Compkiller:_Animation(Frame,Tween,{
					BackgroundTransparency = 0,
				});

				Compkiller:_Animation(SectionText_2,Tween,{
					TextTransparency = 0.5
				});

				Compkiller:_Animation(TextBox,Tween,{
					TextTransparency = 0
				});

				Compkiller:_Animation(SectionClose,Tween,{
					ImageTransparency = 0.5,
				});

				Compkiller:_Animation(SectionClose_2,Tween,{
					ImageTransparency = 0.5,
				});
			else

				Compkiller:_Animation(Icon,Tween,{
					ImageTransparency = 0.5
				});

				Compkiller:_Animation(TabNameLabel,Tween,{
					TextTransparency = 0.5
				});

				Compkiller:_Animation(Highlight,Tween,{
					BackgroundTransparency = 1
				});

				Compkiller:_Animation(ConfigList,Tween,{
					BackgroundTransparency = 1,
				});

				Compkiller:_Animation(AddConfig,Tween,{
					BackgroundTransparency = 1,
				});

				Compkiller:_Animation(UIStroke_4,Tween,{
					Transparency = 1,
				});

				Compkiller:_Animation(UIStroke_3,Tween,{
					Transparency = 1,
				});

				Compkiller:_Animation(UIStroke_2,Tween,{
					Transparency = 1,
				});

				Compkiller:_Animation(UIStroke,Tween,{
					Transparency = 1,
				});

				Compkiller:_Animation(SectionText,Tween,{
					TextTransparency = 1
				});

				Compkiller:_Animation(TextLabel,Tween,{
					TextTransparency = 1,
					TextStrokeTransparency = 1
				});

				Compkiller:_Animation(Frame_2,Tween,{
					BackgroundTransparency = 1,
				});

				Compkiller:_Animation(BlockLine,Tween,{
					BackgroundTransparency = 1,
				});

				Compkiller:_Animation(Frame,Tween,{
					BackgroundTransparency = 1,
				});

				Compkiller:_Animation(SectionText_2,Tween,{
					TextTransparency = 1
				});

				Compkiller:_Animation(TextBox,Tween,{
					TextTransparency = 1
				});

				Compkiller:_Animation(SectionClose,Tween,{
					ImageTransparency = 1,
				});

				Compkiller:_Animation(SectionClose_2,Tween,{
					ImageTransparency = 1,
				});
			end;
		end;

		if not WindowArgs.Tabs[1] then
			TabOpenSignal:Fire(true);
			TabOpen(true);
		else
			TabOpen(false);
		end;

		table.insert(WindowArgs.Tabs , {
			Root = TabButton,
			Remote = TabOpenSignal
		});

		Compkiller:_Hover(TabButton,function()
			if WindowArgs.SelectedTab ~= TabButton then
				Compkiller:_Animation(Icon,Tween,{
					ImageTransparency = 0.1
				});

				Compkiller:_Animation(TabNameLabel,Tween,{
					TextTransparency = 0.1
				});
			end;
		end , function()
			if WindowArgs.SelectedTab ~= TabButton then
				Compkiller:_Animation(Icon,Tween,{
					ImageTransparency = 0.5
				});

				Compkiller:_Animation(TabNameLabel,Tween,{
					TextTransparency = 0.5
				});
			end;
		end)

		TabOpenSignal:Connect(TabOpen);

		TabHover:Connect(function(bool)
			if bool then
				Compkiller:_Animation(TabButton,Tween,{
					Size = UDim2.new(1, -10, 0, 32)
				});

				Compkiller:_Animation(Icon,Tween,{
					Size = UDim2.new(0, 16, 0, 16),
				});

				Compkiller:_Animation(TabNameLabel,Tween,{
					Size = UDim2.new(0, 200, 0, 25),
					Position = UDim2.new(0, 43, 0.5, 0)
				});

				Compkiller:_Animation(UICorner,Tween,{
					CornerRadius = UDim.new(0, 4)
				});

				Compkiller:_Animation(Highlight,Tween,{
					Size = UDim2.new(1, -17, 1, 0),
					Position = UDim2.new(0.5, 0, 0.5, 0)
				});
			else
				Compkiller:_Animation(UICorner,Tween,{
					CornerRadius = UDim.new(0, 10)
				});

				Compkiller:_Animation(TabButton,Tween,{
					Size = UDim2.new(1, -10, 0, 32)
				});

				Compkiller:_Animation(Icon,Tween,{
					Size = UDim2.new(0, 16, 0, 16),
				});

				Compkiller:_Animation(TabNameLabel,Tween,{
					Size = UDim2.new(0, 200, 0, 25),
					Position = UDim2.new(0, 80, 0.5, 0)
				});

				Compkiller:_Animation(Highlight,Tween,{
					Size = UDim2.new(1, -10,1, 5),
					Position = UDim2.new(0.5, 0, 0.5, 0)
				});
			end;
		end);

		Compkiller:_Input(TabButton,function()
			for i,v in next, WindowArgs.Tabs do
				if v.Root == TabButton then
					v.Remote:Fire(true);
				else
					v.Remote:Fire(false);
				end;
			end;
		end);

		function TabArgs:_DrawConfig()
			local ConfigButton = {};

			local ConfigBlock = Instance.new("Frame")
			local ConfigText = Instance.new("TextLabel")
			local LinkValues = Instance.new("Frame")
			local UIListLayout = Instance.new("UIListLayout")
			local SaveButton = Instance.new("Frame")
			local Frame = Instance.new("Frame")
			local UIStroke = Instance.new("UIStroke")
			local UICorner = Instance.new("UICorner")
			local TextLabel = Instance.new("TextLabel")
			local Icon = Instance.new("ImageLabel")
			local LoadButton = Instance.new("Frame")
			local Frame_2 = Instance.new("Frame")
			local UIStroke_2 = Instance.new("UIStroke")
			local UICorner_2 = Instance.new("UICorner")
			local TextLabel_2 = Instance.new("TextLabel")
			local Icon_2 = Instance.new("ImageLabel")
			local UIStroke_3 = Instance.new("UIStroke")
			local UICorner_3 = Instance.new("UICorner")
			local AuthorText = Instance.new("TextLabel")
			local DelButton = Instance.new("ImageButton")
			local UICorner = Instance.new("UICorner")
			local UIGradient = Instance.new("UIGradient")

			DelButton.Name = Compkiller:_RandomString()
			DelButton.Parent = LinkValues
			DelButton.BackgroundTransparency = 1.000
			DelButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DelButton.BorderSizePixel = 0
			DelButton.LayoutOrder = -9999
			DelButton.Size = UDim2.new(0, 35, 0, 15)
			DelButton.ZIndex = 14
			DelButton.Image = Compkiller:CacheImage("rbxassetid://10747362393")
			DelButton.ImageColor3 = Color3.fromRGB(255, 107, 107)
			DelButton.ImageTransparency = 0.500
			DelButton.ScaleType = Enum.ScaleType.Fit

			UICorner.CornerRadius = UDim.new(1, 0)
			UICorner.Parent = DelButton
			ConfigBlock.Name = Compkiller:_RandomString()
			ConfigBlock.Parent = ScrollingFrame
			ConfigBlock.BackgroundColor3 = Color3.fromRGB(33, 34, 40)
			ConfigBlock.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ConfigBlock.BorderSizePixel = 0
			ConfigBlock.BackgroundTransparency = 1
			ConfigBlock.Size = UDim2.new(1, -1, 0, 40)
			ConfigBlock.ZIndex = 10

			if Compkiller:_IsMobile() then
				Compkiller:_AddDragBlacklist(ConfigBlock);
			end;

			ConfigText.Name = Compkiller:_RandomString()
			ConfigText.Parent = ConfigBlock
			ConfigText.AnchorPoint = Vector2.new(0, 0.5)
			ConfigText.BackgroundTransparency = 1.000
			ConfigText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ConfigText.BorderSizePixel = 0
			ConfigText.Position = UDim2.new(0, 12, 0.5, 15)
			ConfigText.Size = UDim2.new(1, -20, 0, 25)
			ConfigText.ZIndex = 10
			ConfigText.Font = Enum.Font.GothamMedium
			ConfigText.RichText = true;
			ConfigText.Text = "Config"
			ConfigText.TextColor3 = Compkiller.Colors.SwitchColor
			ConfigText.TextSize = 13.000
			ConfigText.TextTransparency = 1
			ConfigText.TextXAlignment = Enum.TextXAlignment.Left

			table.insert(Compkiller.Elements.SwitchColor , {
				Element = ConfigText,
				Property = 'TextColor3'
			});

			UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.29, 0.00), NumberSequenceKeypoint.new(0.33, 1.00), NumberSequenceKeypoint.new(1.00, 1.00)}
			UIGradient.Parent = ConfigText

			LinkValues.Name = Compkiller:_RandomString()
			LinkValues.Parent = ConfigBlock
			LinkValues.AnchorPoint = Vector2.new(1, 0.540000021)
			LinkValues.BackgroundTransparency = 1.000
			LinkValues.BorderColor3 = Color3.fromRGB(0, 0, 0)
			LinkValues.BorderSizePixel = 0
			LinkValues.Position = UDim2.new(1, -12, 0.5, 15)
			LinkValues.Size = UDim2.new(1, 0, 0, 18)
			LinkValues.ZIndex = 11

			UIListLayout.Parent = LinkValues
			UIListLayout.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
			UIListLayout.Padding = UDim.new(0, -10)

			SaveButton.Name = Compkiller:_RandomString()
			SaveButton.Parent = LinkValues
			SaveButton.BackgroundTransparency = 1.000
			SaveButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SaveButton.BorderSizePixel = 0
			SaveButton.Size = UDim2.new(0, 77, 0, 30)
			SaveButton.ZIndex = 14

			Frame.Parent = SaveButton
			Frame.AnchorPoint = Vector2.new(0.5, 0.5)
			Frame.BackgroundColor3 = Compkiller.Colors.Highlight
			Frame.BackgroundTransparency = 1
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
			Frame.Size = UDim2.new(1, -15, 1, -5)
			Frame.ZIndex = 14

			table.insert(Compkiller.Elements.Highlight,{
				Element = Frame,
				Property = "BackgroundColor3"
			});

			UIStroke.Transparency = 1
			UIStroke.Color = Compkiller.Colors.StrokeColor
			UIStroke.Parent = Frame

			table.insert(Compkiller.Elements.StrokeColor,{
				Element = UIStroke,
				Property = "Color"
			});

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Frame

			TextLabel.Parent = Frame
			TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0.5, 27, 0.5, 0)
			TextLabel.Size = UDim2.new(1, 0, 1, 0)
			TextLabel.ZIndex = 14
			TextLabel.Font = Enum.Font.GothamMedium
			TextLabel.Text = "Save"
			TextLabel.TextColor3 = Compkiller.Colors.SwitchColor
			TextLabel.TextSize = 12.000
			TextLabel.TextStrokeTransparency = 1
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel.TextTransparency = 1

			table.insert(Compkiller.Elements.SwitchColor , {
				Element = TextLabel,
				Property = 'TextColor3'
			});

			Icon.Name = Compkiller:_RandomString()
			Icon.Parent = Frame
			Icon.AnchorPoint = Vector2.new(0, 0.5)
			Icon.BackgroundTransparency = 1.000
			Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Icon.BorderSizePixel = 0
			Icon.Position = UDim2.new(0, 5, 0.5, 0)
			Icon.Size = UDim2.new(0.699999988, 0, 0.699999988, 0)
			Icon.SizeConstraint = Enum.SizeConstraint.RelativeYY
			Icon.ZIndex = 15
			Icon.Image = Compkiller:CacheImage("rbxassetid://10734941499")
			Icon.ImageTransparency = 1;

			LoadButton.Name = Compkiller:_RandomString()
			LoadButton.Parent = LinkValues
			LoadButton.BackgroundTransparency = 1.000
			LoadButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			LoadButton.BorderSizePixel = 0
			LoadButton.Size = UDim2.new(0, 77, 0, 30)
			LoadButton.ZIndex = 14

			Frame_2.Parent = LoadButton
			Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
			Frame_2.BackgroundColor3 = Compkiller.Colors.Highlight
			Frame_2.BackgroundTransparency = 1
			Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame_2.BorderSizePixel = 0
			Frame_2.Position = UDim2.new(0.5, 0, 0.5, 0)
			Frame_2.Size = UDim2.new(1, -15, 1, -5)
			Frame_2.ZIndex = 14

			table.insert(Compkiller.Elements.Highlight,{
				Element = Frame_2,
				Property = "BackgroundColor3"
			});

			UIStroke_2.Transparency = 1
			UIStroke_2.Color = Compkiller.Colors.StrokeColor
			UIStroke_2.Parent = Frame_2

			table.insert(Compkiller.Elements.StrokeColor,{
				Element = UIStroke_2,
				Property = "Color"
			});

			UICorner_2.CornerRadius = UDim.new(0, 3)
			UICorner_2.Parent = Frame_2

			TextLabel_2.Parent = Frame_2
			TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
			TextLabel_2.BackgroundTransparency = 1.000
			TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel_2.BorderSizePixel = 0
			TextLabel_2.Position = UDim2.new(0.5, 27, 0.5, 0)
			TextLabel_2.Size = UDim2.new(1, 0, 1, 0)
			TextLabel_2.ZIndex = 14
			TextLabel_2.Font = Enum.Font.GothamMedium
			TextLabel_2.Text = "Load"
			TextLabel_2.TextColor3 = Compkiller.Colors.SwitchColor
			TextLabel_2.TextSize = 12.000
			TextLabel_2.TextStrokeTransparency = 1
			TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel_2.TextTransparency = 1

			table.insert(Compkiller.Elements.SwitchColor , {
				Element = TextLabel_2,
				Property = 'TextColor3'
			});

			Icon_2.Name = Compkiller:_RandomString()
			Icon_2.Parent = Frame_2
			Icon_2.AnchorPoint = Vector2.new(0, 0.5)
			Icon_2.BackgroundTransparency = 1.000
			Icon_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Icon_2.BorderSizePixel = 0
			Icon_2.Position = UDim2.new(0, 5, 0.5, 0)
			Icon_2.Size = UDim2.new(0.699999988, 0, 0.699999988, 0)
			Icon_2.SizeConstraint = Enum.SizeConstraint.RelativeYY
			Icon_2.ZIndex = 15
			Icon_2.Image = Compkiller:CacheImage("rbxassetid://10723344270")
			Icon_2.ImageTransparency = 1
			UIStroke_3.Transparency = 1

			UIStroke_3.Color = Compkiller.Colors.StrokeColor
			UIStroke_3.Parent = ConfigBlock

			table.insert(Compkiller.Elements.StrokeColor,{
				Element = UIStroke_3,
				Property = "Color"
			});

			UICorner_3.CornerRadius = UDim.new(0, 6)
			UICorner_3.Parent = ConfigBlock

			AuthorText.Name = Compkiller:_RandomString()
			AuthorText.Parent = ConfigBlock
			AuthorText.AnchorPoint = Vector2.new(0, 0.5)
			AuthorText.BackgroundTransparency = 1.000
			AuthorText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			AuthorText.BorderSizePixel = 0
			AuthorText.Position = UDim2.new(0.5, -65, 0.5, 15)
			AuthorText.Size = UDim2.new(1, -20, 0, 25)
			AuthorText.ZIndex = 10
			AuthorText.Font = Enum.Font.GothamMedium
			AuthorText.RichText = true;
			AuthorText.Text = "Author: <font color=\"rgb(17, 238, 253)\">NoFi</font>"
			AuthorText.TextColor3 = Compkiller.Colors.SwitchColor
			AuthorText.TextSize = 13.000
			AuthorText.TextTransparency = 1
			AuthorText.TextXAlignment = Enum.TextXAlignment.Left

			table.insert(Compkiller.Elements.SwitchColor , {
				Element = TabNameLabel,
				Property = 'TextColor3'
			});

			function ConfigButton:SetInfo(Author , ConfigName)
				local R,G,B = tostring(math.floor(Compkiller.Colors.Highlight.R * 255)) , tostring(math.floor(Compkiller.Colors.Highlight.G * 255)) , tostring(math.floor(Compkiller.Colors.Highlight.B * 255));

				AuthorText.Text = string.format("Author: <font color=\"rgb(%s, %s, %s)\">%s</font>" ,R,G,B , tostring(Author));
				ConfigText.Text = ConfigName;

				if ConfigBlock.BackgroundTransparency >= 0.7 then
					ConfigButton:Update();
				end;
			end;

			function ConfigButton:Toggle(v)
				if v then
					Compkiller:_Animation(ConfigBlock,Tween,{
						BackgroundTransparency = 0
					});

					Compkiller:_Animation(LinkValues,Tween,{
						Position = UDim2.new(1, -12, 0.5, 0)
					});

					Compkiller:_Animation(ConfigText,Tween,{
						TextTransparency = 0.3,
						Position = UDim2.new(0, 12, 0.5, 0)
					});

					Compkiller:_Animation(Frame,Tween,{
						BackgroundTransparency = 0.100
					});

					Compkiller:_Animation(UIStroke,Tween,{
						Transparency = 0
					});

					Compkiller:_Animation(AuthorText,Tween,{
						TextTransparency = 0.5,
						Position = UDim2.new(0,AuthorText:GetAttribute('SPC'), 0.5, 0)
					});

					Compkiller:_Animation(Icon_2,Tween,{
						ImageTransparency = 0
					});

					Compkiller:_Animation(Icon,Tween,{
						ImageTransparency = 0
					});

					Compkiller:_Animation(Frame_2,Tween,{
						BackgroundTransparency = 0.100
					});

					Compkiller:_Animation(UIStroke_2,Tween,{
						Transparency = 0
					});

					Compkiller:_Animation(TextLabel,Tween,{
						TextStrokeTransparency = 0.900,
						TextTransparency = 0
					});

					Compkiller:_Animation(TextLabel_2,Tween,{
						TextStrokeTransparency = 0.900,
						TextTransparency = 0
					});
				else
					Compkiller:_Animation(AuthorText,Tween,{
						TextTransparency = 1,
						Position = UDim2.new(0.5, -65, 0.5, 15)
					});

					Compkiller:_Animation(Icon_2,Tween,{
						ImageTransparency = 1
					});

					Compkiller:_Animation(Icon,Tween,{
						ImageTransparency = 1
					});

					Compkiller:_Animation(LinkValues,Tween,{
						Position = UDim2.new(1, -12, 0.5, 15)
					});

					Compkiller:_Animation(ConfigBlock,Tween,{
						BackgroundTransparency = 1
					});

					Compkiller:_Animation(ConfigText,Tween,{
						TextTransparency = 1,
						Position = UDim2.new(0, 12, 0.5, 15)
					});

					Compkiller:_Animation(Frame,Tween,{
						BackgroundTransparency = 1
					});

					Compkiller:_Animation(UIStroke,Tween,{
						Transparency = 1
					});

					Compkiller:_Animation(Frame_2,Tween,{
						BackgroundTransparency = 1
					});

					Compkiller:_Animation(UIStroke_2,Tween,{
						Transparency = 1
					});

					Compkiller:_Animation(TextLabel,Tween,{
						TextStrokeTransparency = 1,
						TextTransparency = 1
					});

					Compkiller:_Animation(TextLabel_2,Tween,{
						TextStrokeTransparency = 1,
						TextTransparency = 1
					});
				end;
			end;

			function ConfigButton:Update()
				local nameScale = TextService:GetTextSize(ConfigText.Text,ConfigText.TextSize,ConfigText.Font,Vector2.new(math.huge,math.huge));

				AuthorText:SetAttribute('SPC',math.clamp(nameScale.X + 20 , 100,150));

				AuthorText.Position = UDim2.new(0, AuthorText:GetAttribute('SPC'), 0.5, 15)
			end;

			ConfigButton:Update();

			Compkiller:_Input(LoadButton,function()
				task.spawn(ConfigButton.OnLoad);
			end);

			Compkiller:_Input(SaveButton,function()
				task.spawn(ConfigButton.OnSave);
			end);

			DelButton.MouseButton1Click:Connect(function()
				task.spawn(ConfigButton.OnDelete);
			end)

			ConfigButton.OnLoad = nil;
			ConfigButton.OnSave = nil;
			ConfigButton.OnDelete = nil;

			return ConfigButton;
		end;

		function TabArgs:Init()
			local __signals = {};
			local Init = {};

			Compkiller:_Input(Button,function()
				if TextBox.Text:byte() then
					WindowArgs.Notify.new({
						Title = "Configs",
						Icon = Compkiller:_GetIcon(Config.Logo),
						Content = "Create config \""..TextBox.Text.."\""
					})

					Configuration.Config:WriteConfig({
						Name = TextBox.Text,
						Author = WindowArgs.Username,
					});
				end;
			end);

			local Refresh = function()
				local FullConfig = Configuration.Config:GetFullConfigs();

				for i,v in next, ScrollingFrame:GetChildren() do
					if v:IsA('Frame') and v.Name ~= "Space" then
						v:Destroy();
					end;
				end;

				for i,v in next , __signals do
					v:Disconnect();
				end;

				for i,v in next , FullConfig do
					local Button = TabArgs:_DrawConfig();

					Button:SetInfo(v.Info.Author,v.Name);

					table.insert(__signals,TabOpenSignal:Connect(function(v)
						Button:Toggle(v);
					end));

					Button.OnLoad = function()
						WindowArgs.Notify.new({
							Title = "Configs",
							Icon = Compkiller:CacheImage(Config.Logo),
							Content = "Load config \""..v.Name.."\""
						})

						Configuration.Config:LoadConfig(v.Name);
					end;

					Button.OnSave = function()
						WindowArgs.Notify.new({
							Title = "Configs",
							Icon = Compkiller:CacheImage(Config.Logo),
							Content = "Save config \""..v.Name.."\""
						})

						Button:SetInfo(v.Info.Author,v.Name);

						Configuration.Config:WriteConfig({
							Name = v.Name,
							Author = v.Info.Author;
						});
					end

					Button.OnDelete = function()
						WindowArgs.Notify.new({
							Title = "Configs",
							Icon = Compkiller:CacheImage(Config.Logo),
							Content = "Delete config \""..v.Name.."\""
						})

						Configuration.Config:DeleteConfig(v.Name)
					end
				end;
			end;

			Refresh();

			Init.THREAD = task.spawn(function()
				local OldIndex = Configuration.Config:GetConfigCount();

				while true do task.wait(0.125);
					local CountInDirectory = Configuration.Config:GetConfigCount();

					if OldIndex ~= CountInDirectory then
						OldIndex = CountInDirectory;

						Refresh();
					end;
				end;
			end);

			return Init;
		end;

		return TabArgs;
	end;

	function WindowArgs:DrawTab(TabConfig : TabConfig , Internal)
		TabConfig = Compkiller.__CONFIG(TabConfig,{
			Name = "Tab",
			Icon = "eye",
			Type = "Double"
		});

		local TabOpenSignal = Compkiller.__SIGNAL(false);
		local TabArgs = {};
		local Upvalue = {};
		local BASE_PADDING = 10;

		if Internal then

			local TabContent = Instance.new("Frame")
			local Left = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")
			local Right = Instance.new("ScrollingFrame")
			local UIListLayout_2 = Instance.new("UIListLayout")

			TabContent.Name = Compkiller:_RandomString()
			TabContent.Parent = Internal.Parent;
			TabContent.AnchorPoint = Vector2.new(0.5, 0.5)
			TabContent.BackgroundTransparency = 1.000
			TabContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TabContent.BorderSizePixel = 0
			TabContent.Position = UDim2.new(0.5, 0, 0.5, 0)
			TabContent.Size = UDim2.new(1, -5,1, -5)
			TabContent.ZIndex = 6

			Left.Name = Compkiller:_RandomString()
			Left.Parent = TabContent
			Left.Active = true
			Left.AnchorPoint = Vector2.new(0.5, 0.5)
			Left.BackgroundTransparency = 1.000
			Left.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Left.BorderSizePixel = 0
			Left.ClipsDescendants = false
			Left.Position = UDim2.new(0.25, -3, 0.5, 0)
			Left.Size = UDim2.new(0.5, -3, 1, 0)
			Left.ZIndex = 8
			Left.BottomImage = ""
			Left.ScrollBarThickness = 0
			Left.TopImage = ""
			--Left.AutomaticCanvasSize = Enum.AutomaticSize.Y;
			Left.CanvasSize = UDim2.new(0, 0, 0, 0)

			UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
				Left.CanvasSize = UDim2.fromOffset(0,UIListLayout.AbsoluteContentSize.Y)
			end)

			UIListLayout.Parent = Left
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.VerticalFlex = Enum.UIFlexAlignment.None
			UIListLayout.Padding = UDim.new(0, BASE_PADDING)

			Right.Name = Compkiller:_RandomString()
			Right.Parent = TabContent
			Right.Active = true
			Right.AnchorPoint = Vector2.new(0.5, 0.5)
			Right.BackgroundTransparency = 1.000
			Right.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Right.BorderSizePixel = 0
			Right.ClipsDescendants = false
			Right.Position = UDim2.new(0.75, 3, 0.5, 0)
			Right.Size = UDim2.new(0.5, -3, 1, 0)
			Right.ZIndex = 8
			Right.BottomImage = ""
			--Right.AutomaticCanvasSize = Enum.AutomaticSize.Y;
			Right.CanvasSize = UDim2.new(0, 0, 0, 0)
			Right.ScrollBarThickness = 0
			Right.TopImage = ""

			Upvalue.Left = Left;
			Upvalue.Right = Right;
			Upvalue.LeftLayout = UIListLayout;
			Upvalue.RightLayout = UIListLayout_2;

			UIListLayout_2:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
				Right.CanvasSize = UDim2.fromOffset(0,UIListLayout_2.AbsoluteContentSize.Y)
			end)

			UIListLayout_2.Parent = Right
			UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_2.Padding = UDim.new(0, BASE_PADDING)
			UIListLayout_2.VerticalFlex = Enum.UIFlexAlignment.None

			WindowArgs:AddUnbind(UIListLayout_2 , Right);
			WindowArgs:AddUnbind(UIListLayout , Left);

			if TabConfig.Type == "Single" then
				Right.Visible = false;
				Left.Position = UDim2.new(0.5, 0, 0.5, 0)
				Left.Size = UDim2.new(1,0,1,0)
			end;

			local Tween = TweenInfo.new(0.35,Enum.EasingStyle.Quint);

			Internal.Highlight:GetPropertyChangedSignal('BackgroundTransparency'):Connect(function()
				if Internal.Highlight.BackgroundTransparency <= 0.99 then
					TabContent.Visible = true;
				else
					TabContent.Visible = false;
				end;

				if Compkiller.PerformanceMode then
					if TabContent.Visible then
						Compkiller:_SetNilP(TabContent , Internal.Parent);
					else
						Compkiller:_SetNilP(TabContent , nil);
					end;
				else
					Compkiller:_SetNilP(TabContent , Internal.Parent);
				end;
			end);

			Upvalue.Left = Left;
			Upvalue.Right = Right;

			if Compkiller:_IsMobile() then
				Compkiller:_AddDragBlacklist(Left);
				Compkiller:_AddDragBlacklist(Right);
			end;

			TabOpenSignal = Internal.Signal;

			if not TabOpenSignal:GetValue() then
				TabContent.Visible = false;
			else
				TabContent.Visible = true;
			end;

			if Compkiller.PerformanceMode then
				if TabContent.Visible then
					Compkiller:_SetNilP(TabContent , Internal.Parent);
				else
					Compkiller:_SetNilP(TabContent , nil);
				end;
			else
				Compkiller:_SetNilP(TabContent , Internal.Parent);
			end;
		else
			-- Button --
			local TabButton = Instance.new("Frame")
			local Icon = Instance.new("ImageLabel")
			local TabNameLabel = Instance.new("TextLabel")
			local Highlight = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")

			TabButton.Name = Compkiller:_RandomString()
			TabButton.Parent = TabButtonScrollingFrame
			TabButton.BackgroundTransparency = 1.000
			TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TabButton.BorderSizePixel = 0
			TabButton.ClipsDescendants = true
			TabButton.Size = UDim2.new(1, -10, 0, 32)
			TabButton.ZIndex = 3

			Icon.Name = Compkiller:_RandomString()
			Icon.Parent = TabButton
			Icon.AnchorPoint = Vector2.new(0, 0.5)
			Icon.BackgroundColor3 = Compkiller.Colors.Highlight
			Icon.BackgroundTransparency = 1.000
			Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Icon.BorderSizePixel = 0
			Icon.Position = UDim2.new(0, 15, 0.5, 0)
			Icon.Size = UDim2.new(0, 15, 0, 15)
			Icon.ZIndex = 3
			Icon.Image = Compkiller:_GetIcon(TabConfig.Icon);
			Icon.ImageColor3 = Compkiller.Colors.Highlight

			table.insert(Compkiller.Elements.Highlight,{
				Element = Icon,
				Property = "ImageColor3"
			});

			TabNameLabel.Name = Compkiller:_RandomString()
			TabNameLabel.Parent = TabButton
			TabNameLabel.AnchorPoint = Vector2.new(0, 0.5)
			TabNameLabel.BackgroundTransparency = 1.000
			TabNameLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TabNameLabel.BorderSizePixel = 0
			TabNameLabel.Position = UDim2.new(0, 43, 0.5, 0)
			TabNameLabel.Size = UDim2.new(0, 200, 0, 25)
			TabNameLabel.ZIndex = 3
			TabNameLabel.Font = Enum.Font.GothamMedium
			TabNameLabel.Text = TabConfig.Name;
			TabNameLabel.TextColor3 = Compkiller.Colors.SwitchColor
			TabNameLabel.TextSize = 15.000
			TabNameLabel.TextXAlignment = Enum.TextXAlignment.Left

			table.insert(Compkiller.Elements.SwitchColor , {
				Element = TabNameLabel,
				Property = 'TextColor3'
			});

			Highlight.Name = Compkiller:_RandomString()
			Highlight.Parent = TabButton
			Highlight.AnchorPoint = Vector2.new(0.5, 0.5)
			Highlight.BackgroundColor3 = Color3.fromRGB(161, 161, 161)
			Highlight.BackgroundTransparency = 0.925
			Highlight.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Highlight.BorderSizePixel = 0
			Highlight.Position = UDim2.new(0.5, 0, 0.5, 0)
			Highlight.Size = UDim2.new(1, -17, 1, 0)
			Highlight.ZIndex = 2

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Highlight

			local TabContent = Instance.new("Frame")
			local Left = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")
			local Right = Instance.new("ScrollingFrame")
			local UIListLayout_2 = Instance.new("UIListLayout")

			TabContent.Name = Compkiller:_RandomString()
			TabContent.Parent = TabMainFrame;
			TabContent.AnchorPoint = Vector2.new(0.5, 0.5)
			TabContent.BackgroundTransparency = 1.000
			TabContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TabContent.BorderSizePixel = 0
			TabContent.Position = UDim2.new(0.5, 0, 0.5, 0)
			TabContent.Size = UDim2.new(1, -15, 1, -15)
			TabContent.ZIndex = 6

			Left.Name = Compkiller:_RandomString()
			Left.Parent = TabContent
			Left.Active = true
			Left.AnchorPoint = Vector2.new(0.5, 0.5)
			Left.BackgroundTransparency = 1.000
			Left.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Left.BorderSizePixel = 0
			Left.ClipsDescendants = false
			Left.Position = UDim2.new(0.25, -3, 0.5, 0)
			Left.Size = UDim2.new(0.5, -3, 1, 0)
			Left.ZIndex = 8
			Left.BottomImage = ""
			Left.ScrollBarThickness = 0
			Left.TopImage = ""
			--Left.AutomaticCanvasSize = Enum.AutomaticSize.Y;
			Left.CanvasSize = UDim2.new(0, 0, 0, 0)


			UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
				Left.CanvasSize = UDim2.fromOffset(0,UIListLayout.AbsoluteContentSize.Y)
			end);

			UIListLayout.Parent = Left
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.VerticalFlex = Enum.UIFlexAlignment.None
			UIListLayout.Padding = UDim.new(0, BASE_PADDING)

			Right.Name = Compkiller:_RandomString()
			Right.Parent = TabContent
			Right.Active = true
			Right.AnchorPoint = Vector2.new(0.5, 0.5)
			Right.BackgroundTransparency = 1.000
			Right.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Right.BorderSizePixel = 0
			Right.ClipsDescendants = false
			Right.Position = UDim2.new(0.75, 3, 0.5, 0)
			Right.Size = UDim2.new(0.5, -3, 1, 0)
			Right.ZIndex = 8
			Right.BottomImage = ""
			Right.ScrollBarThickness = 0
			Right.TopImage = ""
			--Right.AutomaticCanvasSize = Enum.AutomaticSize.Y;
			Right.CanvasSize = UDim2.new(0, 0, 0, 0)

			Upvalue.Left = Left;
			Upvalue.Right = Right;
			Upvalue.LeftLayout = UIListLayout;
			Upvalue.RightLayout = UIListLayout_2;

			UIListLayout_2:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
				Right.CanvasSize = UDim2.fromOffset(0,UIListLayout_2.AbsoluteContentSize.Y)
			end)

			UIListLayout_2.Parent = Right
			UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_2.Padding = UDim.new(0, BASE_PADDING)
			UIListLayout_2.VerticalFlex = Enum.UIFlexAlignment.None

			WindowArgs:AddUnbind(UIListLayout_2 , Right);
			WindowArgs:AddUnbind(UIListLayout , Left);

			if Compkiller:_IsMobile() then
				Compkiller:_AddDragBlacklist(Left);
				Compkiller:_AddDragBlacklist(Right);
			end;

			if TabConfig.Type == "Single" then
				Right.Visible = false;
				Left.Position = UDim2.new(0.5, 0, 0.5, 0)
				Left.Size = UDim2.new(1, -1, 1, -1)
			end;

			local Tween = TweenInfo.new(0.35,Enum.EasingStyle.Quint);

			Highlight:GetPropertyChangedSignal('BackgroundTransparency'):Connect(function()
				if Highlight.BackgroundTransparency <= 0.99 then
					TabContent.Visible = true;
				else
					TabContent.Visible = false;
				end;

				if Compkiller.PerformanceMode then
					if TabContent.Visible then
						Compkiller:_SetNilP(TabContent , TabMainFrame);
					else
						Compkiller:_SetNilP(TabContent , nil);
					end;
				else
					Compkiller:_SetNilP(TabContent , TabMainFrame);
				end;
			end)

			local TabOpen = function(bool)
				if bool then

					WindowArgs.SelectedTab = TabButton;

					Compkiller:_Animation(Icon,Tween,{
						ImageTransparency = 0,
					});

					Compkiller:_Animation(TabNameLabel,Tween,{
						TextTransparency = 0
					});

					Compkiller:_Animation(Highlight,Tween,{
						BackgroundTransparency = 0.925
					});
				else
					Compkiller:_Animation(Icon,Tween,{
						ImageTransparency = 0.5
					});

					Compkiller:_Animation(TabNameLabel,Tween,{
						TextTransparency = 0.5
					});

					Compkiller:_Animation(Highlight,Tween,{
						BackgroundTransparency = 1
					});
				end;
			end;

			if not WindowArgs.Tabs[1] then
				TabOpenSignal:Fire(true);
				TabOpen(true);
			else
				TabOpen(false);
			end;

			table.insert(WindowArgs.Tabs , {
				Root = TabButton,
				Remote = TabOpenSignal
			});

			Compkiller:_Hover(TabButton,function()
				if WindowArgs.SelectedTab ~= TabButton then
					Compkiller:_Animation(Icon,Tween,{
						ImageTransparency = 0.1
					});

					Compkiller:_Animation(TabNameLabel,Tween,{
						TextTransparency = 0.1
					});
				end;
			end , function()
				if WindowArgs.SelectedTab ~= TabButton then
					Compkiller:_Animation(Icon,Tween,{
						ImageTransparency = 0.5
					});

					Compkiller:_Animation(TabNameLabel,Tween,{
						TextTransparency = 0.5
					});
				end;
			end)

			TabOpenSignal:Connect(TabOpen);

			TabHover:Connect(function(bool)
				if bool then
					Compkiller:_Animation(TabButton,Tween,{
						Size = UDim2.new(1, -10, 0, 32)
					});

					Compkiller:_Animation(Icon,Tween,{
						Size = UDim2.new(0, 16, 0, 16),
					});

					Compkiller:_Animation(TabNameLabel,Tween,{
						Size = UDim2.new(0, 200, 0, 25),
						Position = UDim2.new(0, 43, 0.5, 0)
					});

					Compkiller:_Animation(UICorner,Tween,{
						CornerRadius = UDim.new(0, 4)
					});

					Compkiller:_Animation(Highlight,Tween,{
						Size = UDim2.new(1, -17, 1, 0),
						Position = UDim2.new(0.5, 0, 0.5, 0)
					});
				else
					Compkiller:_Animation(UICorner,Tween,{
						CornerRadius = UDim.new(0, 10)
					});

					Compkiller:_Animation(TabButton,Tween,{
						Size = UDim2.new(1, -10, 0, 32)
					});

					Compkiller:_Animation(Icon,Tween,{
						Size = UDim2.new(0, 16, 0, 16),
					});

					Compkiller:_Animation(TabNameLabel,Tween,{
						Size = UDim2.new(0, 200, 0, 25),
						Position = UDim2.new(0, 80, 0.5, 0)
					});

					Compkiller:_Animation(Highlight,Tween,{
						Size = UDim2.new(1, -10,1, 5),
						Position = UDim2.new(0.5, 0, 0.5, 0)
					});
				end;
			end);

			Compkiller:_Input(TabButton,function()
				for i,v in next, WindowArgs.Tabs do
					if v.Root == TabButton then
						v.Remote:Fire(true);
					else
						v.Remote:Fire(false);
					end;
				end;
			end);
		end;

		function TabArgs:_UpdateScrolling(Frame: ScrollingFrame , ListLayout: UIListLayout)
			local frame;

			local last = 0;
			local scale = 0;

			local Offset = ListLayout.Padding.Offset;
			local Childrens = Frame:GetChildren();

			for i,v in next ,Childrens do task.wait();
				if v:IsA('Frame') then
					if v.LayoutOrder > last then
						scale += v.AbsoluteSize.Y + Offset;

						last = v.LayoutOrder;
						frame = v;
					end;
				end;
			end;

			task.wait();

			if frame then
				local originalScale = frame:GetAttribute('OrigninalScale');

				if originalScale then
					task.wait();

					local Maximum = Frame.AbsoluteSize.Y;

					local remainingHeight = Maximum - ((scale) - (frame.AbsoluteSize.Y));

					if originalScale >= Frame.AbsoluteSize.Y then
						Frame:SetAttribute('LayoutStacks',originalScale + 5);
					else
						Frame:SetAttribute('LayoutStacks',((remainingHeight) + 5));
					end

					task.wait();

					local caller = WindowArgs.THREADS[frame];

					if caller then
						caller(true);
					end;
				end;
			end;

			task.wait();
		end;

		TabArgs.SectionInfo = {};

		TabArgs.SectionClose = {
			[Upvalue.Left] = {},
			[Upvalue.Right] = {},
		};

		TabArgs.LeftThread = coroutine.wrap(function()
			task.wait();

			while true do task.wait(0.01)
				TabArgs:_UpdateScrolling(Upvalue.Left , Upvalue.LeftLayout);
			end;
		end);

		TabArgs.RightThread = coroutine.wrap(function()
			task.wait(0.1);

			while true do task.wait(0.01)
				TabArgs:_UpdateScrolling(Upvalue.Right , Upvalue.RightLayout);
			end;
		end);

		--TabArgs.LeftThread();
		--TabArgs.RightThread();

		function TabArgs:DrawSection(config: Section)
			config = Compkiller.__CONFIG(config,{
				Name = "Section",
				Position = "left"
			});

			local Parent = (TabConfig.Type == "Double" and ((string.lower(config.Position) == "left" and Upvalue.Left) or Upvalue.Right)) or Upvalue.Left;
			local ParentLayout = (TabConfig.Type == "Double" and ((string.lower(config.Position) == "left" and Upvalue.LeftLayout) or Upvalue.RightLayout)) or Upvalue.LeftLayout;

			local IsOpen = true;

			local Section = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")
			local UIListLayout = Instance.new("UIListLayout")
			local Header = Instance.new("Frame")
			local SectionText = Instance.new("TextLabel")
			local SectionClose = Instance.new("ImageLabel")

			Section.Name = Compkiller:_RandomString()
			Section.Parent = Parent;

			if TabConfig.Type == "Single" then
				Section.Parent = Upvalue.Left;
			end;

			Section.BackgroundColor3 = Compkiller.Colors.BlockColor

			table.insert(Compkiller.Elements.BlockColor , {
				Element = Section,
				Property = "BackgroundColor3"
			});

			if Compkiller:_IsMobile() then
				Compkiller:_AddDragBlacklist(Section);
			end;

			Section.LayoutOrder = #Parent:GetChildren() + 3;
			Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Section.BorderSizePixel = 0
			Section.Size = UDim2.new(1, 0, 0, 0)
			Section.ZIndex = 9
			Section.ClipsDescendants = true;

			UICorner.CornerRadius = UDim.new(0, 6)
			UICorner.Parent = Section

			UIStroke.Color = Compkiller.Colors.StrokeColor
			UIStroke.Parent = Section

			table.insert(Compkiller.Elements.StrokeColor,{
				Element = UIStroke,
				Property = "Color"
			});

			UIListLayout.Parent = Section
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)

			Header.Name = Compkiller:_RandomString()
			Header.Parent = Section
			Header.BackgroundTransparency = 1.000
			Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Header.BorderSizePixel = 0
			Header.LayoutOrder = -100
			Header.Size = UDim2.new(1, 0, 0, 35)
			Header.ZIndex = 9

			SectionText.Name = Compkiller:_RandomString()
			SectionText.Parent = Header
			SectionText.AnchorPoint = Vector2.new(0, 0.5)
			SectionText.BackgroundTransparency = 1.000
			SectionText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SectionText.BorderSizePixel = 0
			SectionText.Position = UDim2.new(0, 12, 0.5, 0)
			SectionText.Size = UDim2.new(0, 200, 0, 25)
			SectionText.ZIndex = 10
			SectionText.Font = Enum.Font.GothamMedium
			SectionText.Text = config.Name;
			SectionText.TextColor3 = Compkiller.Colors.SwitchColor
			SectionText.TextSize = 14.000
			SectionText.TextTransparency = 0.500
			SectionText.TextXAlignment = Enum.TextXAlignment.Left

			table.insert(Compkiller.Elements.SwitchColor , {
				Element = SectionText,
				Property = 'TextColor3'
			});

			SectionClose.Name = Compkiller:_RandomString()
			SectionClose.Parent = Header
			SectionClose.AnchorPoint = Vector2.new(1, 0.5)
			SectionClose.BackgroundTransparency = 1.000
			SectionClose.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SectionClose.BorderSizePixel = 0
			SectionClose.Position = UDim2.new(1, -12, 0.5, 0)
			SectionClose.Size = UDim2.new(0, 17, 0, 17)
			SectionClose.ZIndex = 10
			SectionClose.Image = Compkiller:CacheImage("rbxassetid://109535175596957")
			SectionClose.ImageTransparency = 0.500

			if not SectionText.Text:byte() then
				Header.Visible = false;
			else
				Header.Visible = true;
			end;

			TabArgs.SectionInfo[Section] = {
				UIListLayout = UIListLayout,
			};

			local refresh = function(Upvalue)
				if not SectionText.Text:byte() then
					Header.Visible = false;
				else
					Header.Visible = true;
				end;

				Section:SetAttribute('OrigninalScale',UIListLayout.AbsoluteContentSize.Y);

				if IsOpen then
					local FullScale = Section.AbsolutePosition.Y + UIListLayout.AbsoluteContentSize.Y;
					local RefPos = Parent.AbsolutePosition.Y + Parent.AbsoluteSize.Y;

					if (Section:GetAttribute('Height') and not Compkiller:_IsMobile() and FullScale <= RefPos) then
						Compkiller:_Animation(Section,TweenInfo.new(0.4,Enum.EasingStyle.Quint),{
							Size = UDim2.new(1, 0, 0, math.abs(Section:GetAttribute('Height')) + 5)
						});
					else
						Compkiller:_Animation(Section,TweenInfo.new(0.4,Enum.EasingStyle.Quint),{
							Size = UDim2.new(1, 0, 0, math.abs(UIListLayout.AbsoluteContentSize.Y) - 1)
						});

						if Section:GetAttribute('Lasth') and UIListLayout.AbsoluteContentSize.Y > Section:GetAttribute('Lasth') then
							Section:SetAttribute('Lasth',math.abs(UIListLayout.AbsoluteContentSize.Y) - 1);
						end;
					end;

					TabArgs.SectionClose[Parent][Section] = nil;
				else
					TabArgs.SectionClose[Parent][Section] = Section;

					Compkiller:_Animation(Section,TweenInfo.new(0.4,Enum.EasingStyle.Quint),{
						Size = UDim2.new(1, 0, 0, 35)
					});
				end;
			end;

			WindowArgs.THREADS[Section] = refresh;

			local refreshScale = function()
				local Childrens = Parent:GetChildren();
				local Latest = 0;
				local frameFound = 0;
				local allscale = 0;

				for i,v: Frame in next , Childrens do task.wait();
					if v:IsA('Frame') then
						if v ~= Section then
							frameFound += 1;
							allscale += v:GetAttribute('HEIGHTSCALE') or v.AbsoluteSize.Y;

							if v.LayoutOrder < Section.LayoutOrder then
								if WindowArgs.THREADS[v] then
									v:SetAttribute('Height',nil);
									WindowArgs.THREADS[v]();
								end;

								Latest += 1;
							end;
						end;
					end;
				end;

				if frameFound == 0 then
					Latest = math.huge;
				end;

				if Latest >= frameFound then
					local lscale = 25;

					if allscale >= (Parent.AbsoluteSize.Y - lscale) or UIListLayout.AbsoluteContentSize.Y >= (Parent.AbsoluteSize.Y - lscale) then
						Section:SetAttribute('Height',nil);
					else
						local parentScale = 0;

						for i,v in next , Parent:GetChildren() do
							if v:IsA('Frame') then
								parentScale += v:GetAttribute('HEIGHTSCALE') + ParentLayout.Padding.Offset;
							end;
						end;

						local remainingHeight = UIListLayout.AbsoluteContentSize.Y + (Parent.AbsoluteSize.Y - (parentScale));

						if Section:GetAttribute('Lasth') then
							remainingHeight = math.max(remainingHeight , Section:GetAttribute('Lasth'));
						end;

						Section:SetAttribute('Height',remainingHeight);
						Section:SetAttribute('Lasth',remainingHeight);
					end;
				else
					Section:SetAttribute('Height',nil);
				end;

				refresh();
			end;

			Section.ChildAdded:Connect(function()
				task.wait()
				refreshScale();
			end)

			Section:SetAttribute('HEIGHTSCALE',UIListLayout.AbsoluteContentSize.Y);

			UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
				Section:SetAttribute('HEIGHTSCALE',math.max(UIListLayout.AbsoluteContentSize.Y , Section:GetAttribute('HEIGHTSCALE')));

				refresh()
			end);

			TabOpenSignal:Connect(function(bool)
				if bool then
					Compkiller:_Animation(Section,TweenInfo.new(0.21),{
						BackgroundTransparency = 0
					})

					Compkiller:_Animation(SectionText,TweenInfo.new(0.21),{
						TextTransparency = 0.500
					})

					Compkiller:_Animation(SectionClose,TweenInfo.new(0.21),{
						ImageTransparency = 0.500
					})
				else
					Compkiller:_Animation(Section,TweenInfo.new(0.21),{
						BackgroundTransparency = 1
					})

					Compkiller:_Animation(SectionText,TweenInfo.new(0.21),{
						TextTransparency = 1
					})

					Compkiller:_Animation(SectionClose,TweenInfo.new(0.21),{
						ImageTransparency = 1
					})
				end;
			end);

			Compkiller:_Input(Header,function()
				IsOpen = not IsOpen;

				if IsOpen then
					Compkiller:_Animation(SectionClose,TweenInfo.new(0.35),{
						Rotation = 0
					});
				else
					Compkiller:_Animation(SectionClose,TweenInfo.new(0.35),{
						Rotation = -180
					});
				end;

				refresh();
				refreshScale();
			end);

			task.delay(2.5,function()
				refresh();
				refreshScale();
			end);

			Header.MouseEnter:Connect(function()
				Compkiller:_Animation(SectionText,TweenInfo.new(0.2),{
					TextTransparency = 0.25
				})
			end)	

			Header.MouseLeave:Connect(function()
				Compkiller:_Animation(SectionText,TweenInfo.new(0.2),{
					TextTransparency = 0.500
				})
			end)

			return Compkiller:_LoadElement(Section , true , TabOpenSignal)
		end;

		return TabArgs;
	end;

	do
		local CloseWindow = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local ImageLabel = Instance.new("ImageLabel")

		CloseWindow.Name = Compkiller:_RandomString()
		CloseWindow.Parent = CompKiller
		CloseWindow.AnchorPoint = Vector2.new(1, 0)
		CloseWindow.BackgroundColor3 = Compkiller.Colors.BGDBColor

		table.insert(Compkiller.Elements.BGDBColor,{
			Element = CloseWindow,
			Property = 'BackgroundColor3'
		});

		CloseWindow.BackgroundTransparency = 1
		CloseWindow.BorderColor3 = Color3.fromRGB(0, 0, 0)
		CloseWindow.BorderSizePixel = 0
		CloseWindow.Position = UDim2.new(1, -10, 0, 10)
		CloseWindow.Size = UDim2.new(0, 0, 0, 23)
		CloseWindow.ZIndex = 150
		CloseWindow.ClipsDescendants = true;

		UICorner.CornerRadius = UDim.new(0, 3)
		UICorner.Parent = CloseWindow

		ImageLabel.Parent = CloseWindow
		ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		ImageLabel.BackgroundTransparency = 1.000
		ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel.BorderSizePixel = 0
		ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		ImageLabel.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
		ImageLabel.SizeConstraint = Enum.SizeConstraint.RelativeYY
		ImageLabel.ZIndex = 151
		ImageLabel.Image = Config.Logo
		ImageLabel.ImageTransparency = 1
		ImageLabel.ClipsDescendants = false;

		local ToggleCloseUI = function(v)
			ImageLabel.Image = Config.Logo;

			if v then
				ImageLabel.ClipsDescendants = true;

				Compkiller:_Animation(CloseWindow,TweenInfo.new(0.2),{
					Size = UDim2.new(0, 45, 0, 23),
					BackgroundTransparency = 0.025
				})

				Compkiller:_Animation(ImageLabel,TweenInfo.new(0.2),{
					ImageTransparency = (ImageLabel:GetAttribute('Hover') and 0.1) or 0.35
				})
			else
				ImageLabel.ClipsDescendants = false;

				Compkiller:_Animation(CloseWindow,TweenInfo.new(0.2),{
					Size = UDim2.new(0, 0, 0, 23),
					BackgroundTransparency = 1
				})

				Compkiller:_Animation(ImageLabel,TweenInfo.new(0.2),{
					ImageTransparency = 1
				})
			end;
		end;

		function WindowArgs:Watermark()
			local Signal = Compkiller.__SIGNAL(true);

			local Watermark = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local Logo = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local Frame = Instance.new("Frame")
			local CompLogo = Instance.new("ImageLabel")
			local WaternarkList = Instance.new("Frame")
			local UIListLayout = Instance.new("UIListLayout")

			Watermark.Name = Compkiller:_RandomString()
			Watermark.Parent = CompKiller
			Watermark.AnchorPoint = Vector2.new(1, 0)
			Watermark.BackgroundColor3 = Compkiller.Colors.BGDBColor

			Compkiller:Drag(Watermark , Watermark, 0.1);

			table.insert(Compkiller.Elements.BGDBColor,{
				Element = Watermark,
				Property = 'BackgroundColor3'
			});

			Watermark.BackgroundTransparency = 0.025
			Watermark.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Watermark.BorderSizePixel = 0
			Watermark.Position = UDim2.new(1, -10, 0, 10)
			Watermark.Size = UDim2.new(0, 45, 0, 23)
			Watermark.ZIndex = 150

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Watermark

			Logo.Name = Compkiller:_RandomString()
			Logo.Parent = Watermark
			Logo.AnchorPoint = Vector2.new(1, 0.5)
			Logo.BackgroundColor3 = Compkiller.Colors.BGDBColor

			table.insert(Compkiller.Elements.BGDBColor,{
				Element = Logo,
				Property = 'BackgroundColor3'
			});

			Logo.BackgroundTransparency = 0.300
			Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Logo.BorderSizePixel = 0
			Logo.Position = UDim2.new(0, 5, 0.5, 0)
			Logo.Size = UDim2.new(1, 10, 1, 0)
			Logo.SizeConstraint = Enum.SizeConstraint.RelativeYY
			Logo.ZIndex = 149

			UICorner_2.CornerRadius = UDim.new(0, 3)
			UICorner_2.Parent = Logo

			Frame.Parent = Logo
			Frame.AnchorPoint = Vector2.new(0, 0.5)
			Frame.BackgroundColor3 = Compkiller.Colors.Highlight
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(1, -5, 0.5, 0)
			Frame.Size = UDim2.new(0, 2, 1, 0)
			Frame.ZIndex = 151

			table.insert(Compkiller.Elements.Highlight,{
				Element = Frame,
				Property = "BackgroundColor3"
			});

			CompLogo.Name = Compkiller:_RandomString()
			CompLogo.Parent = Logo
			CompLogo.AnchorPoint = Vector2.new(0.5, 0.5)
			CompLogo.BackgroundTransparency = 1.000
			CompLogo.BorderColor3 = Color3.fromRGB(0, 0, 0)
			CompLogo.BorderSizePixel = 0
			CompLogo.Position = UDim2.new(0.5, -2, 0.5, 0)
			CompLogo.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
			CompLogo.SizeConstraint = Enum.SizeConstraint.RelativeYY
			CompLogo.ZIndex = 159
			CompLogo.Image = Config.Logo
			
			if Compkiller.CustomHighlightMode then
				CompLogo.ImageColor3 = Compkiller.Colors.Highlight;

				table.insert(Compkiller.Elements.Highlight , {
					Element = CompLogo,
					Property = 'ImageColor3'
				});
			end;

			WaternarkList.Name = Compkiller:_RandomString()
			WaternarkList.Parent = Watermark
			WaternarkList.AnchorPoint = Vector2.new(0.5, 0)
			WaternarkList.BackgroundTransparency = 1.000
			WaternarkList.BorderColor3 = Color3.fromRGB(0, 0, 0)
			WaternarkList.BorderSizePixel = 0
			WaternarkList.Position = UDim2.new(0.5, 0, 0, 0)
			WaternarkList.Size = UDim2.new(1, -10, 1, 0)
			WaternarkList.ZIndex = 155
			WaternarkList.ClipsDescendants = true

			UIListLayout.Parent = WaternarkList
			UIListLayout.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
			UIListLayout.Padding = UDim.new(0, 3)

			local BackFrame = Instance.new("Frame")

			BackFrame.Name = Compkiller:_RandomString()
			BackFrame.Parent = Watermark
			BackFrame.AnchorPoint = Vector2.new(1, 0.5)
			BackFrame.BackgroundTransparency = 1.000
			BackFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			BackFrame.BorderSizePixel = 0
			BackFrame.Position = UDim2.new(1, 0, 0.5, 0)
			BackFrame.Size = UDim2.new(1, 30, 1, 0)

			Compkiller:_Blur(BackFrame,Signal);

			UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
				Compkiller:_Animation(Watermark,TweenInfo.new(0.4),{
					Size = UDim2.new(0, UIListLayout.AbsoluteContentSize.X + 8, 0, 23)
				});
			end)

			local Args = {};

			function Args:AddText(Watermark : Watermark)
				Watermark = Compkiller.__CONFIG(Watermark, {
					Text = "Watermark",
					Icon = "info"
				});

				local Icon = Instance.new("ImageLabel")
				local TextLabel = Instance.new("TextLabel")

				Icon.Name = Compkiller:_RandomString()
				Icon.Parent = WaternarkList
				Icon.BackgroundTransparency = 1.000
				Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Icon.BorderSizePixel = 0
				Icon.Size = UDim2.fromOffset(15,15)
				Icon.SizeConstraint = Enum.SizeConstraint.RelativeYY
				Icon.ZIndex = 156
				Icon.Image = Compkiller:_GetIcon(Watermark.Icon);

				TextLabel.Parent = WaternarkList
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel.BorderSizePixel = 0
				TextLabel.Size = UDim2.new(0, 50, 0.699999988, 0)
				TextLabel.ZIndex = 156
				TextLabel.Font = Enum.Font.GothamMedium
				TextLabel.Text = Watermark.Text
				TextLabel.TextColor3 = Compkiller.Colors.SwitchColor
				TextLabel.TextSize = 10.000
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left

				table.insert(Compkiller.Elements.SwitchColor , {
					Element = TextLabel,
					Property = 'TextColor3'
				});

				local Update = function()
					local scale = TextService:GetTextSize(TextLabel.Text,TextLabel.TextSize,TextLabel.Font,Vector2.new(math.huge,math.huge));

					TextLabel.Size = UDim2.new(0, scale.X + 2, 0.7, 0)
				end;

				Update()

				local Arg = {};

				function Arg:SetText(text)
					TextLabel.Text = text;
					Update();
				end;

				function Arg:Visible(v)
					Icon.Visible = v;
					TextLabel.Visible = v;

					if Compkiller.PerformanceMode then
						if v then
							Compkiller:_SetNilP(Icon , WaternarkList);
							Compkiller:_SetNilP(TextLabel , WaternarkList);
						else
							Compkiller:_SetNilP(Icon , nil);
							Compkiller:_SetNilP(TextLabel , nil);
						end;
					else
						Compkiller:_SetNilP(Icon , WaternarkList);
						Compkiller:_SetNilP(TextLabel , WaternarkList);
					end;
				end;

				return Arg;
			end;

			return Args;
		end;

		function WindowArgs:Toggle(Value: boolean)
			if WindowArgs.PerformanceMode then
				MainFrame.Visible = Value;
			end;

			WindowOpen:Fire(Value);

			if Value then
				for i,v in next , WindowArgs.Tabs do
					if v.Root == WindowArgs.SelectedTab then
						v.Remote:Fire(true);
					end;
				end;
			else
				for i,v in next , WindowArgs.Tabs do
					v.Remote:Fire(false);
				end;
			end;
		end;

		function WindowArgs:_ToggleUI()
			WindowArgs.IsOpen = not WindowArgs.IsOpen;

			WindowArgs:Toggle(WindowArgs.IsOpen)
		end;

		local Button = Compkiller:_Input(CloseWindow,function()
			WindowArgs:_ToggleUI()
		end)

		if not Compkiller:_IsMobile() then

			Compkiller:_Hover(Button,function()
				ImageLabel:SetAttribute("Hover",true);
			end , function()
				ImageLabel:SetAttribute("Hover",false);
			end);
		end;

		table.insert(WindowArgs.THREADS,task.spawn(function()
			while true do task.wait(0.15)
				if Compkiller:_IsMobile() then
					ToggleCloseUI(true);

					if WindowArgs.IsOpen then
						Compkiller:_Animation(ImageLabel,TweenInfo.new(0.2),{
							ImageTransparency = 0.35
						});

						ImageLabel:GetAttribute("Hover",false);
					else
						ImageLabel:GetAttribute("Hover",true);

						Compkiller:_Animation(ImageLabel,TweenInfo.new(0.2),{
							ImageTransparency = 0.1
						});
					end;
				else
					if not WindowArgs.IsOpen then
						ToggleCloseUI(true);
					else
						ToggleCloseUI(false);
					end
				end;
			end
		end));

		UserInputService.InputBegan:Connect(function(Input,Typing)
			if not Typing and (Input.KeyCode == Config.Keybind or Input.KeyCode.Name == Config.Keybind) then
				WindowArgs:_ToggleUI()
			end;
		end);
	end;

	function WindowArgs:SetMenuKey(new: string | Enum.KeyCode)
		Config.Keybind = new;
	end;

	function WindowArgs:Update(config: WindowUpdate)
		config = config or {};
		config.Logo = config.Logo or Config.Logo;
		config.Username = config.Username or LocalPlayer.DisplayName;
		config.ExpireDate = config.ExpireDate or "NEVER";
		config.WindowName = config.WindowName or Config.Name;
		config.UserProfile = config.UserProfile or WindowArgs.Profile or string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150",tostring(LocalPlayer.UserId));

		if Compkiller.SecureMode and string.find(config.UserProfile, "rbxassetid://",1,true) then
			config.UserProfile = Compkiller:_GetIcon("user");
		end;

		UserText.Text = config.Username;
		CompLogo.Image = config.Logo;
		ExpireText.Text = config.ExpireDate;
		WindowLabel.Text = config.WindowName;
		UserProfile.Image = config.UserProfile;
		WindowArgs.Username = config.Username;

		Config.Logo = config.Logo or Config.Logo;
		WindowArgs.Username = config.Username or WindowArgs.Username;
		WindowArgs.ExipreDate = config.ExpireDate or WindowArgs.ExipreDate;
		Config.Name = config.WindowName or Config.Name;
		WindowArgs.Profile = config.UserProfile or WindowArgs.Profile;
	end;

	WindowArgs.LOOP_THREAD = task.spawn(function()
		local TimeTic = tick();

		local BlurElement = Instance.new("Frame")

		BlurElement.Name = Compkiller:_RandomString()
		BlurElement.Parent = MainFrame
		BlurElement.AnchorPoint = Vector2.new(1, 0.5)
		BlurElement.BackgroundTransparency = 1.000
		BlurElement.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BlurElement.BorderSizePixel = 0
		BlurElement.Position = UDim2.new(1, -5, 0.5, 0)
		BlurElement.Size = UDim2.new(1, 0, 1, 0)
		BlurElement.ZIndex = -100
		BlurElement.Active = true

		Compkiller:_Blur(BlurElement , WindowOpen);

		local MovementFrame = Instance.new("Frame")

		MovementFrame.Name = Compkiller:_RandomString()
		MovementFrame.Parent = MainFrame
		MovementFrame.AnchorPoint = Vector2.new(1, 0.5)
		MovementFrame.BackgroundTransparency = 1.000
		MovementFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		MovementFrame.BorderSizePixel = 0
		MovementFrame.Position = UDim2.new(1, 0, 0.5, 0)
		MovementFrame.Size = UDim2.new(1, 0, 1, 0)
		MovementFrame.ZIndex = 9

		Compkiller:Drag(MovementFrame,MainFrame,0.1)

		SelectionFrame.Position = UDim2.new(1, 5, 0, 28)
		SelectionFrame.Size = UDim2.new(0, 8, 0, 22)

		table.insert(Compkiller.Elements.Highlight,{
			Element = SelectionFrame,
			Property = "BackgroundColor3"
		});

		while true do task.wait(0.01);
			BlurElement.Size = UDim2.new(1, TabFrame.AbsoluteSize.X - 35, 1, 0);
			MovementFrame.Size = UDim2.new(1, TabFrame.AbsoluteSize.X - 35, 1, 0);

			SelectionFrame.BackgroundColor3 = Compkiller.Colors.Highlight;

			if WindowArgs.SelectedTab and WindowArgs.IsOpen then
				local vili = -(TabButtons.AbsolutePosition.Y - WindowArgs.SelectedTab.AbsolutePosition.Y) + 4;
				local distance = (SelectionFrame.Position.Y.Offset - vili);

				if vili < 0 or vili > TabButtons.AbsoluteSize.Y then
					Compkiller:_Animation(SelectionFrame , TweenInfo.new(0.1) , {
						BackgroundTransparency = 1
					});
				else
					if math.abs(distance) <= 10 then
						Compkiller:_Animation(SelectionFrame , TweenInfo.new(0.1) , {
							BackgroundTransparency = 0
						});

						SelectionFrame.Position = UDim2.new(1,5,0,math.ceil(vili));
					else
						Compkiller:_Animation(SelectionFrame , TweenInfo.new(0.15) , {
							BackgroundTransparency = 0,
							Position = UDim2.new(1,5,0,math.ceil(vili))
						});
					end;
				end;
			else
				Compkiller:_Animation(SelectionFrame , TweenInfo.new(0.15) , {
					BackgroundTransparency = 1
				});
			end;

			if WindowArgs.AlwayShowTab then
				TabHover:Fire(true);
			end;
		end;
	end);

	WindowArgs:Update();

	local OldDelayThread;
	local DurationTime = tick();

	Compkiller:_Hover(TabFrame , function()
		if OldDelayThread then
			task.cancel(OldDelayThread);
			OldDelayThread = nil;
		end;

		if WindowArgs.AlwayShowTab then
			return;
		end;

		DurationTime = tick();

		TabHover:Fire(true);
	end , function()
		if OldDelayThread then
			task.cancel(OldDelayThread);
			OldDelayThread = nil;
		end;

		if WindowArgs.AlwayShowTab then
			return;
		end;

		OldDelayThread = task.delay(math.clamp((tick() - DurationTime) , 0.01,5),function()
			if TabHover:GetValue() then
				TabHover:Fire(false);
			end
		end);
	end);

	return WindowArgs;
end;

function Compkiller:GetDate(Time)
	Time = Time or tick();

	local val = os.date('*t',Time);

	return string.format("%s/%s/%s",val.day,val.month,val.year);
end;

function Compkiller:GetTimeNow(Time)
	Time = Time or tick();

	local val = os.date('*t',Time);

	return string.format("%s:%s:%s",val.hour,val.min,val.sec);
end;

function Compkiller:GetConfig(Type: string)
	local ConfigFlags = {};

	for i,v in next , Compkiller.Flags do
		local Value = v:GetValue();
		local Suf = {};

		if typeof(Value) == "table" and Value.ColorPicker and typeof(Value.ColorPicker) == 'table' then
			Suf.Color3 = {
				R = Value.ColorPicker.Color.R,
				G = Value.ColorPicker.Color.G,
				B = Value.ColorPicker.Color.B
			};

			Suf.Transparency = Value.ColorPicker.Transparency;

			Suf.Type = "ColorPicker";
		else
			Suf.Value = Value;
			Suf.Type = "NormalElement";
		end;

		if Type == "KV" then
			ConfigFlags[v.Flag] = {
				Flag = v.Flag,
				Value = Suf,
				Functions = v,
				AutoKeybind = (v.AutoKeybind and v.AutoKeybind:GetSettings());
			}
		elseif Type == "MK" then
			ConfigFlags[v.Flag] = {
				Flag = v.Flag,
				Value = Suf,
				AutoKeybind = (v.AutoKeybind and v.AutoKeybind:GetSettings());
			}
		else
			table.insert(ConfigFlags , {
				Flag = v.Flag,
				Value = Suf,
				AutoKeybind = (v.AutoKeybind and v.AutoKeybind:GetSettings());
			})
		end;
	end;

	return ConfigFlags;
end;

function Compkiller:_Path(...)
	local args = {...};

	return table.concat(args, "/");
end;

function Compkiller:ConfigManager(ConfigManager: ConfigManager) : ConfigFunctions
	ConfigManager = Compkiller.__CONFIG(ConfigManager , {
		Directory = "Compkiller",
		Config = "Software"
	});

	if not isfolder(ConfigManager.Directory) then
		makefolder(ConfigManager.Directory);
	end;

	if not isfolder(Compkiller:_Path(ConfigManager.Directory , ConfigManager.Config)) then
		makefolder(Compkiller:_Path(ConfigManager.Directory , ConfigManager.Config));
	end;

	local Args = {
		Directory = Compkiller:_Path(ConfigManager.Directory , ConfigManager.Config);
		EnableNotify = false,
	};

	local notify = Compkiller.newNotify();

	function Args:WriteConfig(Config: WriteConfig)
		Config = Compkiller.__CONFIG(Config , {
			Name = Compkiller:_RandomString(),
			Author = LocalPlayer.Name,
		});

		local Flags = Compkiller:GetConfig("MK");

		Flags["__INFORMATION"] = {
			Type = "Information",
			Author = Config.Author,
			Name = Config.Name,
			CreatedDate = Compkiller:GetDate()
		};

		if Args.EnableNotify then
			notify.new({
				Title = "Configs",
				Icon = Compkiller:_GetIcon('settings'),
				Content = "Create config \""..Config.Name.."\""
			})
		end

		writefile(Compkiller:_Path(Args.Directory , Config.Name) , HttpService:JSONEncode(Flags));
	end;

	function Args:LoadConfigFromString(str: string)
		local decoded = HttpService:JSONDecode(str);

		local Flags = Compkiller:GetConfig("KV");

		for i,v in next , decoded do
			if v and v.Flag then

				local Value = Flags[v.Flag];

				if Value then

					if v.Value.Type == "NormalElement" then
						Value.Functions:SetValue(v.Value.Value);

					elseif v.Value.Type == "ColorPicker" then

						local Color = Color3.new(v.Value.Color3.R,v.Value.Color3.G,v.Value.Color3.B);

						local Transparency = v.Value.Transparency;

						Value.Functions:SetValue(Color , Transparency);
					end;
				end;
			end
		end;
	end;

	function Args:GetCurrentConfig()
		return Compkiller:GetConfig("MK")
	end;

	function Args:ReadInfo(ConfigName: string)
		local _path = Compkiller:_Path(Args.Directory , ConfigName);

		if isfile(_path) then
			local info = readfile(_path);

			local decoded = HttpService:JSONDecode(info);

			return decoded.__INFORMATION;
		end;

		return false;
	end;

	function Args:GetConfigs()
		local names = {};

		for i,v in next , listfiles(Args.Directory) do
			local Name = string.sub(v , #Args.Directory + 2);

			table.insert(names , Name);
		end;

		return names;
	end;

	function Args:GetFullConfigs()
		local names = {};

		for i,v in next , listfiles(Args.Directory) do
			local Name = string.sub(v , #Args.Directory + 2);
			local Info = Args:ReadInfo(Name);

			table.insert(names , {
				Name = Name,
				Info = Info,
			});
		end;

		return names;
	end;

	function Args:DeleteConfig(ConfigName)
		local _path = Compkiller:_Path(Args.Directory,ConfigName);

		if Args.EnableNotify then
			notify.new({
				Title = "Configs",
				Icon = Compkiller:_GetIcon('settings'),
				Content = "Delete config \""..ConfigName.."\""
			})
		end

		if isfile(_path) then
			delfile(_path);
		end;
	end;

	function Args:GetConfigCount()
		return #listfiles(Args.Directory);
	end;

	function Args:LoadConfig(ConfigName: string)
		local _path = Compkiller:_Path(Args.Directory,ConfigName);

		if isfile(_path) then
			local info = readfile(_path);

			local decoded = HttpService:JSONDecode(info);

			local Flags = Compkiller:GetConfig("KV");

			if Args.EnableNotify then
				notify.new({
					Title = "Configs",
					Icon = Compkiller:_GetIcon('settings'),
					Content = "Load config \""..ConfigName.."\""
				})
			end

			for i,v in next , decoded do
				if v and v.Flag then

					local Value = Flags[v.Flag];

					if Value then

						if v.Value.Type == "NormalElement" then
							Value.Functions:SetValue(v.Value.Value);

						elseif v.Value.Type == "ColorPicker" then

							local Color = Color3.new(v.Value.Color3.R,v.Value.Color3.G,v.Value.Color3.B);

							local Transparency = v.Value.Transparency;

							Value.Functions:SetValue(Color , Transparency);
						end;

						if Value.Functions.AutoKeybind then
							if v.AutoKeybind then
								Value.Functions.AutoKeybind:LoadSettings(v.AutoKeybind)
							end;
						end;
					end;
				end
			end;
		end;
	end;

	return Args;
end;

function Compkiller:Loader(IconId,Duration)
	local CompKiller = Instance.new("ScreenGui")

	CompKiller.Name = Compkiller:_RandomString()
	CompKiller.Parent = CoreGui
	CompKiller.Enabled = true
	CompKiller.ResetOnSpawn = false
	CompKiller.IgnoreGuiInset = true
	CompKiller.ZIndexBehavior = Enum.ZIndexBehavior.Global

	local Loader = Instance.new("Frame")
	local Icon = Instance.new("ImageLabel")
	local Vignette = Instance.new("ImageLabel")

	Loader.Name = Compkiller:_RandomString()
	Loader.Parent = CompKiller
	Loader.AnchorPoint = Vector2.new(0.5, 0.5)
	Loader.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Loader.BackgroundTransparency = 1
	Loader.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Loader.BorderSizePixel = 0
	Loader.Position = UDim2.new(0.5, 0, 0.5, 0)
	Loader.Size = UDim2.new(1, 0, 1, 0)

	Icon.Name = Compkiller:_RandomString()
	Icon.Parent = Loader
	Icon.AnchorPoint = Vector2.new(0.5, 0.5)
	Icon.BackgroundTransparency = 1.000
	Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Icon.BorderSizePixel = 0
	Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
	Icon.Size = UDim2.new(0, 750, 0, 750)
	Icon.ZIndex = 100
	Icon.Image = IconId or Compkiller.Logo;
	Icon.ImageTransparency = 1

	Vignette.Name = Compkiller:_RandomString()
	Vignette.Parent = Loader
	Vignette.BackgroundTransparency = 1.000
	Vignette.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Vignette.BorderSizePixel = 0
	Vignette.Size = UDim2.new(1, 0, 1, 0)
	Vignette.Image = Compkiller:CacheImage("rbxassetid://18720640102")
	Vignette.ImageColor3 = Compkiller.Colors.Highlight
	Vignette.ImageTransparency = 1
	Vignette.AnchorPoint = Vector2.new(0.5,0.5)
	Vignette.Position = UDim2.fromScale(0.5,0.5)

	Compkiller:_Animation(Loader,TweenInfo.new(0.55,Enum.EasingStyle.Quint),{
		BackgroundTransparency = 0.5
	});

	local Event = Instance.new('BindableEvent');

	task.delay(0.5,function()
		Compkiller:_Animation(Icon,TweenInfo.new(0.75,Enum.EasingStyle.Quint),{
			ImageTransparency = 0.01,
			Size = UDim2.new(0, 200, 0, 200)
		});

		task.delay(0.25,function()
			Compkiller:_Animation(Vignette,TweenInfo.new(5),{
				ImageTransparency = 0.2
			});

			task.wait(Duration or 4.5)

			Compkiller:_Animation(Vignette,TweenInfo.new(3,Enum.EasingStyle.Quint,Enum.EasingDirection.InOut),{
				Size = UDim2.new(2, 0, 2, 0)
			});

			Compkiller:_Animation(Icon,TweenInfo.new(0.75,Enum.EasingStyle.Quint,Enum.EasingDirection.InOut),{
				ImageTransparency = 1,
			});

			Compkiller:_Animation(Loader,TweenInfo.new(1.5,Enum.EasingStyle.Quint,Enum.EasingDirection.InOut),{
				BackgroundTransparency = 1
			});

			task.delay(0.1,function()
				Compkiller:_Animation(Vignette,TweenInfo.new(1,Enum.EasingStyle.Quint,Enum.EasingDirection.InOut),{
					ImageTransparency = 1
				});

				task.wait(0.2)

				task.delay(3,function()
					CompKiller:Destroy();
				end)
			end)

			task.delay(0.6,function()
				Event:Fire();
			end)
		end)
	end);

	return {
		yield = function()
			return Event.Event:Wait();
		end	
	};
end;

function Compkiller.newNotify()
	if Compkiller.NOTIFY_CACHE then
		return Compkiller.NOTIFY_CACHE;
	end;

	local Notification = Instance.new("ScreenGui")
	local NotifyContainer = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	Notification.Name = Compkiller:_RandomString()
	Notification.Parent = CoreGui;
	Notification.ResetOnSpawn = false
	Notification.ZIndexBehavior = Enum.ZIndexBehavior.Global

	NotifyContainer.Name = Compkiller:_RandomString()
	NotifyContainer.Parent = Notification
	NotifyContainer.AnchorPoint = Vector2.new(1, 0)
	NotifyContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NotifyContainer.BackgroundTransparency = 1.000
	NotifyContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NotifyContainer.BorderSizePixel = 0
	NotifyContainer.Position = UDim2.new(1, -10, 0, 1)
	NotifyContainer.Size = UDim2.new(0, 100, 0, 100)

	UIListLayout.Parent = NotifyContainer
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 3)

	local LayoutREF = 0;

	Compkiller.NOTIFY_CACHE = {
		new = function(Notify: Notify) : NotifyPayback
			Notify = Compkiller.__CONFIG(Notify, {
				Icon = Compkiller.Logo,
				Title = "Notification",
				Content = "Content",
				Duration = 3,
			});

			LayoutREF -= 5;

			local BlockFrame = Instance.new("Frame")
			local NotifyFrame = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local CompLogo = Instance.new("ImageLabel")
			local Header = Instance.new("TextLabel")
			local Body = Instance.new("TextLabel")
			local TimeLeftFrame = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local TimeLeft = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")

			BlockFrame.Name = Compkiller:_RandomString()
			BlockFrame.Parent = NotifyContainer
			BlockFrame.AnchorPoint = Vector2.new(1, 0)
			BlockFrame.BackgroundColor3 = Compkiller.Colors.BGDBColor
			BlockFrame.BackgroundTransparency = 1.000
			BlockFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			BlockFrame.BorderSizePixel = 0
			BlockFrame.ClipsDescendants = false
			BlockFrame.Size = UDim2.new(0, 200, 0, 0)
			BlockFrame.LayoutOrder = LayoutREF;


			NotifyFrame.Name = Compkiller:_RandomString()
			NotifyFrame.Parent = BlockFrame
			NotifyFrame.BackgroundColor3 = Compkiller.Colors.BGDBColor
			NotifyFrame.BackgroundTransparency = 0.100
			NotifyFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			NotifyFrame.BorderSizePixel = 0
			NotifyFrame.ClipsDescendants = false
			NotifyFrame.Size = UDim2.new(1, 0, 1, -5)
			NotifyFrame.ZIndex = 2
			NotifyFrame.Position = UDim2.new(1,200,0,0)


			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = NotifyFrame

			CompLogo.Name = Compkiller:_RandomString()
			CompLogo.Parent = NotifyFrame
			CompLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			CompLogo.BackgroundTransparency = 1.000
			CompLogo.BorderColor3 = Color3.fromRGB(0, 0, 0)
			CompLogo.BorderSizePixel = 0
			CompLogo.Position = UDim2.new(0, 6, 0, 6)
			CompLogo.Size = UDim2.new(0, 25, 0, 25)
			CompLogo.ZIndex = 4

			if string.find(Notify.Icon,'cache-ck-',1,true) then	
				CompLogo.Image = Notify.Icon;
			else
				CompLogo.Image = Compkiller:_GetIcon(Notify.Icon);
			end;

			if Compkiller.CustomHighlightMode then
				CompLogo.ImageColor3 = Compkiller.Colors.Highlight;
			end;
			
			Header.Name = Compkiller:_RandomString()
			Header.Parent = NotifyFrame
			Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Header.BackgroundTransparency = 1.000
			Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Header.BorderSizePixel = 0
			Header.Position = UDim2.new(0, 40, 0, 10)
			Header.Size = UDim2.new(1, -50, 0, 15)
			Header.ZIndex = 3
			Header.Font = Enum.Font.GothamBold
			Header.Text = Notify.Title
			Header.TextColor3 = Compkiller.Colors.SwitchColor
			Header.TextSize = 14.000
			Header.TextXAlignment = Enum.TextXAlignment.Left

			Body.Name = Compkiller:_RandomString()
			Body.Parent = NotifyFrame
			Body.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Body.BackgroundTransparency = 1.000
			Body.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Body.BorderSizePixel = 0
			Body.Position = UDim2.new(0, 10, 0, 33)
			Body.Size = UDim2.new(1, -15, 0, 30)
			Body.ZIndex = 3
			Body.Font = Enum.Font.GothamMedium
			Body.Text = Notify.Content
			Body.TextColor3 = Compkiller.Colors.SwitchColor
			Body.TextSize = 12.000
			Body.TextTransparency = 0.500
			Body.TextXAlignment = Enum.TextXAlignment.Left
			Body.TextYAlignment = Enum.TextYAlignment.Top

			TimeLeftFrame.Name = Compkiller:_RandomString()
			TimeLeftFrame.Parent = NotifyFrame
			TimeLeftFrame.AnchorPoint = Vector2.new(0, 1)
			TimeLeftFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TimeLeftFrame.BackgroundTransparency = 1.000
			TimeLeftFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TimeLeftFrame.BorderSizePixel = 0
			TimeLeftFrame.Position = UDim2.new(0, 0, 1, 1)
			TimeLeftFrame.Size = UDim2.new(1, 0, 0, 5)
			TimeLeftFrame.ZIndex = 5

			UICorner_2.CornerRadius = UDim.new(0, 4)
			UICorner_2.Parent = TimeLeftFrame

			TimeLeft.Name = Compkiller:_RandomString()
			TimeLeft.Parent = TimeLeftFrame
			TimeLeft.BackgroundColor3 = Compkiller.Colors.Highlight
			TimeLeft.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TimeLeft.BorderSizePixel = 0
			TimeLeft.Size = UDim2.new(0, 0, 1, 0)
			TimeLeft.ZIndex = 5

			UICorner_3.CornerRadius = UDim.new(0, 1)
			UICorner_3.Parent = TimeLeft

			local UpdateText = function()
				local TitleScale = TextService:GetTextSize(Header.Text,Header.TextSize,Header.Font,Vector2.new(math.huge,math.huge));
				local BodyScale = TextService:GetTextSize(Body.Text,Body.TextSize,Body.Font,Vector2.new(math.huge,math.huge));

				local MainX = (TitleScale.X >= BodyScale.X and TitleScale.X) or BodyScale.X;
				local MainY = TitleScale.Y + ((Body.Text:byte() and BodyScale.Y) or 1);

				if BlockFrame:GetAttribute('Already') then
					Compkiller:_Animation(BlockFrame,TweenInfo.new(0.3),{
						Size = UDim2.new(0,MainX + 55,0,MainY + 35)
					});
				else
					BlockFrame:SetAttribute('Already',true)
					BlockFrame.Size = UDim2.new(0, MainX + 45, 0, 0);

					Compkiller:_Animation(BlockFrame,TweenInfo.new(0.3),{
						Size = UDim2.new(0,MainX + 55,0,MainY + 35)
					});
				end;
			end;

			UpdateText();

			local Close = function()
				Compkiller:_Animation(NotifyFrame,TweenInfo.new(0.65,Enum.EasingStyle.Quint),{
					Position = UDim2.new(1,200,0,0)
				});

				task.wait(0.3);

				Compkiller:_Animation(BlockFrame,TweenInfo.new(0.3),{
					Size = UDim2.new(1,0,0,0)
				});

				task.wait(0.35)
				BlockFrame:Destroy();

			end;

			local Show = function()
				Compkiller:_Animation(NotifyFrame,TweenInfo.new(0.5,Enum.EasingStyle.Quint),{
					Position = UDim2.new(0,0,0,0)
				});
			end;

			if typeof(Notify.Duration) == 'number' and Notify.Duration ~= math.huge then
				Compkiller:_Animation(TimeLeft,TweenInfo.new(Notify.Duration + 0.2,Enum.EasingStyle.Linear),{
					Size = UDim2.new(1, 0, 1, 0)
				});

				return task.delay(0.25,function()
					Show();

					task.delay(Notify.Duration + 0.2,Close)
				end);
			end;

			Show();

			return {
				Title = function(self , new)
					Header.Text = new;
					UpdateText(); 
				end,

				Content = function(self , new)
					Body.Text = new;
					UpdateText();
				end,

				SetProgress = function(self , new , Time)
					if Time and Time <= 0 then
						TimeLeft.Size = UDim2.new(new, 0, 1, 0);

						UpdateText();
						return;
					end;

					if new > 1 then
						new = (new / 100);	
					end;

					Compkiller:_Animation(TimeLeft,TweenInfo.new(Time or 0.85,(Time and Enum.EasingStyle.Linear) or Enum.EasingStyle.Quint),{
						Size = UDim2.new(new, 0, 1, 0)
					});

					UpdateText();
				end,

				Close = Close,
			}
		end,
	};

	return Compkiller.NOTIFY_CACHE;
end;

Compkiller.NilFolder.Name = "Nil-Instances";

return Compkiller;
