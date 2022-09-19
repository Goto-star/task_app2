class Post < ApplicationRecord
    validates :title, presence: true
    validates :start_day, presence: true
    validates :posted_day, presence: true
    validate :start_end_check
    
    def start_end_check
        errors.add(:posted_day, "は開始日より前の日付は登録できません") unless 
        self.start_day < self.posted_day    
    end
end
