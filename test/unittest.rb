require './lib/sendmail' # classの読み込み

puts "mail送信"
Sendmail.send_message("smatsuda@x-hack.jp", "おはよう", "テスト")
