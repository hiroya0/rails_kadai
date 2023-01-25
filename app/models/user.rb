class User < ApplicationRecord
    validates :title,length: {maximum: 20}
    validates :title,{presence: true}
    validates :start_day,{presence: true}
    validates :end_day, {presence: true}
    validate :end_check
        def end_check
            if start_day.present? && end_day.present? && start_day >= end_day
                errors.add(:end_day, "開始日より前の日付は登録できません。") 
        end
    end
    validates :memo,length: {maximum: 500}

end
