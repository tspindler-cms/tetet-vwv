declare_loadout({
  category = CAT_PODS,
  CLSID = "f8_pilot",

  attribute = {wsType_Weapon, wsType_GContainer, wsType_Control_Cont,WSTYPE_PLACEHOLDER},
  Picture = "f8_pilot.png",
  displayName = "Pilot",
  Cx_pil = 0.001708984375,
  Weight = 35+20,
  
  shape_table_data = 
  		{
  			{
  				name 	= "f8_pilot",
  				file	= "f8_pilot";
  				life	= 1;
  				fire	= { 0, 1};
  				username	= "f8_pilot";
  				index	= WSTYPE_PLACEHOLDER;
			},
        },
  Elements = {
    {
      Position = {0.00, 0.00, 0.00},
      ShapeName = "f8_pilot",
    },
    	     },
})



