# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.find_or_create_by!(email: "user1@example.com") do |user|
    user.name = "六本木花子"
    user.password = "password"
    user.introduction ='住友不動産六本木グランドタワー 23階'
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/no_image.jpg"), filename:"sample-user1.jpg")
  end
user2 = User.find_or_create_by!(email: "user2@example.com") do |user|
    user.name = "新宿太郎"
    user.password = "password"
    user.introduction ='東京都新宿区新宿2-5-10 成信ビル 4階'
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/no_image.jpg"), filename:"sample-user1.jpg")
  end
  Book.find_or_create_by!(title: "簡単１週間の献立") do |book|
    book.book_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/book03.png"), filename:"book03.png")
    book.body = "今回は、1週間の献立の基本的な考え方から作り置きのコツ、実際のメニューや買い物リストをまとめました。ぜひ、献立を考える際の参考にしてくださいね"
    book.user = user1
  end
  Book.find_or_create_by!(title: "ミステリーですね") do |book|
    book.book_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/book02.png"), filename:"book02.png")
    book.body = "サスペンス小説　事件の謎解きと並行して、登場人物の心理的なスリルやサスペンスの描写に重点を置いたもので、独創的なトリックの枯渇に対応して出現した推理小説。"
    book.user = user2
  end
  Book.find_or_create_by!(title: "謎の本") do |book|
    book.book_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/book01.png"), filename:"book01.png")
    book.body = "本のそのミステリアスな原点は決して新しいフォーマットに置きかえられることはないのだ。"
    book.user = user1
  end
  Book.find_or_create_by!(title: "ABCから始めよう") do |book|
    book.book_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/book04.png"), filename:"book04.png")
    book.body = "日常よく使われているアルファベットの略語から，デザイン感覚を生かした絵によって，わかりやすいＡＢＣを展開します。"
    book.user = user2
  end
