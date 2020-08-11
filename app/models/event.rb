class Event < ApplicationRecord

	has_many :attendances
    has_many :users, through: :attendances
    belongs_to :admin, class_name: "User", required: false

	validates :start_date, presence: true 
    validate :start_date_not_before_time_now
    validates :duration, presence: true, :numericality => { greater_than: 0 }
    validate :duration_minutes 
	validates :title, presence: true, length: { in: 5..140, message: "Un titre fait entre 5 et 140 caractères" }
	validates :description, presence: true, length: { in: 20..1000, message: "Un description fait entre 20 et 1000 caractères" }
	validates :price, presence: true, length: { in: 1..1000, message: "Le prix doit etre compris entre 1 et 1000 €" } 
	validates :location, presence: true 


	def start_date_not_before_time_now #Méthode pour ne pas entrer une date antérieur à la date de debut 
	    if start_date < Date.today
            errors.add(:start_date, "la date ne doit pas etre dans le passé") 
        end  
    end

    def duration_minutes #met l'entre de duree de l'even en positif multiple de 5
        unless duration.present? && duration > 0 && duration % 5 == 0
            errors.add(:duration, "la durée doit etre positive et multiple de 5")
          end
     end

end

	#def start_date_not_before_time_now
    	#unless start_date.present? && start_date > DateTime.now
      		#errors.add(:start_date, "La date ne peut pas etre inférieure à aujourd'hui")
    	#end
  
