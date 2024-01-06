class Product < ApplicationRecord
  # Esto es para que sea obligatorio llenar todos los campos del formulario
  # y que el usuario no se olvide de completar ningun campo.
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

end
