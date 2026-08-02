class Book < ApplicationRecord
validates :title, presence: true
validates :author, presence: true
validates :reading_status, presence: true
validates :acquisition_type, presence: true
validates :memo, length: { maximum: 1000 }
validate :finished_after_started

  # BookモデルとUserモデルを関連付ける（1冊の本は1人のユーザーに属する）
  belongs_to :user

  # 読書状況の選択肢(enum)を定義
  enum reading_status: { unread: 0, reading: 1, finished: 2 }
  # 入手方法の選択肢(enum)を定義
  enum acquisition_type: { not_owned: 0, purchase: 1, borrowed: 2 }

  private

  def finished_after_started
    return if started_on.blank? || finished_on.blank?

      if finished_on < started_on
            errors.add(:finished_on, "は開始日より前にできません")
      end
  end
end
