return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 22,
  height = 26,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 14,
  nextobjectid = 46,
  properties = {
    ["light"] = true,
    ["music"] = "steamworks_overworld"
  },
  tilesets = {
    {
      name = "steamworks_objects_big",
      firstgid = 1,
      filename = "../../../tilesets/steamworks_objects_big.tsx",
      exportfilename = "../../../tilesets/steamworks_objects_big.lua"
    },
    {
      name = "steamworks_objects",
      firstgid = 44,
      filename = "../../../tilesets/steamworks_objects.tsx",
      exportfilename = "../../../tilesets/steamworks_objects.lua"
    }
  },
  layers = {
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 10,
      name = "objects_bg",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 35,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1040,
          width = 880,
          height = 1040,
          rotation = 0,
          gid = 2,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 11,
      name = "objects_bg_light",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 36,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1040,
          width = 880,
          height = 1040,
          rotation = 0,
          gid = 3,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 13,
      name = "objects",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 38,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 256,
          width = 874,
          height = 256,
          rotation = 0,
          gid = 5,
          visible = true,
          properties = {}
        },
        {
          id = 39,
          name = "",
          type = "",
          shape = "rectangle",
          x = 366,
          y = 118,
          width = 148,
          height = 30,
          rotation = 0,
          gid = 57,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "objects_party",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 346,
          y = 1018,
          width = 188,
          height = 22,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "steamworks/03",
            ["marker"] = "up"
          }
        },
        {
          id = 2,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 366,
          y = 0,
          width = 148,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "steamworks/05",
            ["marker"] = "down"
          }
        },
        {
          id = 3,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 880,
          y = 480,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "steamworks/04_transition_c",
            ["marker"] = "left"
          }
        },
        {
          id = 4,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = -40,
          y = 480,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "steamworks/04_transition_b",
            ["marker"] = "right"
          }
        },
        {
          id = 30,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 428,
          y = 622,
          width = 78,
          height = 90,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text1"] = "* (The generator is working\novertime to provide power.)"
          }
        },
        {
          id = 40,
          name = "stw_generator",
          type = "",
          shape = "point",
          x = 428,
          y = 514,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 12,
      name = "objects_overlay",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 37,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1040,
          width = 880,
          height = 342,
          rotation = 0,
          gid = 4,
          visible = true,
          properties = {}
        },
        {
          id = 44,
          name = "stw_steampipe",
          type = "",
          shape = "point",
          x = 58,
          y = 716,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["type"] = 4
          }
        },
        {
          id = 45,
          name = "stw_steampipe",
          type = "",
          shape = "point",
          x = 0,
          y = 600,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["type"] = 5
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "collision",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 880,
          y = 600,
          width = 40,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 880,
          y = 360,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = -40,
          y = 600,
          width = 40,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = -40,
          y = 360,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 514,
          y = 0,
          width = 40,
          height = 138,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 326,
          y = 0,
          width = 40,
          height = 138,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "polygon",
          x = 0,
          y = 374,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 366, y = -236 },
            { x = 0, y = -234 }
          },
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "polygon",
          x = 880.043,
          y = 373.957,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -366.106, y = -236.019 },
            { x = -0.0434783, y = -233.957 }
          },
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "polygon",
          x = 880,
          y = 1040,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0.0625, y = -306.063 },
            { x = -346.091, y = -22 },
            { x = -360, y = 0 }
          },
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "polygon",
          x = 0,
          y = 1040,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = -306.043 },
            { x = 345.938, y = -22 },
            { x = 360, y = 0 }
          },
          properties = {}
        },
        {
          id = 19,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 188,
          width = 78,
          height = 136,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 228,
          y = 124,
          width = 78,
          height = 138,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 574,
          y = 122,
          width = 78,
          height = 138,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = 674,
          y = 186,
          width = 78,
          height = 136,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "",
          type = "",
          shape = "rectangle",
          x = 506,
          y = 618,
          width = 74,
          height = 74,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "",
          type = "",
          shape = "rectangle",
          x = 506,
          y = 692,
          width = 20,
          height = 6,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "",
          type = "",
          shape = "rectangle",
          x = 362,
          y = 618,
          width = 66,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "",
          type = "",
          shape = "rectangle",
          x = 226,
          y = 572,
          width = 410,
          height = 46,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "markers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 5,
          name = "up",
          type = "",
          shape = "point",
          x = 440,
          y = 80,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "down",
          type = "",
          shape = "point",
          x = 440,
          y = 978,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "right",
          type = "",
          shape = "point",
          x = 840,
          y = 540,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "left",
          type = "",
          shape = "point",
          x = 40,
          y = 540,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "spawn",
          type = "",
          shape = "point",
          x = 440,
          y = 760,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
