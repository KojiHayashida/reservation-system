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


    #  # 予約可能か判定する
    def reservation_status(reservations, user_id, day, time)
      if reservations.any?{|r| r[:user_id] == user_id && r[:day] == day.strftime("%Y-%m-%d") && r[:time] == time}
        status = "reserved"
      elsif reservations.count { |r| r[:day] == day.strftime("%Y-%m-%d") && r[:time] == time } <2
        status = "vacant"
      else
        status = "full"
      end
      return status
    end
end
