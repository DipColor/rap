local function get_arz()
  local url = 'http://exchange.nalbandan.com/api.php?action=json'
  local jstr, res = http.request(url)
  local arz = json:decode(jstr)
  return 'نرخ ارز سکه...\n?? سکه طرح قديم:'..arz.coin_old.value..' تومان\\n سکه طرح جديد:'..arz.coin_new.value..' تومان\'..\n? ? ? ? ? ? ? ? ? ? ?\nنرخ ارز پول...\n دلـار رسمي:'..arz.dollar_rasmi.value..' تومان\\n دلار آمريکا:'..arz.dollar.value\تومان '..\n يورو:'..arz.euro.value\تومان '..\n پوند:'..arz.pond.value..' تومان\\n درهم:'..arz.derham.value..' تومان'
end

local function run(msg, matches)
  local text
  if matches[1] == 'arz' then
  text = get_arz() 
elseif matches[1] == 'gold' then
  text = get_gold() 
elseif matches[1] == 'coin' then
  text = get_coin() 
  end
  return text
end
return {
  description = "arz in now", 
  usage = "/arz",
  patterns = {
    "^[!/#](arz)$"
  }, 
  run = run 
}
