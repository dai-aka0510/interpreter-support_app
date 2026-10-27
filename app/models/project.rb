class Project < ApplicationRecord
  belongs_to :user
  # MVPフェーズのため、開発・テストのしやすさを優先してdependent: :destroyを採用
  # 本格運用フェーズで誤削除防止が必要になった場合は dependent: :restrict_with_error への変更を検討する
  has_many :receipts, dependent: :destroy

  # 必須項目のバリデーションを追加
  validates :title, presence: true
  validates :amount, presence: true
end
