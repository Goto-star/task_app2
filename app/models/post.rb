class Post < ApplicationRecord
    validates :title, presence: true
    validates :start_day, presence: true
    validates :posted_day, presence: true
    validate :start_end_check
    
    
    
    def start_end_check
        if self.posted_day == nil || self.start_day == nil
            errors.add(:posted_day, " Start_dayは必ず選択してください。")
            
        elsif self.posted_day < self.start_day
            errors.add(:posted_day, "は開始日より前の日付は登録できません。")
        end
    end
end
