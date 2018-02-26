class Dishes < Sinatra::Base
  get "/" do
    erb :home
  end

  # get "/public/styling.css" do
  #   css :styling
  # end


  get "/dishes/new" do
    erb :new
  end

  get "/dishes/:id/edit" do
    @dish= Dish.find(params[:id])
    erb :edit
  end

  delete "/dishes/:id" do
    Dish.find(params[:id]).destroy
    redirect "/dishes"
  end

  # get "/dishes/:id" do
  #  @dish = Dish.find(params[:id])
  #  erb :dish
  # end

  put "/dishes/:id" do
    dish = Dish.find(params[:id])
    dish.update(
      title: params[:title],
      description: params[:description]
    )
    redirect "/dishes"
  end

  get "/dishes" do
    @dishes = Dish.all
    erb :dishes
  end

  post "/cafe" do
    Dish.create(
      title: params[:title],
      description: params[:description]
    )
    redirect "/dishes"
  end

  # delete "/dishes/:id" do
  # end
end
