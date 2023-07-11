# Importamos BaseModel para poder usar validaciones
# Importamos Field para poder usar validaciones en los campos (requeridos, longitud, etc)
from pydantic import BaseModel, Field

# Importamso opional para poder usar validaciones
from typing import Optional



# Creamos una clase movia que hereda de BaseModel para poder usar validaciones
class Movie(BaseModel):
    # Optional para que el id sea opcional
    id: Optional[int] = None 
    # Field para usar validaciones (requerido, longitud, etc
    title: str = Field(min_length=5, max_length=15  ) 
    overview: str = Field(min_length=2, max_length=50)
    # le: es menor o igual, ge: es mayor o igual
    year: int = Field(le=2023, ge=1990) 
    # ge: es mayor o igual, le: es menor o igual
    rating: float = Field( ge=1, le=10) 
    category: str = Field(min_length=6, max_length=15)


    class Config:
        schema_extra = {
            "example": {
                "id": 1,
                "title": "Film Title",
                "overview": "Description of the film",
                "year": 2023,
                "rating": 7.8,
                "category": "Action"
            }
        }

