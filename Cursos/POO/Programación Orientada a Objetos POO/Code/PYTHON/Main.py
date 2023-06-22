from Car import Car
from Account import Account

if __name__ == '__main__':
    
    car = Car("AMS234", Account("Andres Herrera", "ANDA876"))
    print(vars(car))
    print(vars(car.driver))