local function res_user_callback(extra, success, result)
 if success == 1 then
if not result.phone then
send_large_msg(extra.receiver, "شماره تماس فرد مورد نظر یافت نشد", ok_cb, false)
elseif result.phone then
local phone = '+'..result.phone
local first = result.id
local last = result.id
if result.first_name then
first = result.first_name
end
if result.last_name then
last = result.last_name
end
send_contact(extra.receiver, phone, first, last, ok_cb, false)
  end
end
end
local function user_info_callback(extra, success, result)
 if success == 1 then
if not result.phone then
send_large_msg(extra.receiver, "شماره تماس فرد مورد نظر یافت نشد", ok_cb, false)
elseif result.phone then
local phone = '+'..result.phone
local first = result.id
local last = result.id
if result.first_name then
first = result.first_name
end
if result.last_name then
last = result.last_name
end
send_contact(extra.receiver, phone, first, last, ok_cb, false)
  end
end
end
local function user_info_reply(extra, success, result)
 if success == 1 then
if not result.from.phone then
send_large_msg(extra.receiver, "شماره تماس فرد مورد نظر یافت نشد", ok_cb, false)
elseif result.from.phone then
local phone = '+'..result.from.phone
local first = result.from.id
local last = result.from.id
if result.from.first_name then
first = result.from.first_name
end
if result.from.last_name then
last = result.from.last_name
end
send_contact(extra.receiver, phone, first, last, ok_cb, false)
  end
end
end
local function run(msg, matches)
local receiver = get_receiver(msg)
if matches[1]:lower() == 'share' and is_sudo(msg) then
if msg.reply_id then
get_message(msg.reply_id, user_info_reply, {receiver = receiver})
end
if matches[2] then
   local user = matches[2]
   if string.match(matches[2], '^%d+$') then
   return user_info('user#id'..matches[2], user_info_callback, {receiver=receiver})
    elseif string.match(user, '^@.+$') then
      local username = string.gsub(user, '@', '')
   print(username)
      res_user(username, res_user_callback, {receiver=receiver})
   end
  end
end
end
return {
patterns = {
"^[#!/]([Ss]hare) (.*)$",
"^[#!/]([Ss]hare)$"
},
run = run
} 
