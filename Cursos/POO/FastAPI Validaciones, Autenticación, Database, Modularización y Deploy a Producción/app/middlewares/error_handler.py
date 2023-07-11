# Importamos BaseHTTPMiddleware para poder usar middlewares (intermediarios)
from starlette.middleware.base import BaseHTTPMiddleware
from fastapi import FastAPI, Request, Response
from fastapi.responses import JSONResponse




# Creamos la clase ErrorHandler que hereda de BaseHTTPMiddleware 
class ErrorHandler(BaseHTTPMiddleware):
    
    # Inicializamos el constructor
    def __init__(self, app: FastAPI):
        super().__init__(app)


    # Ponemos la funcion asincrona para que se ejecute en segundo plano (no bloquee la ejecución de otras funciones)
    async def dispatch(self, request: Request, call_next):
        try:
            return await call_next(request)
        except Exception as e:
            return JSONResponse(status_code=500, content={"message": str(e)})