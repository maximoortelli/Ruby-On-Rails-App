class ProductsController < ApplicationController

  # Devuelve todos los productos.
    def index
        @products = Product.all
    end

    # Devuelve un solo producto y lo encuentra por su id.
    def show
        @product = Product.find(params[:id])
    end

    # Crea un nuevo producto
    def new
        @product = Product.new
    end

    # Le pasamos los parametros a un producto nuevo para que se rellene el formulario a agregar.
    def create
        @product = Product.new(product_params)

        # Si al crear un nuevo producto se guarda satisfactoriamente
        # en la base de datos que nos redirija a home.
        if @product.save
            redirect_to products_path

        # En cambio si no se guarda vamos a renderizar
        # el formulario "new" de nuevo.
        else
         render :new
        end
    end

    private
    # Recoge todos los parametros, y vamos a necesitar que tenga un objeto ":product"
    # y que solo permita los parametros que queremos nosotros(title, description, price)
    def product_params
        params.require(:product).permit(:title, :description, :price)
    end
end
