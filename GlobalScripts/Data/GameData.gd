extends Resource
class_name GameData

##Resource for all permanent data. Change the version if you add/remove/change variables.

@export var version : String = Const.gameDataVersion
##Indicates if a YesNoMessage has been shown for controller.
@export var askedUsingControllerMsg : bool = false
##Enables/disables controller.
@export var usingController : bool = false
@export var controllerVibration : bool = true

#region Settings
#region Mouse
@export var cameraSensitivity  : float = 3.0
#endregion
#region Crosshair
@export var crossColor : Color = Color.BLACK
@export var invertedColors : bool = false
@export_range(0.0, 1.0) var crossOpacity : float = 0.8
##In pixels
@export_range(1, 10) var crossWidth : float = 4.0
##In pixels
@export_range(1, 40) var crossLength : float = 20.0
#endregion
#region Volume
@export var mainVol : float
@export var musicVol : float
@export var sfxVol : float
#endregion
#endregion
