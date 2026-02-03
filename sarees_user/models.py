from django.db import models

class Category(models.Model):
    name = models.CharField(max_length=100)
    
    def __str__(self): 
        return self.name

    class Meta:
        verbose_name_plural = "Categories" # Isse Admin mein 'Categorys' nahi dikhega

class Saree(models.Model):
    name = models.CharField(max_length=200)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    fabric = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    image = models.ImageField(upload_to='sarees/')
    description = models.TextField()
    is_available = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self): 
        return self.name

class FAQ(models.Model):
    question = models.CharField(max_length=255)
    answer = models.TextField()

    def __str__(self): 
        return self.question

class AboutStore(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    history = models.TextField(blank=True, null=True)

    def __str__(self): 
        return self.title