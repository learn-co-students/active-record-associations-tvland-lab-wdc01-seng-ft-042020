class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
     "#{self.first_name} #{self.last_name}" 
  end

  def list_roles
    results = []
    character_names = self.characters.collect do |character|
        character.name
    end
    show_names = self.shows.collect do |show|
        show.name
    end
    character_names.each_with_index do |name, index|
        results << "#{name} - #{show_names[index]}"
    end
    results
  end

end
