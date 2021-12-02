class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one? item_name
        !!self.freebies.find_by(item_name: item_name)
    end

    def give_away dev, freebie
        if freebie.dev_id == self.id
            freebie.dev_id = dev.id
            freebie.save
        else
            "This item is not #{self.name}'s to give away!"
        end
    end
            
end
