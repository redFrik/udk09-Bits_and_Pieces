{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 5,
			"minor" : 1,
			"revision" : 9
		}
,
		"rect" : [ 595.0, 155.0, 461.0, 505.0 ],
		"bglocked" : 0,
		"defrect" : [ 595.0, 155.0, 461.0, 505.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 9.0,
		"default_fontface" : 0,
		"default_fontname" : "Monaco",
		"gridonopen" : 0,
		"gridsize" : [ 10.0, 10.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "slider",
					"presentation_rect" : [ 348.0, 295.0, 0.0, 0.0 ],
					"patching_rect" : [ 350.0, 300.0, 20.0, 140.0 ],
					"floatoutput" : 1,
					"size" : 9000.0,
					"numinlets" : 1,
					"id" : "obj-27",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"patching_rect" : [ 250.0, 330.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-25",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "change",
					"fontsize" : 14.0,
					"patching_rect" : [ 250.0, 300.0, 67.0, 25.0 ],
					"numinlets" : 1,
					"id" : "obj-23",
					"fontname" : "Monaco",
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"presentation_rect" : [ 165.0, 300.0, 0.0, 0.0 ],
					"patching_rect" : [ 170.0, 300.0, 20.0, 140.0 ],
					"floatoutput" : 1,
					"size" : 1.0,
					"numinlets" : 1,
					"id" : "obj-21",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"patching_rect" : [ 80.0, 300.0, 20.0, 140.0 ],
					"floatoutput" : 1,
					"size" : 9000.0,
					"numinlets" : 1,
					"id" : "obj-20",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "centroid",
					"fontsize" : 14.0,
					"presentation_rect" : [ 428.0, 208.0, 0.0, 0.0 ],
					"patching_rect" : [ 300.0, 140.0, 78.0, 25.0 ],
					"numinlets" : 1,
					"id" : "obj-18",
					"fontname" : "Monaco",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"fontsize" : 14.0,
					"presentation_rect" : [ 348.0, 208.0, 0.0, 0.0 ],
					"patching_rect" : [ 220.0, 140.0, 72.0, 25.0 ],
					"numinlets" : 1,
					"id" : "obj-19",
					"fontname" : "Monaco",
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "onset index",
					"fontsize" : 14.0,
					"presentation_rect" : [ 375.0, 309.0, 0.0, 0.0 ],
					"patching_rect" : [ 240.0, 170.0, 103.0, 25.0 ],
					"numinlets" : 1,
					"id" : "obj-14",
					"fontname" : "Monaco",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"fontsize" : 14.0,
					"patching_rect" : [ 170.0, 170.0, 64.0, 25.0 ],
					"numinlets" : 1,
					"id" : "obj-15",
					"fontname" : "Monaco",
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "amplitude",
					"fontsize" : 14.0,
					"patching_rect" : [ 200.0, 200.0, 86.0, 25.0 ],
					"numinlets" : 1,
					"id" : "obj-8",
					"fontname" : "Monaco",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"fontsize" : 14.0,
					"patching_rect" : [ 120.0, 200.0, 72.0, 25.0 ],
					"numinlets" : 1,
					"id" : "obj-9",
					"fontname" : "Monaco",
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "pitch",
					"fontsize" : 14.0,
					"patching_rect" : [ 160.0, 240.0, 53.0, 25.0 ],
					"numinlets" : 1,
					"id" : "obj-7",
					"fontname" : "Monaco",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"fontsize" : 14.0,
					"patching_rect" : [ 80.0, 240.0, 72.0, 25.0 ],
					"numinlets" : 1,
					"id" : "obj-5",
					"fontname" : "Monaco",
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack f f i f",
					"fontsize" : 14.0,
					"patching_rect" : [ 80.0, 100.0, 128.0, 25.0 ],
					"numinlets" : 1,
					"id" : "obj-3",
					"fontname" : "Monaco",
					"numoutlets" : 4,
					"outlettype" : [ "float", "float", "int", "float" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /data",
					"fontsize" : 14.0,
					"patching_rect" : [ 80.0, 70.0, 103.0, 25.0 ],
					"numinlets" : 1,
					"id" : "obj-2",
					"fontname" : "Monaco",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpreceive 9000",
					"fontsize" : 14.0,
					"patching_rect" : [ 80.0, 40.0, 137.0, 25.0 ],
					"numinlets" : 1,
					"id" : "obj-1",
					"fontname" : "Monaco",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 3 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 2 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 1 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
