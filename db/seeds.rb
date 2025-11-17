Admin.create(
  email: "aaa@mail",
  password: ENV['ADMIN_PASSWORD']
)

User.find_or_create_by!(email: "aaa@mail") do |user|
  user.name = "平成花子"
  user.password = ENV['USER1_PASSWORD']
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pro_image1.png"), filename:"pro_image1.png")
end

User.find_or_create_by!(email: "bbb@mail") do |user|
  user.name = "昭和二郎"
  user.password = ENV['USER2_PASSWORD']
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pro_image2.png"), filename:"pro_image2.png")
end

User.find_or_create_by!(email: "ccc@mail") do |user|
  user.name = "令和太郎"
  user.password = ENV['USER3_PASSWORD']
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pro_image3.png"), filename:"pro_image3.png")
end

# users（既存ユーザーをメールで取得）
user1 = User.find_by(email: "aaa@mail")
user2 = User.find_by(email: "bbb@mail")
user3 = User.find_by(email: "ccc@mail")

# 1
Post.find_or_create_by!(title: "スターブレイズ：暁の航路") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image1.png"), filename: "post_image1.png")
  post.body = "銀河を漂う貨物船が未知の勢力に襲撃され、平凡な乗組員が戦いに巻き込まれるSFアクション。世界観が壮大で、序盤から一気に引き込まれた。"
  post.release = 2021
  post.timeline = 2
  post.tag = "スターブレイズ"
  post.user = user1
end

# 2
Post.find_or_create_by!(title: "スターブレイズ：闇の跳躍") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image2.png"), filename: "post_image2.png")
  post.body = "前作から数年後、主人公が反乱軍の中心人物として成長する続編。アクションはさらに迫力アップ。キャラ同士の関係が深まり見応えがあった。"
  post.release = 2024
  post.timeline = 3
  post.tag = "スターブレイズ"
  post.user = user2
end

# 3
Post.find_or_create_by!(title: "スターブレイズ：創生の記録") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image3.png"), filename: "post_image3.png")
  post.body = "銀河戦争の起源を描く前日譚。時系列は最も古く、謎だった要素が丁寧に回収される。シリーズの理解が深まって満足度が高い。"
  post.release = 2023
  post.timeline = 1
  post.tag = "スターブレイズ"
  post.user = user3
end

# 4
Post.find_or_create_by!(title: "追憶のカレイドスコープ") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image4.png"), filename: "post_image4.png")
  post.body = "事故で記憶を失った青年と、彼を支える女性の切ない恋物語。映像が美しく、静かなシーンが多いのに心に残る。余韻が長く続く作品。"
  post.release = 2019
  post.timeline = 1
  post.tag = ""
  post.user = user1
end

# 5
Post.find_or_create_by!(title: "クロスライン・バレット") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image5.png"), filename: "post_image5.png")
  post.body = "元軍人の男が陰謀に巻き込まれ、かつての仲間と戦うガンアクション。スピード感があって飽きない。主人公の不器用さが逆に魅力的だった。"
  post.release = 2022
  post.timeline = 1
  post.tag = ""
  post.user = user2
end

# 6
Post.find_or_create_by!(title: "スノーフォール・エコー") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image6.png"), filename: "post_image6.png")
  post.body = "雪国の小学校で起こる小さな奇跡を描く感動ドラマ。自然の描写が素晴らしく、静かな物語なのに心を温めてくれる。見た後に優しい気持ちになれる。"
  post.release = 2017
  post.timeline = 1
  post.tag = ""
  post.user = user3
end

# 7
Post.find_or_create_by!(title: "メタル・ネクサス：覚醒") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image7.png"), filename: "post_image7.png")
  post.body = "人類と機械生命体の衝突を描くSFバトル。重厚な設定ながらテンポが良く、ロボット好きにはたまらない。戦闘シーンの音響が抜群。"
  post.release = 2015
  post.timeline = 2
  post.tag = "メタル・ネクサス"
  post.user = user1
end

# 8
Post.find_or_create_by!(title: "メタル・ネクサス：分岐点") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image8.png"), filename: "post_image8.png")
  post.body = "人類と機械の共存を探る続編。前作よりドラマ要素が強く、敵側にも感情移入できる。単なる対立構造じゃないのが良かった。"
  post.release = 2017
  post.timeline = 3
  post.tag = "メタル・ネクサス"
  post.user = user2
end

# 9
Post.find_or_create_by!(title: "メタル・ネクサス：零域") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image9.png"), filename: "post_image9.png")
  post.body = "人工知能が誕生した瞬間を描く前章。研究者の葛藤が丁寧に描かれ、シリーズの背景が深く理解できる。静かだけど重い作品。"
  post.release = 2021
  post.timeline = 1
  post.tag = "メタル・ネクサス"
  post.user = user3
end

# 10
Post.find_or_create_by!(title: "フォールアウト・ミラージュ") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image10.png"), filename: "post_image10.png")
  post.body = "砂漠で起こった謎の集団失踪事件を追う記者の物語。展開が読めず最後まで緊張感が続く。伏線回収が見事で満足度が高い。"
  post.release = 2018
  post.timeline = 1
  post.tag = ""
  post.user = user1
end

# 11
Post.find_or_create_by!(title: "風夜のランナー") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image11.png"), filename: "post_image11.png")
  post.body = "闇の組織に追われる少女を護衛しながら逃走するロードムービー。スピード感ある展開が魅力。アクションとドラマのバランスが良い。"
  post.release = 2016
  post.timeline = 1
  post.tag = ""
  post.user = user2
end

# 12
Post.find_or_create_by!(title: "ライトウェイブ・メロディ") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image12.png"), filename: "post_image12.png")
  post.body = "音楽に悩む高校生たちがバンドを結成し成長する青春ドラマ。音楽シーンがすごく良くて、ラストライブは鳥肌ものだった。"
  post.release = 2020
  post.timeline = 1
  post.tag = ""
  post.user = user3
end

# 13
Post.find_or_create_by!(title: "アクアリウムの亡霊") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image13.png"), filename: "post_image13.png")
  post.body = "廃館寸前の水族館に潜む怪異を描くホラー。水の静けさが逆に恐怖を引き立てる。じわじわ来る系の怖さで、夜に見るのはおすすめしない。"
  post.release = 2015
  post.timeline = 1
  post.tag = ""
  post.user = user1
end

# 14
Post.find_or_create_by!(title: "グラスコードの迷宮") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image14.png"), filename: "post_image14.png")
  post.body = "天才ハッカーが透明なデジタル犯罪に挑むサスペンス。謎解きが秀逸でテンポが良い。後半のどんでん返しに驚かされた。"
  post.release = 2019
  post.timeline = 1
  post.tag = ""
  post.user = user2
end

# 15
Post.find_or_create_by!(title: "リリィ・アンド・ブルーム") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image15.png"), filename: "post_image15.png")
  post.body = "花屋で働く少女が不思議な力を持つ青年と出会う恋物語。色彩がとても綺麗で、感情が丁寧に描かれている。優しい気持ちになれるアニメ映画。"
  post.release = 2023
  post.timeline = 1
  post.tag = ""
  post.user = user3
end

# 16
Post.find_or_create_by!(title: "オーロラの船影") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image16.png"), filename: "post_image16.png")
  post.body = "極北の海に現れる幻の船を追う冒険ファンタジー。美しい風景描写に圧倒される。ゆったりしたテンポなのに引き込まれた。"
  post.release = 2021
  post.timeline = 1
  post.tag = ""
  post.user = user1
end

# 17
Post.find_or_create_by!(title: "ブロークン・ページ") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image17.png"), filename: "post_image17.png")
  post.body = "作家として行き詰まった女性が故郷に戻り、過去と向き合う物語。派手さはないが心に刺さる。セリフの一つ一つが胸に残る映画。"
  post.release = 2017
  post.timeline = 1
  post.tag = ""
  post.user = user2
end

# 18
Post.find_or_create_by!(title: "ネオンステップ・ダウンタウン") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image18.png"), filename: "post_image18.png")
  post.body = "地下ダンスシーンで夢を追う若者たちの物語。音楽が最高でテンションが上がる。ストーリーも意外と深くて良かった。"
  post.release = 2022
  post.timeline = 1
  post.tag = ""
  post.user = user3
end

# 19
Post.find_or_create_by!(title: "サウンド・オブ・マグナ") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image19.png"), filename: "post_image19.png")
  post.body = "地底に響く謎の音を追う調査隊の冒険活劇。設定がユニークでワクワクした。テンポが良くて最後まで楽しめる作品。"
  post.release = 2018
  post.timeline = 1
  post.tag = ""
  post.user = user1
end

# 20
Post.find_or_create_by!(title: "シルバースモーク・パラドックス") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image20.png"), filename: "post_image20.png")
  post.body = "未来都市で起きる原因不明の煙発生事件を追う刑事の物語。SF設定と推理のバランスが絶妙。映像も世界観も非常にスタイリッシュ。"
  post.release = 2024
  post.timeline = 1
  post.tag = ""
  post.user = user2
end