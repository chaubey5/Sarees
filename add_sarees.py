import os
import django

# --- CONFIGURATION (Isko dhyan se check karein) ---
# 1. Apne PROJECT folder ka naam yahan likho (jahan settings.py hai)
PROJECT_NAME = 'sarees' 

# 2. Apne APP ka naam yahan likho (jahan models.py hai)
APP_NAME = 'sarees_user' 
# --------------------------------------------------

os.environ.setdefault('DJANGO_SETTINGS_MODULE', f'{PROJECT_NAME}.settings')

try:
    django.setup()
    # Dynamic import taaki error na aaye
    import importlib
    models = importlib.import_module(f'{APP_NAME}.models')
    Saree = models.Saree
    Category = models.Category
except Exception as e:
    print(f"❌ Error: Project ya App ka naam galat hai! \nDetails: {e}")
    exit()

def run():
    silk_cat, _ = Category.objects.get_or_create(name="Silk Collection")
    cotton_cat, _ = Category.objects.get_or_create(name="Handloom Cotton")

    # Image Name : [Saree Name, Price, Fabric, Category]
    saree_data = {
        "saree1.webp": ["Kanchipuram Heritage", 12499, "Pure Silk", silk_cat],
        "saree2.webp": ["Banarasi Elegance", 8999, "Katan Silk", silk_cat],
        "saree3.webp": ["Floral Organza", 2450, "Organza", silk_cat],
        "saree4.webp": ["Royal Chanderi", 4200, "Silk Cotton", silk_cat],
        "saree5.webp": ["Midnight Velvet", 6799, "Velvet", silk_cat],
        "saree6.webp": ["Jaipur Gota Patti", 3150, "Georgette", silk_cat],
        "saree7.webp": ["Maheswari Charm", 2800, "Cotton Silk", cotton_cat],
        "saree8.webp": ["Modern Linen", 1950, "Organic Linen", cotton_cat],
    }

    image_folder = 'media/images'
    
    if not os.path.exists(image_folder):
        print(f"❌ Error: '{image_folder}' folder nahi mila! Check karo ki media folder project ke bahar hai ya andar.")
        return

    print("--- Saree Uploading Started ---")
    for img_file in os.listdir(image_folder):
        if img_file.endswith('.webp'):
            if img_file in saree_data:
                name, price, fabric, cat = saree_data[img_file]
            else:
                name = f"Premium Saree {img_file.split('.')[0]}"
                price = 3500
                fabric = "Premium Silk"
                cat = silk_cat

            obj, created = Saree.objects.get_or_create(
                image=f'images/{img_file}',
                defaults={
                    'name': name,
                    'price': price,
                    'fabric': fabric,
                    'category': cat,
                    'description': f"Beautiful {name} handcrafted with love at Savita Sarees."
                }
            )
            if created:
                print(f"✅ Added: {name}")
            else:
                print(f"🟡 Already Exists: {name}")

    print("--- Process Complete! ---")

if __name__ == '__main__':
    run()