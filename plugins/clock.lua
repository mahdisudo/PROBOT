do

local function run(msg, matches)
if matches[1]:lower() == 'stj' then
  local eq = URL.escape(matches[3])
local url = 'https://assets.imgix.net/'..matches[11]..'/'..matches[2]..'.jpg?blur='..matches[5]..'&fm='..matches[4]..'&bri=0&exp=0&hue=0&invert='..matches[6]..'&sat='..matches[10]..'&sharp=100&vib=100&txt='..eq..'&fit=crop&txtsize=200&txtclr='..matches[7]..'&txtalign=middle,center&txtfont=Futura Medium,italic&txtfit=max&txtline='..matches[8]..'&txtlineclr='..matches[9]

local file = download_to_file(url,'Sh123.jpg')
send_document(get_receiver(msg), file, ok_cb, false)
end
end
return {
  patterns = {
 "^[#!/](stj) (.*)/(.*)/(.*)/(.*)/(.*)/(.*)/(.*)/(.*)/(.*)/(.*)$",
   },
  run = run,
  }
  end
  
