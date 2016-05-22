do

local function run(msg, matches)
  local eq = URL.escape(matches[1])

  local url = "http://translate.google.com/translate_tts?ie=UTF-8&total=1&idx=0&textlen=32&client=tw-ob&q="..eq.."&tl=En-gb"
  local file = download_to_file(url,'text.ogg')
      send_audio('channel#id'..msg.to.id, file, ok_cb , false)
end

return {
  description = "Convert text to voice",
  usage = {
    "[#!/]tts [text]: Convert text to voice"
  },
  patterns = {
    "^[#!/][Tt]ts (.+)$"
  },
  run = run
}

end 
