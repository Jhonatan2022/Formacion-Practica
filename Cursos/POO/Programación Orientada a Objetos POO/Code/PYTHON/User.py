from Account import Account

class User(Account):
    def __init__(self, name, document):
        super().__init__(name, document)