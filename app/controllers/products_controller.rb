class ProductsController < ApplicationController

  # Devuelve todos los productos.
    def index
        @products = Product.all
    end

    # Devuelve un solo producto y lo encuentra por su id.
    def show
        @product = Product.find(params[:id])
    end

    def def new
        @product = Product.new
    end

end
