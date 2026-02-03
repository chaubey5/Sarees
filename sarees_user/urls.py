from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('about/', views.about, name='about'),
    path('faq/', views.faq_page, name='faq'),
    path('saree/<int:id>/', views.saree_detail, name='saree_detail'),
    path('add-to-cart/<int:id>/', views.add_to_cart, name='add_to_cart'),
    path('cart/', views.cart, name='cart'),
    path('remove-item/', views.remove_from_cart, name='remove_item'),
    path('checkout/<int:id>/', views.checkout, name='checkout'),
    path('payment-success/', views.payment_success, name='payment_success'),
    path('login/', views.user_login, name='user_login'),
    path('admin-login/', views.admin_dashboard, name='admin_dashboard'), # Browser mein ab rye likhna hoga
    path('delete-saree/<int:id>/', views.delete_saree, name='delete_saree'),
    path('edit-saree/<int:id>/', views.edit_saree, name='edit_saree'),
    path('logout/', views.user_logout, name='logout'),
    path('register/', views.user_register, name='user_register'),
    path('my-orders/', views.my_orders, name='my_orders'),
]