class Student:
    def __init__(self,name,age):
        self.name = name
        self.age = age
    def display_info(self):
        print(f"Name: {self.name} ")
        print(f"Age: {self.age}")


student1 = Student("Djon",23)
student2 = Student("Tom", 27)
student1.display_info()
student2.display_info()