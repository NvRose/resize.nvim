<p align="center">
    <img width=250 src=https://user-images.githubusercontent.com/93622468/199302147-ef457867-30e1-49e3-be68-555fb071c9c9.png>
</p>

<h3 align=center> NvRose/base - resize </h3>

<p align=center>
    The plugin is part of NvRose base.
</p><br><br>

### Usage
```lua
local resize = require("NvRose.base.resize")

map("n", "<c-s-h>", function()
	resize.left(1) --[[ argument means: resize by n columns. ]]
end)
map("n", "<c-s-j>", function()
	resize.down(1)
end)
map("n", "<c-s-k>", function()
	resize.up(1)
end)
map("n", "<c-s-l>", function()
	resize.right(1)
end)
```
