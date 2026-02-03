from django.contrib import admin
from .models import Saree, Category, FAQ, AboutStore

@admin.register(Saree)
class SareeAdmin(admin.ModelAdmin):
    list_display = ('name', 'price', 'fabric', 'category', 'is_available') # Admin mein columns dikhenge
    list_filter = ('category', 'is_available') # Side mein filter aa jayega
    search_fields = ('name', 'fabric') # Search bar aa jayega

admin.site.register(Category)
admin.site.register(FAQ)
admin.site.register(AboutStore)