class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    
    has_secure_password

    def mood
        if nausea
            if nausea > happiness
                "sad"
            else
                "happy"
            end
        end
    end

    def subtract_tickets_used(tickets_used)
        new_ticket_num = tickets - tickets_used.to_i
        update(tickets: new_ticket_num)
    end

    def add_nausea(nausea_added)
        new_nausea = nausea + nausea_added.to_i
        update(nausea: new_nausea)
    end
end
