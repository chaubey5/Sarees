from django.shortcuts import render, redirect, get_object_or_404
from .models import Saree, Category, FAQ
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User

# --- MAIN PAGES ---
def home(request):
    sarees = Saree.objects.all()
    return render(request, 'home.html', {'sarees': sarees})

def about(request):
    return render(request, 'about.html')

def faq_page(request):
    faqs = FAQ.objects.all()
    return render(request, 'FAQ.html', {'faqs': faqs})

# --- AUTH (LOGIN/LOGOUT/REGISTER) ---
def user_login(request):
    if request.method == "POST":
        u = request.POST.get('username')
        p = request.POST.get('password')
        user = authenticate(username=u, password=p)
        if user is not None:
            login(request, user)
            if user.is_staff:
                return redirect('admin_dashboard')
            else:
                return redirect('home')
        return render(request, 'login.html', {'error': 'Galt details hain bhai!'})
    return render(request, 'login.html')

def user_register(request):
    if request.method == "POST":
        u = request.POST.get('username')
        p = request.POST.get('password')
        e = request.POST.get('email')
        if User.objects.filter(username=u).exists():
            return render(request, 'register.html', {'error': 'Username pehle se booked hai!'})
        user = User.objects.create_user(username=u, password=p, email=e)
        user.save()
        login(request, user)
        return redirect('home')
    return render(request, 'register.html')

def user_logout(request):
    logout(request)
    return redirect('user_login')

# --- ADMIN DASHBOARD ---
@login_required(login_url='user_login')
def admin_dashboard(request):
    if not request.user.is_staff:
        return redirect('home')
    if request.method == 'POST':
        name = request.POST.get('name')
        price = request.POST.get('price')
        fabric = request.POST.get('fabric')
        image = request.FILES.get('image')
        if name and price and image:
            Saree.objects.create(name=name, price=price, fabric=fabric, image=image)
            return redirect('admin_dashboard')
    sarees = Saree.objects.all().order_by('-id')
    return render(request, 'dashboard.html', {'sarees': sarees})

@login_required(login_url='user_login')
def edit_saree(request, id):
    saree = get_object_or_404(Saree, id=id)
    if not request.user.is_staff:
        return redirect('home')
    if request.method == 'POST':
        saree.name = request.POST.get('name')
        saree.price = request.POST.get('price')
        saree.fabric = request.POST.get('fabric')
        new_image = request.FILES.get('image')
        if new_image:
            saree.image = new_image
        saree.save()
        return redirect('admin_dashboard')
    return render(request, 'edit_saree.html', {'saree': saree})

@login_required(login_url='user_login')
def delete_saree(request, id):
    saree = get_object_or_404(Saree, id=id)
    if request.user.is_staff:
        saree.delete()
    return redirect('admin_dashboard')

# --- CART & CHECKOUT ---
def add_to_cart(request, id):
    request.session['cart_saree_id'] = id
    return redirect('cart')

def cart(request):
    saree_id = request.session.get('cart_saree_id')
    saree = Saree.objects.filter(id=saree_id).first() if saree_id else None
    return render(request, 'cart.html', {'saree': saree})

def remove_from_cart(request):
    if 'cart_saree_id' in request.session:
        del request.session['cart_saree_id']
    return redirect('cart')

def checkout(request, id):
    saree = get_object_or_404(Saree, id=id)
    if request.method == "POST":
        request.session['last_order_id'] = id
        return redirect('payment_success')
    return render(request, 'checkout.html', {'saree': saree})

def payment_success(request):
    saree_id = request.session.get('last_order_id')
    saree = get_object_or_404(Saree, id=saree_id) if saree_id else None
    return render(request, 'payment_success.html', {'saree': saree})

def saree_detail(request, id):
    saree = get_object_or_404(Saree, id=id)
    return render(request, 'saree_detail.html', {'saree': saree})


@login_required(login_url='user_login')
def my_orders(request):
    # Abhi humne Order model nahi banaya hai, toh hum session se 
    # last order utha ke dikha dete hain temporary testing ke liye.
    saree_id = request.session.get('last_order_id')
    saree = Saree.objects.filter(id=saree_id).first() if saree_id else None
    return render(request, 'my_orders.html', {'saree': saree})