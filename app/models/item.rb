class Item < ActiveRecord::Base

	has_many :comments, dependent: :destroy #se hace esta modificacion para que se borre en cascada los comentarios si un juego es borrado
	validates :name, presence: true, length: {minimum: 2}

	has_many :covers, dependent: :destroy

	def attachments_array=(array)
		array.each do |file|
			covers.build(:cover => file)
		end
	end


	
	#has_many :comments
	#No guarda en la base de datos si el largo es menor que 5
	#validates :description, presence: true, length: {minimum: 5}

	#def self.search(search, page)
	#	if search
    #		#find(:all, :conditions => ['name LIKE ? OR system = ?', "%#{search}%", "%#{search_combo}%"])
    #		find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  	#	else
    #		find(:all)
  	#	end
	#end

	def self.search(search, page, fav, search_combo)
		conditions = ['system = ?', "#{search_combo}"]
 		#conditions = nil

 		if search_combo.blank?
 			conditions = ['system like ?', "1"] #Por defecto busca los de PSX
 		end	

  		unless search.blank?
    		##conditions = ['name like ? AND system = ?', "%#{search}%", "#{search_combo}"]
    		conditions = ['name like ? AND system = ?', "%#{search}%", "#{search_combo}"]
  		end

  		unless fav.blank?
    		conditions = ['favorite = ? AND system = ?', 1, "#{search_combo}"]
  		end


  		paginate :per_page => 12, :page => page, :conditions => conditions, :order => 'name'
	end
end




