# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Item.find_or_create_by( id: '1', title: '礼記20巻', author: '漢鄭玄注;唐陸徳明音義', publisher: '北京図書館出版社（杭州華宝斎印）', holding: '中国国家図書館', note: '影印中国国家図書館蔵周叔弢旧蔵宋余仁仲万巻堂刊本;周叔弢1942年跋　金元・張文通、清・陸潤庠（1841～1915）旧蔵
「臣陸潤庠奉勅審定内府経籍金石書画」印、陸氏は元和の人、同治13年の状元、八国聯軍時慈禧太后の代言草制、太保、東閣大学士、諡文瑞、光緒間南書房に入り内府本の審定に当たる')