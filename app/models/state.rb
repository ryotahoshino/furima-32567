# class Genre < ActiveHash::Base
# self.data = [
#   { id: 1, name: '--' },   # ←こちらに注目しましょう
#   { id: 2, name: '経済' },
#   { id: 3, name: '政治' },
#   { id: 4, name: '地域' },
#   { id: 5, name: '国際' },
#   { id: 6, name: 'IT' },
#   { id: 7, name: 'エンタメ' },
#   { id: 8, name: 'スポーツ' },
#   { id: 9, name: 'グルメ' },
#   { id: 10, name: 'その他' }
#   ]
  
#   include ActiveHash::Associations
#   has_many :articles
# end

class State < ActiveHash::Base
  self.data = [
    {id: 1, name: '---'},
    {id: 2, name: '新品、未使用'},
    {id: 3, name: '未使用に近い'},
    {id: 4, name: '目立った傷や汚れなし'},
    {id: 5, name: 'やや傷や汚れあり'},
    {id: 6, name: '傷や汚れあり'},
    {id: 7, name: '全体的に状態が悪い'}
  ]
  include ActiveHash::Associations
  has_many :items
end
