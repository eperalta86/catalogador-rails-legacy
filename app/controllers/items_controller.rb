class ItemsController < ApplicationController

	def new
		@item = Item.new #para que no de NIL en las validaciones del formulario
	end

	#def index
	#	if params[:search]
	#  		@items =  Item.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
	#  	else
  	#			@items = Item.find(:all)
  	#	end
	#end

	def index
		#@items = Item.order("name").page(params[:page]).per_page(15)
		#@items = Item.search(params[:search]).page(params[:page])
		@items = Item.search(params[:search], params[:page], params[:fav], params[:search_combo])
		#@items = Item.search({:search => params[:search], :search_combo => params[:search_combo]})
		@systems = System.find(:all)
	end

	def list
		#<%= form_tag(:controller => "items", :action => "list", :method => "get") do %>
		@items = Item.search(params[:search], params[:page], params[:fav], params[:search_combo])
		@systems = System.find(:all)
	end

	#accion
	def create
		#render text: params[:ps1].inspect
		@item = Item.new(item_params)

		#@ps1.save puede quedar de esta forma tambien
		# si graba
		if @item.save
			redirect_to @item
		else
			render 'new'
		end		
  	end

  	#mostrar
  	#es importante el orden, private está tomando control sobre todo lo que está abajo de el.
	def show
  		@item = Item.find(params[:id])
	end

	#mostrar
	def edit
		@item = Item.find(params[:id])
	end

	#accion
	def update
		@item = Item.find(params[:id])

		if @item.update(params[:item].permit(:name, :dvd, :dvd2, :filename, :system, :recorded, :copies, :favorite, :cover, :attachments_array => []))
			redirect_to @item
		else
			render 'edit'
		end	
	end	

	#accion
	def destroy
  		@item = Item.find(params[:id])
  		@item.destroy
 
  		redirect_to items_path
	end

  	private
  		def item_params
  			params.require(:item).permit(:name, :dvd, :dvd2, :filename, :system, :recorded, :copies, :favorite, :cover, :attachments_array => [])
  		end


end
