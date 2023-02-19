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

    def check_reservation(reservations, user_id, day, time)     ## findだと予約が無い場合nillがかえってしまう
        result = false
        reservations_count = reservations.count

        if reservations_count > 1
            reservations.each do |reservation|
              result = reservation[:day].eql?(day.strftime("%Y-%m-%d")) && reservation[:time].eql?(time)
              return result if result
            end
          elsif reservations_count == 1
            result = reservations[0][:day].eql?(day.strftime("%Y-%m-%d")) && reservations[0][:time].eql?(time)
            return result if result
          end
        return result
    end

    #  # 予約可能か判定する
    def can_reserve?(reservations, user_id, day, time)
      if reservations.any?{|r| r[:user_id] == user_id && r[:day] == day.strftime("%Y-%m-%d") && r[:time] == time}
        return false
      elsif
        count = reservations.count { |r| r[:day] == day.strftime("%Y-%m-%d") && r[:time] == time }
        return count < 2
      end
    end
end
