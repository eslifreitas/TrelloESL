class History < ApplicationRecord
    belongs_to :requester, class_name: "Person", foreign_key: :requester_id
    belongs_to :owner, class_name: "Person", foreign_key: :owner_id
    belongs_to :project, class_name: "Project", foreign_key: :project_id

    has_many :tasks, dependent: :destroy
    
   # validates :points, numericality: {only_integer: true}, if: :points_is_valid?

    def short_time
        time.to_s(:short)
    end

    def points_is_valid?
        if points > 13
            return false
        else
            return is_fibonacci?(points)
        end
    end

    def is_fibonacci?(param_number)
        n1 = 5 * param_number**2 + 4
        n2 = n1 - 8
        is_square?(n1) or is_square?(n2)
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
