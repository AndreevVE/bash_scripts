class Counter:
    def __init__(self,arg):
        self.arg = arg

    def __add__(self,other):
        return Counter(self.arg + other.arg)

    def __sub__(self, other):
        return Counter(self.arg - other.arg)

    def __str__(self):
        return f"Result = {self.arg}"


a1 = Counter(10)
a2 = Counter(5)

print(a1 + a2)
print(a1 - a2)
