class Book < ApplicationRecord
  # 読書状況の選択肢を定義
  enum reading_status: { unread: 0, reading: 1, finished: 2 }
  # 入手方法の選択肢を定義
  enum acquisition_type: { not_owned: 0, purchase: 1, borrowed: 2 }
end
