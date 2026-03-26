#!/bin/bash

export TERM=xterm
# Header + ASCII (an toàn)
cat << "EOF"
╔══════════════════════════════════════╗
          Mini Browser            
      https://br.matilda.vn      
          (Safe Mode 🛡️)           
╚══════════════════════════════════════╝

        ／＞　 フ
       | 　_　_|   meow~
     ／` ミ＿xノ
    /　　　　 |
   /　 ヽ　　 ﾉ
  │　　|　|　|
／￣|　　 |　|
| (￣ヽ＿_ヽ_)
＼二つ

👉 Nhập URL (vd: https://wikipedia.org)
👉 Nhấn Ctrl+C để nhập lại URL khác

EOF

while true; do
  echo -n "🌐 URL > "
  read url

  # validate đơn giản
  if [[ ! "$url" =~ ^https?:// ]]; then
    echo "❌ URL phải bắt đầu bằng http:// hoặc https://"
    continue
  fi

  echo ""
  echo "🚀 Loading $url ..."
  sleep 1

  # chạy carbonyl (chặn sandbox crash)
  carbonyl --no-sandbox "$url"

  echo ""
  echo "🔁 Quay lại nhập URL mới..."
done