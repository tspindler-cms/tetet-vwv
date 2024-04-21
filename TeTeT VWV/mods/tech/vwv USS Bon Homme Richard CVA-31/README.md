# Essex class carrier CVA-31 Bon Homme Richard for DCS.

This mod is released under the Creative Commons Attribution-NonCommercial-ShareAlike license, see LICENSE.md for details

The model is based on a mod by karla for IL-2 1946: https://www.sas1946.com/main/index.php/topic,46424.0.html

It has been brought to Arma 3 by NightIntruder and myself: https://steamcommunity.com/sharedfiles/filedetails/?id=2536035098

* Odyseus has updated the original model and develops it further.
* TheSn4k3 provided the catapult shuttle and wire.
* ColeMinor supplied the lights textures.
* NodUnit for numerous modeling and texturing advice.

Thanks to Joey45, Admiral189, Tobsen and Hawkeye60 for all the help and advice on getting this boat afloat in DCS.

Thanks to Sidekick65 for the screenshots, check out his youtube channel at https://www.youtube.com/@Sidekick65

Final thanks to Citizen, seabat, toan, Zabbie, and Beldin, testers and contributors of the mod.

The carrier will be published in the Vietnam War Vessels mod, https://github.com/tspindler-cms/tetet-vwv


## HOWTO use alternate deck layouts

In the Database directory there are three different layouts for planes taking off and parking on the flight deck:

* EssexRunwaysAndRoutes.lua - the default layout for any type of carrier plane, plenty of space around planes
* EssexRunwaysAndRoutes24.lua - tight configuration for 12 A-4 and 12 F-8. The A-4s need to be placed first
* EssexRunwaysAndRoutes36.lua - tight configuration for up 36 planes, either A-4 or F-8, the last 8 should be A-4s

You need to save the original EssexRunwaysAndRoutes.lua and copy either EssexRunwaysAndRoutes24.lua or EssexRunwaysAndRoutes36.lua to EssexRunwaysAndRoutes.lua to use them.

Kudos to Beldin for going the extra mile with those deck layouts!

References:
* https://en.wikipedia.org/wiki/USS_Bon_Homme_Richard_(CV-31) 
* https://commons.wikimedia.org/wiki/Category:USS_Bon_Homme_Richard_(CV-31)
* https://www.navsource.org/archives/02/31.htm
* https://www.navysite.de/cv/cv31.htm
* http://www.gonavy.jp/CV-CV31f.html
* https://www.seaforces.org/usnships/cv/CV-31-USS-Bon-Homme-Richard.htm


KNOWN ISSUES
* The collision shell is not optimized
* The island has gaps in between meshes
* The trail marking is suspended in thin air
* The IFLOLS is not fully operational
* The AA guns are not working
* BDA between CVA-31 and planes happen all times on launch and landing
