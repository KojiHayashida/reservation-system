module ReservationsHelper
    def times
        times = ["10:35",
                 "11:35",
                 "13:50",
                 "14:50",
                 "15:50",
                 "17:20",
                 "18:20"]
    end


    ## 予約可能か判定する
    def reservation_status(reservations, user_id, day, time)
      if day <= Date.today
        status = "reservation_not_acceptable"
      elsif reservations.any?{|r| r[:user_id] == user_id && r[:day] == day.strftime("%Y-%m-%d") && r[:time] == time}
        status = "reserved"   ##予約済み
      elsif reservations.count { |r| r[:day] == day.strftime("%Y-%m-%d") && r[:time] == time } <2
        status = "reservation_acceptable"     ##予約可能
      else
        status = "reservation_not_acceptable"    ##予約不可
      end
      return status
    end
end
