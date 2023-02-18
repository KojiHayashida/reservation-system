class Reservation < ApplicationRecord
    belongs_to :user
    extend DisplayList

    # フォームに入力された日付を引数に、該当するレコードを返す
    scope :search_reservations, -> (picked_date){
      where("day = ?", Date.parse(picked_date))
    }


    # 三か月先までの予約を取得して配列を返す
    def self.reservations_after_three_month
      reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
      reservation_data = []
      reservations.each do |reservation|
        reservations_hash = {}
        reservations_hash.merge!(day: reservation.day.strftime("%Y-%m-%d"), time: reservation.time)
        reservation_data.push(reservations_hash)
      end
      reservation_data
    end
end
