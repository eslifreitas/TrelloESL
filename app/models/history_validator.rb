class HistoryValidator < ActiveModel::Validator
    def validate(record)
        if record.points > 13
            record.errors.add(:points.to_s(),"Points deve ser menor ou igual a 13")
        elsif !is_fibonacci?(record.points)
            record.errors.add(:points.to_s(), "Points inválido")   
        end
        if (record.status_was != record.status)
            if record.status == ""
                record.errors.add(:status.to_s(), "Status não pode ser em branco")
            elsif record.status_was == "Pending" && record.status != "Started"
                record.errors.add(:status.to_s(), "Status não pode pular mais de um status")            
            elsif record.status_was == "Started" && (record.status != "Pending" && record.status != "Delivered")
                record.errors.add(:status.to_s(), "Status não pode pular mais de um status")           
            elsif record.status_was == "Delivered" && (record.status != "Started" && record.status != "Accepted")
                record.errors.add(:status.to_s(), "Status não pode pular mais de um status")            
            elsif record.status_was == "Accepted" && (record.status != "Delivered")
                record.errors.add(:status.to_s(), "Status não pode pular mais de um status")            
            end
        end
    end

    private
    def is_fibonacci?(param_number)
        n1 = 5 * param_number**2 + 4
        n2 = n1 - 8
        if !is_square?(n1) && !is_square?(n2)
            return false
        end
        return true
    end

    def sqrt(i)
        a, b = 0, i

        while a + 1 < b
            m = (a + b) / 2

            if m**2 > i
                b = m
            else
                a = m
            end

        end

        return a
    end
    
    def is_square?(i)
        s = sqrt(i)
        puts s ** 2 == i
        return s ** 2 == i
    end

end