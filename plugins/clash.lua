local apikey = 
'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6Ijk0ZDdhMzAxLWM0YjMtNGUzOC1hOGNjLWY4NjRjYWMwZWY2YSIsImlhdCI6MTQ1ODgzMzAxMCwic3ViIjoiZGV2ZWxvcGVyL2QxMzJmNTdjLThiZjYtMWEzNS0zYWQ5LTBkMDA5ZDE1ZDdhYSIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjE0Ni4xNDguNTkuMjQ2Il0sInR5cGUiOiJjbGllbnQifV19.edQnGKPFNN4njNExqP3DysjM0yevSu3Iy5d553hyIh7FhpmU9aYD6S0JGYO4miwLBeDbKa17Mdwvza2Oo5_v9Q' 
local function run(msg, matches)
 if matches[1]:lower() == 'clash' then
  local clantag = matches[2]
  if string.match(matches[2], '^#.+$') then
     clantag = string.gsub(matches[2], '#', '')
  end
  clantag = string.upper(clantag)
  local curl = 'curl -X GET --header "Accept: application/json" --header "authorization: Bearer '..apikey..'" "https://api.clashofclans.com/v1/clans/%23'..clantag..'"'
  cmd = io.popen(curl)
  
  local result = cmd:read('*all')
  local jdat = json:decode(result)
if jdat.reason then
      if jdat.reason == 'accessDenied' then return 'برای ثبت API Key خود به سایت زیر بروید\ndeveloper.clashofclans.com' end
   return '#Error\n'..jdat.reason
  end
  local text = 'تگ کلن: '.. jdat.tag
     text = text..'\nنام کلن: '.. jdat.name
     text = text..'\nوضعیت عضو گیری: '.. jdat.type
     text = text..'\nوضعیت وار: '.. jdat.warFrequency
     text = text..'\nموقعیت مکانی: '..jdat.location.name
     text = text..'\nلول : '.. jdat.clanLevel
     text = text..'\nوار های پیروز: '.. jdat.warWins
     text = text..'\nامتیاز کلن: '.. jdat.clanPoints
     text = text..'\nحداقل امتیاز مورد نیاز: '.. jdat.requiredTrophies
     text = text..'\nافراد: '.. jdat.members..'نفر' 
	 text = text..'\nدرباره کلن: '.. jdat.description
     cmd:close()
  return text
 end
 if matches[1]:lower() == 'clash>' then
  local members = matches[2]
  if string.match(matches[2], '^#.+$') then
     members = string.gsub(matches[2], '#', '')
  end
  members = string.upper(members)
  local curl = 'curl -X GET --header "Accept: application/json" --header "authorization: Bearer '..apikey..'" "https://api.clashofclans.com/v1/clans/%23'..members..'/members"'
  cmd = io.popen(curl)
  local result = cmd:read('*all')
  local jdat = json:decode(result)
  if jdat.reason then
      if jdat.reason == 'accessDenied' then return 'برای ثبت API Key خود به سایت زیر بروید\ndeveloper.clashofclans.com' end
   return '#Error\n'..jdat.reason
  end
  local leader = ""
  local coleader = ""
  local items = jdat.items
  leader = 'مدیران کلن: \n'
   for i = 1, #items do
   if items[i].role == "leader" then
   leader = leader.."\nلیدر: "..items[i].name.."\nلول: "..items[i].expLevel..items[i].league.name
   end
   if items[i].role == "coLeader" then
   coleader = coleader.."\nکو لیدر: "..items[i].name.."\nلول: "..items[i].expLevel
   end
  end
text = leader.."\n"..coleader.."\n\nاعضا کلن:"
  for i = 1, #items do
  text = text..'\n'..i..'- '..items[i].name..'\nlevel: '..items[i].expLevel.."\n"
  end
   cmd:close()
  return text
 end
end

return {
   patterns = {
"^([#!/][Cc]lash) (.*)$",
"^([#!/][Cc]lash>) (.*)$",
   },
   run = run
}
